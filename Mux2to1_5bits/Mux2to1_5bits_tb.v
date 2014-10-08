module Mux2to1_5bits_tb;

// set input as register and output as wires
reg[4:0] in1, in2;
reg selector;
wire[4:0] outData;

//instantiate design code
Mux2to1_5bits testing (in1, in2, selector, outData);

//Test vectors start here
initial
begin
//initialize all inputs
#0 in1 = 5'b00; in2 = 5'b01; selector = 0; //expect outData = 00
#5 in1 = 5'b01; in2 = 5'b00; selector = 1; //expect outData = 01
   
  
end
endmodule