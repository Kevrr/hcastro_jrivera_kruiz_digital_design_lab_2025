module ALU_tb;
	logic [9:0] a, b, result;
	logic [3:0] flags;
	logic [9:0] a_10, b_10, result_10;
    logic [31:0] a_32, b_32, result_32;
    logic [3:0] op;
    logic [3:0] flags_10, flags_32;
    
    ALU #(10) test_10(.a(a_10), .b(b_10), .op(op), .result(result_10), .flags(flags_10));
    ALU #(32) test_32(.a(a_32), .b(b_32), .op(op), .result(result_32), .flags(flags_32));
    
	initial begin
		// Test 1: Suma 10 bits
        op = 4'b0000; // Suma
        a_10 = 10'd1; b_10 = 10'd1;
        #20;
        assert(result_10 == 10'd2) else $error("failed %d + %d, expected = 2, got = %d", a_10, b_10, result_10);
        assert(flags_10 == 4'b0000) else $error("%d + %d flags mismatched, expected = 0000, got = %b", a_10, b_10, flags_10);
        
        // Test 2: Suma con números más grandes 10 bits
        a_10 = 10'd324; b_10 = 10'd324;
        #20;
        assert(result_10 == 10'd648) else $error("failed %d + %d, expected = 648, got = %d", a_10, b_10, result_10);
        assert(flags_10 == 4'b0001) else $error("%d + %d flags mismatched, expected = 0001, got = %b", a_10, b_10, flags_10);
        
        // Test 3: Suma 32 bits
        op = 4'b0000; // Suma
        a_32 = 32'd100000; b_32 = 32'd200000;
        #20;
        assert(result_32 == 32'd300000) else $error("failed %d + %d, expected = 300000, got = %d", a_32, b_32, result_32);
        assert(flags_32 == 4'b0000) else $error("%d + %d flags mismatched, expected = 0000, got = %b", a_32, b_32, flags_32);
        
        // Test 4: Suma con números más grandes 32 bits
        a_32 = 32'd123456789; b_32 = 32'd987654321;
        #20;
        assert(result_32 == 32'd1111111110) else $error("failed %d + %d, expected = 1111111110, got = %d", a_32, b_32, result_32);
        assert(flags_32 == 4'b0001) else $error("%d + %d flags mismatched, expected = 0001, got = %b", a_32, b_32, flags_32);
          
		op = 4'b0001; //resta
		a = 4'd4; b=4'd4;
		#20
		assert(result == 4'd0) else $error("failed %d - %d, expected = 0, got = %d", a, b, result);
		assert(flags == 4'b0100) else $error("%d - %d flags mismatched, expected = 0100, got = %b", a, b, flags);
		
		a = 4'd8; b=4'd1;
		#20
 		assert(result == 4'd9) else $error("failed %d - %d, expected = 9, got = %d", a, b, result);
		assert(flags == 4'b0001) else $error("%d - %d flags mismatched, expected = 0001, got = %b", a, b, flags);
		
		op = 4'b0010; //mult
		a = 4'd2; b=4'd4;
		#20
		assert(result == 4'd8) else $error("failed %d * %d, expected = 8, got = %d", a, b, result);
		assert(flags == 4'b1000) else $error("%d * %d flags mismatched, expected = 1000, got = %b", a, b, flags);
		
		a = 4'd6; b=4'd3;
		#20
 		assert(result == 4'd10) else $error("failed %d * %d, expected = 10, got = %d", a, b, result);
		assert(flags == 4'b1001) else $error("%d * %d flags mismatched, expected = 1001, got = %b", a, b, flags);
		
		op = 4'b0011; //div
		a = 4'd6; b=4'd2;
		#20
		assert(result == 4'd3) else $error("failed %d / %d, expected = 3, got = %d", a, b, result);
		assert(flags == 4'b0000) else $error("%d / %d flags mismatched, expected = 0000, got = %b", a, b, flags);
		
		a = 4'd7; b=4'd3;
		#20
 		assert(result == 4'd2) else $error("failed %d / %d, expected = 2, got = %d", a, b, result);
		assert(flags == 4'b0000) else $error("%d / %d flags mismatched, expected = 0000, got = %b", a, b, flags);
		
		op = 4'b0100; //mod
		a = 4'd4; b=4'd3;
		#20
		assert(result == 4'd3) else $error("failed %d mod %d, expected = 3, got = %d", a, b, result);
		assert(flags == 4'b0000) else $error("%d mod %d flags mismatched, expected = 0000, got = %b", a, b, flags);
		
		a = 4'd2; b=4'd2;
		#20
 		assert(result == 4'd0) else $error("failed %d mod %d, expected = 0, got = %d", a, b, result);
		assert(flags == 4'b0100) else $error("%d mod %d flags mismatched, expected = 0100, got = %b", a, b, flags);
		
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
		assert(result == 4'b0011) else $error("failed %b >> %d, expected = 0011, got = %b", a, b, result);
		assert(flags == 4'b0000) else $error("%b >> %d flags mismatched, expected = 0000, got = %b", a, b, flags);
		
		a = 4'b1010; b=4'd3;
		#20
 		assert(result == 4'b0001) else $error("failed %b >> %d, expected = 0001, got = %b", a, b, result);
		assert(flags == 4'b0000) else $error("%b >> %d flags mismatched, expected = 0000, got = %b", a, b, flags);
		
		op = 4'b1001; //sl
		a = 4'b1100; b=4'd2;
		#20
		assert(result == 4'b0000) else $error("failed %b << %d, expected = 0000, got = %b", a, b, result);
		assert(flags == 4'b0100) else $error("%b << %d flags mismatched, expected = 0100, got = %b", a, b, flags);
		
		a = 4'b1010; b=4'd3;
		#20
 		assert(result == 4'b0000) else $error("failed %b << %d, expected = 0000, got = %b", a, b, result);
		assert(flags == 4'b0100) else $error("%b << %d flags mismatched, expected = 0100, got = %b", a, b, flags);
		
	end
endmodule
