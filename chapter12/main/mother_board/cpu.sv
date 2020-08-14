module cpu(
  input  logic       clk,
  input  logic       n_reset,
  output logic [3:0] addr,
  input  logic [7:0] data,
  input  logic [3:0] switch,
  output logic [3:0] led
);

  // a, b等はDFFのQワイヤーで、現在のレジスタの値に対応
  // next_a, next_b等はDFFのDワイヤーで、次回のレジスタの値に対応
  logic [3:0] a,   next_a;   // 汎用レジスタ
  logic [3:0] b,   next_b;   // 汎用レジスタ
  logic       cf,  next_cf;  // キャリーフラグ
  logic [3:0] ip,  next_ip;  // 命令ポインタ
  logic [3:0] out, next_out; // LEDに接続する

  // DFFの接続
  always_ff @(posedge clk) begin
    if (~n_reset) begin
      a   <= '0;
      b   <= '0;
      cf  <= '0;
      ip  <= '0;
      out <= '0;
    end else begin
      a   <= next_a;
      b   <= next_b;
      cf  <= next_cf;
      ip  <= next_ip;
      out <= next_out;
    end
  end

  // ポートの整備
  logic [3:0] opecode, imm;   // ADDやMOV等の命令と、即値を表すワイヤー
  assign opecode = data[7:4]; // romから受け取ったデータのMSB側を、命令として解釈
  assign imm     = data[3:0]; // romから受け取ったデータのLSB側を、即値として解釈
  assign addr    = ip;        // 命令ポインタの値を、アドレスとしてromに渡す
  assign led     = out;       // LEDをoutレジスタで制御

  // 次回のレジスタの値(next系ワイヤー)を計算する組合回路
  // 真理値表の上塗りを使ってコーディングする
  always_comb begin
    // next系ワイヤーの値をNOP命令の結果にする
    next_a   = a;         // 汎用レジスタは現在の値のままにする
    next_b   = b;         // 汎用レジスタは現在の値のままにする
    next_cf  = 1'b0;      // キャリーフラグは0にリセットする
    next_ip  = ip + 4'd1; // 命令ポインタは1増やす
    next_out = out;       // LEDは現在の値のままにする

    // next系ワイヤーの値を上塗りして、ADDやMOV等の結果にする
    unique case (opecode)
      4'b0000: {next_cf, next_a} = a + imm;     // ADD A, IMM
      4'b0101: {next_cf, next_b} = b + imm;     // ADD B, IMM
      4'b0011: next_a   = imm;                  // MOV A, IMM
      4'b0111: next_b   = imm;                  // MOV B, IMM
      4'b0001: next_a   = b;                    // MOV A, B
      4'b0100: next_b   = a;                    // MOV B, A
      4'b1111: next_ip  = imm;                  // JMP IMM
      4'b1110: next_ip  = cf ? ip + 4'd1 : imm; // JNC IMM
      4'b0010: next_a   = switch;               // IN  A
      4'b0110: next_b   = switch;               // IN  B
      4'b1001: next_out = b;                    // OUT B
      4'b1011: next_out = imm;                  // OUT IMM
      default: ;
    endcase
  end
endmodule
