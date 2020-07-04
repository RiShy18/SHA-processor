module test_shift_right_arithmetic();

parameter N = 3;

logic signed [N-1:0] a;
logic [N-1:0] s;

Shift_right_arithmetic DUT(a, s);


initial begin
	
	#10 a = 3'b101;
	#1	$display("a = %b \ns = %b", a, s);
	
	#10 a = 3'b100;
	#1	$display("a = %b \ns = %b", a, s);
	
	#10 a = 3'b110;
	#1	$display("a = %b \ns = %b", a, s);
	
	#10 a = 3'b011;
	#1	$display("a = %b \ns = %b", a, s);
	
end
endmodule
