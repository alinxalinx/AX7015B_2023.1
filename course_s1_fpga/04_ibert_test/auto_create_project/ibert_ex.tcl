#////////////////////////////////////////////////////////////////////////////////
#  project：I2C interface EEPROM experiment                                    //
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

#设置项目名称和工作目录
set projname "ibert"
set projname2 "ibert_ex"
set Topname "example_ibert"
set tclpath [pwd]
cd ..
set projpath [pwd]
#创建工程
#**********************************************************************************************************
create_project -force $projname $projpath/$projname -part xc7z015clg485-2
# Create 'sources_1' fileset (if not found)
if {[string equal [get_filesets -quiet sources_1] ""]} {
  create_fileset -srcset sources_1
}
file mkdir $projpath/$projname/$projname.srcs/sources_1/ip
file mkdir $projpath/$projname/$projname.srcs/sources_1/new
file mkdir $projpath/$projname/$projname.srcs/sources_1/bd
# Create 'constrs_1' fileset (if not found)
if {[string equal [get_filesets -quiet constrs_1] ""]} {
  create_fileset -constrset constrs_1
}
file mkdir $projpath/$projname/$projname.srcs/constrs_1/new
# Create 'sim_1' fileset (if not found)
if {[string equal [get_filesets -quiet sim_1] ""]} {
  create_fileset -simset sim_1
}
file mkdir $projpath/$projname/$projname.srcs/sim_1/new
#添加IP
create_ip -name ibert_7series_gtp -vendor xilinx.com -library ip -version 3.0 -module_name ibert
set_property -dict [list \
  CONFIG.C_CHANNEL_QUAD_0 {Channel_0} \
  CONFIG.C_CHANNEL_QUAD_1 {Channel_0} \
  CONFIG.C_CHANNEL_QUAD_2 {Channel_0} \
  CONFIG.C_CHANNEL_QUAD_3 {Channel_0} \
  CONFIG.C_PROTOCOL_MAXLINERATE_1 {6.25} \
  CONFIG.C_PROTOCOL_MAXLINERATE_2 {3.125} \
  CONFIG.C_PROTOCOL_MAXLINERATE_3 {3.125} \
  CONFIG.C_PROTOCOL_QUAD0 {Custom_1_/_6.25_Gbps} \
  CONFIG.C_PROTOCOL_QUAD1 {None} \
  CONFIG.C_PROTOCOL_QUAD2 {None} \
  CONFIG.C_PROTOCOL_QUAD3 {None} \
  CONFIG.C_PROTOCOL_RXREFCLK_FREQUENCY_1 {125.000} \
  CONFIG.C_REFCLK_SOURCE_QUAD_0 {MGTREFCLK1_112} \
  CONFIG.C_REFCLK_SOURCE_QUAD_1 {None} \
  CONFIG.C_REFCLK_SOURCE_QUAD_2 {None} \
  CONFIG.C_REFCLK_SOURCE_QUAD_3 {None} \
  CONFIG.C_RXOUTCLK_FREQUENCY {390.625} \
  CONFIG.C_RXOUTCLK_GT_LOCATION {QUAD_112} \
  CONFIG.C_RXOUTCLK_PIN_STD {DIFF_SSTL15} \
  CONFIG.C_SYSCLK_FREQUENCY {125.000} \
  CONFIG.C_SYSCLK_IO_PIN_LOC_N {UNASSIGNED} \
  CONFIG.C_SYSCLK_IO_PIN_LOC_P {UNASSIGNED} \
  CONFIG.C_SYSCLK_IO_PIN_STD {DIFF_SSTL15} \
  CONFIG.C_SYSCLK_MODE_EXTERNAL {0} \
  CONFIG.C_SYSCLOCK_SOURCE_INT {QUAD112_1} \
] [get_ips ibert]
generate_target {instantiation_template} [get_files c:/Users/Administrator/Desktop/course_s1_fpga/01_led/led.srcs/sources_1/ip/ibert/ibert.xci]

update_compile_order -fileset sources_1
generate_target all [get_files  $projpath/$projname/$projname.srcs/sources_1/ip/ibert/ibert.xci]

export_ip_user_files -of_objects [get_files $projpath/$projname/$projname.srcs/sources_1/ip/ibert/ibert.xci] -no_script -sync -force -quiet
export_simulation -of_objects [get_files $projpath/$projname/$projname.srcs/sources_1/ip/ibert/ibert.xci] -directory $projpath/$projname/$projname.ip_user_files/sim_scripts -ip_user_files_dir $projpath/$projname/$projname.ip_user_files -ipstatic_source_dir $projpath/$projname/$projname.ip_user_files/ipstatic -lib_map_path [list {modelsim=$projpath/$projname/$projname.cache/compile_simlib/modelsim} {questa=$projpath/$projname/$projname.cache/compile_simlib/questa} {riviera=$projpath/$projname/$projname.cache/compile_simlib/riviera} {activehdl=$projpath/$projname/$projname.cache/compile_simlib/activehdl}] -use_ip_compiled_libs -force -quiet
open_example_project -force -dir $projpath [get_ips  ibert]

if {[string equal [get_filesets -quiet constrs_1] ""]} {
  create_fileset -constrset constrs_1
}
file mkdir $projpath/$projname2/$projname2.srcs/constrs_1/new

update_compile_order -fileset sources_1
add_files -force -norecurse -copy_to $projpath/$projname2/imports $tclpath/src/design/example_ibert.v

#添加约束文件
add_files -fileset constrs_1  -copy_to $projpath/$projname2/$projname2.srcs/constrs_1/new -force -quiet [glob -nocomplain $tclpath/src/constraints/*.xdc]
update_compile_order -fileset sources_1
start_gui
#**********************************************************************************************************
launch_runs impl_1 -to_step write_bitstream -jobs 5

