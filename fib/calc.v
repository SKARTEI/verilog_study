module calc (a, b, sel, hout);

   parameter bw = 8;
   parameter pw = bw/2;
   
   input [bw-1:0] a, b;
   input [1:0] sel;
   output [bw-1:0] hout;
   
   wire[bw-1:0] d_out, m_out;
   
   assign hout = (sel[0]) ? d_out : m_out;
   
   mul #(pw) u0 (a[pw-1:0], b[pw-1:0], m_out);
   div #(bw) u1 (a, b, d_out);



endmodule
