//Up down counter
module UpDown_Test;
// Inputs
	reg clk;
	reg mode;
	reg reset;
// Outputs
	wire [3:0] count;
	wire [6:0] BCD_output;
// Instantiate the Unit Under Test (UUT)
UpDown_Count uut (
	.clk(clk),
	.mode(mode),
	.count(count),
	.reset(reset),
	.BCD_output(BCD_output)
);
always #5 clk = ~clk;
initial begin
// Initialize Inputs
	clk = 0;
	mode = 0;
	#30 reset = 1;mode = 0;
	#140 reset = 0;
	#140 mode = 1;
end
initial begin
  $dumpfile("dump.vcd");
  $dumpvars;
  #350 $finish;
end
endmodule
