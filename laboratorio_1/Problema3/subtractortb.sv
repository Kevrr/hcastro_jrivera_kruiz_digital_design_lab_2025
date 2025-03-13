module subtractortb;
    logic clk, reset, button;
    logic [1:0] value_2;
    logic [3:0] value_4;
    logic [5:0] value_6;

    // Instancias parametrizables
    countdown #(2) uut_2bit (.clk(clk), .reset(reset), .button(button), .value(value_2));
    countdown #(4) uut_4bit (.clk(clk), .reset(reset), .button(button), .value(value_4));
    countdown #(6) uut_6bit (.clk(clk), .reset(reset), .button(button), .value(value_6));

    // Generación de reloj
    always #5 clk = ~clk;

    initial begin
        clk = 0;
        reset = 1;
        button = 0;
        #10 reset = 0;
        #10 button = 1;
        #10 button = 0;
        #20 button = 1;
        #10 button = 0;
        #50 $stop;
    end
endmodule
