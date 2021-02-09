module myself (opa, opb, sel, hout, c);

	parameter bw = 8;
	
	input [bw-1:0] opa, opb;
	input [2:0] sel;
	
	output [bw-1:0] hout; 
	output c;
	
	wire [bw-1:0] c_hout, s_hout;
	wire sh_c;
	
	assign hout = (sel[2] && sel[1]) ? c_hout : s_hout;
	assign c = (sel[2] && sel[1]) ? 1'b0 : sh_c;
	
	shifter #(bw) u0 (opb, sel, s_hout, sh_c);
	calc #(bw) u1 (opa, opb, sel[1:0], c_hout);


endmodule
