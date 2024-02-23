#////////////////////////////////////////////////////////////////////////////////
#  project：PCIe_test                                                          //
#                                                                              //
#  Author: JunFN                                                               //
#          853808728@qq.com                                                    //
#          ALINX(shanghai) Technology Co.,Ltd                                  //
#          黑金                                                                //
#     WEB: http://www.alinx.cn/                                                //
#                                                                              //
#////////////////////////////////////////////////////////////////////////////////
#                                                                              //
# Copyright (c) 2017,ALINX(shanghai) Technology Co.,Ltd                        //
#                    All rights reserved                                       //
#                                                                              //
# This source file may be used and distributed without restriction provided    //
# that this copyright statement is not removed from the file and that any      //
# derivative work contains the original copyright notice and the associated    //
# disclaimer.                                                                  //
#                                                                              // 
#////////////////////////////////////////////////////////////////////////////////

#================================================================================
#  Revision History:
#  Date          By            Revision    Change Description
# --------------------------------------------------------------------------------
#  2023/8/22                   1.0          Original
#=================================================================================

  # Create interface ports
  set pcie_mgt [ create_bd_intf_port -mode Master -vlnv xilinx.com:interface:pcie_7x_mgt_rtl:1.0 pcie_mgt ]

  set pcie_ref [ create_bd_intf_port -mode Slave -vlnv xilinx.com:interface:diff_clock_rtl:1.0 pcie_ref ]
  set_property -dict [ list \
   CONFIG.FREQ_HZ {100000000} \
   ] $pcie_ref

  set DDR [ create_bd_intf_port -mode Master -vlnv xilinx.com:interface:ddrx_rtl:1.0 DDR ]

  set FIXED_IO [ create_bd_intf_port -mode Master -vlnv xilinx.com:display_processing_system7:fixedio_rtl:1.0 FIXED_IO ]


  # Create ports
  set pcie_rst_n [ create_bd_port -dir I -type rst pcie_rst_n ]
  set_property -dict [ list \
   CONFIG.POLARITY {ACTIVE_LOW} \
 ] $pcie_rst_n
 
  # Create instance: axi_smc, and set properties
  set axi_smc [ create_bd_cell -type ip -vlnv xilinx.com:ip:smartconnect:1.0 axi_smc ]
  set_property CONFIG.NUM_SI {1} $axi_smc


  # Create instance: util_ds_buf_0, and set properties
  set util_ds_buf_0 [ create_bd_cell -type ip -vlnv xilinx.com:ip:util_ds_buf:2.2 util_ds_buf_0 ]
  set_property CONFIG.C_BUF_TYPE {IBUFDSGTE} $util_ds_buf_0


  # Create instance: xdma_0, and set properties
  set xdma_0 [ create_bd_cell -type ip -vlnv xilinx.com:ip:xdma:4.1 xdma_0 ]
  set_property -dict [list \
    CONFIG.PF0_DEVICE_ID_mqdma {9022} \
    CONFIG.PF0_SRIOV_VF_DEVICE_ID {0000} \
    CONFIG.PF2_DEVICE_ID_mqdma {9022} \
    CONFIG.PF3_DEVICE_ID_mqdma {9022} \
    CONFIG.axisten_freq {125} \
    CONFIG.copy_pf0 {true} \
    CONFIG.enable_gen4 {false} \
    CONFIG.pcie_id_if {false} \
    CONFIG.pf0_device_id {7022} \
    CONFIG.pf1_bar0_scale {Kilobytes} \
    CONFIG.pf1_bar0_size {128} \
    CONFIG.pf1_bar1_enabled {false} \
    CONFIG.pl_link_cap_max_link_speed {5.0_GT/s} \
    CONFIG.pl_link_cap_max_link_width {X2} \
    CONFIG.plltype {QPLL1} \
  ] $xdma_0


  # Create interface connections
  connect_bd_intf_net -intf_net axi_smc_M00_AXI [get_bd_intf_pins axi_smc/M00_AXI] [get_bd_intf_pins processing_system7_0/S_AXI_HP0]
  connect_bd_intf_net -intf_net diff_clock_rtl_0_1 [get_bd_intf_pins util_ds_buf_0/CLK_IN_D] [get_bd_intf_ports pcie_ref]
  connect_bd_intf_net -intf_net processing_system7_0_DDR [get_bd_intf_pins processing_system7_0/DDR] [get_bd_intf_ports DDR]
  connect_bd_intf_net -intf_net processing_system7_0_FIXED_IO [get_bd_intf_pins processing_system7_0/FIXED_IO] [get_bd_intf_ports FIXED_IO]
  connect_bd_intf_net -intf_net xdma_0_M_AXI [get_bd_intf_pins xdma_0/M_AXI] [get_bd_intf_pins axi_smc/S00_AXI]
  connect_bd_intf_net -intf_net xdma_0_pcie_mgt [get_bd_intf_pins xdma_0/pcie_mgt] [get_bd_intf_ports pcie_mgt]

  # Create port connections
  connect_bd_net -net reset_rtl_0_1 [get_bd_ports pcie_rst_n] [get_bd_pins xdma_0/sys_rst_n]
  connect_bd_net -net util_ds_buf_0_IBUF_OUT [get_bd_pins util_ds_buf_0/IBUF_OUT] [get_bd_pins xdma_0/sys_clk]
  connect_bd_net -net xdma_0_axi_aclk [get_bd_pins xdma_0/axi_aclk] [get_bd_pins processing_system7_0/S_AXI_HP0_ACLK] [get_bd_pins axi_smc/aclk]
  connect_bd_net -net xdma_0_axi_aresetn [get_bd_pins xdma_0/axi_aresetn] [get_bd_pins axi_smc/aresetn]

  # Create address segments
  assign_bd_address -offset 0x00000000 -range 0x40000000 -target_address_space [get_bd_addr_spaces xdma_0/M_AXI] [get_bd_addr_segs processing_system7_0/S_AXI_HP0/HP0_DDR_LOWOCM] -force
