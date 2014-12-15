library verilog;
use verilog.vl_types.all;
entity Register_8bits is
    port(
        load            : in     vl_logic;
        register_input  : in     vl_logic_vector(7 downto 0);
        \out\           : out    vl_logic_vector(7 downto 0);
        clear           : in     vl_logic;
        clock           : in     vl_logic
    );
end Register_8bits;
