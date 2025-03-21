module ALU_tb;
	
	logic [3: 0] a, b, op, result, flags;
	
	ALU test(a, b, op, result, flags);
	
	initial begin
		op = 4'b0000; //suma
		a = 4'd1; b=4'd1;
		#20
		assert(result == 4'd2) else $error("failed %b + %b, expected = 2, got = %b", a, b, result);
		assert(flags == 4'b0000) else $error("%b + %b flags mismatched, expected = 0000, got = %b", a, b, flags);
		
		a = 4'd7; b=4'd6;
		#20
 		assert(result == 4'd13) else $error("failed %b + %b, expected = 13, got = %b", a, b, result);
		assert(flags == 4'b1001) else $error("%b + %b flags mismatched, expected = 1001, got = %b", a, b, flags);
		
		op = 4'b0001; //resta
		a = 4'd4; b=4'd4;
		#20
		assert(result == 4'd0) else $error("failed %b - %b, expected = 0, got = %b", a, b, result);
		assert(flags == 4'b0100) else $error("%b - %b flags mismatched, expected = 0100, got = %b", a, b, flags);
		
		a = 4'd8; b=4'd1;
		#20
 		assert(result == 4'd9) else $error("failed %b - %b, expected = 9, got = %b", a, b, result);
		assert(flags == 4'b0001) else $error("%b - %b flags mismatched, expected = 0001, got = %b", a, b, flags);
		
		op = 4'b0010; //mult
		a = 4'd2; b=4'd4;
		#20
		assert(result == 4'd8) else $error("failed %b * %b, expected = 8, got = %b", a, b, result);
		assert(flags == 4'b1000) else $error("%b * %b flags mismatched, expected = 1000, got = %b", a, b, flags);
		
		a = 4'd6; b=4'd3;
		#20
 		assert(result == 4'd10) else $error("failed %b * %b, expected = 10, got = %b", a, b, result);
		assert(flags == 4'b1001) else $error("%b * %b flags mismatched, expected = 1001, got = %b", a, b, flags);
		
		op = 4'b0011; //div
		a = 4'd6; b=4'd2;
		#20
		assert(result == 4'd3) else $error("failed %b / %b, expected = 3, got = %b", a, b, result);
		assert(flags == 4'b0000) else $error("%b / %b flags mismatched, expected = 0000, got = %b", a, b, flags);
		
		a = 4'd7; b=4'd3;
		#20
 		assert(result == 4'd2) else $error("failed %b / %b, expected = 2, got = %b", a, b, result);
		assert(flags == 4'b0000) else $error("%b / %b flags mismatched, expected = 0000, got = %b", a, b, flags);
		
		op = 4'b0100; //mod
		a = 4'd4; b=4'd3;
		#20
		assert(result == 4'd3) else $error("failed %b mod %b, expected = 3, got = %b", a, b, result);
		assert(flags == 4'b0000) else $error("%b mod %b flags mismatched, expected = 0000, got = %b", a, b, flags);
		
		a = 4'd2; b=4'd2;
		#20
 		assert(result == 4'd0) else $error("failed %b mod %b, expected = 0, got = %b", a, b, result);
		assert(flags == 4'b0100) else $error("%b mod %b flags mismatched, expected = 0100, got = %b", a, b, flags);
		
		op = 4'b0101; //and
		a = 4'b0111; b=4'b0110;
		#20
		assert(result == 4'b0110) else $error("failed %b & %b, expected = 0110, got = %b", a, b, result);
		assert(flags == 4'b0000) else $error("%b & %b flags mismatched, expected = 0000, got = %b", a, b, flags);
		
		a = 4'b1111; b=4'b1111;
 		assert(result == 4'b1111) else $error("failed %b & %b, expected = 10, got = %b", a, b, result);
		assert(flags == 4'b1000) else $error("%b & %b flags mismatched, expected = 1000, got = %b", a, b, flags);
		
		op = 4'b0110; //or
		a = 4'b1111; b=4'b0000;
		#20
		assert(result == 4'b1111) else $error("failed %b | %b, expected = 1111, got = %b", a, b, result);
		assert(flags == 4'b1000) else $error("%b | %b flags mismatched, expected = 1000, got = %b", a, b, flags);
		
		a = 4'b0101; b=4'b0101;
		#20
 		assert(result == 4'b0101) else $error("failed %b | %b, expected = 0101, got = %b", a, b, result);
		assert(flags == 4'b0000) else $error("%b | %b flags mismatched, expected = 0000, got = %b", a, b, flags);
		
		op = 4'b0111; //xor
		a = 4'b1001; b=4'b0110;
		#20
		assert(result == 4'b1111) else $error("failed %b ^ %b, expected = 1111, got = %b", a, b, result);
		assert(flags == 4'b1000) else $error("%b ^ %b flags mismatched, expected = 1000, got = %b", a, b, flags);
		
		a = 4'b1010; b=4'b1010;
		#20
 		assert(result == 4'b0000) else $error("failed %b ^ %b, expected = 0000, got = %b", a, b, result);
		assert(flags == 4'b0100) else $error("%b ^ %b flags mismatched, expected = 0100, got = %b", a, b, flags);
		
		op = 4'b1000; //sr
		a = 4'b1100; b=4'd2;
		#20
		assert(result == 4'b0011) else $error("failed %b >> %b, expected = 0011, got = %b", a, b, result);
		assert(flags == 4'b0000) else $error("%b >> %b flags mismatched, expected = 0000, got = %b", a, b, flags);
		
		a = 4'b1010; b=4'd3;
		#20
 		assert(result == 4'b0001) else $error("failed %b >> %b, expected = 0001, got = %b", a, b, result);
		assert(flags == 4'b0000) else $error("%b >> %b flags mismatched, expected = 0000, got = %b", a, b, flags);
		
		op = 4'b1001; //sl
		a = 4'b1100; b=4'd2;
		#20
		assert(result == 4'b0000) else $error("failed %b << %b, expected = 0000, got = %b", a, b, result);
		assert(flags == 4'b0100) else $error("%b << %b flags mismatched, expected = 0100, got = %b", a, b, flags);
		
		a = 4'b1010; b=4'd3;
		#20
 		assert(result == 4'b0000) else $error("failed %b << %b, expected = 0000, got = %b", a, b, result);
		assert(flags == 4'b0100) else $error("%b << %b flags mismatched, expected = 0100, got = %b", a, b, flags);
		
	end
endmodule
