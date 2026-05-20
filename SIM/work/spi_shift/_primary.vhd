library verilog;
use verilog.vl_types.all;
entity spi_shift is
    generic(
        Tp              : integer := 1
    );
    port(
        clk             : in     vl_logic;
        rst             : in     vl_logic;
        latch           : in     vl_logic_vector(3 downto 0);
        byte_sel        : in     vl_logic_vector(3 downto 0);
        len             : in     vl_logic_vector(6 downto 0);
        lsb             : in     vl_logic;
        go              : in     vl_logic;
        pos_edge        : in     vl_logic;
        neg_edge        : in     vl_logic;
        rx_negedge      : in     vl_logic;
        tx_negedge      : in     vl_logic;
        tip             : out    vl_logic;
        last            : out    vl_logic;
        p_in            : in     vl_logic_vector(31 downto 0);
        p_out           : out    vl_logic_vector(127 downto 0);
        s_clk           : in     vl_logic;
        s_in            : in     vl_logic;
        s_out           : out    vl_logic
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of Tp : constant is 1;
end spi_shift;
