library verilog;
use verilog.vl_types.all;
entity instructionSetOp is
    port(
        RAM_output      : out    vl_logic_vector(7 downto 0);
        input_data      : in     vl_logic_vector(7 downto 0);
        output_data     : out    vl_logic_vector(7 downto 0);
        Asel            : in     vl_logic_vector(1 downto 0);
        Aload           : in     vl_logic;
        Reset           : in     vl_logic;
        Clock           : in     vl_logic;
        Sub             : in     vl_logic;
        Aeq0            : out    vl_logic_vector(7 downto 0);
        Apos            : out    vl_logic;
        MemWr           : in     vl_logic;
        RAMAddress      : in     vl_logic_vector(4 downto 0)
    );
end instructionSetOp;
