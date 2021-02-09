module div (a, b, q);
	
	parameter bw = 8;
	
	input [bw-1:0] a;
	input [bw-1:0] b;
	output reg [bw-1:0] q;

	reg [bw-1:0] aa, bb, pl;
	integer i;

	always@ (a or b) begin
		aa = a;
		bb = b;
		pl = {bw{1'b0}};
		for(i = 0; i<bw; i = i+1'b1) begin
			pl = {pl[bw-2:0],aa[bw-1]};
			aa[bw-1:1] = aa[bw-2:0];
			pl = pl - bb;
			if(pl[bw-1] == 1) begin
				aa[0] = 1'b0;
				pl = pl +bb;
			end
			else
				aa[0] = 1'b1;
			end
		q = aa;
		end
		
endmodule
