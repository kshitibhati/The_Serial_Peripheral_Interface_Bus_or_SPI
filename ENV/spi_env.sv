class spi_env extends uvm_env;

`uvm_component_utils(spi_env)

master_agent    magent_h;
slave_agent     sagent_h;
master_monitor  m_mon_h;
slave_monitor   s_mon_h;
spi_sb          sb_h;


function new(string name ="spi_env",uvm_component parent=null);
 super.new(name,parent);
endfunction


function void build_phase(uvm_phase phase);
 super.build_phase(phase);
  magent_h = master_agent::type_id::create("magent_h",this);
  sagent_h = slave_agent ::type_id::create("sagent_h",this);
  sb_h     = spi_sb      ::type_id::create("sb_h",this);
endfunction 


function void connect_phase(uvm_phase phase);
 super.connect_phase(phase);
  magent_h.m_mon_h.an_mtrans_port.connect(sb_h.an_masterfifo.analysis_export);
  sagent_h.s_mon_h.an_strans_port.connect(sb_h.an_slavefifo.analysis_export);
endfunction

endclass
