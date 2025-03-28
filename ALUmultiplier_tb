module ALU_tb;

    parameter n = 4; // Parametrizar a 4 bits
    logic [n - 1: 0] a, b;
    logic [2*n - 1: 0] product;

    multiplier #(n) test(a, b, product);

    initial begin
        // Caso 1: 3 * 2 = 6
        a = 4'b0011; // 3 en decimal
        b = 4'b0010; // 2 en decimal
        #20
        assert(product == 8'b00000110) else $error("failed %d * %d, expected = 6, got = %d", a, b, product);

        // Caso 2: 7 * 5 = 35
        a = 4'b0111; // 7 en decimal
        b = 4'b0101; // 5 en decimal
        #20
        assert(product == 8'b00100011) else $error("failed %d * %d, expected = 35, got = %d", a, b, product);
    end
endmodule
