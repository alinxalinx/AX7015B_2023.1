
connect_debug_port u_ila_0/probe3 [get_nets [list {design_1_i/axis_data_fifo_0/axis_data_count[0]} {design_1_i/axis_data_fifo_0/axis_data_count[1]} {design_1_i/axis_data_fifo_0/axis_data_count[2]} {design_1_i/axis_data_fifo_0/axis_data_count[3]} {design_1_i/axis_data_fifo_0/axis_data_count[4]} {design_1_i/axis_data_fifo_0/axis_data_count[5]} {design_1_i/axis_data_fifo_0/axis_data_count[6]} {design_1_i/axis_data_fifo_0/axis_data_count[7]} {design_1_i/axis_data_fifo_0/axis_data_count[8]} {design_1_i/axis_data_fifo_0/axis_data_count[9]} {design_1_i/axis_data_fifo_0/axis_data_count[10]} {design_1_i/axis_data_fifo_0/axis_data_count[11]} {design_1_i/axis_data_fifo_0/axis_data_count[12]} {design_1_i/axis_data_fifo_0/axis_data_count[13]} {design_1_i/axis_data_fifo_0/axis_data_count[14]} {design_1_i/axis_data_fifo_0/axis_data_count[15]} {design_1_i/axis_data_fifo_0/axis_data_count[16]} {design_1_i/axis_data_fifo_0/axis_data_count[17]} {design_1_i/axis_data_fifo_0/axis_data_count[18]} {design_1_i/axis_data_fifo_0/axis_data_count[19]} {design_1_i/axis_data_fifo_0/axis_data_count[20]} {design_1_i/axis_data_fifo_0/axis_data_count[21]} {design_1_i/axis_data_fifo_0/axis_data_count[22]} {design_1_i/axis_data_fifo_0/axis_data_count[23]} {design_1_i/axis_data_fifo_0/axis_data_count[24]} {design_1_i/axis_data_fifo_0/axis_data_count[25]} {design_1_i/axis_data_fifo_0/axis_data_count[26]} {design_1_i/axis_data_fifo_0/axis_data_count[27]} {design_1_i/axis_data_fifo_0/axis_data_count[28]} {design_1_i/axis_data_fifo_0/axis_data_count[29]} {design_1_i/axis_data_fifo_0/axis_data_count[30]} {design_1_i/axis_data_fifo_0/axis_data_count[31]}]]

