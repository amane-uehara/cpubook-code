interface mem_bus_if #(parameter ADDR_WIDTH, DATA_WIDTH) ();
  logic [ADDR_WIDTH-1:0] addr;
  logic [DATA_WIDTH-1:0] data;
  modport master(output addr, input data);
  modport slave(input addr, output data);
endinterface
