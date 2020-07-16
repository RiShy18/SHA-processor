`timescale 1ns / 1ps
`define WIDTH 16
module tb_mod_exp;
    
    reg [`WIDTH*2-1:0] base;
	reg [`WIDTH*2-1:0] modulo;
	reg [`WIDTH*2-1:0] exponent;
	reg clk;
	reg reset;
	wire finish;
	wire [`WIDTH*2-1:0] result;
	
	mod_exp uut(base,modulo,exponent,clk,reset,finish,result);
	defparam uut.WIDTH = `WIDTH;
	
	initial begin
	   base = 3237;
	   modulo = 4171;
	   exponent =  2705;
	   clk = 0;
	   reset = 0;
	   #10 reset = 1;
	   #10 reset = 0;
	end
	
	always #5 clk = ~clk;
endmodule