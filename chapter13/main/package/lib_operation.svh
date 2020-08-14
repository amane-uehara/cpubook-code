`ifndef LIB_OPERATION_SVH
`define LIB_OPERATION_SVH
`include "lib_cpu.svh"
package lib_operation;
  import lib_cpu :: REGS;

  function automatic REGS nop(REGS regs);
    nop    = regs;
    nop.cf = 1'b0;
    nop.ip = regs.ip + 4'd1;
  endfunction

  function automatic REGS mov_a_b(REGS regs);
    mov_a_b   = nop(regs);
    mov_a_b.a = regs.b;
  endfunction

  function automatic REGS mov_b_a(REGS regs);
    mov_b_a   = nop(regs);
    mov_b_a.b = regs.a;
  endfunction

  function automatic REGS mov_a_imm(REGS regs, logic [3:0] imm);
    mov_a_imm   = nop(regs);
    mov_a_imm.a = imm;
  endfunction

  function automatic REGS mov_b_imm(REGS regs, logic [3:0] imm);
    mov_b_imm   = nop(regs);
    mov_b_imm.b = imm;
  endfunction

  function automatic REGS in_a(REGS regs, logic [3:0] switch);
    in_a   = nop(regs);
    in_a.a = switch;
  endfunction

  function automatic REGS in_b(REGS regs, logic [3:0] switch);
    in_b   = nop(regs);
    in_b.b = switch;
  endfunction

  function automatic REGS out_b(REGS regs);
    out_b     = nop(regs);
    out_b.out = regs.b;
  endfunction

  function automatic REGS out_imm(REGS regs, logic [3:0] imm);
    out_imm     = nop(regs);
    out_imm.out = imm;
  endfunction

  function automatic REGS add_a_imm(REGS regs, logic [3:0] imm);
    add_a_imm                   = nop(regs);
    {add_a_imm.cf, add_a_imm.a} = regs.a + imm;
  endfunction

  function automatic REGS add_b_imm(REGS regs, logic [3:0] imm);
    add_b_imm                   = nop(regs);
    {add_b_imm.cf, add_b_imm.b} = regs.b + imm;
  endfunction

  function automatic REGS jmp_imm(REGS regs, logic [3:0] imm);
    jmp_imm    = nop(regs);
    jmp_imm.ip = imm;
  endfunction

  function automatic REGS jnc_imm(REGS regs, logic [3:0] imm);
    jnc_imm    = nop(regs);
    jnc_imm.ip = regs.cf ? regs.ip + 4'd1 : imm;
  endfunction

endpackage
`endif
