module t7485 (e, f, oeq1, oeq2, eq); 
input [7:0] e,f;
output oeq1, oeq2, eq;
wire eq;

assign eq = oeq1&&oeq2 ;
/*t7485_1 U1 (.e(e[7:4]), .f(f[7:4]), .oeq(oeq1),.ieq(1'b1), .iegf(1'b0), .ielf(1'b0));
t7485_1 U2 (.e(e[3:0]), .f(f[3:0]), .oeq(oeq2),.ieq(1'b1), .iegf(1'b0), .ielf(1'b0));*/

t7485_1 U1 (.e(e[7:4]), .f(f[7:4]), .iegf(1'b0), .ielf(1'b0), .ieq(1'b1), .oeq(oeq1), .oegf(), .oelf());
t7485_1 U2 (.e(e[3:0]), .f(f[3:0]), .iegf(1'b0), .ielf(1'b0), .ieq(1'b1), .oeq(oeq2), .oegf(), .oelf());


endmodule 