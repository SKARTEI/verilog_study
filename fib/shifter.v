module shifter (din, sel, dout, c);
	parameter bw = 8;

	input [bw-1:0] din;
	input [2:0] sel;
	output reg [bw-1:0] dout;
	output reg c;

	always @* begin
		case (sel)
			3'b000: begin dout = din;								c = 1'b0; 		end  	//MVB
			3'b001: begin dout = {din[bw-1], din[bw-1:1]};	c = din[0]; 	end   //ASR
			3'b010: begin dout = {1'b0, din[bw-1:1]};			c = din[0]; 	end   //LSR
			3'b011: begin dout = {din[bw-2:0], 1'b0};			c = din[bw-1]; end   //LSL
			3'b100: begin dout = {din[0], din[bw-1:1]};		c = din[0]; 	end   //RSR
			3'b101: begin dout = {din[bw-2:0], din[bw-1]};	c = din[bw-1];	end   //RSL
			default : begin dout = din;							c = 1'b0;		end  
		endcase
	end

endmodule
