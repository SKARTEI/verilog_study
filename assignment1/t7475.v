module t7475(d, e1, e2, q, qb);
input [7:0] d;
input e1, e2;
output [7:0] q, qb;

t7475_1 U1 (.d(d[7:4]),.e1(e1),.e2(e2),.q(q[7:4]),.qb(qb[7:4]));
t7475_1 U2 (.d(d[3:0]),.e1(e1),.e2(e2),.q(q[3:0]),.qb(qb[3:0]));

endmodule