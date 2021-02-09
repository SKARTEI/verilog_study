`timescale 1ns/1ns
module t74147_1 (in, o);
input [8:0] in;
output [3:0] o;

reg [3:0] o; 

always @ (in)
#18
    casex (in)
	9'b0_xxxx_xxxx : o = 4'b0110;
	9'b1_0xxx_xxxx : o = 4'b0111;
	9'b1_10xx_xxxx : o = 4'b1000;
	9'b1_110x_xxxx : o = 4'b1001;
	9'b1_1110_xxxx : o = 4'b1010;
	9'b1_1111_0xxx : o = 4'b1011;
	9'b1_1111_10xx : o = 4'b1100;
	9'b1_1111_110x : o = 4'b1101;
	9'b1_1111_1110 : o = 4'b1110;
	9'b1_1111_1111 : o = 4'b1111;
	default	       : o = 4'b0000;
    endcase
endmodule