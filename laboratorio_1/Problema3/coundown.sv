module coundown #(
    parameter int N = 7  // Parámetro para definir el tamaño del contador
)(
    input logic clk,               
    input logic reset,             
    input logic button,            
    output logic [N-1:0] value     // Salida de N bits
);
    logic [N-1:0] count;           
    logic button_prev;             

    always_ff @(posedge clk or posedge reset) begin
        if (reset) begin
            count <= {N{1'b1}};  // Inicializa con todos los bits en 1 (valor máximo)
            button_prev <= 1'b0; 
        end else begin
            if (button && !button_prev) begin
                if (count > 0) begin
                    count <= count - 1;
                end
            end
            button_prev <= button;
        end
    end

    assign value = count;

endmodule
