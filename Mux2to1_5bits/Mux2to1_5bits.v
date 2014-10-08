module Mux2to1_5bits (in1, in2, selector, outData);

input[4:0] in1, in2;
input selector;
output reg[4:0] outData;

always @ (selector)

	if(selector == 1)
		outData = in2;
	else
		outData = in1;



endmodule




