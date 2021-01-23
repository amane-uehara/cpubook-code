C:\iverilog\bin\iverilog.exe -g2012 -o test_top.vvp test_top.sv ..\..\main\top.sv ..\..\main\prescaler.sv ..\..\main\mother_board.sv ..\..\main\mother_board\cpu.sv ..\..\main\mother_board\rom.sv
C:\iverilog\bin\vvp.exe -N test_top.vvp +vcd
C:\iverilog\gtkwave\bin\gtkwave.exe test_top.vcd
