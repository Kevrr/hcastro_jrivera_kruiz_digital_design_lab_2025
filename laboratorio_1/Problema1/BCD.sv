module BCD (input logic [3:0] x,
				output logic [6:0] units_seg,
				output logic [1:0] tens_seg);
				
	assign units_seg[6] = (~x[3] & ~x[1] |
								 x[3] & x[1]) & 
								 ~x[2];
							
	assign units_seg[5] = ~x[3] & ~x[2] & x[0] | 
						       ~x[3] & ~x[2] & x[1] |
						       ~x[3] & x[1] & x[0] | 
						       x[3] & x[2] & ~x[1] |
						       ~x[2] & x[1] & x[0];
						 
	assign units_seg[4] = x[0] |
						       x[2] & (~x[3] & ~x[1] |
						       x[3] & x[1]);
						 
	assign units_seg[3] = ~x[3] & ~x[2] & ~x[1] & x[0] |
						       ~x[3] & x[2] & ~x[1] & ~x[0] | 
						       ~x[3] & x[2] & x[1] & x[0] | 
						       x[3] & x[2] & x[1] & ~x[0] |
								 x[3] & ~x[2] & x[1] & x[0];
						 
	assign units_seg[2] = (~x[3] & ~x[2] & x[1] |
						       x[3] & x[2] & ~x[1]) & 
						       ~x[0];
						 
	assign units_seg[1] = (~x[3] & ~x[1] & x[0] |
						       ~x[3] & x[1] & ~x[0] |
						       x[3] & x[1] & x[0]) &
						       x[2];
						 
	assign units_seg[0] = ~x[3] & ~x[2] & ~x[1] & x[0] |
						       ~x[3] & x[2] & ~x[1] & ~x[0] |
						       x[3] & x[2] & x[1] & ~x[0] |
						       x[3] & ~x[2] & x[1] & x[0];
								 
	assign tens_seg[1] = x[3] & (x[2] | x[1]);
	assign tens_seg[0] = tens_seg[1];
	
endmodule
