module cpu(
  input  logic clk,
  input  logic n_reset,
  output logic led
);
  logic a, next_a;

  always_ff @(posedge clk) begin
    if (~n_reset) a <= 1'b0;
    else          a <= next_a;
  end

  assign led = a;

  always_comb begin
    next_a = ~a;
  end
endmodule
