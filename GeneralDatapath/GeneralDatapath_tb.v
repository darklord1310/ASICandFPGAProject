module datapath_tb;
//(PCload,JMPmux,IRload,Meminst,MemWr,Aload,Reset,Clock,Sub,Asel,Aeq0,Apos,IR,clock,data_in,data_out);

reg PCload, JMPmux, IRload, Meminst, MemWr,Aload,Reset,Clock,Sub,clock;
reg[7:0] data_in;
reg[1:0] Asel;
wire[7:0] Aeq0,data_out;
wire Apos;
wire[2:0] IR;
wire[7:0] RAM_out,mux4to1_out,mux2to1_out,IR_out;
wire[4:0] increment_out, PC_out, RAM_address;
reg[7:0] subadd_out;

datapath testing (PCload,JMPmux,IRload,Meminst,MemWr,Aload,Reset,Clock,Sub,Asel,Aeq0,Apos,IR,clock,data_in,data_out);


initial clock = 0;
always @ #5 clock = ~clock;



initial
begin

//start
#0  IRload = 0; JMPmux = 0; PCload = 0; Meminst = 0; MemWr = 0; Asel = 2'b00; Aload = 0; Sub = 0; data_in = 8'd5;

//fetch
#10  IRload = 1; JMPmux = 0; PCload = 1; Meminst = 0; MemWr = 0; Asel = 2'b00; Aload = 0; Sub = 0; data_in = 8'd5;

//decode
#10  IRload = 0; JMPmux = 0; PCload = 0; Meminst = 1; MemWr = 0; Asel = 2'b00; Aload = 0; Sub = 0; 

//load
#10  IRload = 0; JMPmux = 0; PCload = 0; Meminst = 0; MemWr = 0; Asel = 2'b10; Aload = 1; Sub = 0; 

//store
#10  IRload = 0; JMPmux = 0; PCload = 0; Meminst = 1; MemWr = 1; Asel = 2'b00; Aload = 0; Sub = 0; 

//add
#10  IRload = 0; JMPmux = 0; PCload = 0; Meminst = 0; MemWr = 0; Asel = 2'b00; Aload = 1; Sub = 0; 

end
endmodule
