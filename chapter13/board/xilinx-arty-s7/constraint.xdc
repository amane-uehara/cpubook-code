# CLOCK 100MHZ
set_property -dict {PACKAGE_PIN R2  IOSTANDARD LVCMOS33} [get_ports {pin_clock}];
create_clock -add -name sys_clk_pin -period 10.00 -waveform {0 5} [get_ports {pin_clock}];

# SWITCH
set_property -dict {PACKAGE_PIN H14 IOSTANDARD LVCMOS33} [get_ports {pin_switch[0]}];
set_property -dict {PACKAGE_PIN H18 IOSTANDARD LVCMOS33} [get_ports {pin_switch[1]}];
set_property -dict {PACKAGE_PIN G18 IOSTANDARD LVCMOS33} [get_ports {pin_switch[2]}];
set_property -dict {PACKAGE_PIN M5  IOSTANDARD LVCMOS33} [get_ports {pin_switch[3]}];

# LED
set_property -dict {PACKAGE_PIN E18 IOSTANDARD LVCMOS33} [get_ports {pin_led[0]}];
set_property -dict {PACKAGE_PIN F13 IOSTANDARD LVCMOS33} [get_ports {pin_led[1]}];
set_property -dict {PACKAGE_PIN E13 IOSTANDARD LVCMOS33} [get_ports {pin_led[2]}];
set_property -dict {PACKAGE_PIN H15 IOSTANDARD LVCMOS33} [get_ports {pin_led[3]}];

# RESET
set_property -dict {PACKAGE_PIN C18 IOSTANDARD LVCMOS33} [get_ports {pin_n_reset}];
