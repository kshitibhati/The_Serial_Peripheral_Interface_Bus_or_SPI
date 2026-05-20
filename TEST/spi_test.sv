class spi_test extends uvm_test;

`uvm_component_utils(spi_test)

spi_env env_h;
master_base_seqs m_seqs_h;
slave_base_seqs s_seqs_h; 


function new(string name="spi_test",uvm_component parent=null);
  super.new(name,parent);
endfunction



function void build_phase(uvm_phase phase);
  super.build_phase(phase);
  env_h    = spi_env         ::type_id::create("env_h",this);
  m_seqs_h = master_base_seqs::type_id::create("m_seqs_h",this);
  s_seqs_h = slave_base_seqs ::type_id::create("s_seqs_h",this);
endfunction

function void end_of_elaboration_phase(uvm_phase phase);
super.end_of_elaboration_phase(phase);
uvm_top.print_topology();
endfunction

task run_phase(uvm_phase phase);
  phase.raise_objection(this);
  fork
  m_seqs_h.start(env_h.magent_h.m_seqr_h);
  s_seqs_h.start(env_h.sagent_h.s_seqr_h);
  join
  #1us;
  phase.drop_objection(this);
endtask

endclass

