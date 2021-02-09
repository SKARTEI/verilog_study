module top (a,b,oeq, seg1, seg2, clk, rst, PB);
input [8:0] a,b;
input rst, clk, PB;
output oeq;
output [14:1] seg1, seg2;
wire [7:0] in1, in2, in3; 

t74147 U1 (.a(a),.b(b),.o1(in1));
t7447 U2 (.bcd(~in1),.seg(seg1),.BI_RBO(1'b1));
/*BCD_100 U3 (.rst(rst),.clk(clk),.PB(PB),.q(in2));
t7485 U4 (.e(~in1),.f(in2),.eq(oeq));
t7475 U5 (.d(in2),.e1(1'b1),.e2(1'b1),.q(in3));*/

BCD_100 U3 (.rst(rst),.clk(clk),.PB(PB),.q(in2), .tco());
t7485 U4 (.e(~in1),.f(in2),.eq(oeq), .oeq1(), .oeq2());
t7475 U5 (.d(in2),.e1(1'b1),.e2(1'b1),.q(in3), .qb());


t7447 U6 (.bcd(in3),.seg(seg2),.BI_RBO(oeq));

endmodule