

class master_driver extends uvm_driver #(master_trans);

 `uvm_component_utils(master_driver)
   
 virtual spi_if.MASTERDR_MP vif;

   
function new (string name = "master_driver", uvm_component parent=null);
   super.new(name,parent);
endfunction
   

task run_phase(uvm_phase phase);
  @(vif.masterdr_cb);
   vif.masterdr_cb.wb_rst_i<=1;
   vif.masterdr_cb.wb_stb_i<=1;
   vif.masterdr_cb.wb_cyc_i<=1;
   repeat(2)
  @(vif.masterdr_cb);
   vif.masterdr_cb.wb_rst_i<=0;
   forever
    begin
    seq_item_port.get_next_item(req);
      
    send_to_dut(req);
    seq_item_port.item_done();
	end
endtask


task send_to_dut(master_trans req);
  @(vif.masterdr_cb);
   begin

   vif.masterdr_cb.wb_adr_i <= req.wb_adr_i;
   vif.masterdr_cb.wb_dat_i <= req.wb_dat_i;
   vif.masterdr_cb.wb_sel_i <= 4'hf;
   vif.masterdr_cb.wb_we_i  <= 1'b1;
   vif.masterdr_cb.wb_stb_i <= 1'b1;
   vif.masterdr_cb.wb_cyc_i <= 1'b1;
   
 
   wait(vif.masterdr_cb.wb_ack_o);
   @(vif.masterdr_cb);
   @(vif.masterdr_cb);
  
   
   if(vif.masterdr_cb.wb_adr_i == 5'h10 && vif.masterdr_cb.wb_dat_i[8] == 1)begin
   
   
     wait(vif.masterdr_cb.wb_int_o);
   
    end
   end
endtask

endclass
