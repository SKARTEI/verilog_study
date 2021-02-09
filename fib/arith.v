module arith (a, b, sel, cout, v, aout);
	parameter bw = 8;

	input [bw-1:0] a, b;
	input [2:0] sel;
	output cout, v;
	output [bw-1:0] aout;
	
	wire [bw-1:0] y;
	
	assign y = (b & {bw{sel[1]}}) | (~b & {bw{sel[2]}});
	
	rca #(bw) u0 (a, y, sel[0], aout, v, cout);
	
endmodule
