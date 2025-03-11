module binario_a_BCD (
    input [4:0] S,     // Entrada de 5 bits 
    output reg [3:0] U,    // Unidades en BCD
    output reg [3:0] D     // Decenas en BCD
);

    always @(*) begin
        // Inicializa las salidas
        U = 4'b0000;
        D = 4'b0000;

        // Conversión directa de binario a BCD
        if (S >= 30) begin
            D = 3;
            U = S - 30;
        end else if (S >= 20) begin
            D = 2;
            U = S - 20;
        end else if (S >= 10) begin
            D = 1;
            U = S - 10;
        end else begin
            D = 0;
            U = S;
        end
    end

endmodule