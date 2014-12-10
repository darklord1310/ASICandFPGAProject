module instructionSetOp_tb();
 
//Set input as register and output as wires
reg		Aload, Reset, Clock, Sub, MemWr;
reg     [1:0] Asel;
reg		[7:0] input_data;
reg     [4:0] RAMAddress;
wire	[7:0] outputFromRAM, output_data;


//Instantiate design code
instructionSetOp testing (outputOfRAM, input_data, output_data, Asel, Aload, Reset, Clock, Sub, Aeq0, Apos, MemWr, RAMAddress);

//Test vector start here
initial
begin
//Initialize all inputs
#0 Clock = 0; Reset = 1; Aload = 0; MemWr = 0; Sub = 0; input_data = 8'd10;
#10


#30 $stop;
end

//Clock pulse generator
always #5 Clock = ~Clock;

endmodule