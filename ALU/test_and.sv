module test_and();

logic [2:0] a;
logic [2:0] b;
logic [5:0] s;

And_ DUT(a, b, s);


initial begin
	
	#10 a = 3'b101; b = 3'b100;
	#1	$display("a = %b, b = %b \n", a, b);
	#1	$display("s = %b\n", s);
	
	#10 a = 3'b101; b = 3'b000;
	#1	$display("a = %b, b = %b \n", a, b);
	#1	$display("s = %b\n", s);
	
	#10 a = 3'b110; b = 3'b101;
	#1	$display("a = %b, b = %b \n", a, b);
	#1	$display("s = %b\n", s);
	
	#10 a = 3'b011; b = 3'b101;
	#1	$display("a = %b, b = %b \n", a, b);
	#1	$display("s = %b\n", s);
	
end
endmodule
