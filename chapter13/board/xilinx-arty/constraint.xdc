# CLOCK 100MHZ
set_property -dict {PACKAGE_PIN E3  IOSTANDARD LVCMOS33} [get_ports {pin_clock}];
create_clock -add -name sys_clk_pin -period 10.00 -waveform {0 5} [get_ports {pin_clock}];

# SWITCH
set_property -dict {PACKAGE_PIN A8  IOSTANDARD LVCMOS33} [get_ports {pin_switch[0]}];
set_property -dict {PACKAGE_PIN C11 IOSTANDARD LVCMOS33} [get_ports {pin_switch[1]}];
set_property -dict {PACKAGE_PIN C10 IOSTANDARD LVCMOS33} [get_ports {pin_switch[2]}];
set_property -dict {PACKAGE_PIN A10 IOSTANDARD LVCMOS33} [get_ports {pin_switch[3]}];

# LED
set_property -dict {PACKAGE_PIN H5  IOSTANDARD LVCMOS33} [get_ports {pin_led[0]}];
set_property -dict {PACKAGE_PIN J5  IOSTANDARD LVCMOS33} [get_ports {pin_led[1]}];
set_property -dict {PACKAGE_PIN T9  IOSTANDARD LVCMOS33} [get_ports {pin_led[2]}];
set_property -dict {PACKAGE_PIN T10 IOSTANDARD LVCMOS33} [get_ports {pin_led[3]}];

# RESET
set_property -dict {PACKAGE_PIN C2  IOSTANDARD LVCMOS33} [get_ports {pin_n_reset}];
