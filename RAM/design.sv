//Prajwal Kadam
`timescale 1ns / 1ps
module RAM( dataIn,
                dataOut,
                Addr, 
                CS, 
                WRITE, 
                READ, 
                clk
              );
// parameters for the width 
parameter ADR   = 10;
parameter DATA   = 8;
parameter MS  = 1024;
//ports
  input   [DATA-1:0]  dataIn;
output reg [DATA-1:0]  dataOut;
input   [ADR-1:0]  Addr;
input CS, 
      WRITE, 
      READ, 
      clk;
     
//internal variables
reg [DATA-1:0] RAM [MS-1:0];
always @ (posedge clk)
begin
 if (CS == 1'b1) begin
  if (WRITE == 1'b1 && READ == 1'b0) begin
   RAM [Addr] = dataIn;
  end
  else if (READ == 1'b1 && WRITE == 1'b0) begin
   dataOut = RAM [Addr]; 
  end
  else;
 end
 else;
end
endmodule