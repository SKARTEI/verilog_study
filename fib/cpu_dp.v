module cpu_dp (clk, rst, cw, ir_ops, din, pc_out, addr, dout, psw, r0, r1); //dp
	
	parameter bw = 8;
	
	input clk, rst;
	input [12:0] cw;
	input [bw-1:0] din;
	output [bw-1:0] dout;
	output [8:0] addr;
	output [3:0] psw;
	input [8:0] pc_out;
	input [8:0] ir_ops;
	
	output [bw-1:0] r0, r1;

	wire [bw-1:0] busa, busb, fout;
	wire [4:0] fs;
	wire [3:0] psw;
	wire [bw-1:0] busd, bdata; 
	wire [3:0] da, aa, ba;
	wire rw, mb, md, mm;

	assign addr = mm ? pc_out : busa[8:0];
	assign dout = busb;

	assign da = {cw[12], ir_ops[8:6]}; //check
	assign aa = {cw[11], ir_ops[5:3]};
	assign ba = {cw[10], ir_ops[2:0]};
	assign mb = cw[9];
	assign fs = cw[8:4];
	assign md = cw[3];
	assign rw = cw[2];
	assign mm = cw[1];

	funit #(bw) u0 (clk, rst, busa, busb, fs, rw, fout, psw);
	rfile #(bw) u1 (clk, rst, busd, rw, da, aa, ba, busa, bdata, r0, r1);

	assign busb = mb ? {13'b0, ir_ops[2:0]} : bdata;
	assign busd = md ? din : fout;
	

endmodule
