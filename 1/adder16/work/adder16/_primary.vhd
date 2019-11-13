library verilog;
use verilog.vl_types.all;
entity adder16 is
    port(
        x               : in     vl_logic_vector(15 downto 0);
        y               : in     vl_logic_vector(15 downto 0);
        cin             : in     vl_logic;
        sum             : out    vl_logic_vector(15 downto 0);
        count           : out    vl_logic
    );
end adder16;
