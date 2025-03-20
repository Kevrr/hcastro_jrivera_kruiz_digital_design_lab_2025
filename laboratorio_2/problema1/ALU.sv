module ALU #(parameter n = 4)
	(input logic [n - 1: 0] a, b,
	 input logic [3: 0] selButtons,
	 input logic [1: 0] selSwitches,
	 output logic [n - 1: 0] result,
	 output logic [3: 0] flags); // N Z C V
	 
	logic [n - 1: 0] addRes, subRes, divRes, modRes, andRes, orRes, xorRes, sLRes, sRRes;
	logic [2*n - 1: 0] multRes;
	logic addCout, subCout;
	 
	adder #(n) add(a, b, addRes, addCout);
	subtractor #(n) sub(a, b, subRes, subCout);
	multiplier #(n) mult(a, b, multRes);
	divider #(n) div(a, b, divRes);
	modulo #(n) mod(a, b, modRes);
	andGate #(n) AND(a, b, andRes);
	orGate #(n) OR(a, b, orRes);
	xorGate #(n) XOR(a, b, xorRes);
	shiftRight #(n) sr(a, b, sLRes);
	shiftLeft #(n) sl(a, b, sRRes);
	
	getOperation #(n) getOp(a, b, 
									addRes, subRes, 
									divRes, modRes, 
									andRes, orRes, 
									xorRes, sLRes, 
									sRRes, addCout, 
									subCout, multRes, 
									result, flags);
									
endmodule
	