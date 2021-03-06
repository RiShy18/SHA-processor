`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    00:56:20 10/7/2020  
// Design Name: 
// Module Name:    Main 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module Main(
    input [15:0] M,
    //input [7:0] A,
	 //input [7:0]p,
	 //input [7:0]q,
	 input clk,
    input start,
	 input start1,
	 input start2,
	 
	 //input [7:0]e,
	 input [15:0]n,
	 input [15:0] d,// */

	 output [15:0]remainder,
	 output [7:0]e,
	 output finish,
	 output fin1,
	 output finished
    );
	 //p(8) and q(8) take through A by insel
	 //first n(16) and e(16) has to be generated to be transferred to client
	 //then C will be taken as input from the server
	 
	 //reg[15:0] e, d, n, p, q;
	 //parameter [15:0] e= 16'b111101110001;
	 //parameter [16:0] n = 16'b1000001001011;
	 //parameter [15:0] p = 16'b01100001;
	 //parameter [15:0] q = 16'b00101011;
	 //parameter [15:0] d = 16'b101010010001;
	 /*
	 always begin 
			
			assign d[15:0]= 4'd2705;
			assign n[15:0]= 4'd4171;
			assign p[15:0]= 2'd97;
			assign q[15:0]=2'd43;
	 end */

		
	 		 //reg [15:0] n,d;
//	 reg [15:0]d1;
	 keygen k1 (p,q,start,clk,e,finish);
	 dnew kd1 (p,q,e,clk,start1,n,d,fin1);
	 modularmult m1 (M,d,n,start2,clk,finished,Mpower,remainder);


endmodule
