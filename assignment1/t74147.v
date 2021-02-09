module t74147 (a,b, o1);
input [8:0] a,b;
output [7:0] o1;

t74147_1 U1 (.in(a), .o(o1[7:4]));
t74147_1 U2 (.in(b), .o(o1[3:0]));

endmodule
