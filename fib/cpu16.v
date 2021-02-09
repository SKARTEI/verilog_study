module cpu16 (clk, rst, din, mw, addr, dout, r0, r1);
	
	parameter bw = 16;
	
	input clk, rst;
	input [bw-1:0] din;
	output mw;
	output [bw-1:0] dout;
	output [8:0] addr;
	
	output [bw-1:0] r0, r1;

	wire [12:0] cw;
	wire [3:0] psw;
	wire [8:0] pc_out;
	wire [8:0] ir_ops;
	
	assign mw = cw[0];

	cpu_dp #(bw) u0 (clk, rst, cw, ir_ops, din, pc_out, addr, dout, psw, r0, r1);
	cpu_con #(bw) u1 (clk, rst, psw, din, cw, ir_ops, pc_out);

	
endmodule
