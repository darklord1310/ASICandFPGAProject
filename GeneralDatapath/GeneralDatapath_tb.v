module datapath_tb;
//(PCload,JMPmux,IRload,Meminst,MemWr,Aload,Reset,Clock,Sub,Asel,Aeq0,Apos,IR,clock,data_in,data_out);

reg PCload, JMPmux, IRload, Meminst, MemWr,Aload,Reset,Clock,Sub;
reg[7:0] data_in;
reg[1:0] Asel;
wire[7:0] data_out;
wire Apos, Aeq0;
wire[2:0] IR;

datapath testing (PCload,JMPmux,IRload,Meminst,MemWr,Aload,Reset,Clock,Sub,Asel,Aeq0,Apos,IR,data_in,data_out);


initial Clock = 0;
always #5 Clock = ~Clock;



initial
begin

//initialize all inputs
#0 data_in = 8'd0 ; IRload = 0 ; JMPmux = 0 ; PCload = 0 ; Meminst = 0 ; MemWr = 0 ; Asel = 2'd0 ; Aload =0 ; Reset = 1 ; Clock = 0 ; Sub = 0 ;

/*Test write to register A from data_in */
#10 data_in = 8'd5 ; Aload = 1 ; Asel = 2'd1; Reset = 0 ;// Expect output 5 , Aeq0 = 0 

/*Test writing to RAM */
#10 MemWr = 1 ; // RAM with address 0 contains 5 ;
#10 MemWr = 0 ; 

/* Test Add and store to Reg A */
#10 Asel = 2'd0 ; // RegA + RAM = 5 + 5 -> RegA = 10 , Expect output 10
#10 // RegA + RAM = 10 + 5 -> RegA = 15 Expect output 15

/* Test Subtract and store to Reg A */
#10 Sub = 1 ;// RegA - RAM = 15 - 5 -> RegA = 10 , Expect output 10
#10 // RegA - RAM = 10 + 5 -> RegA = 5 , Expect output 5

/* Test write 3 to RAM address 5 (5 from  IR) */
#10 IRload = 1 ; Aload = 0 ; data_in = 8'd3 ; Aload = 1; Asel = 2'd1 ;// Load IR with 5 and Write 3 to RegA and output 3
#10 Meminst = 1 ;IRload = 0 ; 
#10 MemWr = 1; // Write to RAM
#10 MemWr = 0 ;

/* Overwrite Reg A with 0 */
#10 data_in = 8'd0 ; //Expect output 0 , Aeq0 = 1

/* Read value from RAM address 5 and write to RegA */
#10 Asel = 2'd2 ; //Expect output 3;


/* Test write 1 to RAM address 6 (5 from IR + 1)*/
#10 JMPmux = 1 ; PCload = 1 ; // Load PC from IR (5)
#10 JMPmux = 0 ; // Increment PC from 5 to 6
#10 data_in = 8'd1 ; Asel = 2'd1 ; PCload = 0 ; // Write 1 to RegA and output 1
#10 Meminst = 0 ;
#10 MemWr = 1 ; // Expect output 1
#10 MemWr = 0 ; 

/* Overwrite Reg A with 0 */
#10 data_in = 8'd0 ; //Expect output 0 , Aeq0 = 1


/* Read value from RAM address 6 and write to RegA */
#10 Meminst = 0 ;Asel = 2'd2 ; //Expect output 1 ;

/* Write 200 to RAM address 6 */
#10 data_in = 8'd200 ; Asel = 2'd1 ;// Write 200 to RegA and output 200
#10

/* Read value from RAM address 5 and write to RegA */
#10 Meminst = 1 ;
#10 Asel = 2'd2 ; //Expect output 3 ;


/* Read value from RAM address 6 and write to RegA */
#10 Meminst = 0 ; //Expect output 200 ;
#10 //do nothing

#50 $finish ;


end
endmodule
