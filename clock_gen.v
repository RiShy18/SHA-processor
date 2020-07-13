module clock_gen;
	reg clk;
	reg x,y;
	wire z;
	and_ DUT(
			.x(x),
			.y(y),
			.z(z)
			);
	initial clk=0;
	always #10 clk=~clk;
	initial begin
		x=0;
		y=0;
		#100
		x=1;
		#100
		y=1;
		#100;
	end
endmodule 