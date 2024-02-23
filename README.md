# Xilinx Zynq 7000 Series Development Board AX7015B
## Development board introduction
### Development board introduction
AC7015B (core board model, the same below) core board, ZYNQ chip is based on the ZYNQ7000 series of XILINX Company
XC7Z015-2CLG485I. The PS system of the ZYNQ chip integrates two ARM Cortex™-A9 processors.
AMBA® interconnect, internal memory, external memory interfaces and peripherals. The FPGA of the ZYNQ chip contains rich
Programmable logic unit, DSP and internal RAM.
This core board uses 2 pieces of SK Hynix's H5TQ4G63AFR-PBI DDR3 chips.
The capacity of DDR is 4Gbit; 2 DDR chips are combined into a 32bit data bus width, between ZYNQ and DDR3
The read and write data clock frequency is as high as 533Mhz; this configuration can meet the high-bandwidth data processing needs of the system.
In order to connect to the backplane, the four board-to-board connectors of this core board extend the USB interface on the PS side, Gigabit and above.
Ethernet interface, SD card interface and other remaining MIO ports; it also extends ZYNQ's 4 pairs of high-speed transceiver GTP interfaces;
And almost all IO ports (84) of BANK13, BAN34 and BANK35 on the PL side, among which the IO ports of BANK35
The level can be modified by replacing the LDO chip on the core board to meet the user's requirement of not using a level interface. for need
For users with a lot of IO, this core board will be a good choice. And the IO connection part, the wiring between the ZYNQ chip and the interface
Equal length and differential processing have been performed, and the core board size is only 60*60 (mm), which is very suitable for secondary development.
### Key Features
1. Zynq7000 series chip, model number is XC7Z015-2CLG485I. The chip's PS system integrates two ARM Cortex™-A9 processors
2. Two DDR3 SDRAM chips from SK Hynix (1GB in total), model H5TQ4G63AFR-PBI (compatible with Micron’s MT41J256M16RE-125). The total bus width of DDR3 SDRAM is 32bit.
3. A 256MBit Quad-SPI FLASH chip, model W25Q256FVEI, which uses the 3.3V CMOS voltage standard.
4. A large-capacity 8GB eMMC FLASH chip, model MTFC4GACAAAM-1M, which supports the JEDEC e-MMC V5.0 standard HS-MMC interface, and the level supports 1.8V or 3.3V.
5. The core board is equipped with a Uart to USB interface, and the conversion chip uses the USB-UAR chip of Silicon Labs CP1502GM.
6. There are 4 red LED lights on the core board, 1 of which is the power indicator light (PWR), 1 is the configuration LED light (DONE), and 2 are user LED lights (LED1~LED2).
7. There is a reset button RESET and circuit on the core board, and the reset signal is connected to the PS reset pin of the ZYNQ chip
8. 2 Gigabit Ethernet interfaces, of which 1 Ethernet interface is connected to the PS system side, and the other 1 Ethernet interface is connected to the logical IO port of the PL.
9. 4 USB2.0 HOST interfaces. The USB2.0 transceiver uses a 1.8V, high-speed USB3320C-EZK chip that supports ULPI standard interface, and then extends 4 USB HOST interfaces through a USB HUB chip USB2514.
10. The HDMI output interface is implemented using Silion Image's SIL9134 HDMI (DVI) encoding chip, which supports up to 1080P@60Hz output and 3D output.
11. For the HDMI input interface, we use the SIL9013 HDMI decoding chip from Silion Image Company, which supports up to 1080P@60Hz input and supports data output in different formats.
12. 2-way optical fiber interface, users can purchase optical modules (1.25G, 2.5G optical modules on the market) and insert them into these 2 optical fiber interfaces for optical fiber data communication.
13. An industrial-grade high-speed data transmission PCIe x2 interface
14. A Micro SD card interface
15. 6 red LED lights, 1 of which is power indicator light (PWR) and 5 of which are user LED lights.
16. There are 2 user buttons PS KEY and PL KEY. PS KEY is connected to the MIO pin of the ZYNQ chip PS, and PL KEY is connected to the IO pin of the ZYNQ chip PL.
17. The power input voltage is DC12V

# AX7015, AX7015B document tutorial link

 Note: You can switch between Chinese and English languages at the footer at the end of the document

# AX7015B routine
## Routine description
This project is the factory routine of the development board and supports most peripherals on the board.
## Development environment and requirements
* Vivado 2023.1
* AX7015B development board
## Create Vivado project
* Download the latest ZIP package.
* Create a new project folder.
* Unzip the downloaded ZIP package into this project folder.


There are two ways to create a Vivado project, as follows:
### Use Vivado tcl console to create a Vivado project
1. Open the Vivado software and use the **cd** command to enter the "**auto_create_project**" directory and press Enter
```
cd \<archive extracted location\>/vivado/auto_create_project
```
2. Enter **source ./create_project.tcl** and press Enter
```
source ./create_project.tcl
```

### Use bat to create a Vivado project
1. In the "**auto_create_project**" folder, there is a "**create_project.bat**" file, right-click to open it in edit mode, and modify the vivado path to the vivado installation path of this host, save and close.
```
CALL E:\XilinxVitis\Vivado\2023.1\bin\vivado.bat -mode batch -source create_project.tcl
PAUSE
```
2. Double-click the bat file under Windows.


For more information, please visit [ALINX website](https://www.alinx.com)