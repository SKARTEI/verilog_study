module funit (clk, rst, opa, opb, fs, rw, fout, psw);
	parameter bw = 8;

	input	clk, rst;
	input [bw-1:0] opa, opb;
	input [4:0] fs;
	input rw;
	output [bw-1:0] fout;
	output reg [3:0] psw;

	wire [bw-1:0] gout, hout, fout;
	wire [3:0] apsw, cpsw, gsel;
	wire [2:0] hsel;
	wire mf, c, m_cout;

	assign gsel = fs[3:0];
	assign hsel = fs[3:1];
	assign mf = fs[4];


	myalu #(bw) u0 (opa, opb, gsel, apsw, gout);

	myself #(bw) u1 (opa, opb, hsel, hout, m_cout);
	
	//assign c = mf ? cpsw[1] : m_cout;
	assign fout = mf ? hout : gout;
	
	assign cpsw[0] = apsw[0];
	assign cpsw[1] = mf ? m_cout : apsw[1];
	assign cpsw[2] = (gout[bw-1] == 1'b1 && ~mf) ? 1'b1 : 1'b0; // n
	assign cpsw[3] = (~|fout) ? 1'b1 : 1'b0; // z
	
	always @(posedge rst, posedge clk) begin
	if (rst) psw <= 4'b0;
	else if (rw) psw <= cpsw;
	end

endmodule
