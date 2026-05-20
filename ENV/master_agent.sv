//MASTER_AGENT
class master_agent extends uvm_agent;

`uvm_component_utils(master_agent)

virtual spi_if vif;
 
 master_seqr m_seqr_h;
 master_driver m_drv_h;
 master_monitor m_mon_h;


function new(string name="master_agent",uvm_component parent=null);
	super.new(name,parent);
endfunction

	
function void build_phase(uvm_phase phase);
	super.build_phase(phase);
	m_seqr_h=master_seqr::type_id::create("m_seqr_h",this);
    m_drv_h=master_driver::type_id::create("m_drv_h",this);
    m_mon_h=master_monitor::type_id::create("m_mon_h",this);
			
	if (!uvm_config_db#(virtual spi_if)::get(this,"","vif", vif)) begin
        `uvm_fatal("MASTER_AGENT", "The virtual interface get failed");end
endfunction


function void connect_phase(uvm_phase phase);
    super.connect_phase(phase);
    m_drv_h.seq_item_port.connect(m_seqr_h.seq_item_export);
	m_drv_h.vif=vif;
	m_mon_h.vif=vif;

endfunction

endclass