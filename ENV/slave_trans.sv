	

class slave_trans extends uvm_sequence_item;

function new(string name="slave_trans");
super.new(name);
endfunction


rand logic miso_pad_i;
rand bit [127:0] miso_reg;
rand bit [127:0] mosi_reg;
logic miso[$];
logic mosi[$];



bit [7:0]ss_pad_o;
bit [127:0] char_len;
bit mosi_pad_o;
bit sclk_pad_o;
rand bit [127:0] rx;



`uvm_object_utils_begin(slave_trans)
`uvm_field_int(miso_pad_i,UVM_ALL_ON)
`uvm_field_int(mosi_pad_o,UVM_ALL_ON)
`uvm_field_int(ss_pad_o,UVM_ALL_ON)
`uvm_object_utils_end

endclass :slave_trans
