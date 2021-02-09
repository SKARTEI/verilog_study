module rfile (clk, rst, din, rw, da, aa, ba, adata, bdata, r0, r1);
	
	parameter bw = 8;
	
	input clk, rst;
	input [bw-1:0] din;
	input rw;
	input [3:0] da, aa, ba;
	
	output reg [bw-1:0] adata, bdata;
	output [bw-1:0] r0, r1;
	
	reg [bw-1:0] r0, r1, r2, r3, r4, r5, r6, r7, r8;
	
	always @* begin
		case(aa)
			4'b0000 : adata = r0;
			4'b0001 : adata = r1;
			4'b0010 : adata = r2;
			4'b0011 : adata = r3;
			4'b0100 : adata = r4;
			4'b0101 : adata = r5;
			4'b0110 : adata = r6;
			4'b0111 : adata = r7;
			4'b1000 : adata = r8;
			default : adata = r0;
		endcase
	end	
	
	always @* begin
		case(ba)
			4'b0000 : bdata = r0;
			4'b0001 : bdata = r1;
			4'b0010 : bdata = r2;
			4'b0011 : bdata = r3;
			4'b0100 : bdata = r4;
			4'b0101 : bdata = r5;
			4'b0110 : bdata = r6;
			4'b0111 : bdata = r7;
			4'b1000 : bdata = r8;
			default : bdata = r0;
		endcase
	end
			
	always @ (posedge rst, posedge clk) begin
		if(rst) begin
			r0 <= {bw{1'b0}};
			r1 <= {bw{1'b0}};
			r2 <= {bw{1'b0}};
			r3 <= {bw{1'b0}};
			r4 <= {bw{1'b0}};
			r5 <= {bw{1'b0}};
			r6 <= {bw{1'b0}};
			r7 <= {bw{1'b0}};
			r8 <= {bw{1'b0}};
		end
		else if(rw) begin
			case(da)
				4'b0000 : r0 <= din;
				4'b0001 : r1 <= din;
				4'b0010 : r2 <= din;
				4'b0011 : r3 <= din;
				4'b0100 : r4 <= din;
				4'b0101 : r5 <= din;
				4'b0110 : r6 <= din;
				4'b0111 : r7 <= din;
				4'b1000 : r8 <= din;
				default : r0 <= din;
			endcase
		end
	end
	
endmodule
