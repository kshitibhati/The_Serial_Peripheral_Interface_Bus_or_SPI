class master_monitor extends uvm_monitor;

`uvm_component_utils(master_monitor)
master_trans trans_h;


uvm_analysis_port#(master_trans)an_mtrans_port;

int i;


virtual spi_if.MASTERMON_MP vif;
   
	
function new(string name="master_monitor",uvm_component parent=null);
	super.new(name,parent);
    an_mtrans_port=new("an_mtrans_port",this);
endfunction	

function void build_phase(uvm_phase phase);
	super.build_phase(phase);
endfunction

		
task run_phase(uvm_phase phase);
    repeat(10) 
	 trans_h=new;
	 monitor();
	 an_mtrans_port.write(trans_h);
endtask
   

task monitor();
                    
  trans_h=master_trans::type_id::create("trans_h");
        
  @(vif.mastermon_cb);
	    
	trans_h.wb_rst_i = vif.mastermon_cb.wb_rst_i;
	trans_h.wb_adr_i = vif.mastermon_cb.wb_adr_i;
	trans_h.wb_dat_i = vif.mastermon_cb.wb_dat_i;
	trans_h.wb_sel_i = vif.mastermon_cb.wb_sel_i;
	trans_h.wb_we_i  = vif.mastermon_cb.wb_we_i;
	trans_h.wb_stb_i = vif.mastermon_cb.wb_stb_i;
	trans_h.wb_cyc_i = vif.mastermon_cb.wb_cyc_i;
	trans_h.wb_dat_o = vif.mastermon_cb.wb_dat_o;
	trans_h.wb_ack_o = vif.mastermon_cb.wb_ack_o;
	trans_h.wb_err_o = vif.mastermon_cb.wb_err_o;
	trans_h.wb_int_o = vif.mastermon_cb.wb_int_o;

   begin
   @(vif.mastermon_cb);
	wait(vif.mastermon_cb.wb_we_i==1 && vif.mastermon_cb.wb_adr_i==5'h10);
      begin
	  trans_h.char_len = vif.mastermon_cb.wb_dat_i[6:0];
	  $display("char_len=%0d",trans_h.char_len);
	  trans_h.lsb = vif.mastermon_cb.wb_dat_i[11];
	  $display("char_len=**%0d",trans_h.lsb);
	  trans_h.t_posedge = vif.mastermon_cb.wb_dat_i[10];
	  trans_h.r_negedge = vif.mastermon_cb.wb_dat_i[9];
	  trans_h.go = vif.mastermon_cb.wb_dat_i[8];
	  end
	     
	
	@(vif.mastermon_cb);
	repeat(3)
      
    wait(vif.mastermon_cb.wb_adr_i==5'h00); 
	  trans_h.tx[31:0]=vif.mastermon_cb.wb_dat_i;
	
	  $display("tx=%0b",trans_h.tx[31:0]);

	wait(vif.mastermon_cb.wb_adr_i==5'h04);
	  trans_h.tx[63:32]=vif.mastermon_cb.wb_dat_i;
	 

	   
	 
	  for(i=0;i<=trans_h.char_len;i=i+1)begin
	  @(posedge vif.mastermon_cb.sclk_pad_o);
      trans_h.mosi[i]= vif.mastermon_cb.mosi_pad_o;
	  	
      trans_h.miso[i]= vif.mastermon_cb.miso_pad_i;			  
      end	       

                       
	@(vif.mastermon_cb);

    wait(vif.mastermon_cb.wb_adr_i==5'h00);
	  trans_h.rx[31:0]=vif.mastermon_cb.wb_dat_o;
	 
	  $display("rx=%0d",trans_h.rx);

	@(vif.mastermon_cb);
    @(vif.mastermon_cb);

	wait(vif.mastermon_cb.wb_adr_i==5'h04);
	  trans_h.rx[63:32]=vif.mastermon_cb.wb_dat_o;

    end	  
endtask
   
endclass

