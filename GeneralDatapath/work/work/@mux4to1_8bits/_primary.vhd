library verilog;
use verilog.vl_types.all;
entity Mux4to1_8bits is
    port(
        selector        : in     vl_logic_vector(1 downto 0);
        in0             : in     vl_logic_vector(7 downto 0);
        in1             : in     vl_logic_vector(7 downto 0);
        in2             : in     vl_logic_vector(7 downto 0);
        outData         : out    vl_logic_vector(7 downto 0)
    );
end Mux4to1_8bits;
