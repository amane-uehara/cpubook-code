module rom(
  input  logic [3:0] addr,
  output logic [7:0] data
);
  always_comb begin
    case (addr)                     // addr  data   assembler
      4'b0000: data = 8'b0110_0000; // 0     8'h60  IN  B
      4'b0001: data = 8'b1001_0000; // 1     8'h90  OUT B
      4'b0010: data = 8'b0011_1101; // 2     8'h3D  MOV A, 13
      4'b0011: data = 8'b0000_0001; // 3     8'h01  ADD A, 1
      4'b0100: data = 8'b1110_0011; // 4     8'hE3  JNC    3
      4'b0101: data = 8'b0101_0001; // 5     8'h51  ADD B, 1
      4'b0110: data = 8'b1110_0001; // 6     8'hE1  JNC    1
      4'b0111: data = 8'b1011_0000; // 7     8'hB0  OUT    0
      4'b1000: data = 8'b1011_1111; // 8     8'hBF  OUT    15
      4'b1001: data = 8'b1111_0111; // 9     8'hF7  JMP    7
      default: data = 8'b0000_0000;
    endcase
  end
endmodule
