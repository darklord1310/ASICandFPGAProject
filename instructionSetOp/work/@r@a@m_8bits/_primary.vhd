library verilog;
use verilog.vl_types.all;
entity RAM_8bits is
    port(
        address         : in     vl_logic_vector(4 downto 0);
        WE              : in     vl_logic;
        dataIn          : in     vl_logic_vector(7 downto 0);
        dataOut         : out    vl_logic_vector(7 downto 0);
        clock           : in     vl_logic
    );
end RAM_8bits;
