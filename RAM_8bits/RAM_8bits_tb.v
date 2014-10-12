module RAM_8bits_tb;

reg [7:0] address, dataIn;
reg WE, clock;
wire[7:0] dataOut;
reg [7:0] RAM[31:0];

RAM_8bits testing (address, WE,dataIn, dataOut, clock);
  
initial clock = 0;
always #10 clock = ~clock;
  
  
  
initial
begin
  
//write 10 into address 0
#10 address = 8'b0; WE = 1; dataIn = 8'd10; // dataOut should be unknown


//just to delay the clock until the next edge
#10 address = 8'b0; WE = 0; dataIn = 8'd10; // dataOut should be unknown

//read 10 from address 0
#10 address = 8'b0; WE = 0; dataIn = 8'b0; //dataOut should be 10


//just to delay the clock until the next edge
#10 address = 8'b0; WE = 0; dataIn = 8'd10; // dataOut should be unknown

//try with another address
//write 15 into address 8'b0001000
#10 address = 8'b0001000; WE = 1; dataIn = 8'd15; // dataOut should be unknown


//just to delay the clock until the next edge
#10 address = 8'b0; WE = 0; dataIn = 8'd10; // dataOut should be unknown


//read 15 from address 8'b0001000
#10 address = 8'b0001000; WE = 0; dataIn = 8'd15; //dataOut should be 15
  
  
end

endmodule
