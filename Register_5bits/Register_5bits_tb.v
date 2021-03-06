module Register_5bits_tb;

reg[4:0] register_in;
reg load, clear, clock;
wire[4:0] out;

//instantiate design code
Register_5bits testing (register_in, load, out ,clear,clock);

//create a clock
initial clock = 0;
always #10 clock = ~clock;

//Test vectors start here
initial
begin
//initialize all inputs
#10 load = 1; clear = 0; register_in = 5'd3;  //expect out = 3
#10 load = 0; clear = 0; register_in = 8'd0; // this is to delay the clock until the next edge
#10 load = 0; clear = 0; register_in = 5'd10; //expect out = 3
#10 load = 0; clear = 0; register_in = 8'd0; // this is to delay the clock until the next edge
#10 clear = 1; load = 1; register_in = 5'd33; //expect out = 0
#10 load = 0; clear = 0; register_in = 8'd0; // this is to delay the clock until the next edge
#10 load = 1; clear = 0; register_in = 8'd55; // purposely fetch some value to see if clear working correctly
#10 load = 0; clear = 0; register_in = 8'd0; // this is to delay the clock until the next edge
#10 clear = 1; load = 0; register_in = 5'd50; //expect out = 0
   
  
end
endmodule

