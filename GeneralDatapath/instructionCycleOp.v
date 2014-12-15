module instructionCycleOp(inputOfIR, inputOfRAM,outputFromRAM,IRload, JMPmux, PCload, Reset, Meminst, MemWr, Clock, IR, RAM_Address, lower5bits_IR, increment_output);

input[7:0] inputOfIR, inputOfRAM;
output[7:0] outputFromRAM;
output[2:0] IR;
input IRload, JMPmux, PCload, Reset, Meminst, MemWr, Clock;
wire[7:0] IR_out;
output[4:0] lower5bits_IR;
wire[4:0] increment_out, PC_out;
reg[4:0] JMPmux_out;
reg[4:0] Meminst_out;
output[4:0] increment_output;
output[4:0] RAM_Address;


Register_8bits IRRegister(IRload, inputOfIR, IR_out, Reset, Clock);

assign IR = IR_out[7:5];
 
always @ (JMPmux , IR_out[4:0] , JMPmux_out)
    if(JMPmux == 1)
        JMPmux_out = IR_out[4:0];
    else
        JMPmux_out = increment_out;

assign lower5bits_IR = IR_out[4:0];

Register_5bits registerPC(JMPmux_out, PCload, PC_out , Reset, Clock);

always @ (Meminst , IR_out[4:0] , PC_out)
    if(Meminst == 1)
        Meminst_out = IR_out[4:0];
    else
        Meminst_out = PC_out;

assign increment_out = PC_out + 1'b1;


assign RAM_Address = Meminst_out;

RAM_8bits RAM(Meminst_out, MemWr ,inputOfRAM, outputFromRAM, Clock);

assign increment_output = increment_out;



endmodule