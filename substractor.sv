module substractor(
    input logic [3:0] A, B,  // Entradas de 4 bits
    output logic [4:0] D     // Salida de 5 bits (para manejar el bit de préstamo)
);
    logic B0, B1, B2, B3;  

    // Primer bit
    assign D[0] = A[0] ^ B[0]; 
    assign B0   = ~A[0] & B[0];

    // Segundo bit
    assign D[1] = (A[1] ^ B[1]) ^ B0;
    assign B1   = (~A[1] & B[1]) | (B0 & (~A[1] ^ B[1]));

    // Tercer bit
    assign D[2] = (A[2] ^ B[2]) ^ B1;
    assign B2   = (~A[2] & B[2]) | (B1 & (~A[2] ^ B[2]));

    // Cuarto bit
    assign D[3] = (A[3] ^ B[3]) ^ B2;
    assign B3   = (~A[3] & B[3]) | (B2 & (~A[3] ^ B[3]));

    // Quinto bit (Borrow)
    assign D[4] = B3;  // Este es el bit extra para manejar el bit de préstamo

endmodule