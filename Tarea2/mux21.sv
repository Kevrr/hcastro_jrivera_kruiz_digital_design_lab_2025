module mux21 #(parameter n = 8) 
	(input [n - 1: 0] a, b,
	 input sel,
	 output [n - 1: 0] c);

	assign c = sel ? b : a;

endmodule
