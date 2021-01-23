`timescale 1ns/1ps
module test_top();
  logic pin_clock, pin_n_reset, pin_led;
  top top(.*);

  always #5 pin_clock = ~pin_clock;
  initial   pin_clock = 1'b0;

  defparam top.prescaler.RATIO      = 2;
  initial  top.prescaler.counter    = 32'd0;
  initial  top.prescaler.slow_clock = 1'b0;

  initial begin
    if ($test$plusargs("vcd")) begin
      $dumpfile("test_top.vcd");
      $dumpvars(0, test_top);
    end
  end

  initial begin
    pin_n_reset = 1'b0;
    #10;
    pin_n_reset = 1'b1;
  end

  initial begin
    #200;
    $finish();
  end
endmodule
