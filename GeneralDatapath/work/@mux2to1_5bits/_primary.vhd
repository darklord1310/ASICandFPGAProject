library verilog;
use verilog.vl_types.all;
entity Mux2to1_5bits is
    port(
        in0             : in     vl_logic_vector(4 downto 0);
        in1             : in     vl_logic_vector(4 downto 0);
        selector        : in     vl_logic;
        outData         : out    vl_logic_vector(4 downto 0)
    );
end Mux2to1_5bits;
