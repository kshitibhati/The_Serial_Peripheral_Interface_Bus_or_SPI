class slave_base_seqs extends uvm_sequence#(slave_trans);
`uvm_object_utils(slave_base_seqs)

slave_trans strans_h;

function new (string name="slave_base_seqs");
super.new(name);
endfunction


task body ();
 repeat(10)begin
  strans_h=slave_trans::type_id::create("strans_h");
  start_item(strans_h);
  assert (strans_h.randomize());
  finish_item(strans_h);
 end
endtask


endclass
