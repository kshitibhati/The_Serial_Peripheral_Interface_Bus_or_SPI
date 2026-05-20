class slave_agent extends uvm_agent;

`uvm_component_utils(slave_agent)


virtual spi_if vif;

slave_seqr s_seqr_h;
slave_monitor  s_mon_h;	
slave_driver s_drv_h;


function new(string name="slave_agent",uvm_component parent=null);
super.new(name,parent);
endfunction


function void build_phase(uvm_phase phase);
  super.build_phase(phase);
  s_seqr_h = slave_seqr   ::type_id::create("s_seqr_h",this);
  s_mon_h  = slave_monitor::type_id::create("s_mon_h",this);
  s_drv_h  = slave_driver ::type_id::create("s_drv_h",this);
  if (!uvm_config_db#(virtual spi_if)::get(this,"","vif", vif)) begin
    `uvm_fatal("SLAVE_AGENT", "The virtual interface get failed");end
endfunction


function void connect_phase(uvm_phase phase);
  super.connect_phase(phase);
  s_drv_h.seq_item_port.connect(s_seqr_h.seq_item_export);
  s_drv_h.vif=vif;
  s_mon_h.vif=vif;

endfunction

endclass