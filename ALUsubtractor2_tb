module ALU_tb;

    parameter n = 32; // Parametrizar a 32 bits
    logic [n - 1: 0] a, b, result;
    logic Cout;

    subtractor #(n) test(a, b, result, Cout);

    initial begin
        // Caso: 123456789 - 98765432 = 24791357
        a = 32'd123456789; // 0111_0101_1011_1100_1101_1011_0001_0101
        b = 32'd98765432;  // 0001_0111_1101_0111_1100_1101_1011_1000
        #20
        assert(result == 32'd24791357) else $error("failed %d - %d, expected = 24791357, got = %d", a, b, result);
        // Las banderas se verificarán según el resultado
    end
endmodule
