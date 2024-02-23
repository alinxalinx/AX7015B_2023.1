set_property PACKAGE_PIN M4 [get_ports {cmos1_i2c_sda_io}]
set_property PACKAGE_PIN U14 [get_ports {cmos1_d[9]}]
set_property PACKAGE_PIN U13 [get_ports {cmos1_d[8]}]
set_property PACKAGE_PIN AB14 [get_ports {cmos1_i2c_scl_io}]
set_property PACKAGE_PIN AB13 [get_ports {cmos1_d[5]}]
set_property PACKAGE_PIN W15 [get_ports {cmos1_d[3]}]
set_property PACKAGE_PIN V15 [get_ports {cmos1_d[4]}]
set_property PACKAGE_PIN Y17 [get_ports {cmos1_d[6]}]
set_property PACKAGE_PIN W17 [get_ports {cmos1_d[0]}]
set_property PACKAGE_PIN W18 [get_ports {cmos1_d[7]}]
set_property PACKAGE_PIN V18 [get_ports {cmos1_d[1]}]
set_property PACKAGE_PIN AB22 [get_ports {cmos1_d[2]}]
set_property PACKAGE_PIN AB21 [get_ports {cmos1_pclk}]
set_property PACKAGE_PIN AA20 [get_ports {cmos1_href}]
set_property PACKAGE_PIN AA19 [get_ports {cmos1_vsync}]
set_property PACKAGE_PIN T17 [get_ports {cmos_rstn_tri_o[0]}]
set_property IOSTANDARD LVCMOS33 [get_ports {cmos1_i2c_sda_io}]
set_property IOSTANDARD LVCMOS33 [get_ports {cmos1_d[9]}]
set_property IOSTANDARD LVCMOS33 [get_ports {cmos1_d[8]}]
set_property IOSTANDARD LVCMOS33 [get_ports {cmos1_i2c_scl_io}]
set_property IOSTANDARD LVCMOS33 [get_ports {cmos1_d[5]}]
set_property IOSTANDARD LVCMOS33 [get_ports {cmos1_d[3]}]
set_property IOSTANDARD LVCMOS33 [get_ports {cmos1_d[4]}]
set_property IOSTANDARD LVCMOS33 [get_ports {cmos1_d[6]}]
set_property IOSTANDARD LVCMOS33 [get_ports {cmos1_d[0]}]
set_property IOSTANDARD LVCMOS33 [get_ports {cmos1_d[7]}]
set_property IOSTANDARD LVCMOS33 [get_ports {cmos1_d[1]}]
set_property IOSTANDARD LVCMOS33 [get_ports {cmos1_d[2]}]
set_property IOSTANDARD LVCMOS33 [get_ports {cmos1_pclk}]
set_property IOSTANDARD LVCMOS33 [get_ports {cmos1_href}]
set_property IOSTANDARD LVCMOS33 [get_ports {cmos1_vsync}]
set_property IOSTANDARD LVCMOS33 [get_ports {cmos_rstn_tri_o[0]}]

set_property IOSTANDARD LVCMOS33 [get_ports {cmos2_vsync}]
set_property IOSTANDARD LVCMOS33 [get_ports {cmos2_pclk}]
set_property PACKAGE_PIN M1 [get_ports {cmos2_d[9]}]
set_property PACKAGE_PIN M2 [get_ports {cmos2_i2c_sda_io}]
set_property PACKAGE_PIN Y13 [get_ports {cmos2_d[6]}]
set_property PACKAGE_PIN Y12 [get_ports {cmos2_i2c_scl_io}]
set_property PACKAGE_PIN P2 [get_ports {cmos2_d[7]}]
set_property PACKAGE_PIN P3 [get_ports {cmos2_d[2]}]
set_property PACKAGE_PIN R7 [get_ports {cmos2_href}]
set_property PACKAGE_PIN P7 [get_ports {cmos2_d[8]}]
set_property PACKAGE_PIN P8 [get_ports {cmos2_d[3]}]
set_property PACKAGE_PIN N8 [get_ports {cmos_rstn_tri_o[1]}]
set_property PACKAGE_PIN R2 [get_ports {cmos2_d[4]}]
set_property PACKAGE_PIN R3 [get_ports {cmos2_d[5]}]
set_property PACKAGE_PIN R4 [get_ports {cmos2_d[1]}]
set_property PACKAGE_PIN R5 [get_ports {cmos2_d[0]}]
set_property PACKAGE_PIN M7 [get_ports {cmos2_vsync}]
set_property PACKAGE_PIN M8 [get_ports {cmos2_pclk}]

set_property IOSTANDARD LVCMOS33 [get_ports {cmos2_d[9]}]
set_property IOSTANDARD LVCMOS33 [get_ports {cmos2_i2c_sda_io}]
set_property IOSTANDARD LVCMOS33 [get_ports {cmos2_d[6]}]
set_property IOSTANDARD LVCMOS33 [get_ports {cmos2_i2c_scl_io}]
set_property IOSTANDARD LVCMOS33 [get_ports {cmos2_d[7]}]
set_property IOSTANDARD LVCMOS33 [get_ports {cmos2_d[2]}]
set_property IOSTANDARD LVCMOS33 [get_ports {cmos2_href}]
set_property IOSTANDARD LVCMOS33 [get_ports {cmos2_d[8]}]
set_property IOSTANDARD LVCMOS33 [get_ports {cmos2_d[3]}]
set_property IOSTANDARD LVCMOS33 [get_ports {cmos_rstn_tri_o[1]}]
set_property IOSTANDARD LVCMOS33 [get_ports {cmos2_d[4]}]
set_property IOSTANDARD LVCMOS33 [get_ports {cmos2_d[5]}]
set_property IOSTANDARD LVCMOS33 [get_ports {cmos2_d[1]}]
set_property IOSTANDARD LVCMOS33 [get_ports {cmos2_d[0]}]

set_property PULLUP true [get_ports cmos1_i2c_scl_io]
set_property PULLUP true [get_ports cmos1_i2c_sda_io]
set_property PULLUP true [get_ports cmos2_i2c_scl_io]
set_property PULLUP true [get_ports cmos2_i2c_sda_io]
set_property CLOCK_DEDICATED_ROUTE FALSE [get_nets cmos1_pclk_IBUF]
set_property CLOCK_DEDICATED_ROUTE FALSE [get_nets cmos2_pclk_IBUF]