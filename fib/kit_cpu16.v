module kit_cpu16 (clk, rst, r0, r1, LCD_ON);
	
	parameter bw = 16;
	
	input clk, rst;
	output [bw-1:0] r0, r1;
	output LCD_ON;
	wire mw;
	wire [bw-1:0] din, dout;
	wire [8:0] addr;
	wire clk1M;
	wire rstn;
	assign LCD_ON = 1'b1;

	assign rstn = ~rst;
	
	cpu16 #(bw) u0 (clk, rst, din, mw, addr, dout, r0, r1);
	
	clk_1k u2 (
	.inclk0(clk),	//50M
	.c0(clk1M),		//1M
	.c1(),		//10k
	.c2());	
	
	mmem u1 (
	.address(addr),
	.clock(clk1M),
	.data(dout),
	.wren(mw),
	.q(din));
	
endmodule
