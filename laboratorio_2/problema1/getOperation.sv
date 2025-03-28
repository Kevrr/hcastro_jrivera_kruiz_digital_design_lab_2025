module getOperation (input logic [3: 0] selButtons,
							input logic [1: 0] selSwitches,
							output logic [3: 0] op);
	
	always @(*) begin
		case ({selButtons, selSwitches})
			{4'b1110, 2'b00}: op <= 4'b0000; //ADD
			{4'b1101, 2'b00}: op <= 4'b0001; //SUB
			{4'b1011, 2'b00}: op <= 4'b0010; //MULT
			{4'b0111, 2'b00}: op <= 4'b0011; //DIV
			{4'b1110, 2'b01}: op <= 4'b0100; //MOD
			{4'b1101, 2'b01}: op <= 4'b0101; //AND
			{4'b1011, 2'b01}: op <= 4'b0110; //OR
			{4'b0111, 2'b01}: op <= 4'b0111; //XOR
			{4'b1110, 2'b10}: op <= 4'b1000; //SR
			{4'b1101, 2'b10}: op <= 4'b1001; //SL
			default: op <= 4'b1111;
		endcase
	end
	
endmodule
