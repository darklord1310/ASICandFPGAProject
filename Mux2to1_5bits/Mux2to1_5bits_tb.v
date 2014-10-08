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
#0 in1 = 5'b01100; in2 = 5'b01001; selector = 0; //expect outData = 12
#5 in1 = 5'b00001; in2 = 5'b00110; selector = 1; //expect outData = 6
   
  
end
endmodule