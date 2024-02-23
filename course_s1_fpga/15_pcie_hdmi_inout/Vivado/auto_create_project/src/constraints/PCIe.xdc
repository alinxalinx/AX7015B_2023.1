set_property BITSTREAM.GENERAL.COMPRESS TRUE [current_design]
set_property CFGBVS VCCO [current_design]
set_property CONFIG_VOLTAGE 3.3 [current_design]

#PCIe rstn
set_property PACKAGE_PIN M6 [get_ports pcie_rst_n]
set_property IOSTANDARD LVCMOS33 [get_ports pcie_rst_n]


# PCI Express reference clock 100MHz
set_property PACKAGE_PIN U9 [get_ports {pcie_ref_clk_p[0]}]
set_property PACKAGE_PIN V9 [get_ports {pcie_ref_clk_n[0]}]

# MGT locations

set_property PACKAGE_PIN W8 [get_ports {pcie_mgt_rxp[0]}]
set_property PACKAGE_PIN AA7 [get_ports {pcie_mgt_rxp[1]}]

set_property PACKAGE_PIN W4 [get_ports {pcie_mgt_txp[0]}]
set_property PACKAGE_PIN AA3 [get_ports {pcie_mgt_txp[1]}]

# PCIe Lane 0
#set_property LOC GTPE2_CHANNEL_X0Y1 [get_cells {inst/gt_top_i/pipe_wrapper_i/pipe_lane[0].gt_wrapper_i/gtp_channel.gtpe2_channel_i}]
# PCIe Lane 1
#set_property LOC GTPE2_CHANNEL_X0Y0 [get_cells {inst/gt_top_i/pipe_wrapper_i/pipe_lane[1].gt_wrapper_i/gtp_channel.gtpe2_channel_i}]

# GTP Common Placement
set_property LOC GTPE2_COMMON_X0Y0 [get_cells -hierarchical -filter {NAME=~*/pipe_wrapper_i/pipe_lane[0].pipe_quad.gt_common_enabled.gt_common_int.gt_common_i/qpll_wrapper_i/gtp_common.gtpe2_common_i}]

#
# PCI Express Block placement. This constraint selects the PCI Express
# Block to be used.
#

set_property LOC PCIE_X0Y0 [get_cells -hierarchical -filter {NAME=~*/pcie_7x_i/pcie_block_i}]

#
# BlockRAM placement
#
set_property LOC RAMB36_X3Y5 [get_cells -hierarchical -filter {NAME=~*/pcie_7x_i/pcie_bram_top/pcie_brams_rx/brams[3].ram/use_tdp.ramb36/genblk*.bram36_tdp_bl.bram36_tdp_bl}]
set_property LOC RAMB36_X2Y6 [get_cells -hierarchical -filter {NAME=~*/pcie_7x_i/pcie_bram_top/pcie_brams_rx/brams[2].ram/use_tdp.ramb36/genblk*.bram36_tdp_bl.bram36_tdp_bl}]
set_property LOC RAMB36_X2Y5 [get_cells -hierarchical -filter {NAME=~*/pcie_7x_i/pcie_bram_top/pcie_brams_rx/brams[1].ram/use_tdp.ramb36/genblk*.bram36_tdp_bl.bram36_tdp_bl}]
set_property LOC RAMB36_X2Y4 [get_cells -hierarchical -filter {NAME=~*/pcie_7x_i/pcie_bram_top/pcie_brams_rx/brams[0].ram/use_tdp.ramb36/genblk*.bram36_tdp_bl.bram36_tdp_bl}]
set_property LOC RAMB36_X2Y3 [get_cells -hierarchical -filter {NAME=~*/pcie_7x_i/pcie_bram_top/pcie_brams_tx/brams[0].ram/use_tdp.ramb36/genblk*.bram36_tdp_bl.bram36_tdp_bl}]
set_property LOC RAMB36_X2Y2 [get_cells -hierarchical -filter {NAME=~*/pcie_7x_i/pcie_bram_top/pcie_brams_tx/brams[1].ram/use_tdp.ramb36/genblk*.bram36_tdp_bl.bram36_tdp_bl}]
set_property LOC RAMB36_X2Y1 [get_cells -hierarchical -filter {NAME=~*/pcie_7x_i/pcie_bram_top/pcie_brams_tx/brams[2].ram/use_tdp.ramb36/genblk*.bram36_tdp_bl.bram36_tdp_bl}]
set_property LOC RAMB36_X2Y0 [get_cells -hierarchical -filter {NAME=~*/pcie_7x_i/pcie_bram_top/pcie_brams_tx/brams[3].ram/use_tdp.ramb36/genblk*.bram36_tdp_bl.bram36_tdp_bl}]

