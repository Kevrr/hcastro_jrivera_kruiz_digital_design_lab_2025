module getResult #(parameter n = 4)
	(input logic [n - 1: 0] a, b,
	 addRes, subRes, divRes, modRes, 
	 andRes, orRes, xorRes, 
	 sLRes, sRRes,
	 input logic [2*n - 1: 0] multRes,
	 input logic addCout, subCout,
	 input logic [3: 0] op,
	 output logic [n - 1: 0] result,
	 output logic [3: 0] flags);
	 
	always @(*) begin
		case (op)
			4'b0000: begin
				result <= addRes;
				flags[1] = addCout;
				if (a[n - 1] == b[n - 1]) begin
					flags [0] = a[n - 1] != result[n - 1];
				end
			end
			4'b0001: begin
				result <= subRes;
				flags[1] = subCout;
				if (a[n - 1] != b[n - 1]) begin
					flags [0] = a[n - 1] != result[n - 1];
				end
			end
			4'b0010: begin
				result <= multRes[n - 1: 0];
				if (multRes[2*n - 1: n] != 0) begin
					flags [0] = 1'b1;
				end
			end
			4'b0011: begin
				result <= divRes;
			end
			4'b0100: begin
				result <= modRes;
			end
			4'b0101: begin
				result <= andRes;
			end
			4'b0110: begin
				result <= orRes;
			end
			4'b0111: begin
				result <= xorRes;
			end
			4'b1000: begin
				result <= sLRes;
			end
			4'b1001: begin
				result <= sRRes;
			end
			default: result <= 'b0;
		endcase
		
		flags[3] = result[n - 1];
		flags[2] = result == 0;
	end
	
endmodule
