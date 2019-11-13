library verilog;
use verilog.vl_types.all;
entity bcd1 is
    port(
        clk             : in     vl_logic;
        reset           : in     vl_logic;
        x               : in     vl_logic;
        bcd1_out        : out    vl_logic_vector(3 downto 0)
    );
end bcd1;
