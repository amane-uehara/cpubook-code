module top(
  input  logic       pin_clock,
  input  logic       pin_n_reset,
  input  logic [3:0] pin_switch,
  output logic [3:0] pin_led
);
  logic clk;
  prescaler #(.RATIO(100_000_000)) prescaler(
    .quick_clock(pin_clock),
    .slow_clock(clk)
  );

  mother_board mother_board(.clk, .n_reset(pin_n_reset), .switch(pin_switch), .led(pin_led));
endmodule
