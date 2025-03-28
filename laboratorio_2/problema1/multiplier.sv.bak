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

    logic [2*n - 1:0] partial_products [n - 1:0]; // Productos parciales
    logic [2*n - 1:0] sum [n:0];   // Suma acumulada
    logic [2*n - 1:0] carry [n:0]; // Acarreo acumulado

    genvar i, j;

    // Generar productos parciales
    generate
        for (i = 0; i < n; i = i + 1) begin : partial_product_gen
            for (j = 0; j < n; j = j + 1) begin : bit_mult
                assign partial_products[i][j+i] = a[i] & b[j]; // Alineado
            end
            for (j = 0; j < i; j = j + 1) begin : leading_zeros
                assign partial_products[i][j] = 0;
            end
            for (j = i + n; j < 2*n; j = j + 1) begin : trailing_zeros
                assign partial_products[i][j] = 0;
            end
        end
    endgenerate

    // Asignar sum[0] y carry[0]
    assign sum[0] = partial_products[0];
    assign carry[0] = '0;

    // Sumar productos parciales usando full_adders
    generate
        for (i = 1; i < n; i = i + 1) begin : add_partial_products
            assign carry[i][0] = 0;
            for (j = 0; j < 2*n - 1; j = j + 1) begin : add_bits
                full_adder fa (
                    .a(partial_products[i][j]),
                    .b(sum[i-1][j]),
                    .cin(carry[i][j]),
                    .sum(sum[i][j]),
                    .cout(carry[i][j+1])
                );
            end
            assign sum[i][2*n-1] = carry[i][2*n-1];
        end
    endgenerate

    // Resultado final
    assign product = sum[n-1];

endmodule
