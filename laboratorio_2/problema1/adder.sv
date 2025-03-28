module adder #(parameter N = 10) (
    input  logic [N-1:0] a, b,  
    output logic [N:0] y,  // N+1 bits
    output logic Cout  
);
    logic [N:0] c;  // Bits de acarreo interno (N+1 bits)

    // Primer bit (sumador completo)
    assign y[0] = a[0] ^ b[0];  
    assign c[0] = a[0] & b[0];  

    // Suma bit a bit con propagación de acarreo
    genvar i;
    generate
        for (i = 1; i < N; i = i + 1) begin : sumador
            assign y[i] = (a[i] ^ b[i]) ^ c[i-1];
            assign c[i] = (a[i] & b[i]) | (c[i-1] & (a[i] ^ b[i]));
        end
    endgenerate

    assign y[N] = c[N-1];  
    assign Cout = c[N-1]; 
endmodule