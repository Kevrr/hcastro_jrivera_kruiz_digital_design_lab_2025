module ALUFPGA(input logic [3: 0] a, b,
					input logic [3: 0] selButtons,
					input logic [1: 0] selSwitches,
					output logic [6: 0] a_seg, b_seg, res_seg,
					output logic a_sign, b_sign, res_sign,
					output logic [3: 0] flags);
					
	logic [3: 0] op, result;
	logic [2: 0] a_signed, b_signed, res_signed;
	
	getOperation getOp(selButtons, selSwitches, op);
	
	ALU ALU4bits(a, b, op, result, flags);
	
	getSignedNum getSignedA(a, a_sign, a_signed);
	
	getSignedNum getSignedB(b, b_sign, b_signed);
	
	getSignedNum getSignedRes(result, res_sign, res_signed);
	
	sevenseg displayA(a_signed, a_seg);
	
	sevenseg displayB(b_signed, b_seg);
	
	sevenseg displayRes(res_signed, res_seg);
	
endmodule
	