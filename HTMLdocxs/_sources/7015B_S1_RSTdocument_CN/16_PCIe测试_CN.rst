PCIe测试
==========

**实验VIvado工程为“PCIe_test”。**

本实验使用Xilinx提供的PCIe XDMA来完成一个简单的PCIe，读写实验，来测试PCIe的速度。PCIe 2.0，每个lane的速度是5Gbit/s，由于编码、协议等开销，可用带宽可以达到80%。

开发板提供Windows 7 64位和Windows 10 64位驱动程序，已经驱动程序的源代码，驱动程序使用VS2015开发，开发板也提供了Linux版本的驱动源码和测试程序。

为了在Windows下更直观的测试，芯驿电子使用QT开发了一些带界面的测试程序，方便测试。

Vivado工程建立
--------------

1) 新建一个名为PCIe_test的Vivado工程

.. image:: images/16_media/image1.png
      
2) 新建一个Block设计

.. image:: images/16_media/image2.png
      
3) 添加ZYNQ处理器

.. image:: images/16_media/image3.png
      
4) 配置ZYNQ参数，PS-PL配置，取消M AXI GP0 端口，使能S AXI HP0接口

.. image:: images/16_media/image4.png
      
5) 配置MIO，BNAK 0电平为LVCMOS 3.3V， Bnak1电平为LVCMOS 1.8V，使能QPSI，这样才能固化程序，PCIe才能正常使用。

.. image:: images/16_media/image5.png
      
6) 为了调试方便，使能UART1

.. image:: images/16_media/image6.png
      
7) ddr3配置，ddr3选择MT41256M16 RE-125

.. image:: images/16_media/image7.png
      
8) 添加PCIe DMA子系统

.. image:: images/16_media/image8.png
      
9) 配置PCIe xdma参数，Lane宽度选择X2，速率选择5.0 GT/s，其他参数都保持默认。

.. image:: images/16_media/image9.png
      
10) 添加PCIe 差分参考时钟缓冲

.. image:: images/16_media/image10.png
      
11) 配置为收发器时钟差分缓冲

.. image:: images/16_media/image11.png
      
12) 连接PCIe参考时钟

.. image:: images/16_media/image12.png
      
13) 运行自动连接

.. image:: images/16_media/image13.png
      
14) 选择所有自动连接

.. image:: images/16_media/image14.png
      
15) 运行Block自动化

.. image:: images/16_media/image15.png
      
16) 修改端口名称

.. image:: images/16_media/image16.png
      
17) 保存设计，按F6 检查设计

18) 创建HDL文件

.. image:: images/16_media/image17.png
      
19) 由于PCIe约束比较特殊，xdma IP会自动生成一个IP，需要运行Generate Output Products后才能查看

.. image:: images/16_media/image18.png
      
20) 在IP Sources页搜索xdc文件，可以找到一个关于PCIe管脚约束的文件，这个文件约束的和开发板设计不符合，我们需要修改，但是这个文件是只读的，这里先禁用这个文件，然后自己写xdc文件代替这个。

.. image:: images/16_media/image19.png
      
21) 禁用自动生成的xdc约束

.. image:: images/16_media/image20.png
      
22) 添加xdc约束

.. image:: images/16_media/image21.png
      
23) 修改xdc文件内容，详细文件可以参考例程提供的Vivado工程，xdc文件使用是TCL教程语言，不熟悉TCL可以去找相关资料学习一下。

.. image:: images/16_media/image22.png
      
24) 编译生成bit文件

生成烧写BOOT
------------

1) 导出硬件，运行Vitis

2) 新建名为fsbl的APP，模板选择Zynq FSBL

3) 生成BOOT.bin

.. image:: images/16_media/image23.png
            
4) 烧写BOOT.bin到QSPI flash，PCIe对启动时间有严格要求，使用QSPI启动比SD卡启动要快。

.. image:: images/16_media/image24.png
            
5) 烧写完成以后设置开发板启动模式为QSPI，插入计算机PCIe插槽（断电操作），这时开发板不需要外部电源适配器供电，由电脑主板供电。

设置电脑进入测试模式
--------------------

由于PCIe驱动程序没有经过微软数字签名，所以只能用于测试，需要将系统设置到测试模式，设置的详细方法参考MSDN文档\ https://msdn.microsoft.com/en-us/windows/hardware/drivers/install/the-testsigning-boot-configuration-option

1) 使用管理员身份运行cmd

.. image:: images/16_media/image25.png
      
2) 输入命令Bcdedit.exe -set TESTSIGNING ON 打开测试模式

.. image:: images/16_media/image26.png
      
3) 重启电脑后桌面显示正在运行测试模式

.. image:: images/16_media/image27.png
      
安装PCIe驱动
------------

PCIe驱动和上位机测试文件都位于“course_s1/资源文件/PCIe”

1) 没有安装驱动时，设备管理器如下，发现一个PCI串行端口

.. image:: images/16_media/image28.png
      
2) 例程提供的编译好的驱动程序

.. image:: images/16_media/image29.png
      
3) 选择设备，右键更新驱动

.. image:: images/16_media/image30.png
      
4) 浏览计算机以查找驱动程序软件

.. image:: images/16_media/image31.png
      
5) 测试电脑安装的是win7，这里使用Win7_Release版本

.. image:: images/16_media/image32.png
      
6) 有个安全警告，选择安装

.. image:: images/16_media/image33.png
      
7) 正确安装了设备驱动

.. image:: images/16_media/image34.png
      
测试PCIe
--------

1) xilinx提供了一些测试程序，不过都是命令行的程序

.. image:: images/16_media/image35.png
      
2) 芯驿电子开发了一些有界面的应用，使用pciespeed.exe来测试一下PCIe读写速率，这个读写测试会把数据写入ZYNQ的ddr然后再读取出来。

3) 读写同时进行测试

.. image:: images/16_media/image36.png
      
4) 只读测试

.. image:: images/16_media/image37.png
      
5) 只写测试

.. image:: images/16_media/image38.png
      
实验总结
--------

本实验主要是掌握PCIe硬件工程的建立，初步体验PCIe读写速度，在后续的实验中我们会做一些更加实用的功能。上位机软件使用QT开发，如果需要自己修改编译，请先学习如何使用QT。
