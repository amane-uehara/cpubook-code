interface ctrl_bus_if();
  logic clk;
  logic n_reset;
  modport master(input clk, input n_reset);
endinterface
