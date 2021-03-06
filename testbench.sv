`timescale 1 ps / 100 fs
module testbench();
// Testbench Verilog code for 32-bit 5-stage Pipelined MIPS Processor 
parameter ClockDelay = 5000;

reg clk,reset;


TopPipeline  myCorei3(clk, reset);
initial clk = 0;
always #(ClockDelay/2) clk = ~clk;

initial 
begin
   reset = 1;
  #(ClockDelay/4);
  reset = 0;
end
endmodule