interface spi_if(input bit clk);

`define ADDR 3
`define DATA 32

logic            wb_rst_i;
logic [`ADDR+1:0]wb_adr_i;
logic [`DATA-1:0]wb_dat_i;
logic [`DATA-1:0]wb_dat_o;
logic [`ADDR:0]  wb_sel_i;
logic            wb_we_i;
logic            wb_stb_i;
logic            wb_cyc_i;
logic            wb_ack_o;
logic            wb_err_o;
logic            wb_int_o;


logic [`ADDR+4:0]ss_pad_o;
logic            sclk_pad_o;
logic            mosi_pad_o;
logic            miso_pad_i;


clocking masterdr_cb@(posedge clk);
default input #1 output #1;
input wb_dat_o,wb_ack_o,wb_err_o,wb_int_o;
output wb_rst_i,wb_adr_i,wb_dat_i,wb_sel_i,wb_we_i,wb_stb_i,wb_cyc_i;
endclocking


clocking mastermon_cb@(posedge clk);
default  input #1 output #1;
input wb_rst_i,wb_adr_i,wb_dat_i,wb_sel_i,wb_we_i,wb_stb_i,wb_cyc_i;
input wb_dat_o,wb_ack_o,wb_err_o,wb_int_o,mosi_pad_o,sclk_pad_o,miso_pad_i;
endclocking


clocking slavedr_cb@(posedge clk);
default input #1 output #1;
input  sclk_pad_o,ss_pad_o,mosi_pad_o,wb_adr_i,wb_dat_i,wb_we_i;
output miso_pad_i;
endclocking


clocking slavemon_cb@(posedge clk);
default input #1 output #1;
input sclk_pad_o,ss_pad_o,mosi_pad_o;
input miso_pad_i;
endclocking


   modport MASTERDR_MP  (clocking masterdr_cb);
   
   modport MASTERMON_MP (clocking mastermon_cb);
   
   modport SLAVEDR_MP   (clocking slavedr_cb);
   
   modport SLAVEMON_MP  (clocking slavemon_cb);
   
endinterface
   
