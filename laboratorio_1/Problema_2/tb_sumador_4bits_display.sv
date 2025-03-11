module tb_sumador_4bits_display;

    // Señales de prueba
    logic [3:0] A, B;
    logic [6:0] units_seg, tens_seg;
    logic [4:0] S;    // Resultado de la suma con 5 bits (4 bits + posible acarreo)

    // Instanciación del módulo sumador_4bits_display
    sumador_4bits_display uut (
        .A(A),
        .B(B),
        .units_seg(units_seg),
        .tens_seg(tens_seg),
        .S(S)  // Conectar S para poder visualizarlo
    );

    // Simulación
    initial begin
        // Iniciar con valores conocidos
        $display("Iniciando prueba...");

        // Prueba 1: A = 1111 (15), B = 1010 (10)
        A = 4'b1111; B = 4'b1010; // A = 15, B = 10
        #10; // Espera 10 unidades de tiempo
        $display("A = %b, B = %b -> Suma: %b (Decimal: %0d), Unidades: %b, Decenas: %b", A, B, S, S, units_seg, tens_seg);

        // Prueba 2: A = 0101 (5), B = 0110 (6)
        A = 4'b0101; B = 4'b0110; // A = 5, B = 6
        #10;
        $display("A = %b, B = %b -> Suma: %b (Decimal: %0d), Unidades: %b, Decenas: %b", A, B, S, S, units_seg, tens_seg);

        // Prueba 3: A = 0001 (1), B = 0010 (2)
        A = 4'b0001; B = 4'b0010; // A = 1, B = 2
        #10;
        $display("A = %b, B = %b -> Suma: %b (Decimal: %0d), Unidades: %b, Decenas: %b", A, B, S, S, units_seg, tens_seg);

        // Prueba 4: A = 0000 (0), B = 0000 (0)
        A = 4'b0000; B = 4'b0000; // A = 0, B = 0
        #10;
        $display("A = %b, B = %b -> Suma: %b (Decimal: %0d), Unidades: %b, Decenas: %b", A, B, S, S, units_seg, tens_seg);

        // Prueba 5: A = 0111 (7), B = 0101 (5)
        A = 4'b0111; B = 4'b0101; // A = 7, B = 5
        #10;
        $display("A = %b, B = %b -> Suma: %b (Decimal: %0d), Unidades: %b, Decenas: %b", A, B, S, S, units_seg, tens_seg);

        // Finalizar simulación
        $stop;
    end

endmodule
