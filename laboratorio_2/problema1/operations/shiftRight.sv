module shiftRight #(parameter n = 4)
	(input logic [n - 1: 0] a, displace,
	 output logic [n - 1: 0] y,
	 output logic sign);	
	
	always @(*) begin
	
		y <= a >> displace;
		sign <= a[n - 1];
	end
	
endmodule
