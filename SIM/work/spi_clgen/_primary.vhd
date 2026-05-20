library verilog;
use verilog.vl_types.all;
entity spi_clgen is
    generic(
        Tp              : integer := 1
    );
    port(
        clk_in          : in     vl_logic;
        rst             : in     vl_logic;
        go              : in     vl_logic;
        enable          : in     vl_logic;
        last_clk        : in     vl_logic;
        divider         : in     vl_logic_vector(15 downto 0);
        clk_out         : out    vl_logic;
        pos_edge        : out    vl_logic;
        neg_edge        : out    vl_logic
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of Tp : constant is 1;
end spi_clgen;
