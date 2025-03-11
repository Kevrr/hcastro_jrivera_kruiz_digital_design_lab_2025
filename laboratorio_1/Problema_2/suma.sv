module suma(
    input logic [3:0] A, B,  // Entradas de 4 bits
    output logic [4:0] S     // Salida de 5 bits (ahora sí soporta 30)
);
    logic C0, C1, C2, C3;  

    // Primer bit
    assign S[0] = A[0] ^ B[0]; 
    assign C0   = A[0] & B[0];

    // Segundo bit
    assign S[1] = (A[1] ^ B[1]) ^ C0;
    assign C1   = (A[1] & B[1]) | (C0 & (A[1] ^ B[1]));

    // Tercer bit
    assign S[2] = (A[2] ^ B[2]) ^ C1;
    assign C2   = (A[2] & B[2]) | (C1 & (A[2] ^ B[2]));

    // Cuarto bit
    assign S[3] = (A[3] ^ B[3]) ^ C2;
    assign C3   = (A[3] & B[3]) | (C2 & (A[3] ^ B[3]));

    // Quinto bit (Cout)
    assign S[4] = C3;  // Este es el bit extra para manejar hasta 30

endmodule

