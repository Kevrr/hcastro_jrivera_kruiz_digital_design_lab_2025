module ALU_tb;

    parameter n = 32; // Ahora con 32 bits
    logic [n - 1:0] a, b;
    logic [2*n - 1:0] product;

    multiplier #(n) test(a, b, product);

    initial begin
        // Caso 1: 15 * 10 = 150
        a = 32'd15;
        b = 32'd10;
        #20
        assert(product == 64'd150) else
            $error("Error: %0d * %0d, esperado = 150, obtenido = %0d", a, b, product);

        // Caso 2: 12345 * 54321 = 670592745
        a = 32'd12345;
        b = 32'd54321;
        #20
        assert(product == 64'd670592745) else
            $error("Error: %0d * %0d, esperado = 670592745, obtenido = %0d", a, b, product);

        // Caso 3: 0 * 999 = 0
        a = 32'd0;
        b = 32'd999;
        #20
        assert(product == 64'd0) else
            $error("Error: %0d * %0d, esperado = 0, obtenido = %0d", a, b, product);

        // Caso 4: 2^31 * 2 = 4294967296
        a = 32'd2147483648;
        b = 32'd2;
        #20
        assert(product == 64'd4294967296) else
            $error("Error: %0d * %0d, esperado = 4294967296, obtenido = %0d", a, b, product);

        $display("Todos los casos pasaron correctamente.");
        $finish;
    end

endmodule
