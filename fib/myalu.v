module myalu (opa, opb, sel, psw, out);
	parameter bw = 8;

	input [bw-1:0] opa, opb;
	input [3:0] sel;
	output [3:0] psw;
	output [bw-1:0] out;
	
	wire [1:0] lsel;
	reg [bw-1:0] lout; 
	wire [bw-1:0] aout;
	wire cout, vout, c, v, z, n;
	
	assign lsel = sel[2:1];
	assign out = sel[3] ? lout : aout;
	assign z = ~|aout;
	assign n = aout[bw-1];
	assign c = sel[3] ? 1'b0 : cout;
	assign v = sel[3] ? 1'b0 : vout;
	assign psw = {z, n, c, v};
	
	//logic unit
	always @* begin
		case (lsel)
			2'b00 : lout = opa & opb;
			2'b01 : lout = opa | opb;
			2'b10 : lout = opa ^ opb;
			2'b11 : lout = ~opa;
			default : lout = opa; 
		endcase
	end
	
	//arith unit
	arith #(bw) u0 (opa, opb, sel[2:0], cout, vout, aout);
	//assign n = ;
	
	
endmodule
