module BCD_tb();

	logic [3:0] x;
	logic [6:0] units_seg;
	logic [1:0] tens_seg;
	
	BCD test (x, units_seg, tens_seg);
	
	initial begin 
	x = 4'b0000;
	#40;
	x = 4'b0001;
	#40;
	x = 4'b0010;
	#40;
	x = 4'b0011;
	#40;
	x = 4'b0100;
	#40;
	x = 4'b0101;
	#40;
	x = 4'b0110;
	#40;
	x = 4'b0111;
	#40;
	x = 4'b1000;
	#40;
	x = 4'b1001;
	#40;
	x = 4'b1010;
	#40;
	x = 4'b1011;
	#40;
	x = 4'b1100;
	#40;
	x = 4'b1101;
	#40;
	x = 4'b1110;
	#40;
	x = 4'b1111;
	
	end
	
endmodule
