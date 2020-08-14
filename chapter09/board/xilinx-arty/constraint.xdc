# CLOCK 100MHZ
set_property -dict {PACKAGE_PIN E3 IOSTANDARD LVCMOS33} [get_ports {pin_clock}];
create_clock -add -name sys_clk_pin -period 10.00 -waveform {0 5} [get_ports {pin_clock}];

# LED
set_property -dict {PACKAGE_PIN H5 IOSTANDARD LVCMOS33} [get_ports {pin_led}];

# RESET
set_property -dict {PACKAGE_PIN C2 IOSTANDARD LVCMOS33} [get_ports {pin_n_reset}];
