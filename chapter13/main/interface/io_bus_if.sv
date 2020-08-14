interface io_bus_if #(parameter WIDTH) ();
  logic [WIDTH-1:0] switch;
  logic [WIDTH-1:0] led;
  modport master(input switch, output led);
endinterface
