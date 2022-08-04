//There are 2 sensors at entry and exit which are triggered by a coming vehicle until then system remains idle.When its triggered it asks for password to open gate.Gate opens for right password and remains close for wrong one. When password is right the green led blinks. When condition is wait password the led remains red and for wrong password it blinks red led.If 2 cars triggered sensor simultaneouly then gate remains close till entering car enters right password.
module tb_parking;

  reg clk;	// Inputs
  reg rst;
  reg entry;
  reg exit;
  reg [1:0] password1;
  reg [1:0] password2;

  // Outputs
  wire GREEN; //led green
  wire RED;
  wire [6:0] HEX_1;
  wire [6:0] HEX_2;

  // Instantiate the Unit Under Test (UUT)
  parking uut (.clk(clk), 
  				.rst(rst), 
     			.entry(entry), 
  				.exit(exit), 
  				.password1(password1), 
  				.password2(password2), 
  				.GREEN(GREEN), 
  				.RED(RED), 
  				.HEX_1(HEX_1), 
 				.HEX_2(HEX_2)
 				);
 initial begin
 clk = 0;
 forever #10 clk = ~clk;
 end
 initial begin
 // Initialize Inputs
 rst = 0;
 entry= 0;
 exit = 0;
 password1 = 2'b00;
 password2 = 2'b00;
 // Wait 100 ns for global reset to finish
 #100;
 rst= 1;
 #20;
 entry=1;
 #1000;
 entry=0;
 password1 = 2'b01;
 password2 = 2'b10;
 #2000;
 exit =1;
 
 end
  initial begin
		$dumpfile("dump.vcd");
		$dumpvars;
		#4000 $finish;
  		end    
endmodule