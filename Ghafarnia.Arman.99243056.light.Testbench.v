`include "Ghafarnia.Arman.99243056.light.v"
`timescale 1s/1s
module arman();

        wire [2 : 0] light_B;
	wire [2 : 0] light_A;
	reg res,clk;
	light tl(light_A,light_B,clk,res);


	initial clk = 1;

	always #(0.5) clk = ~clk;

	initial begin
	res = 0;
	#1
	res = 1;
	#1
	res = 0;
	end
	
endmodule