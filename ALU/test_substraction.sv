module test_substraction();

logic [2:0] a;
logic [2:0] b;
logic cin;
logic [5:0] s;
logic cout;

Substraction DUT(a, b, cin, s, cout);


initial begin

	// a > b
	#1	$display(" a > b \n");
	
	
	#10 a = 3'b101; b = 3'b100;
	#1	$display("a = %b, b = %b, cin = %d\n", a, b, cin);
	#1	$display("s = %b, cout = %b\n", s, cout);
	
	#10 a = 3'b001; b = 3'b000;
	#1	$display("a = %b, b = %b, cin = %d\n", a, b, cin);
	#1	$display("s = %b, cout = %b\n", s, cout);
	
	#10 a = 3'b101; b = 3'b001;
	#1	$display("a = %b, b = %b, cin = %d\n", a, b, cin);
	#1	$display("s = %b, cout = %b\n", s, cout);
	
	#10 a = 3'b111; b = 3'b100; 
	#1	$display("a = %b, b = %b, cin = %d\n", a, b, cin);
	#1	$display("s = %b, cout = %b\n", s, cout);
	
	
	// a < b
	#1	$display(" a < b \n");
	
	#10 a = 3'b100; b = 3'b101; 
	#1	$display("a = %b, b = %b, cin = %d\n", a, b, cin);
	#1	$display("s = %b, cout = %b\n", s, cout);
	
	#10 a = 3'b000; b = 3'b001;
	#1	$display("a = %b, b = %b, cin = %d\n", a, b, cin);
	#1	$display("s = %b, cout = %b\n", s, cout);
	
	#10 a = 3'b001; b = 3'b011; 
	#1	$display("a = %b, b = %b, cin = %d\n", a, b, cin);
	#1	$display("s = %b, cout = %b\n", s, cout);
	
	#10 a = 3'b100; b = 3'b111;
	#1	$display("a = %b, b = %b, cin = %d\n", a, b, cin);
	#1	$display("s = %b, cout = %b\n", s, cout);

end
endmodule
