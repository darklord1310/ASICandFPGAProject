module Register_8bits(load, register_input, out,clear,clock);

input load, clock,clear;
input [7:0] register_input;
output reg[7:0] out;


always @ (posedge clock)

	if(clear == 1 )
		out <= 8'b00000000;
	else
	begin
      if(load == 1)
        out <= register_input;
      else
        out <= out;
	end
	
endmodule
