set_property PACKAGE_PIN H1 [get_ports hdmi_out_clk]
set_property PACKAGE_PIN G3 [get_ports {hdmi_out_data[0]}]
set_property PACKAGE_PIN H3 [get_ports {hdmi_out_data[1]}]
set_property PACKAGE_PIN H4 [get_ports {hdmi_out_data[2]}]
set_property PACKAGE_PIN G7 [get_ports {hdmi_out_data[3]}]
set_property PACKAGE_PIN G8 [get_ports {hdmi_out_data[4]}]
set_property PACKAGE_PIN G1 [get_ports {hdmi_out_data[5]}]
set_property PACKAGE_PIN H5 [get_ports {hdmi_out_data[6]}]
set_property PACKAGE_PIN H6 [get_ports {hdmi_out_data[7]}]
set_property PACKAGE_PIN G4 [get_ports {hdmi_out_data[8]}]
set_property PACKAGE_PIN F4 [get_ports {hdmi_out_data[9]}]
set_property PACKAGE_PIN F5 [get_ports {hdmi_out_data[10]}]
set_property PACKAGE_PIN E5 [get_ports {hdmi_out_data[11]}]
set_property PACKAGE_PIN G6 [get_ports {hdmi_out_data[12]}]
set_property PACKAGE_PIN F6 [get_ports {hdmi_out_data[13]}]
set_property PACKAGE_PIN E7 [get_ports {hdmi_out_data[14]}]
set_property PACKAGE_PIN F7 [get_ports {hdmi_out_data[15]}]
set_property PACKAGE_PIN D3 [get_ports {hdmi_out_data[16]}]
set_property PACKAGE_PIN C3 [get_ports {hdmi_out_data[17]}]
set_property PACKAGE_PIN C4 [get_ports {hdmi_out_data[18]}]
set_property PACKAGE_PIN D5 [get_ports {hdmi_out_data[19]}]
set_property PACKAGE_PIN C5 [get_ports {hdmi_out_data[20]}]
set_property PACKAGE_PIN C6 [get_ports {hdmi_out_data[21]}]
set_property PACKAGE_PIN E8 [get_ports {hdmi_out_data[22]}]
set_property PACKAGE_PIN D8 [get_ports {hdmi_out_data[23]}]
set_property PACKAGE_PIN G2 [get_ports hdmi_out_de]
set_property PACKAGE_PIN E4 [get_ports hdmi_out_hs]
set_property PACKAGE_PIN L4 [get_ports {hdmi_rstn_tri_o[0]}]
set_property PACKAGE_PIN E3 [get_ports hdmi_out_vs]
set_property PACKAGE_PIN J8 [get_ports hdmi_i2c_scl_io]
set_property PACKAGE_PIN K8 [get_ports hdmi_i2c_sda_io]

set_property IOSTANDARD LVCMOS33 [get_ports hdmi_i2c_scl_io]
set_property IOSTANDARD LVCMOS33 [get_ports hdmi_i2c_sda_io]
set_property IOSTANDARD LVCMOS33 [get_ports hdmi_out_clk]
set_property IOSTANDARD LVCMOS33 [get_ports hdmi_out_de]
set_property IOSTANDARD LVCMOS33 [get_ports hdmi_out_hs]
set_property IOSTANDARD LVCMOS33 [get_ports {hdmi_out_data[*]}]
set_property IOSTANDARD LVCMOS33 [get_ports hdmi_out_vs]
set_property IOSTANDARD LVCMOS33  [get_ports {hdmi_rstn_tri_o[0]}]

set_property SLEW FAST [get_ports {hdmi_out_data[*]}]
set_property DRIVE 8 [get_ports {hdmi_out_data[*]}]
set_property SLEW FAST [get_ports hdmi_out_clk]
set_property SLEW FAST [get_ports hdmi_out_de]
set_property SLEW FAST [get_ports hdmi_out_hs]
set_property SLEW FAST [get_ports hdmi_out_vs]