module sumador_4bits_display(
    input logic [3:0] A, B,   // Entradas de 4 bits
    output logic [6:0] seg_units, seg_tens // Display 7 segmentos
);
    logic [4:0] S;    // Suma con 5 bits
    logic [3:0] U, D; // Unidades y decenas en BCD

    // Módulo sumador
    suma sumador_inst(.A(A), .B(B), .S(S)); // Ahora S tiene 5 bits

    // Conversión a BCD
    binario_a_BCD bcd_inst(.S(S), .U(U), .D(D));

    // Displays de 7 segmentos
    display_7seg display_units(.BCD(U), .seg(seg_units));
    display_7seg display_tens(.BCD(D), .seg(seg_tens));

endmodule
