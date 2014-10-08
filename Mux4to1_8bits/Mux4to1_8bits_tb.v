module Mux4to1_8bits_tb;

// set input as register and output as wires
reg[1:0] selector;
reg[7:0] in1,in2,in3;
wire[7:0] outData;

//instantiate design code
Mux4to1_8bits testing (selector, in1, in2,in3,outData);

//Test vectors start here
initial
begin
//initialize all inputs
#0 in1 = 8'd5; in2 = 8'd10; in3 = 8'd15; selector = 2'b00; //expect output=5
#5 in1 = 8'd5; in2 = 8'd10; in3 = 8'd15; selector = 2'b01; //expect output=10
#5 in1 = 8'd5; in2 = 8'd10; in3 = 8'd15; selector = 2'b10; //expect output=15
#5 in1 = 8'd5; in2 = 8'd10; in3 = 8'd15; selector = 2'b11; //expect output=XX

   
  
end
endmodule