
module SPI_TOP();
     import spi_pkg::*;
	 import uvm_pkg::*;
	 
`include "uvm_macros.svh"
	 
bit wb_clk_i;

spi_if inf(wb_clk_i);
	 

	spi_top DUT( .wb_clk_i(wb_clk_i),
	             .wb_rst_i(inf.wb_rst_i),
				 .wb_adr_i(inf.wb_adr_i),
				 .wb_dat_i(inf.wb_dat_i),
				 .wb_dat_o(inf.wb_dat_o),
				 .wb_sel_i(inf.wb_sel_i),
				 .wb_we_i(inf.wb_we_i),
				 .wb_stb_i(inf.wb_stb_i),
				 .wb_cyc_i(inf.wb_cyc_i),
				 .wb_ack_o(inf.wb_ack_o),
				 .wb_err_o(inf.wb_err_o),
				 .wb_int_o(inf.wb_int_o),
				 .ss_pad_o(inf.ss_pad_o),
				 .sclk_pad_o(inf.sclk_pad_o),
				 .mosi_pad_o(inf.mosi_pad_o),
				 .miso_pad_i(inf.miso_pad_i));
	 
    always
	 #5 wb_clk_i = ~wb_clk_i;

 
	initial
	begin
	uvm_config_db #(virtual spi_if)::set(null,"*","vif",inf);
	run_test("spi_test");
	end
	 
endmodule
