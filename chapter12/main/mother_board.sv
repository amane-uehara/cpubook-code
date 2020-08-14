module mother_board(
  input  logic       clk,
  input  logic       n_reset,
  input  logic [3:0] switch,
  output logic [3:0] led
);
  logic [3:0] addr;
  logic [7:0] data;

  cpu cpu(.clk, .n_reset, .addr, .data, .switch, .led);
  rom rom(.addr, .data);
endmodule
