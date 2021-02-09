module mul (x, y, p);

	parameter bw = 8;
	localparam pw = bw*2;
	input [bw-1:0] x, y;
	output wire [pw-1:0] p;

	wire [bw-1:0] xy[0:7];
	wire [bw-1:0] s[1:7];
	wire tw[1:7];

	genvar i;

	generate
		for(i = 0; i < bw; i = i + 1) begin:ga
			assign xy[i] = {bw{y[i]}} & x;
		end
	endgenerate

	rca #(bw) u0 ({1'b0, xy[0][bw-1:1]}, xy[1], 1'b0, s[1], , tw[1]);

	generate
		for(i = 2; i < bw; i = i + 1) begin:gr
			rca #(bw) ur ({tw[i-1], s[i-1][bw-1:1]}, xy[i], 1'b0, s[i], , tw[i]);
		end
	endgenerate

	assign p = {tw[7], s[7][bw-1:0], s[6][0], s[5][0], s[4][0], s[3][0], s[2][0], s[1][0], xy[0][0]};


endmodule
