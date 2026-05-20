 class master_base_seqs extends uvm_sequence#(master_trans);
`uvm_object_utils(master_base_seqs)

 master_trans mtrans_h;

function new (string name="master_base_seqs");
  super.new(name);
endfunction

task body();
   repeat(1)begin
mtrans_h=master_trans::type_id::create("mtrans_h");
start_item(mtrans_h);
   
																																				assert (mtrans_h.randomize()with{mtrans_h.wb_adr_i == 5'h10; mtrans_h.wb_we_i==1; mtrans_h.wb_sel_i==4'hf; mtrans_h.wb_dat_i==
	                                                                                                      {17'h0,1'h1,1'h1,1'h1,1'h1,1'h0,1'h0,1'h0,7'd48};});
   finish_item(mtrans_h);
   
   start_item(mtrans_h);
   assert (mtrans_h.randomize()with {mtrans_h.wb_adr_i==5'h14; mtrans_h.wb_we_i==1; mtrans_h.wb_sel_i==4'hf; mtrans_h.wb_dat_i==32'h00;});//divider register
   finish_item(mtrans_h);
   
   start_item(mtrans_h);
   assert(mtrans_h.randomize()with{mtrans_h.wb_adr_i==5'h18; mtrans_h.wb_we_i==1; mtrans_h.wb_sel_i==4'hf; mtrans_h.wb_dat_i==32'h2;});//slave select register
   finish_item(mtrans_h);
      
   start_item(mtrans_h);
   assert (mtrans_h.randomize()with{mtrans_h.wb_adr_i==5'h00; mtrans_h.wb_we_i==1; mtrans_h.wb_sel_i==4'hf; mtrans_h.wb_dat_i;});//TX0 register
   finish_item(mtrans_h);
   
   start_item(mtrans_h);
   assert (mtrans_h.randomize()with{mtrans_h.wb_adr_i==5'h04; mtrans_h.wb_we_i==1; mtrans_h.wb_sel_i==4'hf; mtrans_h.wb_dat_i;});//TX1 register
   finish_item(mtrans_h);
   
   start_item(mtrans_h);
   assert (mtrans_h.randomize()with{mtrans_h.wb_adr_i==5'h08; mtrans_h.wb_we_i==1; mtrans_h.wb_sel_i==4'hf; mtrans_h.wb_dat_i;});//TX2 register
   finish_item(mtrans_h);
   
   start_item(mtrans_h);
   assert (mtrans_h.randomize()with{mtrans_h.wb_adr_i==5'h0c; mtrans_h.wb_we_i==1; mtrans_h.wb_sel_i==4'hf; mtrans_h.wb_dat_i;});//TX3 register
   finish_item(mtrans_h);
 
   
   start_item(mtrans_h);
   assert (mtrans_h.randomize()with{mtrans_h.wb_adr_i==5'h10; mtrans_h.wb_we_i==1; mtrans_h.wb_sel_i==4'hf; mtrans_h.wb_dat_i==	
	                                                                          {17'h0,1'h1,1'h1,1'h1,1'h0,1'h1,1'h1,1'h0,7'd48};});     
																			  //go busy 1 ctrl
   finish_item(mtrans_h);
   
   
   start_item(mtrans_h);
   assert (mtrans_h.randomize()with{mtrans_h.wb_adr_i==5'h00; mtrans_h.wb_we_i==1; mtrans_h.wb_sel_i==4'hf; mtrans_h.wb_dat_i;});//RX0 register
   finish_item(mtrans_h);
   
   start_item(mtrans_h);
   assert (mtrans_h.randomize()with{mtrans_h.wb_adr_i==5'h08; mtrans_h.wb_we_i==1; mtrans_h.wb_sel_i==4'hf; mtrans_h.wb_dat_i;});//RX2 register
   finish_item(mtrans_h);
   
   start_item(mtrans_h);
   assert (mtrans_h.randomize()with{mtrans_h.wb_adr_i==5'h04; mtrans_h.wb_we_i==1; mtrans_h.wb_sel_i==4'hf; mtrans_h.wb_dat_i;});//RX1 register
   finish_item(mtrans_h);
   
   start_item(mtrans_h);
   assert (mtrans_h.randomize()with{mtrans_h.wb_adr_i==5'h0c; mtrans_h.wb_we_i==1; mtrans_h.wb_sel_i==4'hf; mtrans_h.wb_dat_i;});//RX3 register
   finish_item(mtrans_h);
   
   
   end
  endtask
endclass
