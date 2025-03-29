module multiplier #(parameter n = 4)
	(input logic [n - 1: 0] a, b,
	 output logic [2*n - 1: 0] y);
	
	always_comb begin
		y = a * b;
	end
	
endmodule
