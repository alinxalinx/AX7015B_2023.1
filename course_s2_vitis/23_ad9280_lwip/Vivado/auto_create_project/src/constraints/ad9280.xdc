set_property BITSTREAM.GENERAL.COMPRESS TRUE [current_design]
set_property CFGBVS VCCO [current_design]
set_property CONFIG_VOLTAGE 3.3 [current_design]

set_property PACKAGE_PIN W18 [get_ports adc_clk]
set_property PACKAGE_PIN U14 [get_ports {adc_data[0]}]
set_property PACKAGE_PIN U13 [get_ports {adc_data[1]}]
set_property PACKAGE_PIN AB14 [get_ports {adc_data[2]}]
set_property PACKAGE_PIN AB13 [get_ports {adc_data[3]}]
set_property PACKAGE_PIN W15 [get_ports {adc_data[4]}]
set_property PACKAGE_PIN V15 [get_ports {adc_data[5]}]
set_property PACKAGE_PIN Y17 [get_ports {adc_data[6]}]
set_property PACKAGE_PIN W17 [get_ports {adc_data[7]}]


set_property IOSTANDARD LVCMOS33 [get_ports adc_clk]
set_property IOSTANDARD LVCMOS33 [get_ports {adc_data[*]}]



set_false_path -reset_path -from [get_pins {design_1_i/ad9280_sample_0/inst/ad9280_sample_v1_0_S00_AXI_inst/slv_reg1_reg[*]/C}] -to [get_pins {design_1_i/ad9280_sample_0/inst/ad9280_sample_v1_0_S00_AXI_inst/sample_inst/sample_len_d0_reg[*]/D}]
set_false_path -reset_path -from [get_pins {design_1_i/ad9280_sample_0/inst/ad9280_sample_v1_0_S00_AXI_inst/slv_reg1_reg[*]/C}] -to [get_pins {design_1_i/ad9280_sample_0/inst/ad9280_sample_v1_0_S00_AXI_inst/sample_inst/dma_len_d0_reg[*]/D}]
set_false_path -reset_path -from [get_pins {design_1_i/ad9280_sample_0/inst/ad9280_sample_v1_0_S00_AXI_inst/slv_reg0_reg[0]/C}] -to [get_pins design_1_i/ad9280_sample_0/inst/ad9280_sample_v1_0_S00_AXI_inst/sample_inst/sample_start_d0_reg/D]


set_false_path -reset_path -from [get_pins design_1_i/ad9280_sample_0/inst/ad9280_sample_v1_0_S00_AXI_inst/sample_inst/st_clr_reg/C] -to [get_pins design_1_i/ad9280_sample_0/inst/ad9280_sample_v1_0_S00_AXI_inst/st_clr_d0_reg/D]
