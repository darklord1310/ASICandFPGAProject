library verilog;
use verilog.vl_types.all;
entity datapath is
    port(
        PCload          : in     vl_logic;
        JMPmux          : in     vl_logic;
        IRload          : in     vl_logic;
        Meminst         : in     vl_logic;
        MemWr           : in     vl_logic;
        Aload           : in     vl_logic;
        Reset           : in     vl_logic;
        Clock           : in     vl_logic;
        Sub             : in     vl_logic;
        Asel            : in     vl_logic_vector(1 downto 0);
        Aeq0            : out    vl_logic;
        Apos            : out    vl_logic;
        IR              : out    vl_logic_vector(2 downto 0);
        data_in         : in     vl_logic_vector(7 downto 0);
        data_out        : out    vl_logic_vector(7 downto 0);
        RAMAddress      : out    vl_logic_vector(4 downto 0);
        lower5bits_IR   : out    vl_logic_vector(4 downto 0);
        outputFromPC    : out    vl_logic_vector(4 downto 0)
    );
end datapath;
