module t7447 ( bcd, seg, BI_RBO);
input BI_RBO;
input [7:0] bcd;
output [14:1] seg; 


t7447_1 U1 ( .bcd(bcd[7:4]),.seg(seg[14:8]),.BI_RBO(BI_RBO));
t7447_1 U2 ( .bcd(bcd[3:0]),.seg(seg[7:1]),.BI_RBO(BI_RBO));

endmodule
