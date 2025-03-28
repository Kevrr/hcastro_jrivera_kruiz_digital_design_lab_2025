module ALU_tb;
    logic [1:0] a_2, b_2;
    logic [3:0] result_2, a_4, b_4;
    logic [7:0] result_4, a_8, b_8;
    logic [15:0] result_8, a_16, b_16;
    logic [31:0] result_16, a_32, b_32;
	 logic [63:0] result_32;
    logic [3:0] op;
    logic [3:0] flags_2, flags_4, flags_8, flags_16, flags_32;

    ALU #(2) test_2(.a(a_2), .b(b_2), .op(op), .result(result_2), .flags(flags_2));
    ALU #(4) test_4(.a(a_4), .b(b_4), .op(op), .result(result_4), .flags(flags_4));
    ALU #(8) test_8(.a(a_8), .b(b_8), .op(op), .result(result_8), .flags(flags_8));
    ALU #(16) test_16(.a(a_16), .b(b_16), .op(op), .result(result_16), .flags(flags_16));
    ALU #(32) test_32(.a(a_32), .b(b_32), .op(op), .result(result_32), .flags(flags_32));

    initial begin
        // Pruebas de Suma
        op = 4'b0000; // Suma
        
        // 2 bits
        a_2 = 2'd1; b_2 = 2'd1; #20;
        assert(result_2 == 2'd2) else $error("failed %d + %d, expected = 2, got = %d", a_2, b_2, result_2);
        
        // 4 bits
        a_4 = 4'd8; b_4 = 4'd7; #20;
        assert(result_4 == 4'd15) else $error("failed %d + %d, expected = 15, got = %d", a_4, b_4, result_4);
        
        // 8 bits
        a_8 = 8'd50; b_8 = 8'd60; #20;
        assert(result_8 == 8'd110) else $error("failed %d + %d, expected = 110, got = %d", a_8, b_8, result_8);
        
        // 16 bits
        a_16 = 16'd1000; b_16 = 16'd2000; #20;
        assert(result_16 == 16'd3000) else $error("failed %d + %d, expected = 3000, got = %d", a_16, b_16, result_16);
        
        // 32 bits
        a_32 = 32'd100000; b_32 = 32'd200000; #20;
        assert(result_32 == 32'd300000) else $error("failed %d + %d, expected = 300000, got = %d", a_32, b_32, result_32);

        // Pruebas de Resta
        op = 4'b0001; // Resta
        
        // 2 bits
        a_2 = 2'd3; b_2 = 2'd1; #20;
        assert(result_2 == 2'd2) else $error("failed %d - %d, expected = 2, got = %d", a_2, b_2, result_2);
        
        // 4 bits
        a_4 = 4'd15; b_4 = 4'd8; #20;
        assert(result_4 == 4'd7) else $error("failed %d - %d, expected = 7, got = %d", a_4, b_4, result_4);
        
        // 8 bits
        a_8 = 8'd100; b_8 = 8'd50; #20;
        assert(result_8 == 8'd50) else $error("failed %d - %d, expected = 50, got = %d", a_8, b_8, result_8);
        
        // 16 bits
        a_16 = 16'd3000; b_16 = 16'd1000; #20;
        assert(result_16 == 16'd2000) else $error("failed %d - %d, expected = 2000, got = %d", a_16, b_16, result_16);
        
        // 32 bits
        a_32 = 32'd300000; b_32 = 32'd100000; #20;
        assert(result_32 == 32'd200000) else $error("failed %d - %d, expected = 200000, got = %d", a_32, b_32, result_32);

        // Pruebas de Multiplicación
        op = 4'b0010; // Multiplicación
        
        // 2 bits
        a_2 = 2'd2; b_2 = 2'd2; #20;
        assert(result_2 == 2'd4) else $error("failed %d * %d, expected = 4, got = %d", a_2, b_2, result_2);
        
        // 4 bits
        a_4 = 4'd4; b_4 = 4'd4; #20;
        assert(result_4 == 4'd16) else $error("failed %d * %d, expected = 16, got = %d", a_4, b_4, result_4);
        
        // 8 bits
        a_8 = 8'd8; b_8 = 8'd8; #20;
        assert(result_8 == 8'd64) else $error("failed %d * %d, expected = 641, got = %d", a_8, b_8, result_8);
        
        // 16 bits
        a_16 = 16'd16; b_16 = 16'd16; #20;
        assert(result_16 == 16'd256) else $error("failed %d * %d, expected = 256, got = %d", a_16, b_16, result_16);
        
        // 32 bits
        a_32 = 32'd32; b_32 = 32'd32; #20;
        assert(result_32 == 32'd1024) else $error("failed %d * %d, expected = 1024, got = %d", a_32, b_32, result_32);

        // Pruebas de Div, Mod, And, Or, Xor, Sr, Sl solo con 4 bits
        op = 4'b0011; // div
        a_4 = 4'd6; b_4 = 4'd2; #20;
        assert(result_4 == 4'd3) else $error("failed %d / %d, expected = 3, got = %d", a_4, b_4, result_4);

        op = 4'b0100; // mod
        a_4 = 4'd4; b_4 = 4'd3; #20;
        assert(result_4 == 4'd1) else $error("failed %d mod %d, expected = 1, got = %d", a_4, b_4, result_4);

        op = 4'b0101; // and
        a_4 = 4'b0111; b_4 = 4'b0110; #20;
        assert(result_4 == 4'b0110) else $error("failed %b & %b, expected = 0110, got = %b", a_4, b_4, result_4);

        op = 4'b0110; // or
        a_4 = 4'b1111; b_4 = 4'b0000; #20;
        assert(result_4 == 4'b1111) else $error("failed %b | %b, expected = 1111, got = %b", a_4, b_4, result_4);

        op = 4'b0111; // xor
        a_4 = 4'b1001; b_4 = 4'b0110; #20;
        assert(result_4 == 4'b1111) else $error("failed %b ^ %b, expected = 1111, got = %b", a_4, b_4, result_4);

        op = 4'b1000; // sr
        a_4 = 4'b1100; b_4 = 4'd2; #20;
        assert(result_4 == 4'b0011) else $error("failed %b >> %d, expected = 0011, got = %b", a_4, b_4, result_4);

        op = 4'b1001; // sl
        a_4 = 4'b1100; b_4 = 4'd2; #20;
        assert(result_4 == 4'b0000) else $error("failed %b << %d, expected = 0000, got = %b", a_4, b_4, result_4);

        $display("Todos los casos pasaron correctamente.");
    end
endmodule