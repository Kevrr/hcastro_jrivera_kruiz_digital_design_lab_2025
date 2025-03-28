module shiftLeft #(parameter n = 4)
   (input logic [n-1:0] a, displace,
    output logic [n-1:0] y);


   always @(*) begin
      y = a << displace;
   end

endmodule
