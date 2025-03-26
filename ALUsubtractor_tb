module ALU_tb;

    parameter n = 12; // Parametrizar a 12 bits
    logic [n - 1: 0] a, b, result;
    logic [3: 0] op, flags;

    ALU #(n) test(a, b, op, result, flags);

    initial begin
        op = 4'b0001; // resta

        // Caso 1: 4 - 4 = 0
        a = 12'd4; b = 12'd4;
        #20
        assert(result == 12'd0) else $error("failed %d - %d, expected = 0, got = %d", a, b, result);
        assert(flags == 4'b0100) else $error("%d - %d flags mismatched, expected = 0100, got = %b", a, b, flags);

        // Caso 2: 8 - 1 = 7
        a = 12'd8; b = 12'd1;
        #20
        assert(result == 12'd7) else $error("failed %d - %d, expected = 7, got = %d", a, b, result);
        assert(flags == 4'b0000) else $error("%d - %d flags mismatched, expected = 0000, got = %b", a, b, flags);

        // Caso 3: 15 - 5 = 10
        a = 12'd15; b = 12'd5;
        #20
        assert(result == 12'd10) else $error("failed %d - %d, expected = 10, got = %d", a, b, result);
        assert(flags == 4'b0000) else $error("%d - %d flags mismatched, expected = 0000, got = %b", a, b, flags);

        // Caso 4: 20 - 10 = 10
        a = 12'd20; b = 12'd10;
        #20
        assert(result == 12'd10) else $error("failed %d - %d, expected = 10, got = %d", a, b, result);
        assert(flags == 4'b0000) else $error("%d - %d flags mismatched, expected = 0000, got = %b", a, b, flags);

        // Caso 5: 100 - 50 = 50
        a = 12'd100; b = 12'd50;
        #20
        assert(result == 12'd50) else $error("failed %d - %d, expected = 50, got = %d", a, b, result);
        assert(flags == 4'b0000) else $error("%d - %d flags mismatched, expected = 0000, got = %b", a, b, flags);

        // Caso 6: 200 - 150 = 50
        a = 12'd200; b = 12'd150;
        #20
        assert(result == 12'd50) else $error("failed %d - %d, expected = 50, got = %d", a, b, result);
        assert(flags == 4'b0000) else $error("%d - %d flags mismatched, expected = 0000, got = %b", a, b, flags);

        // Caso 7: 4095 - 2048 = 2047
        a = 12'd4095; b = 12'd2048;
        #20
        assert(result == 12'd2047) else $error("failed %d - %d, expected = 2047, got = %d", a, b, result);
        assert(flags == 4'b0000) else $error("%d - %d flags mismatched, expected = 0000, got = %b", a, b, flags);

    end
endmodule
