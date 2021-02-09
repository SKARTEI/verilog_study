module rca (x, y, cin, sum, v, cout);

parameter bw = 8;

input [bw-1:0] x, y;
input cin;
output wire [bw-1:0] sum;
output wire v, cout;

wire [bw:0] tc;

assign tc[0] = cin;
assign cout = tc[bw];
assign v = tc[bw] ^ tc[bw-1];

genvar i;

generate
	for(i = 0; i < bw; i = i + 1) begin:gu
		FA u0 (x[i], y[i], tc[i], sum[i], tc[i+1]);
	end
endgenerate

endmodule
