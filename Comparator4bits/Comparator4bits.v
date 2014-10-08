module Comparator4bits(inA,inB,x,y,z);

input[3:0] inA,inB;
output reg x,y,z;

always @ (inA , inB)
begin
	if ( inA > inB)
	begin
		 x = 1;
		 y=0;
		 z=0;
	end
	else if (inA<inB)
	begin
		 y=1;
		 x=0;
		 z=0;
	end
	else
	begin
		 z=1;
		 x=0;
		 y=0;
	end
end

endmodule