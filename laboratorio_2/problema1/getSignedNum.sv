module getSignedNum (input logic [3: 0] x,
							output logic x_sign,
							output logic [2: 0] x_signed);
	
	assign x_sign = ~x[3];
	always_comb begin
		x_signed = x[3] ? ~x[2: 0] : x[2: 0];
		if (x[3]) begin 
			x_signed += 1;
		end
	end
endmodule
