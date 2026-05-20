library verilog;
use verilog.vl_types.all;
entity spi_slave is
    port(
        sck             : in     vl_logic;
        cs              : in     vl_logic;
        mosi            : in     vl_logic;
        miso            : out    vl_logic
    );
end spi_slave;
