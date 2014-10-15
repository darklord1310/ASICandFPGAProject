module datapath(PCload,JMPmux,IRload,Meminst,MemWr,Aload,Reset,Clock,Sub,Asel,Aeq0,Apos,IR,clock,data_in,data_out);

input PCload, JMPmux, IRload, Meminst, MemWr,Aload,Reset,Clock,Sub,clock;
input[7:0] data_in;
input[1:0] Asel;
output[7:0] Aeq0,data_out;
output Apos;
output[2:0] IR;
wire[7:0] RAM_out,mux4to1_out,mux2to1_out,IR_out;
wire[4:0] increment_out, PC_out, RAM_address;
reg[7:0] subadd_out;

Mux4to1_8bits(Asel, subadd_out, data_in, RAM_out, mux4to1_out);
Register_8bits(Aload, mux4to1_out, data_out, Reset, clock);
assign Aeq0 = data_out == 0 ? 0:1;
assign Apos = ~data_out[7];

always @ (Sub)
	if(Sub == 1)
		subadd_out = data_out - RAM_out;
	else
		subadd_out = data_out + RAM_out;

Register_8bits(IRload, RAM_out ,IR_out , Reset, clock);
assign IR = IR_out[7:5];
Mux2to1_5bits (increment_out, IR_out[4:0], JMPmux, mux2to1_out);
Register_5bits(mux2to1_out, PCload, PC_out , Reset, clock);
assign increment_out = PC_out + 1'b1;
Mux2to1_5bits (PC_out, IR_out[4:0], Meminst, RAM_address);
RAM_8bits(RAM_address, MemWr, data_out, RAM_out, clock);


endmodule
