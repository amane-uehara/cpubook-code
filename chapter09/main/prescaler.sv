module prescaler #(parameter RATIO = 2) (
  input  logic quick_clock,
  output logic slow_clock
);
  logic [31:0] counter, next_counter;
  logic inv;
  assign inv = (counter == (RATIO/2 - 1));

  assign next_counter = inv ? 32'd0 : counter + 32'd1;
  always_ff @(posedge quick_clock) counter <= next_counter;

  logic next_slow_clock;
  assign next_slow_clock = inv ? ~slow_clock : slow_clock;
  always_ff @(posedge quick_clock) slow_clock <= next_slow_clock;
endmodule
