library verilog;
use verilog.vl_types.all;
entity spi_top is
    generic(
        Tp              : integer := 1
    );
    port(
        wb_clk_i        : in     vl_logic;
        wb_rst_i        : in     vl_logic;
        wb_adr_i        : in     vl_logic_vector(4 downto 0);
        wb_dat_i        : in     vl_logic_vector(31 downto 0);
        wb_dat_o        : out    vl_logic_vector(31 downto 0);
        wb_sel_i        : in     vl_logic_vector(3 downto 0);
        wb_we_i         : in     vl_logic;
        wb_stb_i        : in     vl_logic;
        wb_cyc_i        : in     vl_logic;
        wb_ack_o        : out    vl_logic;
        wb_err_o        : out    vl_logic;
        wb_int_o        : out    vl_logic;
        ss_pad_o        : out    vl_logic_vector(31 downto 0);
        sclk_pad_o      : out    vl_logic;
        mosi_pad_o      : out    vl_logic;
        miso_pad_i      : in     vl_logic
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of Tp : constant is 1;
end spi_top;
