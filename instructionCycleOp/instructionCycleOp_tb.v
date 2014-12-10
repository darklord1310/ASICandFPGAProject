module instructionCycleOp_tb();
 
//Set input as register and output as wires
reg		IRload, Reset, Clock, JMPmux, PCload, MemWr, Meminst;
reg		[7:0] inputOfRAM , inputOfIR;
wire    [2:0] IR;
wire    [4:0] RAM_Address;
wire    [4:0] lower5bits_IR;
wire	[7:0] outputFromRAM;
wire    [4:0] increment_output;

//Instantiate design code
instructionCycleOp test (inputOfIR, inputOfRAM,outputFromRAM, IRload, JMPmux, PCload, Reset, Meminst, MemWr, Clock, IR, RAM_Address, lower5bits_IR, increment_output);

//Test vector start here
initial
begin
//Initialize all inputs
#0 Clock = 0; Reset = 1; IRload = 0; JMPmux = 1; PCload = 1; Meminst = 1; MemWr = 1; inputOfRAM = 8'd10; inputOfIR = 8'd1;        //write 10 to address 0 and increase PC to 1
#10 PCload = 0 ; Reset = 0;                                                                                                       //take off the reset
#10 Meminst = 1; MemWr = 0;                                                                                                       //read 10 at address 0
#10 PCload = 1; JMPmux = 0;                                                                                                       //load 1 to PC register
#10 PCload = 0; inputOfRAM = 8'd1; Meminst = 0; MemWr = 1;                                                                        //write 1 to address 1
#10 Meminst = 0; MemWr = 0;                                                                                                       //read 1 at address 1
#10 inputOfIR = 8'd5; IRload = 1;                                                                                                 //jump to address 5
#10 IRload = 0; Meminst = 1; MemWr = 1; inputOfRAM = 8'd20;                                                                       //write 20 to address 5
#10 Meminst = 1; MemWr = 0;                                                                                                       //read 20 at address 5
#10 JMPmux = 1; PCload = 1;                                                                                                       //load address 5 to PC register
#10 JMPmux = 0;                                                                                                                   //load address 6 to PC register
#10 PCload = 0; Meminst = 0; MemWr = 1; inputOfRAM = 8'd30;                                                                       //write 30 to address 6
#10 Meminst = 0; MemWr = 0;                                                                                                       //read 30 from address 6
#10 IRload = 1; inputOfIR = 8'd0;                                                                                                 //go to address 0
#10 IRload = 0; Meminst = 1; MemWr = 0;                                                                                           //read 10 from address 0
// #10 MemWr = 0;

// #10 IRload = 1; PCload = 1; Meminst = 0;
// #10 MemWr = 1;
// #10 idata = 8'd0;
// #10 MemWr = 0;

// #30 PCload = 1; Meminst = 0;
// #10 JMPmux = 0; MemWr = 1;
// #10 idata = 8'd2; JMPmux = 1; PCload = 0;
// #10 MemWr = 0;

// #10 PCload = 1;

#30 $stop;
end

//Clock pulse generator
always #5 Clock = ~Clock;

endmodule