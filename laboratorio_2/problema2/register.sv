module register #(parameter n = 4) 
	(input logic clk, rst, en,
    input logic [n - 1: 0] d,
    output logic [n - 1: 0] q);

	always_ff @(posedge clk or posedge rst) begin
		if (rst) q <= 'b0;
		else if (en) q <= d;
    end

endmodule
