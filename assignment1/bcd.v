module bcd (rst, en, clk,q, tco);
input rst, en, clk;
output [3:0] q;
output tco;
reg [3:0] q;
reg tco;

always @ (posedge rst or posedge clk)
  if (rst)
	begin q <= 4'b0000; tco <= 1'b1; end
  else if (en)
     if (q==4'd8)
	begin q <= q+1'b1; tco <= 1'b0; end
     else if (q==4'd9)
	begin q <= 4'b0000; tco <= 1'b1; end
     else 
	begin q <= q+1'b1; tco <= 1'b1; end
endmodule 