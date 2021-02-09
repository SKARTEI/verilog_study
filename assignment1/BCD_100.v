module BCD_100 (rst, PB, clk, q, tco);
input rst, PB, clk;
output [7:0] q;
output tco;
wire tco, tc1, tc2;
bcd LB (rst, PB, clk, q[3:0], tc1);
bcd UB (rst, PB, tc1, q[7:4], tc2);

endmodule