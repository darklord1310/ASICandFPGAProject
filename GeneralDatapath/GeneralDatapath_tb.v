module datapath_tb;
//(PCload,JMPmux,IRload,Meminst,MemWr,Aload,Reset,Clock,Sub,Asel,Aeq0,Apos,IR,clock,data_in,data_out);

reg PCload, JMPmux, IRload, Meminst, MemWr,Aload,Reset,Clock,Sub;
reg[7:0] data_in;
reg[1:0] Asel;
wire[7:0] Aeq0,data_out;
wire Apos;
wire[2:0] IR;

datapath testing (PCload,JMPmux,IRload,Meminst,MemWr,Aload,Reset,Clock,Sub,Asel,Aeq0,Apos,IR,data_in,data_out);


initial Clock = 0;
always #5 Clock = ~Clock;



initial
begin

//clear everything
#0  Reset = 1;  //expect Aeq0 =1, Apos = 1, IR = 0, data_out = 0

//write 80 into register A and load it to RAM address 0 and increase the RAM pointer to 1
#10  Reset = 0; Asel = 2'b01 ; Aload = 1; data_in = 8'd80;   // expect Aeq0 = 0, Apos = 1, IR = 0, data_out = 80
#10  Meminst = 1 ; MemWr = 1; PCload = 1; JMPmux = 1; IRload = 0;  // expect Aeq0 = 0, Apos = 1, IR = 0, data_out = 80 

//read 80 from RAM address 0 
// #10  Meminst = 1 ; MemWr = 0; 
// #10  Asel = 2'b10; Aload = 1; //expect Aeq0 = 0, Apos = 1, data_out = 80, IR = 0

//write 75 into register A and load it to RAM address 1 and increase RAM pointer to 2
#10  Asel = 2'b01 ; Aload = 1; 
#10  Meminst = 0 ; MemWr = 1; PCload = 1; JMPmux = 0; IRload = 0; data_in = 8'd75;   // expect Aeq0 = 0, Apos = 1, IR = 0, data_out = 75

//read 80 from RAM address 0 and subtract 80 from 75
#10  MemWr = 0; Meminst = 1; Sub = 1; PCload = 1; JMPmux = 0;  //expect Aeq0 = 0, Apos = 1; data_out = 75, IR = 0

//load -5 into register A and  write -5 to RAM address 3
#10  Asel = 2'b00; Aload = 1;
#10  MemWr = 1; Meminst = 0; //expect Aeq0 = 0, Apos = 0, data_out = -5, IR = 0

//read -5 from RAM address 3 and add with -5 
#10  Meminst = 0; MemWr = 0; Sub = 0; // expect Aeq0 = 0, Apos = 0, data_out = -5, IR = 0

//load -10 into register A 
#10  Asel = 2'b00; Aload = 1; //expect Aeq0 = 0; Apos = 0; data_out = -10, IR = 0

//load the -5 into IR register and load -5 into register A
#10  Asel = 2'b10; Aload = 1; IRload = 1; //expect Apos = 0, Aeq0 = 0, data_output = -5, IR = 1

//write -5 into RAM address 11011
#10  Meminst = 0; MemWr = 1;  //expect Apos = 0, Aeq0 = 0, data_output = -5


$finish;


end
endmodule