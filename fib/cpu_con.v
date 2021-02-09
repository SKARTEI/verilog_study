module cpu_con (clk, rst, psw, din, cw, ir_ops, pc);
	
	parameter bw = 8;
	
	input clk, rst;
	input [3:0] psw;
	input [bw-1:0] din;
	output [12:0] cw;
	output [8:0] ir_ops;
	
	output reg [8:0] pc;
	
	wire z, n, c, v;
	
	reg [7:0] car, car_in;
	reg mout;
	reg [bw-1:0] ir;
	
	
	wire [7:0] addr_fet;
	
	wire [27:0] cword; //control word
	
	wire [7:0] naddr, mc_out;
	wire [2:0] ms;
	wire mc, il, pi, pl;
	
		
	wire [8:0] PC_EXTEND;
	
	assign PC_EXTEND = (ir[13]==0) ? {ir[7], ir[7:0]} : {1'b0, ir[7:0]};
	
	assign ir_ops = ir[8:0];
	
	assign z = psw[3];
	assign n = psw[2];
	assign c = psw[1];
	assign v = psw[0];
	
	assign naddr = cword[27:20];
	assign ms = cword[19:17];
	assign mc = cword[16];
	assign il = cword[15];
	assign pi = cword[14];
	assign pl = cword[13];
	
	assign cw = cword[12:0];
	
	always @*
		case(ms)
			3'b000 : mout = 1'b0;
			3'b001 : mout = 1'b1;
			3'b010 : mout = c;
			3'b011 : mout = v;
			3'b100 : mout = z;
			3'b101 : mout = n;
			3'b110 : mout = ~c;
			3'b111 : mout = ~z;
			default : mout = 1'b0;
		endcase

		
	always @ (posedge clk, posedge rst)
		if(rst) pc <= 9'b0; //mmem start
		else if(pi) pc <= pc + 1'b1;	
		else if (pl) begin
			case(ir[13:9])
				5'b00000 : 	if (c) pc <= pc + PC_EXTEND - 1'b1; // BRC
				5'b00001 : 	if (~c) pc <= pc + PC_EXTEND - 1'b1; // BRNC
				5'b00010 : 	if (z) pc <= pc + PC_EXTEND - 1'b1; // BRZ
				5'b00011 : 	if (~z) pc <= pc + PC_EXTEND - 1'b1; // BRNZ
				5'b00100 : 	if (n) pc <= pc + PC_EXTEND - 1'b1; // BRN
				5'b00101 : 	if (v) pc <= pc + PC_EXTEND - 1'b1; // BRV
				5'b10000 : 	pc <= PC_EXTEND;
				default : pc <= pc +1'b1;
			endcase
		end	
		
		
	always @ (posedge clk)
		if(il) ir <= din;
	
	assign mc_out = mc ? {1'b0, ir[15:9]} : naddr;
	
	assign addr_fet = 8'd192;  //check!!!!!!
	
	always @ *  //car reg
		if(rst) car_in = addr_fet; //1 period assure addr 192
		else if((ms[2:1]!==2'b00)) car_in = mc_out;
		else if (mout) car_in = mc_out;
		else car_in = car + 1'b1;
		
		
	always @ (posedge clk)
		car <= car_in;
	
	cwrom u0 (
		.address (car_in),
		.clock (clk),
		.q (cword));
		
endmodule

