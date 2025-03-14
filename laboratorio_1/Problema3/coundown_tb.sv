module coundown_tb;
    logic clk;                  // Reloj del sistema
    logic reset;                // Switch para reiniciar el valor a 63
    logic button;               // Botón para disminuir el valor
    logic [6:0] value;          // Salida de 7 bits para representar valores de 0 a 63

    // Instancia del módulo countdown
    coundown uut (
        .clk(clk),
        .reset(reset),
        .button(button),
        .value(value)
    );

    // Generador de reloj
    always #5 clk = ~clk;  // Generar un reloj con un período de 10 unidades de tiempo

    initial begin
        // Inicialización de señales
        clk = 0;
        reset = 0;
        button = 0;

        // Ejecución del test
        $display("Starting testbench");
        
        // Prueba de reset
        $display("Applying reset");
        reset = 1;
        #10;
        reset = 0;
        #10;
        $display("Value after reset: %d", value); // Debe ser 63

        // Prueba del botón
        $display("Pressing button to decrement value");
        button = 1;
        #10;
        button = 0;
        #10;
        $display("Value after button press: %d", value); // Debe ser 62

        // Prueba de múltiples pulsaciones del botón
        repeat (5) begin
            button = 1;
            #10;
            button = 0;
            #10;
            $display("Value after button press: %d", value);
        end

        // Finalizar la simulación
        $finish;
    end
endmodule
