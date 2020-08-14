module mother_board(
  input  logic clk,
  input  logic n_reset,
  output logic led
);
  logic addr;
  logic data;

  cpu cpu(.clk, .n_reset, .addr, .data, .led);
  rom rom(.addr, .data);
endmodule
