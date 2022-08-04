module test_parity; 
reg clk, x; wire z; 
parity_gen PAR (x, clk, z); 
initial 
begin 
  clk = 1'b0; 
end 
always #5 clk = ~clk; 
initial 
begin 
# 2 x = 0; #10 x = 1; #10 x = 1; #10 x = 1; 
#10 x = 0; #10 x = 1; #10 x = 0; #10 x = 0; 
#10 x = 0; #10 x = 1; #10 x = 1; #10 x = 0;
#10 x = 1; #10 x = 1; #10 x = 1; #10 x = 1; 
#10 x = 0; #10 x = 0; #10 x = 0; #10 x = 0; 
#10 $finish; 
end
  initial begin
		$dumpfile("dump.vcd");
		$dumpvars;
		#200 $finish;
  		end
endmodule