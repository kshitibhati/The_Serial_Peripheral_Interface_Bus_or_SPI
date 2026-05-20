class spi_sb extends uvm_scoreboard;

`uvm_component_utils(spi_sb)
master_trans mtrans_h;
slave_trans trans_h;

int i;

uvm_tlm_analysis_fifo #(master_trans)an_masterfifo;
uvm_tlm_analysis_fifo #(slave_trans)an_slavefifo;


function new(string name = "spi_sb",uvm_component parent = null);
 super.new(name,parent);
  an_masterfifo = new ("an_masterfifo",this);
  an_slavefifo = new ("an_slavefifo",this);
endfunction


task run_phase (uvm_phase phase);
 super.run_phase(phase);
 forever begin
  an_masterfifo.get(mtrans_h);

  $display("rx=%0b",mtrans_h.rx);
  an_slavefifo.get(trans_h);
  check_data();
 end 
endtask


task check_data();
	
  for(i=0;i<=mtrans_h.char_len;i=i+1)
  begin
  

  if(mtrans_h.miso[i] == mtrans_h.rx[i])begin

    $display(" SUCCESS ! miso = %d : %d = rx\n\n",mtrans_h.miso[i],mtrans_h.rx[i]);end

  else 

    $display(" mismatch ! miso = %d : %d = rx\n\n",mtrans_h.miso[i],mtrans_h.rx[i]);
 

  end
endtask

endclass
