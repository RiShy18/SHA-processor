`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   15:04:38 10/07/2020
// Design Name:   Main
// Module Name:   test_bench.v
// Project Name:  SHA-processor
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: Main
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module test_bench;

	// Inputs
	reg [15:0] M; //, n, d;
	reg [7:0] p;
	reg [7:0] q;
	reg clk;
	reg start;
	reg start1;
	reg start2;

	// Outputs
	//wire [7:0] e;
	//wire [15:0] n;
	wire [15:0] remainder;
	//wire [15:0] d;
	wire finish;
	wire fin1;
	wire finished;

	// Instantiate the Unit Under Test (UUT)
	Main uut (
		.M(M), 
		//.p(p), 
		//.q(q), 
		.clk(clk), 
		.start(start), 
		.start1(start1), 
		.start2(start2), 
		//.e(e), 
		//.n(n), 
		.remainder(remainder), 
		//.d(d), 
		.finish(finish), 
		.fin1(fin1),
		.finished(finished)
	);

	initial begin
		// Initialize Inputs
		M = 0;
		p = 0;
		q = 0;
		//n=0;
		//d=0;
		clk = 0;
		start = 0;
		start1 = 0;
		start2 = 0;

		// Wait 100 ns for global reset to finish
		#10;
      M = 3237;
		//n = 4171;
		//d= 2705;
		
		p = 97;
		q = 43;
		#10;
		start = 1;
		#5;
		start=0;
		#40;
		start1=1;
		#10;
		start1=0;
		#30;
		start2=1;
		#10;start2=0;
		// Add stimulus here

	end
      always #0.1 clk=!clk;
      
endmodule



