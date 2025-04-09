module comparator #(parameter n = 8) 
	(input [n - 1: 0] a, b,
	 output equal);
												
	assign equal = (a == b);
	
endmodule
