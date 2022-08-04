module UpDown_Count(
	input clk, input mode,
	output reg[3:0] count, input reset,
	output reg[6:0] BCD_output
);
always @(count) begin case(count)
	4'b0000:BCD_output = 7'b0000001;
	4'b0001:BCD_output = 7'b1001111;
	4'b0010:BCD_output = 7'b0010010;
	4'b0011:BCD_output = 7'b0000110;
	4'b0100:BCD_output = 7'b1001100;
	4'b0101:BCD_output = 7'b0100100;
	4'b0110:BCD_output = 7'b0100000;
	4'b0111:BCD_output = 7'b0001111;
	4'b1000:BCD_output = 7'b0000000;
	4'b1001:BCD_output = 7'b0000100;
	4'b1010:BCD_output = 7'b0001001;
	4'b1011:BCD_output = 7'b1100000;
	4'b1100:BCD_output = 7'b0110001;
	4'b1101:BCD_output = 7'b0000001;
	4'b1110:BCD_output = 7'b0110000;
	4'b1111:BCD_output = 7'b0111000;
	default:BCD_output = 7'b1111111;
endcase
end
always @(posedge clk or posedge reset)
begin if(reset==1)
  count<=0;
	else if(mode==0) count<=count+1;
	else count<=count-1; 
	end
endmodule
