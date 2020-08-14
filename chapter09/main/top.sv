module top(
  input  logic pin_clock,
  input  logic pin_n_reset,
  output logic pin_led
);
  logic clk;
  prescaler #(.RATIO(100_000_000)) prescaler(
    .quick_clock(pin_clock),
    .slow_clock(clk)
  );

  cpu cpu(.clk, .n_reset(pin_n_reset), .led(pin_led));
endmodule
