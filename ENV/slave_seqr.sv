class slave_seqr extends uvm_sequencer#(slave_trans);
`uvm_component_utils(slave_seqr)

function new(string name ="slave_seqr",uvm_component parent=null);
 super.new(name,parent);
endfunction

endclass