module sevenseg(input logic [2: 0] x,
					 input logic x_sign,
					 output logic [6: 0] seg);
					 
	always_comb begin
		case (x) 
							 //b6543201
			3'h0: seg <= {x_sign, 6'b000000}; // 0
			3'h1: seg <= 7'b1111001; // 1
			3'h2: seg <= 7'b0100100; // 2
			3'h3: seg <= 7'b0110000; // 3
			3'h4: seg <= 7'b0011001; // 4
			3'h5: seg <= 7'b0010010; // 5
			3'h6: seg <= 7'b0000010; // 6
			3'h7: seg <= 7'b1111000; // 7
					
			default: seg = 7'b1000000;
					
		endcase
	end
	
endmodule
