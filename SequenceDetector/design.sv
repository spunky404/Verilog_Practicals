
module seq10101 (in, out, clk, reset);
	
	parameter S0 = 3'b000; 
	parameter S1 = 3'b001;
	parameter S2 = 3'b010;
	parameter S3 = 3'b011;
	parameter S4 = 3'b100;
	
	input clk,reset,in;//input and output
	output reg out;

	reg [2:0] state;
	reg [2:0] next_state;//registered state
	
	always @ (posedge clk)//state switching
	if(reset) 
		state <= S0;
	else 
		state <= next_state;
	
	
	always @ (in or state)
	begin
		case(state)
		S0:
			begin
			if (in) 
				begin
				next_state <= S1;
				out = 1'b0;
				end
			else
			    begin
				next_state <= S0;
				out = 1'b0;
				end
		    end
		S1:begin
			if (in) begin
				next_state <= S1;
				out = 1'b0;
				end
			else begin
				next_state <= S2;
				out = 1'b0;
				end
		   end
		S2:begin
			if (in) begin 
				next_state <= S3;
				out = 1'b0;
				end
			else begin
				next_state <= S0;
				out = 1'b0;
				end
		   end
		S3:begin
			if (in) begin
				next_state <= S1;
				out = 1'b0;
				end
			else begin
				next_state <= S4;
				out = 1'b0;
				end
		   end
		S4:begin
			if (in) begin
				next_state <= S1;
				out = 1'b1;
				end
			else begin
				next_state <= S0;
				out = 1'b0;
				end
		   end
		endcase
	end
endmodule