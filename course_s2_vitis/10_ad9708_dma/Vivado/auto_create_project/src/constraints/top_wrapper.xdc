
set_property PACKAGE_PIN Y13 [get_ports dac_clk]
set_property PACKAGE_PIN R2 [get_ports {dac_data[0]}]
set_property PACKAGE_PIN N8 [get_ports {dac_data[1]}]
set_property PACKAGE_PIN P8 [get_ports {dac_data[2]}]
set_property PACKAGE_PIN P7 [get_ports {dac_data[3]}]
set_property PACKAGE_PIN R7 [get_ports {dac_data[4]}]
set_property PACKAGE_PIN P3 [get_ports {dac_data[5]}]
set_property PACKAGE_PIN P2 [get_ports {dac_data[6]}]
set_property PACKAGE_PIN Y12 [get_ports {dac_data[7]}]

set_property IOSTANDARD LVCMOS33 [get_ports dac_clk]
set_property IOSTANDARD LVCMOS33 [get_ports {dac_data[*]}]


set_false_path -reset_path -from [get_pins top_i/ad9708_send_0/inst/ad9708_send_v1_0_S00_AXI_inst/send_inst/st_clr_reg/C] -to [get_pins top_i/ad9708_send_0/inst/ad9708_send_v1_0_S00_AXI_inst/st_clr_d0_reg/D]
set_false_path -reset_path -from [get_pins {top_i/ad9708_send_0/inst/ad9708_send_v1_0_S00_AXI_inst/slv_reg0_reg[0]/C}] -to [get_pins top_i/ad9708_send_0/inst/ad9708_send_v1_0_S00_AXI_inst/send_inst/send_start_d0_reg/D]
