`timescale 1ns/100ps
module tb_cpu;

parameter bw = 16;

reg clk, rst;
wire [bw-1:0] r0, r1;

kit_cpu16 #(bw) DUT (clk, rst, r0, r1);

always #103 clk = ~clk;

initial begin
	 clk = 1'b0;
  	 rst = 1'b1; 
	 
	 #150 
	 rst = 1'b0;
	 
	 #500000
	$stop;
 end
 endmodule
 