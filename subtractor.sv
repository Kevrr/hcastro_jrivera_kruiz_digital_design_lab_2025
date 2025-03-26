module subtractor #(parameter n = 4)
	(input logic [n - 1: 0] a, b,
	 output logic [n - 1: 0] y,
	 output logic Cout);
	
	assign y = a - b;
	assign Cout = 1'b0;
	
endmodule
