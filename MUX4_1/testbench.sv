// Code your testbench here
// or browse Examples
//4 : 1 Mux
`timescale 1ns / 1ps
module mux41_test;
reg s0, s1, i0, i1, i2, i3;
wire out; integer k;
mux_4to1 MYMUX41 (out, s0, s1, i0, i1, i2, i3); initial
begin
for (k=0; k<64; k=k+1) begin
#5 {s0,s1,i0,i1,i2,i3} = k;
$display ("Sel: %2b, In: %4b, Out: %b", {s0,s1}, {i0,i1,i2,i3}, out); end
end endmodule

