`include "lib_cpu.svh"

module write_reg import lib_cpu :: *; (
  ctrl_bus_if.master ctrl_bus,
  output REGS        current,
  input  REGS        next
);
  always_ff @(posedge ctrl_bus.clk) begin
    if (~ctrl_bus.n_reset) current <= '0;
    else                   current <= next;
  end
endmodule
