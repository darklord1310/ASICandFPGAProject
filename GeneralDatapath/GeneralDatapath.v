module datapath(PCload,JMPmux,IRload,Meminst,MemWr,Aload,Reset,Clock,Sub,Asel,Aeq0,Apos,IR,data_in,dataOut);

input PCload, JMPmux, IRload, Meminst, MemWr,Aload,Reset,Clock,Sub;
input[7:0] data_in;
wire[7:0] data_out;
output[7:0] dataOut;
input[1:0] Asel;
output Apos,Aeq0;
output[2:0] IR;
wire[7:0] RAM_out, IR_out;
wire[7:0] mux4to1_out;
wire[4:0] increment_out, PC_out, RAM_address;
reg[4:0] JMPmux_out, Meminst_out;
reg[7:0] subadd_out;

//set operations
Mux4to1_8bits mux4to1(Asel, subadd_out, data_in , RAM_out ,mux4to1_out);

Register_8bits ARegister(Aload, mux4to1_out, data_out, Reset, Clock);

assign dataOut = data_out;
    
assign Aeq0 = data_out == 0 ? 1:0;

assign Apos = ~data_out[7];

RAM_8bits RAM(Meminst_out, MemWr , data_out, RAM_out, Clock);

always @ (Sub, data_out, RAM_out)
	if(Sub == 1)
		subadd_out = data_out - RAM_out;
	else
		subadd_out = data_out + RAM_out;
        
        
//cycle operations
Register_8bits IRRegister(IRload, RAM_out, IR_out, Reset, Clock);

assign IR = IR_out[7:5];

always @ (JMPmux , IR_out[4:0] , JMPmux_out)
    if(JMPmux == 1)
        JMPmux_out = IR_out[4:0];
    else
        JMPmux_out = increment_out;

Register_5bits registerPC(JMPmux_out, PCload, PC_out , Reset, Clock);

always @ (Meminst , IR_out[4:0] , PC_out)
    if(Meminst == 1)
        Meminst_out = IR_out[4:0];
    else
        Meminst_out = PC_out;

assign increment_out = PC_out + 1'b1;




endmodule
