library verilog;
use verilog.vl_types.all;
entity Register_5bits is
    port(
        register_in     : in     vl_logic_vector(4 downto 0);
        load            : in     vl_logic;
        \out\           : out    vl_logic_vector(4 downto 0);
        clear           : in     vl_logic;
        clock           : in     vl_logic
    );
end Register_5bits;
