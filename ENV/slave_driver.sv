

class slave_driver extends uvm_driver#(slave_trans);

`uvm_component_utils(slave_driver)
int i;
bit [6:0] ctrl;

function new(string name="slave_driver",uvm_component parent=null);
	super.new(name,parent);
endfunction


virtual spi_if.SLAVEDR_MP vif;

task run_phase(uvm_phase phase);
  forever
  begin
	seq_item_port.get_next_item(req);
	
	send_to_dut(req);
	seq_item_port.item_done();
  end
endtask


task send_to_dut(slave_trans req);
  
  $display("************");
  @(vif.slavedr_cb);
   wait (vif.slavedr_cb.wb_we_i==1 && vif.slavedr_cb.wb_adr_i== 5'h10);
  ctrl = vif.slavedr_cb.wb_dat_i;
  for (i=0; i<=ctrl[6:0]; i=i+1) begin
 
  @(posedge vif.slavedr_cb.sclk_pad_o);  

  vif.slavedr_cb.miso_pad_i <= {$random};
   
	   end
endtask

endclass









