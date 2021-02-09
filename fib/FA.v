module FA (x, y, ci, s, co);
	input x, y, ci;
	output wire co, s;

	assign s = x ^ y ^ ci;
	assign co = (x & y) | (ci & (x | y));

endmodule
