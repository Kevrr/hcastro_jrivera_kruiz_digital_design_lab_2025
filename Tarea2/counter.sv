module counter #(parameter n = 8) 
	(input clk, rst, en,
	 output [n - 1: 0] q);
											 
	always_ff @(negedge clk or posedge rst)
		if (rst) q = 8'h0;
		else
			if (en) q = q + 1'b1;
			
endmodule
