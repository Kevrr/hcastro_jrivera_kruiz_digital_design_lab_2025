module multiplier #(parameter n = 4)
    (input logic [n-1:0] a, b,
     output logic [2*n:0] multRes);

    // Usar asignación continua para la multiplicación
    assign multRes = {4'b0000, a} * {4'b0000, b};
    
endmodule