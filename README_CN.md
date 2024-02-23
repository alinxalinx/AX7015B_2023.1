# Xilinx Zynq 7000 系列开发板AX7015B  
## 开发板介绍
### 开发板简介
AC7015B(核心板型号，下同)核心板，ZYNQ 芯片是基于 XILINX 公司的 ZYNQ7000 系列
的 XC7Z015-2CLG485I。ZYNQ 芯片的 PS 系统集成了两个 ARM Cortex™-A9 处理器，
AMBA®互连，内部存储器，外部存储器接口和外设。ZYNQ 芯片的 FPGA 内部含有丰富的
可编程逻辑单元，DSP 和内部 RAM。
这款核心板使用了 2 片 SK Hynix 公司的 H5TQ4G63AFR-PBI 这款 DDR3 芯片，每片
DDR 的容量为 4Gbit；2 片 DDR 芯片组合成 32bit 的数据总线宽度，ZYNQ 和 DDR3 之间
的读写数据时钟频率高达 533Mhz；这样的配置，可以满足系统的高带宽的数据处理的需求。
为了和底板连接，这款核心板的 4 个板对板连接器扩展出了 PS 端的 USB 接口，千兆以
太网接口，SD 卡接口及其它剩余的 MIO 口；也扩展出了 ZYNQ 的 4 对高速收发器 GTP 接口；
以及 PL 端的 BANK13, BAN34 和 BANK35 的几乎所有 IO 口（84 个），其中 BANK35 的 IO
的电平可以通过更换核心板上的 LDO 芯片来修改，满足用户不用电平接口的要求。对于需要
大量 IO 的用户，此核心板将是不错的选择。而且 IO 连接部分，ZYNQ 芯片到接口之间走线
做了等长和差分处理，并且核心板尺寸仅为 60*60（mm），对于二次开发来说，非常适合。
### 关键特性
  1. Zynq7000 系列的芯片，型号为 XC7Z015-2CLG485I。芯片的 PS 系统集成了两个 ARM Cortex™-A9 处理器 
  2. 两片SK Hynix公司的DDR3 SDRAM芯片(共计1GB),型号为 H5TQ4G63AFR-PBI（兼容美光的MT41J256M16RE-125）。DDR3 SDRAM的总线宽度共为32bit。   
  3. 一片 256MBit 大小的 Quad-SPI FLASH 芯片，型号为 W25Q256FVEI，它使用 3.3V CMOS 电压标准。 
  4. 一片大容量的 8GB 大小的 eMMC FLASH 芯片，型号为 MTFC4GACAAAM-1M，它支持 JEDEC e-MMC V5.0 标准的 HS-MMC 接口，电平支持 1.8V 或者 3.3V。   
  5. 核心板配备了一个 Uart 转 USB 接口,转换芯片采用 Silicon Labs CP1502GM 的 USB-UAR 芯片   
  6. 核心板上有 4 个红色 LED 灯，其中 1 个是电源指示灯(PWR)，1 个是配置 LED 灯(DONE)，2 个是用户 LED 灯（LED1~LED2）。 
  7. 核心板上有一个复位按键 RESET 和电路，复位信号连接到 ZYNQ 芯片 PS 复位管脚上
  8. 2 路千兆以太网接口，其中 1 路以太网接口是连接的 PS 系统端，另外 1 路以太网接口是连接到 PL 的逻辑 IO 口上。 
  9. 4个USB2.0 HOST接口，USB2.0收发器采用的是一个1.8V的，高速的支持ULPI标准接口的USB3320C-EZK芯片，再通过一个USB HUB芯片USB2514扩展出4路 USB HOST接口。 
  10. HDMI 输出接口的实现，是选用 Silion Image 公司的 SIL9134 HDMI（DVI）编码芯片，最高支持 1080P@60Hz 输出，支持 3D 输出。  
  11. HDMI 输入接口我们采用了 Silion Image 公司的 SIL9013 HDMI 解码芯片，最高支持 1080P@60Hz 输入，支持不同格式的数据输出。
  12. 2 路光纤接口，用户可以购买光模块(市场上 1.25G，2.5G 光模块）插入到这 2 个光纤接口中进行光纤数据通信。
  13. 一个工业级高速数据传输 PCIe x2 接口 
  14. 一个Micro型的SD卡接口  
  15. 6 个红色 LED 灯，其中 1 个是电源指示灯(PWR)， 5 个是用户 LED灯。  
  16. 2 个用户按键 PS KEY 和 PL KEY，PS KEY 连接到 ZYNQ 芯片 PS 的 MIO 管脚上，PL KEY 连接到 ZYNQ 芯片 PL 的 IO 管脚上。
  17. 电源输入电压为 DC12V

# AX7015、AX7015B 文档教程链接
https://ax7015b-20231-v101.readthedocs.io/zh-cn/latest/7015B_S1_RSTdocument_CN/00_%E5%85%B3%E4%BA%8EALINX_CN.html

 注意：文档的末尾页脚处可以切换中英文语言

# AX7015B 例程
## 例程描述
此项目为开发板出厂例程，支持板卡上的大部分外设。
## 开发环境及需求
* Vivado 2023.1
* AX7015B 开发板
## 创建Vivado工程
* 下载最新的ZIP包。
* 创建新的工程文件夹.
* 解压下载的ZIP包到此工程文件夹中。


有两种方法创建Vivado工程，如下所示：
### 利用Vivado tcl console创建Vivado工程
1. 打开Vivado软件并且利用**cd**命令进入"**auto_create_project**"目录，并回车
```
cd \<archive extracted location\>/vivado/auto_create_project
```
2. 输入 **source ./create_project.tcl** 并且回车
```
source ./create_project.tcl
```

### 利用bat创建Vivado工程
1. 在 "**auto_create_project**" 文件夹, 有个 "**create_project.bat**"文件, 右键以编辑模式打开，并且修改vivado路径为本主机vivado安装路径，保存并关闭。
```
CALL E:\XilinxVitis\Vivado\2023.1\bin\vivado.bat -mode batch -source create_project.tcl
PAUSE
```
2. 在Windows下双击bat文件即可。


更多信息, 请访问[ALINX网站](https://www.alinx.com)