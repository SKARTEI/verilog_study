`timescale 1ns/1ns
module t7475_1 (d, e1, e2, q, qb);
input [3:0] d; // input
input e1; //enable e12
input e2; //enable e34

output [3:0] q;
output [3:0] qb; // ~q
reg [3:0] q;
assign #(20,15) qb = ~q;

always @ (*)
  if(e1) #30 begin q[0]<=d[0]; q[1]<=d[1]; end
  else #30 begin q[0]<=q[0]; q[1]<=q[1]; end

always @(*)
  if(e2) #30 begin q[2]<=d[2]; q[3]<=d[3]; end
  else #30 begin q[2]<=q[2]; q[3]<=q[3]; end


endmodule 