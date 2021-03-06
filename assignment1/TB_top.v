`timescale 1ns/1ns
module TB_top;
reg [8:0] a,b;
reg rst, clk, PB;
wire oeq;
wire [14:1] seg1, seg2;

top U1 (a,b, oeq, seg1, seg2, clk, rst, PB);
always begin
#500 clk = ~clk; 
end

initial begin
a = 9'b111111011; 
b = 9'b111101111;
rst = 1'b0;
PB = 1'b0;
clk = 1'b0;

#250 rst = 1'b1;
#200 rst = 1'b0;
#1000 PB = 1'b1;
#50000
#2000 rst = 1'b1; PB= 1'b0;a = 9'b111111110;  b = 9'b101111111;
#500 rst = 1'b0;
#1000 PB = 1'b1;
#50000
#2000 rst = 1'b1; PB= 1'b0;a = 9'b111011111;  b = 9'b111111101;
#500 rst = 1'b0;
#1000 PB = 1'b1;
#50000
#2000 rst = 1'b1; PB= 1'b0;a = 9'b110111111;  b = 9'b111011111;
#500 rst = 1'b0;
#1000 PB = 1'b1;
#100000 $stop;
end
endmodule 