class slave_monitor extends uvm_monitor;

`uvm_component_utils(slave_monitor)
 slave_trans trans_h;

uvm_analysis_port#(slave_trans)an_strans_port;


virtual spi_if.SLAVEMON_MP vif; 

 	
function new(string name="slave_monitor",uvm_component parent=null);
  super.new(name,parent);
  an_strans_port=new("an_strans_port",this);
endfunction
       
function void build_phase(uvm_phase phase);
  super.build_phase(phase);
endfunction
	
task run_phase(uvm_phase phase);
   repeat(10)
  
    trans_h=new;
	monitor();
	an_strans_port.write(trans_h);
	
endtask

task monitor();
@(vif.slavemon_cb);
  trans_h=slave_trans::type_id::create("trans_h");
  
	trans_h.sclk_pad_o = vif.slavemon_cb.sclk_pad_o;
	trans_h.ss_pad_o   = vif.slavemon_cb.ss_pad_o;
	trans_h.mosi_pad_o = vif.slavemon_cb.mosi_pad_o;
	trans_h.miso_pad_i = vif.slavemon_cb.miso_pad_i;
        
	

   
           
endtask		  
   
endclass
