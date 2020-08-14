`include "lib_cpu.svh"
`include "lib_operation.svh"

module alu import lib_cpu :: *, lib_operation :: *; (
  input  OPECODE     opecode,
  input  logic [3:0] imm,
  input  logic [3:0] switch,
  input  REGS        current,
  output REGS        next
);
  always_comb begin
    unique case (opecode)
      MOV_A_B:   next = mov_a_b(current);
      MOV_B_A:   next = mov_b_a(current);
      MOV_A_IMM: next = mov_a_imm(current, imm);
      MOV_B_IMM: next = mov_b_imm(current, imm);
      IN_A:      next = in_a(current, switch);
      IN_B:      next = in_b(current, switch);
      OUT_B:     next = out_b(current);
      OUT_IMM:   next = out_imm(current, imm);
      ADD_A_IMM: next = add_a_imm(current, imm);
      ADD_B_IMM: next = add_b_imm(current, imm);
      JMP_IMM:   next = jmp_imm(current, imm);
      JNC_IMM:   next = jnc_imm(current, imm);
      default:   next = nop(current);
    endcase
  end
endmodule
