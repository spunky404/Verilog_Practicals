
`timescale 1ns / 1ps
module parking( 
	input clk,rst,
	input entry, exit, //sensors at both end 
 	input [1:0] password1, password2,
 	output wire GREEN,RED,
 	output reg [6:0] HEX_1, HEX_2
    );
 
parameter IDLE = 3'b000,WAIT_PASSWORD = 3'b001,WRONG_PASS = 3'b010,RIGHT_PASS = 3'b011,STOP = 3'b100;
 
//moore fsm as output depends on current state
reg[2:0] current_state, next_state;
reg[31:0] counter_wait;
reg red_tmp,green_tmp;
// next state
always @(posedge clk or negedge rst)
begin
if(~rst) 
	current_state = IDLE;
else
	current_state = next_state;
end
// counter_wait
always @(posedge clk or negedge rst) 
begin
 if(~rst) 
 	counter_wait <= 0;
 else if(current_state==WAIT_PASSWORD)
 	counter_wait <= counter_wait + 1;
 else 
 	counter_wait <= 0;
end
 // change state

always @(*)
begin
 case(current_state)
 IDLE: begin
   		if(entry == 1) //entry sensor high
 		 next_state = WAIT_PASSWORD;
 		else
 		 next_state = IDLE;
 	   end
 WAIT_PASSWORD: begin
 		if(counter_wait <= 3)
 			next_state = WAIT_PASSWORD;
 		else 
 		begin
 		 if((password1==2'b01)&&(password2==2'b10))
 		 next_state = RIGHT_PASS;
 		 else
 		 next_state = WRONG_PASS;
 		end
 		end
 WRONG_PASS: begin
		 if((password1==2'b01)&&(password2==2'b10))
		 next_state = RIGHT_PASS;
		 else
		 next_state = WRONG_PASS;
		 end
 RIGHT_PASS: begin
   		if(entry ==1 && exit == 1)
		 next_state = STOP;
 		else if(exit == 1)
 		 next_state = IDLE;
		else
		 next_state = RIGHT_PASS;
		end
 STOP: begin
		if((password1==2'b01)&&(password2==2'b10))
		next_state = RIGHT_PASS;
		else
		next_state = STOP;
		end
 		default: next_state = IDLE;
endcase
end
 // LEDs and output
always @(posedge clk) begin 
 case(current_state)
 IDLE: begin
	 green_tmp = 1'b0;
	 red_tmp = 1'b0;
	 HEX_1 = 7'b1111111; // off
	 HEX_2 = 7'b1111111; // off
	end
 WAIT_PASSWORD: begin
	 green_tmp = 1'b0;
	 red_tmp = 1'b1;
	 HEX_1 = 7'b0000110; // E
	 HEX_2 = 7'b0101011; // n 
	end
 WRONG_PASS: begin
	 green_tmp = 1'b0;
	 red_tmp = ~red_tmp;
	 HEX_1 = 7'b0000110; // E
	 HEX_2 = 7'b0000110; // E 
	end
 RIGHT_PASS: begin
	 green_tmp = ~green_tmp;
	 red_tmp = 1'b0;
	 HEX_1 = 7'b0000010; // 6
	 HEX_2 = 7'b1000000; // 0 
	end
 STOP: begin
	 green_tmp = 1'b0;
	 red_tmp = ~red_tmp;
	 HEX_1 = 7'b0010010; // 5
	 HEX_2 = 7'b0001100; // P 
	end
endcase
end
assign RED = red_tmp  ;
assign GREEN = green_tmp;
endmodule