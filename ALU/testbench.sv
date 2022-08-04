//ALU
module tb_alu;
//Inputs
reg[3:0] A,B;
reg[1:0] ALU_Sel;

//Outputs
wire[3:0] ALU_Out;
wire C;
integer i;
alu test_unit(
   A,B,  // Inputs                 
   ALU_Sel,// ALU Selection
   ALU_Out, // Output
   C // carry
   );
  initial begin
  A = 4'b0110;
  B = 4'b0010;
  
  ALU_Sel = 2'b00;#10;
  ALU_Sel = 2'b01;#10;
  ALU_Sel = 2'b10;#10;
  ALU_Sel = 2'b11;
    
  end
  initial begin
  $dumpfile("dump.vcd");
  $dumpvars;
  #40 $finish;
  end
endmodule