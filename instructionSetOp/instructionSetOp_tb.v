module instructionSetOp_tb();
 
//Set input as register and output as wires
reg		Aload, Reset, Clock, Sub, MemWr;
reg     [1:0] Asel;
reg		[7:0] input_data;
reg     [4:0] RAMAddress;
wire	[7:0] RAM_output, output_data;


//Instantiate design code
instructionSetOp testing (RAM_output, input_data, output_data, Asel, Aload, Reset, Clock, Sub, Aeq0, Apos, MemWr, RAMAddress);

//Test vector start here
initial
begin
//Initialize all inputs
#0 Clock = 0; Reset = 1; Aload = 0; MemWr = 0; Sub = 0; input_data = 8'd10;  RAMAddress = 0;
#10 Reset = 0; Aload = 1; Asel = 1;         //load 10 to register A 
#10 MemWr = 1;                              //write 10 to RAM address 0
#10 MemWr = 0;                              //read 10 from address 0 
#10 Sub = 0; Aload = 1; Asel = 0;           //add with 10, expect 20
#10 Aload = 0; MemWr = 1; RAMAddress = 1;   //write 20 into address 1
#10 MemWr = 0;                              //read 20 from address 10
#10 Asel = 2'b10; Aload = 1;                //load 20 to output 
#10 Asel = 2'b01; input_data = 8'd35; Sub = 1; //Subtract 35 from 20
#10 Asel = 2'b00;                              //load -5 to output

#30 $stop;
end

//Clock pulse generator
always #5 Clock = ~Clock;

endmodule