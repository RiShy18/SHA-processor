module twoComplement #(parameter N = 3)(input logic [N-1:0] a, output logic [N-1:0] s, output logic cout);
	
//	assign s = (~b && ((~a && cin) || (a && ~cin))) && (b && ((~a && ~cin) || (a && cin)));
//	assign cout = (~a && (cin || b) ) || (b && cin);

	assign {cout,s} = ~a + 1'b1;
	

endmodule
