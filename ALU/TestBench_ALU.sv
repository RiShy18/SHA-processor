module TestBench_ALU();

parameter N = 3;

logic [N-1:0] a;
logic [N-1:0] b;
logic [N:0] AluControl;
logic [N-1:0] AluResult; 
logic z;
logic n;

//logic z, o, c, n);

Alu DUT(a, b, AluControl, AluResult, z, n);


initial begin
	
	#10 a = 3'b001; b = 3'b001; AluControl = 3'b000;
	#1	$display("AluResult = %b \n", AluResult);
	#1	$display("z = %b  n = %b \n", z, n);
	
	#10 a = 3'b111; b = 3'b100; AluControl = 3'b010;
	#1	$display("AluResult = %b \n", AluResult);
	#1	$display("z = %b  n = %b \n", z, n);
	
	#10 a = 3'b111; b = 3'b101; AluControl = 3'b100;
	#1	$display("AluResult = %b \n", AluResult);
	#1	$display("z = %b  n = %b \n", z, n);
	
	#10 a = 3'b010; b = 3'b110; AluControl = 3'b011;
	#1	$display("AluResult = %b \n", AluResult);
	#1	$display("z = %b  n = %b \n", z, n);
	
end
endmodule