###############################################################################
# Timing Constraints
###############################################################################
#
create_clock -name txoutclk_x0y0 -period 10 [get_pins -hierarchical -filter {NAME=~*/pipe_wrapper_i/pipe_lane[0].gt_wrapper_i/gtp_channel.gtpe2_channel_i/TXOUTCLK}]
#
#
set_false_path -to [get_pins -hierarchical -filter {NAME=~*/pipe_wrapper_i/pipe_clock_int.pipe_clock_i/pclk_i1_bufgctrl.pclk_i1/S0}]
set_false_path -to [get_pins -hierarchical -filter {NAME=~*/pipe_wrapper_i/pipe_clock_int.pipe_clock_i/pclk_i1_bufgctrl.pclk_i1/S1}]




#
create_generated_clock -name clk_125mhz_x0y0 [get_pins -hierarchical -filter {NAME=~*/pipe_wrapper_i/pipe_clock_int.pipe_clock_i/mmcm_i/CLKOUT0}]
create_generated_clock -name clk_250mhz_x0y0 [get_pins -hierarchical -filter {NAME=~*/pipe_wrapper_i/pipe_clock_int.pipe_clock_i/mmcm_i/CLKOUT1}]
create_generated_clock -name clk_125mhz_mux_x0y0 \
                        -source [get_pins -hierarchical -filter {NAME=~*/pipe_wrapper_i/pipe_clock_int.pipe_clock_i/pclk_i1_bufgctrl.pclk_i1/I0}] \
                        -divide_by 1 \
                        [get_pins -hierarchical -filter {NAME=~*/pipe_wrapper_i/pipe_clock_int.pipe_clock_i/pclk_i1_bufgctrl.pclk_i1/O}]
#
create_generated_clock -name clk_250mhz_mux_x0y0 \
                        -source [get_pins -hierarchical -filter {NAME=~*/pipe_wrapper_i/pipe_clock_int.pipe_clock_i/pclk_i1_bufgctrl.pclk_i1/I1}] \
                        -divide_by 1 -add -master_clock [get_clocks -of [get_pins -hierarchical -filter {NAME=~*/pipe_wrapper_i/pipe_clock_int.pipe_clock_i/pclk_i1_bufgctrl.pclk_i1/I1}]] \
                        [get_pins -hierarchical -filter {NAME=~*/pipe_wrapper_i/pipe_clock_int.pipe_clock_i/pclk_i1_bufgctrl.pclk_i1/O}]
#
set_clock_groups -name pcieclkmux -physically_exclusive -group clk_125mhz_mux_x0y0 -group clk_250mhz_mux_x0y0
#
#
# Timing ignoring the below pins to avoid CDC analysis, but care has been taken in RTL to sync properly to other clock domain.
#
#
set_false_path -through [get_pins -hierarchical -filter {NAME=~*/pcie_block_i/PLPHYLNKUPN}]
set_false_path -through [get_pins -hierarchical -filter {NAME=~*/pcie_block_i/PLRECEIVEDHOTRST}]

#------------------------------------------------------------------------------
# Asynchronous Paths
#------------------------------------------------------------------------------
set_false_path -through [get_pins -hierarchical -filter {NAME=~*/RXELECIDLE}]
set_false_path -through [get_pins -hierarchical -filter {NAME=~*/TXPHINITDONE}]
set_false_path -through [get_pins -hierarchical -filter {NAME=~*/TXPHALIGNDONE}]
set_false_path -through [get_pins -hierarchical -filter {NAME=~*/TXDLYSRESETDONE}]
set_false_path -through [get_pins -hierarchical -filter {NAME=~*/RXDLYSRESETDONE}]
set_false_path -through [get_pins -hierarchical -filter {NAME=~*/RXPHALIGNDONE}]
set_false_path -through [get_pins -hierarchical -filter {NAME=~*/RXCDRLOCK}]
set_false_path -through [get_pins -hierarchical -filter {NAME=~*/CFGMSGRECEIVEDPMETO}]
set_false_path -through [get_pins -hierarchical -filter {NAME=~*/PLL0LOCK}]
set_false_path -through [get_pins -hierarchical -filter {NAME=~*/RXPMARESETDONE}]
set_false_path -through [get_pins -hierarchical -filter {NAME=~*/RXSYNCDONE}]
set_false_path -through [get_pins -hierarchical -filter {NAME=~*/TXSYNCDONE}]

###############################################################################
# End
###############################################################################

