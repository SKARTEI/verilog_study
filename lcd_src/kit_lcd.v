module kit_lcd ( clk, rstn,
			LCD_DATA, LCD_RW, LCD_EN, LCD_RS, LCD_ON );
input	 clk, rstn;
output wire [7:0] LCD_DATA;
output wire LCD_RW, LCD_EN, LCD_RS, LCD_ON;
//wire   clk1M;

assign LCD_ON = 1'b1;

//apll1Mhz U0 (
//	.inclk0 (clk), .c0 (clk1M));
	
// lcd_display U1(clk1M, rstn, LCD_DATA, LCD_RW, LCD_EN, LCD_RS );		

lcd2 U2 (
	.resetn (rstn),
	.lcdclk (clk),
	.lcd_rs (LCD_RS),
	.lcd_rw (LCD_RW),
	.lcd_en (LCD_EN),
	.lcd_data (LCD_DATA));
		
endmodule
