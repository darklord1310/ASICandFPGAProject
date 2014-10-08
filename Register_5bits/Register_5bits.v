module Register_5bits(register_in, load, out ,clear,clock);

input[4:0] register_in;
input load, clear, clock;
output reg[4:0] out;


always @ (posedge clock)
	if(load == 1)
		out <= register_in;
	else if(clear == 1)
		out <= 8'b00000000;


endmodule
