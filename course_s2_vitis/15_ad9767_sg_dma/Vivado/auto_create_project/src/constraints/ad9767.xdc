set_property PACKAGE_PIN M8 [get_ports dac_ch0_clk]
set_property PACKAGE_PIN M7 [get_ports dac_ch0_wrt]
set_property PACKAGE_PIN R5 [get_ports {dac_ch0_data[0]}]
set_property PACKAGE_PIN R4 [get_ports {dac_ch0_data[1]}]
set_property PACKAGE_PIN R3 [get_ports {dac_ch0_data[2]}]
set_property PACKAGE_PIN R2 [get_ports {dac_ch0_data[3]}]
set_property PACKAGE_PIN N8 [get_ports {dac_ch0_data[4]}]
set_property PACKAGE_PIN P8 [get_ports {dac_ch0_data[5]}]
set_property PACKAGE_PIN P7 [get_ports {dac_ch0_data[6]}]
set_property PACKAGE_PIN R7 [get_ports {dac_ch0_data[7]}]
set_property PACKAGE_PIN P3 [get_ports {dac_ch0_data[8]}]
set_property PACKAGE_PIN P2 [get_ports {dac_ch0_data[9]}]
set_property PACKAGE_PIN Y12 [get_ports {dac_ch0_data[10]}]
set_property PACKAGE_PIN Y13 [get_ports {dac_ch0_data[11]}]
set_property PACKAGE_PIN M2 [get_ports {dac_ch0_data[12]}]
set_property PACKAGE_PIN M1 [get_ports {dac_ch0_data[13]}]

set_property PACKAGE_PIN M3 [get_ports dac_ch1_clk]
set_property PACKAGE_PIN M4 [get_ports dac_ch1_wrt]
set_property PACKAGE_PIN AA19 [get_ports {dac_ch1_data[0]}]
set_property PACKAGE_PIN AA20 [get_ports {dac_ch1_data[1]}]
set_property PACKAGE_PIN AB21 [get_ports {dac_ch1_data[2]}]
set_property PACKAGE_PIN AB22 [get_ports {dac_ch1_data[3]}]
set_property PACKAGE_PIN V18 [get_ports {dac_ch1_data[4]}]
set_property PACKAGE_PIN W18 [get_ports {dac_ch1_data[5]}]
set_property PACKAGE_PIN W17 [get_ports {dac_ch1_data[6]}]
set_property PACKAGE_PIN Y17 [get_ports {dac_ch1_data[7]}]
set_property PACKAGE_PIN V15 [get_ports {dac_ch1_data[8]}]
set_property PACKAGE_PIN W15 [get_ports {dac_ch1_data[9]}]
set_property PACKAGE_PIN AB13 [get_ports {dac_ch1_data[10]}]
set_property PACKAGE_PIN AB14 [get_ports {dac_ch1_data[11]}]
set_property PACKAGE_PIN U13 [get_ports {dac_ch1_data[12]}]
set_property PACKAGE_PIN U14 [get_ports {dac_ch1_data[13]}]

set_property IOSTANDARD LVCMOS33 [get_ports dac_ch0_clk]
set_property IOSTANDARD LVCMOS33 [get_ports dac_ch0_wrt]
set_property IOSTANDARD LVCMOS33 [get_ports {dac_ch0_data[*]}]

set_property IOSTANDARD LVCMOS33 [get_ports dac_ch1_clk]
set_property IOSTANDARD LVCMOS33 [get_ports dac_ch1_wrt]
set_property IOSTANDARD LVCMOS33 [get_ports {dac_ch1_data[*]}]

set_false_path -reset_path -from [get_pins top_i/ad9767_send_0/inst/ad9767_send_v1_0_S00_AXI_inst/send_inst/st_clr_reg/C] -to [get_pins top_i/ad9767_send_0/inst/ad9767_send_v1_0_S00_AXI_inst/st_clr_d0_reg/D]
set_false_path -reset_path -from [get_pins {top_i/ad9767_send_0/inst/ad9767_send_v1_0_S00_AXI_inst/slv_reg0_reg[0]/C}] -to [get_pins top_i/ad9767_send_0/inst/ad9767_send_v1_0_S00_AXI_inst/send_inst/send_start_d0_reg/D]

set_false_path -reset_path -from [get_pins top_i/ad9767_send_1/inst/ad9767_send_v1_0_S00_AXI_inst/send_inst/st_clr_reg/C] -to [get_pins top_i/ad9767_send_1/inst/ad9767_send_v1_0_S00_AXI_inst/st_clr_d0_reg/D]
set_false_path -reset_path -from [get_pins {top_i/ad9767_send_1/inst/ad9767_send_v1_0_S00_AXI_inst/slv_reg0_reg[0]/C}] -to [get_pins top_i/ad9767_send_1/inst/ad9767_send_v1_0_S00_AXI_inst/send_inst/send_start_d0_reg/D]


#set_false_path -from [get_pins {top_i/ad9767_send_1/inst/ad9767_send_v1_0_S00_AXI_inst/slv_reg0_reg[0]/C}] -to [get_pins top_i/ad9767_send_1/inst/ad9767_send_v1_0_S00_AXI_inst/send_inst/send_start_d0_reg/D]
#set_false_path -from [get_pins top_i/ad9767_send_1/inst/ad9767_send_v1_0_S00_AXI_inst/send_inst/st_clr_reg/C] -to [get_pins top_i/ad9767_send_1/inst/ad9767_send_v1_0_S00_AXI_inst/st_clr_d0_reg/D]




set_false_path -from [get_pins {top_i/ad9767_send_1/inst/ad9767_send_v1_0_S00_AXI_inst/slv_reg0_reg[0]/C}] -to [get_pins top_i/ad9767_send_1/inst/ad9767_send_v1_0_S00_AXI_inst/send_inst/send_start_d0_reg/D]
set_false_path -from [get_pins top_i/ad9767_send_1/inst/ad9767_send_v1_0_S00_AXI_inst/send_inst/st_clr_reg/C] -to [get_pins top_i/ad9767_send_1/inst/ad9767_send_v1_0_S00_AXI_inst/st_clr_d0_reg/D]
