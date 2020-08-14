module cpu(
  input  logic clk,
  input  logic n_reset,
  output logic addr,
  input  logic data,
  output logic led
);
  logic a,  next_a;
  logic ip, next_ip;

  always_ff @(posedge clk) begin
    if (~n_reset) begin
      a  <= 1'b0;
      ip <= 1'b0;
    end else begin
      a  <= next_a;
      ip <= next_ip;
    end
  end

  assign led  = a;
  assign addr = ip;

  always_comb begin
    case (data)
      1'b0: next_a =  a; // NOP
      1'b1: next_a = ~a; // NOT
    endcase
    next_ip = ip + 1'b1;
  end
endmodule
