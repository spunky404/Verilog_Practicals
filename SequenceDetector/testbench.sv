module eq10101_tb();
	wire out;
	wire state,next_state;
	reg in;
	reg clk,reset;
seq10101 uut( 	.in(in),
		    .out(out),
            .clk(clk),
		    .reset(reset));
	initial 
	begin //time
		clk = 0;
		forever #5 clk = ~clk;
	 end
	
	initial
		begin
			in = 0;
			reset = 1;
			#20 reset = 0;
			
			#5 in = 1;#10 in = 0;#10 in = 1;
			#10 in = 0;#10 in = 1;#10 in = 0;
			#10 in = 1;#10 in = 1;#10 in = 1;
			#10 in = 1;#10 in = 0;#10 in = 1;
			#10 in = 1;#10 in = 1;#10 in = 1;
			#10 in = 1;#10 in = 0;#10 in = 1;
			#10 in = 0;#10 in = 1;#10 in = 0;
		end
	initial begin
		$dumpfile("dump.vcd");
		$dumpvars;
		#300 $finish;
  		end
endmodule