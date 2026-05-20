package spi_pkg;
   import uvm_pkg::*;
   `include "uvm_macros.svh"
   
   `include "master_trans.sv"
   `include "slave_trans.sv"
   
   `include "master_seqs.sv"
   `include "slave_seqs.sv"
   
   `include "master_seqr.sv"
   `include "slave_seqr.sv"
   
   `include "master_driver.sv"
   `include "slave_driver.sv"
   
   `include "master_monitor.sv"
   `include "slave_monitor.sv"
   
   `include "master_agent.sv"
   `include "slave_agent.sv"
   
   `include "spi_sb.sv"
   `include "spi_env.sv"
   `include "spi_test.sv"

endpackage