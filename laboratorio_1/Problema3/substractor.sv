module substractor #(
    parameter int N = 7 // Parámetro para definir el número de bits
)(
    input logic clk,                
    input logic reset,              
    input logic button,             
    output logic [N-1:0] value      
);
    logic [N-1:0] count;      
    logic button_prev;        

    always_ff @(posedge clk or posedge reset) begin
        if (reset) begin
            count <= (2**N - 1); // Inicializar en el valor máximo posible
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
