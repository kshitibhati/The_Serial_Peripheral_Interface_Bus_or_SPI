
class master_trans extends uvm_sequence_item;



     bit wb_clk_i; 
	 bit wb_rst_i;
rand bit[4:0]wb_adr_i;
rand logic [31:0]wb_dat_i;
rand bit [3:0]wb_sel_i;
rand bit wb_we_i;
rand bit wb_stb_i;
rand bit wb_cyc_i;
 bit miso_pad_i;
 bit mosi_pad_o;
 bit [127:0] miso;
 bit [127:0] mosi;

logic [31:0]wb_dat_o;
bit wb_ack_o;
bit wb_err_o;
bit wb_int_o;
rand logic [31:0]ctrl;

bit lsb;
bit msb;
bit t_posedge;
bit r_posedge;
bit r_negedge;
bit go;
bit [6:0] char_len;

bit [127:0] tx;
bit [127:0] rx;
rand logic [31:0] divider;
rand logic [31:0] ss;

function new(string name="master_trans");
  super.new(name);
endfunction


`uvm_object_utils_begin(master_trans)
`uvm_field_int(wb_rst_i,UVM_ALL_ON)
`uvm_field_int(wb_adr_i,UVM_ALL_ON)
`uvm_field_int(wb_dat_i,UVM_ALL_ON)
`uvm_field_int(wb_sel_i,UVM_ALL_ON)
`uvm_field_int(wb_we_i,UVM_ALL_ON)
`uvm_field_int(wb_stb_i,UVM_ALL_ON)
`uvm_field_int(wb_cyc_i,UVM_ALL_ON)
`uvm_field_int(wb_dat_o,UVM_ALL_ON)
`uvm_field_int(wb_ack_o,UVM_ALL_ON)
`uvm_field_int(wb_err_o,UVM_ALL_ON)
`uvm_field_int(wb_int_o,UVM_ALL_ON)
`uvm_object_utils_end


endclass
