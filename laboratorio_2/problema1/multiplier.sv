module full_adder(
    input logic a, b, cin,
    output logic sum, cout
);
    assign sum = a ^ b ^ cin;
    assign cout = (a & b) | (cin & (a ^ b));
endmodule

module multiplier #(parameter n = 4)
    (input logic [n - 1:0] a, b,
     output logic [2*n - 1:0] product);

    logic [2*n - 1:0] partial_products [n - 1:0]; 
    logic [2*n - 1:0] sum [n:0];  
    logic [2*n - 1:0] carry [n:0];

    genvar i, j;

    // Generar productos parciales sin usar *
    generate
        for (i = 0; i < n; i = i + 1) begin : partial_product_gen
            for (j = 0; j < n; j = j + 1) begin : bit_mult
                assign partial_products[i][j+i] = a[i] & b[j]; 
            end
            for (j = 0; j < i; j = j + 1) begin : leading_zeros
                assign partial_products[i][j] = 0;
            end
            for (j = i + n; j < 2*n; j = j + 1) begin : trailing_zeros
                assign partial_products[i][j] = 0;
            end
        end
    endgenerate

    // Inicializar sum[0] y carry[0]
    assign sum[0] = partial_products[0];
    assign carry[0] = {2*n{1'b0}};  

    // Sumar productos parciales usando full_adders
    generate
        for (i = 1; i < n; i = i + 1) begin : add_partial_products
            logic [2*n:0] temp_carry; // Un bit extra para acarreo
            assign temp_carry[0] = 0;

            for (j = 0; j < 2*n; j = j + 1) begin : add_bits
                full_adder fa (
                    .a(partial_products[i][j]),
                    .b(sum[i-1][j]),
                    .cin(temp_carry[j]),
                    .sum(sum[i][j]),
                    .cout(temp_carry[j+1])
                );
            end

            // Asignamos el carry propagado
            assign carry[i] = temp_carry[2*n:1];
        end
    endgenerate

    // Resultado final
    assign product = sum[n-1];

endmodule