create_debug_core u_ila_0 ila
set_property ALL_PROBE_SAME_MU true [get_debug_cores u_ila_0]
set_property ALL_PROBE_SAME_MU_CNT 1 [get_debug_cores u_ila_0]
set_property C_ADV_TRIGGER false [get_debug_cores u_ila_0]
set_property C_DATA_DEPTH 4096 [get_debug_cores u_ila_0]
set_property C_EN_STRG_QUAL false [get_debug_cores u_ila_0]
set_property C_INPUT_PIPE_STAGES 2 [get_debug_cores u_ila_0]
set_property C_TRIGIN_EN false [get_debug_cores u_ila_0]
set_property C_TRIGOUT_EN false [get_debug_cores u_ila_0]
set_property port_width 1 [get_debug_ports u_ila_0/clk]
connect_debug_port u_ila_0/clk [get_nets [list design_1_i/processing_system7_0/inst/FCLK_CLK0]]
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe0]
set_property port_width 11 [get_debug_ports u_ila_0/probe0]
connect_debug_port u_ila_0/probe0 [get_nets [list {design_1_i/axis_data_fifo_0/axis_rd_data_count[0]} {design_1_i/axis_data_fifo_0/axis_rd_data_count[1]} {design_1_i/axis_data_fifo_0/axis_rd_data_count[2]} {design_1_i/axis_data_fifo_0/axis_rd_data_count[3]} {design_1_i/axis_data_fifo_0/axis_rd_data_count[4]} {design_1_i/axis_data_fifo_0/axis_rd_data_count[5]} {design_1_i/axis_data_fifo_0/axis_rd_data_count[6]} {design_1_i/axis_data_fifo_0/axis_rd_data_count[7]} {design_1_i/axis_data_fifo_0/axis_rd_data_count[8]} {design_1_i/axis_data_fifo_0/axis_rd_data_count[9]} {design_1_i/axis_data_fifo_0/axis_rd_data_count[10]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe1]
set_property port_width 32 [get_debug_ports u_ila_0/probe1]
connect_debug_port u_ila_0/probe1 [get_nets [list {design_1_i/axis_data_fifo_0/s_axis_tdata[0]} {design_1_i/axis_data_fifo_0/s_axis_tdata[1]} {design_1_i/axis_data_fifo_0/s_axis_tdata[2]} {design_1_i/axis_data_fifo_0/s_axis_tdata[3]} {design_1_i/axis_data_fifo_0/s_axis_tdata[4]} {design_1_i/axis_data_fifo_0/s_axis_tdata[5]} {design_1_i/axis_data_fifo_0/s_axis_tdata[6]} {design_1_i/axis_data_fifo_0/s_axis_tdata[7]} {design_1_i/axis_data_fifo_0/s_axis_tdata[8]} {design_1_i/axis_data_fifo_0/s_axis_tdata[9]} {design_1_i/axis_data_fifo_0/s_axis_tdata[10]} {design_1_i/axis_data_fifo_0/s_axis_tdata[11]} {design_1_i/axis_data_fifo_0/s_axis_tdata[12]} {design_1_i/axis_data_fifo_0/s_axis_tdata[13]} {design_1_i/axis_data_fifo_0/s_axis_tdata[14]} {design_1_i/axis_data_fifo_0/s_axis_tdata[15]} {design_1_i/axis_data_fifo_0/s_axis_tdata[16]} {design_1_i/axis_data_fifo_0/s_axis_tdata[17]} {design_1_i/axis_data_fifo_0/s_axis_tdata[18]} {design_1_i/axis_data_fifo_0/s_axis_tdata[19]} {design_1_i/axis_data_fifo_0/s_axis_tdata[20]} {design_1_i/axis_data_fifo_0/s_axis_tdata[21]} {design_1_i/axis_data_fifo_0/s_axis_tdata[22]} {design_1_i/axis_data_fifo_0/s_axis_tdata[23]} {design_1_i/axis_data_fifo_0/s_axis_tdata[24]} {design_1_i/axis_data_fifo_0/s_axis_tdata[25]} {design_1_i/axis_data_fifo_0/s_axis_tdata[26]} {design_1_i/axis_data_fifo_0/s_axis_tdata[27]} {design_1_i/axis_data_fifo_0/s_axis_tdata[28]} {design_1_i/axis_data_fifo_0/s_axis_tdata[29]} {design_1_i/axis_data_fifo_0/s_axis_tdata[30]} {design_1_i/axis_data_fifo_0/s_axis_tdata[31]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe2]
set_property port_width 32 [get_debug_ports u_ila_0/probe2]
connect_debug_port u_ila_0/probe2 [get_nets [list {design_1_i/axis_data_fifo_0/m_axis_tdata[0]} {design_1_i/axis_data_fifo_0/m_axis_tdata[1]} {design_1_i/axis_data_fifo_0/m_axis_tdata[2]} {design_1_i/axis_data_fifo_0/m_axis_tdata[3]} {design_1_i/axis_data_fifo_0/m_axis_tdata[4]} {design_1_i/axis_data_fifo_0/m_axis_tdata[5]} {design_1_i/axis_data_fifo_0/m_axis_tdata[6]} {design_1_i/axis_data_fifo_0/m_axis_tdata[7]} {design_1_i/axis_data_fifo_0/m_axis_tdata[8]} {design_1_i/axis_data_fifo_0/m_axis_tdata[9]} {design_1_i/axis_data_fifo_0/m_axis_tdata[10]} {design_1_i/axis_data_fifo_0/m_axis_tdata[11]} {design_1_i/axis_data_fifo_0/m_axis_tdata[12]} {design_1_i/axis_data_fifo_0/m_axis_tdata[13]} {design_1_i/axis_data_fifo_0/m_axis_tdata[14]} {design_1_i/axis_data_fifo_0/m_axis_tdata[15]} {design_1_i/axis_data_fifo_0/m_axis_tdata[16]} {design_1_i/axis_data_fifo_0/m_axis_tdata[17]} {design_1_i/axis_data_fifo_0/m_axis_tdata[18]} {design_1_i/axis_data_fifo_0/m_axis_tdata[19]} {design_1_i/axis_data_fifo_0/m_axis_tdata[20]} {design_1_i/axis_data_fifo_0/m_axis_tdata[21]} {design_1_i/axis_data_fifo_0/m_axis_tdata[22]} {design_1_i/axis_data_fifo_0/m_axis_tdata[23]} {design_1_i/axis_data_fifo_0/m_axis_tdata[24]} {design_1_i/axis_data_fifo_0/m_axis_tdata[25]} {design_1_i/axis_data_fifo_0/m_axis_tdata[26]} {design_1_i/axis_data_fifo_0/m_axis_tdata[27]} {design_1_i/axis_data_fifo_0/m_axis_tdata[28]} {design_1_i/axis_data_fifo_0/m_axis_tdata[29]} {design_1_i/axis_data_fifo_0/m_axis_tdata[30]} {design_1_i/axis_data_fifo_0/m_axis_tdata[31]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe3]
set_property port_width 11 [get_debug_ports u_ila_0/probe3]
connect_debug_port u_ila_0/probe3 [get_nets [list {design_1_i/axis_data_fifo_0/axis_wr_data_count[0]} {design_1_i/axis_data_fifo_0/axis_wr_data_count[1]} {design_1_i/axis_data_fifo_0/axis_wr_data_count[2]} {design_1_i/axis_data_fifo_0/axis_wr_data_count[3]} {design_1_i/axis_data_fifo_0/axis_wr_data_count[4]} {design_1_i/axis_data_fifo_0/axis_wr_data_count[5]} {design_1_i/axis_data_fifo_0/axis_wr_data_count[6]} {design_1_i/axis_data_fifo_0/axis_wr_data_count[7]} {design_1_i/axis_data_fifo_0/axis_wr_data_count[8]} {design_1_i/axis_data_fifo_0/axis_wr_data_count[9]} {design_1_i/axis_data_fifo_0/axis_wr_data_count[10]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe4]
set_property port_width 32 [get_debug_ports u_ila_0/probe4]
connect_debug_port u_ila_0/probe4 [get_nets [list {design_1_i/axi_dma_0/m_axi_s2mm_awaddr[0]} {design_1_i/axi_dma_0/m_axi_s2mm_awaddr[1]} {design_1_i/axi_dma_0/m_axi_s2mm_awaddr[2]} {design_1_i/axi_dma_0/m_axi_s2mm_awaddr[3]} {design_1_i/axi_dma_0/m_axi_s2mm_awaddr[4]} {design_1_i/axi_dma_0/m_axi_s2mm_awaddr[5]} {design_1_i/axi_dma_0/m_axi_s2mm_awaddr[6]} {design_1_i/axi_dma_0/m_axi_s2mm_awaddr[7]} {design_1_i/axi_dma_0/m_axi_s2mm_awaddr[8]} {design_1_i/axi_dma_0/m_axi_s2mm_awaddr[9]} {design_1_i/axi_dma_0/m_axi_s2mm_awaddr[10]} {design_1_i/axi_dma_0/m_axi_s2mm_awaddr[11]} {design_1_i/axi_dma_0/m_axi_s2mm_awaddr[12]} {design_1_i/axi_dma_0/m_axi_s2mm_awaddr[13]} {design_1_i/axi_dma_0/m_axi_s2mm_awaddr[14]} {design_1_i/axi_dma_0/m_axi_s2mm_awaddr[15]} {design_1_i/axi_dma_0/m_axi_s2mm_awaddr[16]} {design_1_i/axi_dma_0/m_axi_s2mm_awaddr[17]} {design_1_i/axi_dma_0/m_axi_s2mm_awaddr[18]} {design_1_i/axi_dma_0/m_axi_s2mm_awaddr[19]} {design_1_i/axi_dma_0/m_axi_s2mm_awaddr[20]} {design_1_i/axi_dma_0/m_axi_s2mm_awaddr[21]} {design_1_i/axi_dma_0/m_axi_s2mm_awaddr[22]} {design_1_i/axi_dma_0/m_axi_s2mm_awaddr[23]} {design_1_i/axi_dma_0/m_axi_s2mm_awaddr[24]} {design_1_i/axi_dma_0/m_axi_s2mm_awaddr[25]} {design_1_i/axi_dma_0/m_axi_s2mm_awaddr[26]} {design_1_i/axi_dma_0/m_axi_s2mm_awaddr[27]} {design_1_i/axi_dma_0/m_axi_s2mm_awaddr[28]} {design_1_i/axi_dma_0/m_axi_s2mm_awaddr[29]} {design_1_i/axi_dma_0/m_axi_s2mm_awaddr[30]} {design_1_i/axi_dma_0/m_axi_s2mm_awaddr[31]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe5]
set_property port_width 32 [get_debug_ports u_ila_0/probe5]
connect_debug_port u_ila_0/probe5 [get_nets [list {design_1_i/axi_dma_0/m_axi_mm2s_araddr[0]} {design_1_i/axi_dma_0/m_axi_mm2s_araddr[1]} {design_1_i/axi_dma_0/m_axi_mm2s_araddr[2]} {design_1_i/axi_dma_0/m_axi_mm2s_araddr[3]} {design_1_i/axi_dma_0/m_axi_mm2s_araddr[4]} {design_1_i/axi_dma_0/m_axi_mm2s_araddr[5]} {design_1_i/axi_dma_0/m_axi_mm2s_araddr[6]} {design_1_i/axi_dma_0/m_axi_mm2s_araddr[7]} {design_1_i/axi_dma_0/m_axi_mm2s_araddr[8]} {design_1_i/axi_dma_0/m_axi_mm2s_araddr[9]} {design_1_i/axi_dma_0/m_axi_mm2s_araddr[10]} {design_1_i/axi_dma_0/m_axi_mm2s_araddr[11]} {design_1_i/axi_dma_0/m_axi_mm2s_araddr[12]} {design_1_i/axi_dma_0/m_axi_mm2s_araddr[13]} {design_1_i/axi_dma_0/m_axi_mm2s_araddr[14]} {design_1_i/axi_dma_0/m_axi_mm2s_araddr[15]} {design_1_i/axi_dma_0/m_axi_mm2s_araddr[16]} {design_1_i/axi_dma_0/m_axi_mm2s_araddr[17]} {design_1_i/axi_dma_0/m_axi_mm2s_araddr[18]} {design_1_i/axi_dma_0/m_axi_mm2s_araddr[19]} {design_1_i/axi_dma_0/m_axi_mm2s_araddr[20]} {design_1_i/axi_dma_0/m_axi_mm2s_araddr[21]} {design_1_i/axi_dma_0/m_axi_mm2s_araddr[22]} {design_1_i/axi_dma_0/m_axi_mm2s_araddr[23]} {design_1_i/axi_dma_0/m_axi_mm2s_araddr[24]} {design_1_i/axi_dma_0/m_axi_mm2s_araddr[25]} {design_1_i/axi_dma_0/m_axi_mm2s_araddr[26]} {design_1_i/axi_dma_0/m_axi_mm2s_araddr[27]} {design_1_i/axi_dma_0/m_axi_mm2s_araddr[28]} {design_1_i/axi_dma_0/m_axi_mm2s_araddr[29]} {design_1_i/axi_dma_0/m_axi_mm2s_araddr[30]} {design_1_i/axi_dma_0/m_axi_mm2s_araddr[31]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe6]
set_property port_width 32 [get_debug_ports u_ila_0/probe6]
connect_debug_port u_ila_0/probe6 [get_nets [list {design_1_i/axi_dma_0/m_axi_mm2s_rdata[0]} {design_1_i/axi_dma_0/m_axi_mm2s_rdata[1]} {design_1_i/axi_dma_0/m_axi_mm2s_rdata[2]} {design_1_i/axi_dma_0/m_axi_mm2s_rdata[3]} {design_1_i/axi_dma_0/m_axi_mm2s_rdata[4]} {design_1_i/axi_dma_0/m_axi_mm2s_rdata[5]} {design_1_i/axi_dma_0/m_axi_mm2s_rdata[6]} {design_1_i/axi_dma_0/m_axi_mm2s_rdata[7]} {design_1_i/axi_dma_0/m_axi_mm2s_rdata[8]} {design_1_i/axi_dma_0/m_axi_mm2s_rdata[9]} {design_1_i/axi_dma_0/m_axi_mm2s_rdata[10]} {design_1_i/axi_dma_0/m_axi_mm2s_rdata[11]} {design_1_i/axi_dma_0/m_axi_mm2s_rdata[12]} {design_1_i/axi_dma_0/m_axi_mm2s_rdata[13]} {design_1_i/axi_dma_0/m_axi_mm2s_rdata[14]} {design_1_i/axi_dma_0/m_axi_mm2s_rdata[15]} {design_1_i/axi_dma_0/m_axi_mm2s_rdata[16]} {design_1_i/axi_dma_0/m_axi_mm2s_rdata[17]} {design_1_i/axi_dma_0/m_axi_mm2s_rdata[18]} {design_1_i/axi_dma_0/m_axi_mm2s_rdata[19]} {design_1_i/axi_dma_0/m_axi_mm2s_rdata[20]} {design_1_i/axi_dma_0/m_axi_mm2s_rdata[21]} {design_1_i/axi_dma_0/m_axi_mm2s_rdata[22]} {design_1_i/axi_dma_0/m_axi_mm2s_rdata[23]} {design_1_i/axi_dma_0/m_axi_mm2s_rdata[24]} {design_1_i/axi_dma_0/m_axi_mm2s_rdata[25]} {design_1_i/axi_dma_0/m_axi_mm2s_rdata[26]} {design_1_i/axi_dma_0/m_axi_mm2s_rdata[27]} {design_1_i/axi_dma_0/m_axi_mm2s_rdata[28]} {design_1_i/axi_dma_0/m_axi_mm2s_rdata[29]} {design_1_i/axi_dma_0/m_axi_mm2s_rdata[30]} {design_1_i/axi_dma_0/m_axi_mm2s_rdata[31]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe7]
set_property port_width 32 [get_debug_ports u_ila_0/probe7]
connect_debug_port u_ila_0/probe7 [get_nets [list {design_1_i/axi_dma_0/m_axi_s2mm_wdata[0]} {design_1_i/axi_dma_0/m_axi_s2mm_wdata[1]} {design_1_i/axi_dma_0/m_axi_s2mm_wdata[2]} {design_1_i/axi_dma_0/m_axi_s2mm_wdata[3]} {design_1_i/axi_dma_0/m_axi_s2mm_wdata[4]} {design_1_i/axi_dma_0/m_axi_s2mm_wdata[5]} {design_1_i/axi_dma_0/m_axi_s2mm_wdata[6]} {design_1_i/axi_dma_0/m_axi_s2mm_wdata[7]} {design_1_i/axi_dma_0/m_axi_s2mm_wdata[8]} {design_1_i/axi_dma_0/m_axi_s2mm_wdata[9]} {design_1_i/axi_dma_0/m_axi_s2mm_wdata[10]} {design_1_i/axi_dma_0/m_axi_s2mm_wdata[11]} {design_1_i/axi_dma_0/m_axi_s2mm_wdata[12]} {design_1_i/axi_dma_0/m_axi_s2mm_wdata[13]} {design_1_i/axi_dma_0/m_axi_s2mm_wdata[14]} {design_1_i/axi_dma_0/m_axi_s2mm_wdata[15]} {design_1_i/axi_dma_0/m_axi_s2mm_wdata[16]} {design_1_i/axi_dma_0/m_axi_s2mm_wdata[17]} {design_1_i/axi_dma_0/m_axi_s2mm_wdata[18]} {design_1_i/axi_dma_0/m_axi_s2mm_wdata[19]} {design_1_i/axi_dma_0/m_axi_s2mm_wdata[20]} {design_1_i/axi_dma_0/m_axi_s2mm_wdata[21]} {design_1_i/axi_dma_0/m_axi_s2mm_wdata[22]} {design_1_i/axi_dma_0/m_axi_s2mm_wdata[23]} {design_1_i/axi_dma_0/m_axi_s2mm_wdata[24]} {design_1_i/axi_dma_0/m_axi_s2mm_wdata[25]} {design_1_i/axi_dma_0/m_axi_s2mm_wdata[26]} {design_1_i/axi_dma_0/m_axi_s2mm_wdata[27]} {design_1_i/axi_dma_0/m_axi_s2mm_wdata[28]} {design_1_i/axi_dma_0/m_axi_s2mm_wdata[29]} {design_1_i/axi_dma_0/m_axi_s2mm_wdata[30]} {design_1_i/axi_dma_0/m_axi_s2mm_wdata[31]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe8]
set_property port_width 1 [get_debug_ports u_ila_0/probe8]
connect_debug_port u_ila_0/probe8 [get_nets [list design_1_i/axi_dma_0_mm2s_introut]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe9]
set_property port_width 1 [get_debug_ports u_ila_0/probe9]
connect_debug_port u_ila_0/probe9 [get_nets [list design_1_i/axi_dma_0_s2mm_introut]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe10]
set_property port_width 1 [get_debug_ports u_ila_0/probe10]
connect_debug_port u_ila_0/probe10 [get_nets [list design_1_i/axi_dma_0/m_axi_mm2s_rlast]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe11]
set_property port_width 1 [get_debug_ports u_ila_0/probe11]
connect_debug_port u_ila_0/probe11 [get_nets [list design_1_i/axi_dma_0/m_axi_mm2s_rready]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe12]
set_property port_width 1 [get_debug_ports u_ila_0/probe12]
connect_debug_port u_ila_0/probe12 [get_nets [list design_1_i/axi_dma_0/m_axi_mm2s_rvalid]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe13]
set_property port_width 1 [get_debug_ports u_ila_0/probe13]
connect_debug_port u_ila_0/probe13 [get_nets [list design_1_i/axi_dma_0/m_axi_s2mm_wlast]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe14]
set_property port_width 1 [get_debug_ports u_ila_0/probe14]
connect_debug_port u_ila_0/probe14 [get_nets [list design_1_i/axi_dma_0/m_axi_s2mm_wready]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe15]
set_property port_width 1 [get_debug_ports u_ila_0/probe15]
connect_debug_port u_ila_0/probe15 [get_nets [list design_1_i/axi_dma_0/m_axi_s2mm_wvalid]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe16]
set_property port_width 1 [get_debug_ports u_ila_0/probe16]
connect_debug_port u_ila_0/probe16 [get_nets [list design_1_i/axis_data_fifo_0/m_axis_tlast]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe17]
set_property port_width 1 [get_debug_ports u_ila_0/probe17]
connect_debug_port u_ila_0/probe17 [get_nets [list design_1_i/axis_data_fifo_0/m_axis_tready]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe18]
set_property port_width 1 [get_debug_ports u_ila_0/probe18]
connect_debug_port u_ila_0/probe18 [get_nets [list design_1_i/axis_data_fifo_0/m_axis_tvalid]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe19]
set_property port_width 1 [get_debug_ports u_ila_0/probe19]
connect_debug_port u_ila_0/probe19 [get_nets [list design_1_i/axis_data_fifo_0/s_axis_tlast]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe20]
set_property port_width 1 [get_debug_ports u_ila_0/probe20]
connect_debug_port u_ila_0/probe20 [get_nets [list design_1_i/axis_data_fifo_0/s_axis_tready]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe21]
set_property port_width 1 [get_debug_ports u_ila_0/probe21]
connect_debug_port u_ila_0/probe21 [get_nets [list design_1_i/axis_data_fifo_0/s_axis_tvalid]]
set_property C_CLK_INPUT_FREQ_HZ 300000000 [get_debug_cores dbg_hub]
set_property C_ENABLE_CLK_DIVIDER false [get_debug_cores dbg_hub]
set_property C_USER_SCAN_CHAIN 1 [get_debug_cores dbg_hub]
connect_debug_port dbg_hub/clk [get_nets u_ila_0_FCLK_CLK0]
