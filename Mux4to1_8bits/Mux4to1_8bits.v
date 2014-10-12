module Mux4to1_8bits(selector, in0, in1,in2,outData);

input[1:0] selector;
input[7:0] in0,in1,in2;
output reg[7:0] outData;

always @ (*)
	if( selector == 2'b00)
		outData = in0;
	else if( selector == 2'b01)
		outData = in1;
	else if( selector == 2'b10)
		outData = in2;
	else
		outData = 2'bXX;



endmodule
