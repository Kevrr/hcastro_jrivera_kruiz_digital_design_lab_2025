module modulo #(parameter n = 4)
    (input logic [n-1:0] a, b,
     output logic [n-1:0] y);

    logic [n-1:0] remainder;

    function automatic logic [n-1:0] resta_binaria(input logic [n-1:0] x, input logic [n-1:0] y);
        logic [n-1:0] resultado;
        logic borrow;
        resultado = x;
        borrow = 0;
        for (int i = 0; i < n; i = i + 1) begin
            logic diff, new_borrow;
            diff = resultado[i] ^ y[i] ^ borrow;
            new_borrow = (~resultado[i] & y[i]) | ((~resultado[i] | y[i]) & borrow);
            resultado[i] = diff;
            borrow = new_borrow;
        end
        return resultado;
    endfunction

    always_comb begin
        remainder = a;

        if (b == 0) begin
            y = {n{1'bx}};
        end else begin
            for (int i = 0; i < n * 2; i = i + 1) begin
                if (remainder >= b) begin
                    remainder = resta_binaria(remainder, b);
                end
            end
            y = remainder;
        end
    end
endmodule
