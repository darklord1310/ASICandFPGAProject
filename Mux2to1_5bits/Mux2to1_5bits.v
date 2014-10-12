module Mux2to1_5bits (in0, in1, selector, outData);

input[4:0] in0, in1;
input selector;
output reg[4:0] outData;

always @ (selector)

	if(selector == 1)
		outData = in1;
	else
		outData = in0;



endmodule



