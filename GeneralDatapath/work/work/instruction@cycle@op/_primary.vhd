library verilog;
use verilog.vl_types.all;
entity instructionCycleOp is
    port(
        inputOfIR       : in     vl_logic_vector(7 downto 0);
        inputOfRAM      : in     vl_logic_vector(7 downto 0);
        outputFromRAM   : out    vl_logic_vector(7 downto 0);
        IRload          : in     vl_logic;
        JMPmux          : in     vl_logic;
        PCload          : in     vl_logic;
        Reset           : in     vl_logic;
        Meminst         : in     vl_logic;
        MemWr           : in     vl_logic;
        Clock           : in     vl_logic;
        IR              : out    vl_logic_vector(2 downto 0);
        RAM_Address     : out    vl_logic_vector(4 downto 0);
        lower5bits_IR   : out    vl_logic_vector(4 downto 0);
        increment_output: out    vl_logic_vector(4 downto 0)
    );
end instructionCycleOp;
