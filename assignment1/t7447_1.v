`timescale 1ns/1ns
module t7447_1 ( bcd, seg, BI_RBO);
input BI_RBO;
input [3:0] bcd;
output [7:1] seg; 
wire BI_RBO;
wire [3:0] bcd;
reg [7:1] seg;

always @*
if(~BI_RBO) #100
        seg = 7'b1111111; // gfedcba, cc- active high
else #100
  case(bcd)
	4'b0000: seg = 7'b0111111;
	4'b0001: seg = 7'b0000110;
	4'b0010: seg = 7'b1011011;
	4'b0011: seg = 7'b1001111;
	4'b0100: seg = 7'b1100110;
	4'b0101: seg = 7'b1101101;
	4'b0110: seg = 7'b1111101;
	4'b0111: seg = 7'b0000111;
	4'b1000: seg = 7'b1111111;
	4'b1001: seg = 7'b1000000;
	default  seg = 7'b0000000;
   endcase
endmodule