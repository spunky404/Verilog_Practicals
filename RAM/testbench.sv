`timescale 1ns / 1ps
module RAM_tb;
 // Inputs
 reg [7:0] dataIn;
 reg [9:0] Addr;
 reg CS;
 reg WRITE;
 reg READ;
 reg clk;
 // Outputs
 wire [7:0] dataOut;
 // Instantiate the Unit Under Test (UUT)
 RAM uut (
  .dataIn(dataIn), 
  .dataOut(dataOut), 
  .Addr(Addr), 
  .CS(CS), 
  .WRITE(WRITE), 
  .READ(READ), 
  .clk(clk)
  );
 initial begin
  // Initialize Inputs
  dataIn  = 8'h0;
  Addr  = 8'h0;
  CS  = 1'b0;
  WRITE  = 1'b0;
  READ  = 1'b0;
  clk  = 1'b0;
  // Wait 100 ns for global reset to finish
  #100;
  // Add stimulus here
  dataIn  = 8'h0;
  Addr  = 8'h0;
  CS  = 1'b1;
  WRITE  = 1'b1;
  READ  = 1'b0;
  #20;
  dataIn  = 8'h1;
  Addr  = 8'h0;
  #20;
  dataIn  = 8'h12;
  Addr  = 8'h1;
  #20;
  dataIn  = 8'h13;
  Addr  = 8'h2;
  #20;
  dataIn  = 8'h16;
  Addr  = 8'h3;
  #20;
  dataIn  = 8'h2;
  Addr  = 8'h4;
  #40;
  Addr  = 8'h0;
  WRITE  = 1'b0;
  READ  = 1'b1;
  #20;
  Addr   = 8'h1;
  #20;
  Addr   = 8'h2;
  #20;
  Addr   = 8'h3;
  #20;
  Addr   = 8'h4;
 end
 always #10 clk = ~ clk;
initial begin
		$dumpfile("dump.vcd");
		$dumpvars;
		#400 $finish;
  		end 
endmodule