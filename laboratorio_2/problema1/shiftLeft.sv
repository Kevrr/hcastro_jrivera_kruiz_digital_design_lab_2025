module shiftLeft #(parameter n = 4)
   (input logic [n-1:0] a, displace,
    output logic [n-1:0] y,
    output logic sign);

   logic [2*n-1:0] temp; 

   always @(*) begin
      temp = a << displace;  // Desplazamiento con tamaño extendido
      y = temp[n-1:0];       // Solo tomamos los n bits menos significativos
      sign = y[n-1];         // El signo del resultado final
   end

endmodule
