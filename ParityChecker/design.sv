
module parity_gen (x, clk, z); 
input x, clk; 
output reg z; 
reg state; // The machine state 
parameter EVEN=0, ODD=1; 
always @(posedge clk) 
	case (state) 
		EVEN: begin 
		z <= x ? 1 : 0; 
		state <= x ? ODD : EVEN; 
		end 
		ODD: begin 
		z <= x ? 0 : 1; 
		state <= x ? EVEN : ODD; 
		end 
		default: state <= EVEN; 
	endcase 
endmodule