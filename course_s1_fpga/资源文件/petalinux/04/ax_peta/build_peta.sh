#!/bin/sh

csplit project-spec/configs/config '/CONFIG_TMP_DIR_LOCATION/'
mv xx00 project-spec/configs/config
echo CONFIG_TMP_DIR_LOCATION=\"${PWD}/build/tmp\" >> project-spec/configs/config
sed '/CONFIG_TMP_DIR_LOCATION/d' xx01 >> project-spec/configs/config
rm -rf xx01

source /opt/pkg/petalinux/settings.sh
source /opt/Xilinx/Vivado/2017.4/settings64.sh



petalinux-config --get-hw-description ./hdf

petalinux-build

petalinux-package --boot --fsbl ./images/linux/zynq_fsbl.elf  --fpga --u-boot --kernel --force

