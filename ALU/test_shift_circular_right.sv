module test_shift_circular_right();

parameter N = 3;

logic [N-1:0] a;
logic [N-1:0] b;
logic [N-1:0] s;

Shift_circular_right DUT(a, b, s);


initial begin
	
	#10 a = 3'b101; b = 3'b001;
	#1	$display("a = %b b = %b \ns = %b", a, b, s);
	
	#10 a = 3'b100; b = 3'b111;
	#1	$display("a = %b b = %b\ns = %b", a, b, s);
	
	#10 a = 3'b110; b = 3'b101;
	#1	$display("a = %b b = %b\ns = %b", a, b, s);
	
	#10 a = 3'b011; b = 3'b001;
	#1	$display("a = %b b = %b\ns = %b", a, b, s);
	
end
endmodule
