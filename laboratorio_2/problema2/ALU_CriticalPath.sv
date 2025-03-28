module ALU_CriticalPath #(parameter n = 4)
	(input logic clk, rst,
	 input logic [n - 1: 0] a, b,
	 input logic [3: 0] op,
	 output logic [n-1: 0] current_res,
	 output logic [3: 0] current_flags);
	 
	 logic [n - 1: 0] current_a, current_b, result;
	 logic [3: 0] current_op, flags;

	 register #(n) a_reg(clk, rst, 1'b1, a, current_a);
	 register #(n) b_reg(clk, rst, 1'b1, b, current_b);
	 register #(4) op_reg(clk, rst, 1'b1, op, current_op);
	 
	 ALU #(n) measuring(current_a, current_b, current_op, result, flags);
	 
	 register #(n) res_reg(clk, rst, 1'b1, res, current_res);
	 register #(4) flags_reg(clk, rst, 1'b1, flags, current_flags);
	 
endmodule
