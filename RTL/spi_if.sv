`define WIDTH 32
`define ADDR 5

interface spi_if (input bit clock);

logic wb_clk_i;
logic wb_rst_i;
logic [`ADDR-1:0]  wb_adr_i;
logic [`WIDTH-1:0] wb_dat_i;
logic [`WIDTH-1:0] wb_dat_o;
logic [`ADDR-2:0] wb_sel_i;
logic wb_we_i;
logic wb_stb_i;
logic wb_cyc_i;
logic wb_ack_o;
logic wb_err_o;
logic wb_int_o;
logic [`ADDR+2:0] ss_pad_o;
logic sclk_pad_o;
logic mosi_pad_o;
logic miso_pad_i;

assign wb_clk_i=clock; 

clocking ms_dr@(posedge wb_clk_i);
default input #0 output #1;
output wb_rst_i;
output wb_adr_i;
output wb_dat_i;
output wb_sel_i;
output wb_we_i;
output wb_stb_i;
output wb_cyc_i;
input wb_ack_o;
input wb_err_o;
input wb_int_o;
input sclk_pad_o;

endclocking

clocking ms_mon@(negedge wb_clk_i);
default input #0 output #1;
input wb_rst_i;
input wb_adr_i;
input wb_dat_i;
input wb_sel_i;
input wb_we_i;
input wb_stb_i;
input wb_cyc_i;
input wb_dat_o;
input wb_ack_o;
input wb_err_o;
input wb_int_o;

endclocking

clocking sl_dr@(posedge wb_clk_i);
default input #0 output #1;
input ss_pad_o;
input sclk_pad_o;
input mosi_pad_o;
output miso_pad_i;
input wb_adr_i;
input wb_dat_i;

endclocking

clocking sl_mon@(negedge wb_clk_i);
default input #0 output #1;
input ss_pad_o;
input sclk_pad_o;
input miso_pad_i;
input mosi_pad_o;
input wb_adr_i;
input wb_dat_i;

endclocking

modport MS_DR(clocking ms_dr);
modport MS_MON(clocking ms_mon);
modport SL_DR(clocking sl_dr);
modport SL_MON(clocking sl_mon);

endinterface






