module sumador_4bits_display(
    input logic [3:0] A, B,   // Entradas de 4 bits
    output logic [6:0] units_seg, tens_seg,
	 output logic [4:0] S // Display 7 segmentos
);
    logic [3:0] U, D; // Unidades y decenas en BCD

    // Módulo sumador
    suma sumador_inst(.A(A), .B(B), .S(S)); // Ahora S tiene 5 bits

    // Conversión a BCD
    binario_a_BCD bcd_inst(.S(S), .U(U), .D(D));

    // Displays de 7 segmentos
    display_7seg display_units(.BCD(U), .seg(units_seg));
    display_7seg display_tens(.BCD(D), .seg(tens_seg));

endmodule
