module Comparator4bits_tb;

// set input as register and output as wires
register[3:0] inA,inB;
wire x,y,z;

//instantiate design code
Comparator4bits testing (inA,inB,x,y,z);

//Test vectors start here
initial
begin
//initialize all inputs
#0 inA = 4'b00; inB = 4'b00;
#5 inA = 4'd5; inB = 4'd0;
#5 inA = 4'd0; inB = 4'd5;
#5 inA = 4'd8; inB = 4'd8;
   
  
end
endmodule