
module alu(
  input [3:0] A,B,  // Inputs                 
  input [1:0] ALU_Sel,// Selection
  output [3:0] ALU_Out, // Output
  output C // Carry
    );
  reg [3:0] ALU_Result;
  wire [4:0] tmp;
  assign ALU_Out = ALU_Result; // ALU out
  assign tmp = {1'b0,A} + {1'b0,B};
  assign C = tmp[4]; // Carryout
  always @(*)
  begin
     case(ALU_Sel)
     2'b00: // Addition
        ALU_Result = A + B ; 
     2'b01: // Subtraction
        ALU_Result = A - B ;
     2'b10: //  or
        ALU_Result = (A | B);
     2'b11: // Nand 
        ALU_Result = ~(A & B);
     default: ALU_Result = A + B ; 
     endcase
  end
endmodule