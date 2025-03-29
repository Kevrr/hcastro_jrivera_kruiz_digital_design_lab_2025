// Módulo full_subtractor
module full_subtractor
    (input logic a, b, bin,  // a y b son los bits a restar, bin es el bit de préstamo de la posición anterior
     output logic diff, bout); // diff es la diferencia, bout es el bit de préstamo para la siguiente posición

    assign diff = a ^ b ^ bin; // Diferencia: XOR de a, b y bin
    assign bout = (~a & bin) | (~a & b) | (b & bin); // Préstamo: lógica para calcular el bit de préstamo

endmodule

// Módulo subtractor
module subtractor #(parameter n = 4)
    (input logic [n - 1: 0] a, b,
     output logic [n - 1: 0] y,
     output logic Cout);

    logic [n:0] borrow; // Señal para los bits de préstamo

    assign borrow[0] = 0; // No hay préstamo inicial

    // Generar restadores completos para cada bit
    genvar i;
    generate
        for (i = 0; i < n; i = i + 1) begin : full_subtractors
            full_subtractor fs (
                .a(a[i]),
                .b(b[i]),
                .bin(borrow[i]),
                .diff(y[i]),
                .bout(borrow[i + 1])
            );
        end
    endgenerate

    assign Cout = borrow[n]; // El bit de préstamo final

endmodule
