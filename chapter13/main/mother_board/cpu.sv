`include "lib_cpu.svh"

module cpu(
  ctrl_bus_if.master ctrl_bus,
  io_bus_if.master   io_bus,
  mem_bus_if.master  mem_bus
);
  import lib_cpu :: *;

  OPECODE opecode;
  logic [3:0] imm;
  decoder decoder(.data(mem_bus.data), .opecode, .imm);

  REGS current, next;
  assign mem_bus.addr = current.ip;
  assign io_bus.led   = current.out;

  alu alu(.opecode, .imm, .switch(io_bus.switch), .current, .next);
  write_reg write_reg(.ctrl_bus, .current, .next);
endmodule
