module instructionSetOp(RAM_output, input_data, output_data, Asel, Aload, Reset, Clock, Sub, Aeq0, Apos, MemWr, RAMAddress);

input Clock, Reset, Aload, Sub, MemWr;
input[1:0] Asel;
input[7:0] input_data;
output[7:0] output_data, RAM_output;
wire[7:0] outputOfRAM;
output Apos;
output[7:0] Aeq0;
input[4:0] RAMAddress;
wire[7:0] mux4to1_out;
reg[7:0] subadd_out;


Mux4to1_8bits mux4to1(Asel, subadd_out, input_data ,outputOfRAM ,mux4to1_out);
Register_8bits IRRegister(Aload, mux4to1_out, output_data, Reset, Clock);
assign Aeq0 = output_data == 0 ? 1:0;

assign Apos = ~output_data[7];

RAM_8bits RAM(RAMAddress, MemWr , output_data, outputOfRAM, Clock);

assign RAM_output = outputOfRAM;

always @ (Sub, output_data, outputOfRAM)
	if(Sub == 1)
		subadd_out = output_data - outputOfRAM;
	else
		subadd_out = output_data + outputOfRAM;


endmodule