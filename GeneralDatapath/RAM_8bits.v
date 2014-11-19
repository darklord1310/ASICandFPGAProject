module RAM_8bits(address, WE,dataIn, dataOut, clock);

input [7:0] dataIn;
input [4:0] address;
input WE, clock;
output reg[7:0] dataOut;

reg [7:0] RAM[31:0];

always @ (posedge clock)
	if( WE == 1'b1)
		RAM[address] <= dataIn;
	else
		dataOut <= RAM[address];

endmodule
