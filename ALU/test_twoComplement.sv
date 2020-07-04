module test_twoComplement();

logic [2:0] a;
logic [5:0] s;
logic cout;

twoComplement DUT(a, s, cout);

initial begin	
	#10 a = 3'b101; 
	#1	$display("a = %b,\n", a);
	#1	$display("s = %b, cout = %b\n", s, cout);
	
	#10 a = 3'b000;
	#1	$display("a = %b,\n", a);
	#1	$display("s = %b, cout = %b\n", s, cout);
	
	#10 a = 3'b110;
	#1	$display("a = %b,\n", a);
	#1	$display("s = %b, cout = %b\n", s, cout);
	
	#10 a = 3'b111;
	#1	$display("a = %b,\n", a);
	#1	$display("s = %b, cout = %b\n", s, cout);
	
	
end
endmodule
