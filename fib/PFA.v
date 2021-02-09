module PFA (x, y, cin, s, cout);

parameter bw = 8;

input [bw-1:0] x, y, cin;
output [bw-1:0] s, cout;

genvar i;

generate 
	for (i = 0; i < bw; i = i +1) begin : pu
		FA u (x[i], y[i], cin[i], s[i], cout[i]);
		
	end
	
endgenerate
	
endmodule
