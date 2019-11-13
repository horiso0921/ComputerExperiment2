library verilog;
use verilog.vl_types.all;
entity m is
    port(
        clk             : in     vl_logic;
        reset           : in     vl_logic;
        x               : in     vl_logic;
        y               : out    vl_logic
    );
end m;
