PL按键中断实验
================

**实验VIvado工程为“ps_axi_key”。**

前面的定时器中断实验的中断属于PS内部的中断，本实验中断来自PL，PS最大可以接收16个来自PL的中断信号，都是上升沿或高电平触发。本实验用按键中断来控制LED。

.. image:: images/11_media/image1.png
      
Vivado工程建立
--------------

1) 本实验所用的Vivado工程只需要在“ps_axi_led”这个工程上添加用于按键输入的AXI GPIO就可以，点击菜单“File -> Save Project As...”

.. image:: images/11_media/image2.png
      
2) 新的工程名为“ps_axi_key”

.. image:: images/11_media/image3.png
      
3) 添加一个AXI GPIO

.. image:: images/11_media/image4.png
      
4) 配置GPIO参数，都为输入，宽度为1，使能中断

.. image:: images/11_media/image5.png
      
5) 使用自动连接

.. image:: images/11_media/image6.png
      
6) 再把端口名称改为keys

.. image:: images/11_media/image7.png
      
7) 配置ZYNQ处理器的中断，勾选IRQ_F2P

.. image:: images/11_media/image8.png
      
8) 连接ip2intc_irpt到IRQ_F2Q

.. image:: images/11_media/image9.png
      
9) 修改xdc约束文件

::

 set_property IOSTANDARD LVCMOS33 [get_ports {leds_tri_o[0]}]
 set_property IOSTANDARD LVCMOS33 [get_ports {leds_tri_o[1]}]
 set_property IOSTANDARD LVCMOS33 [get_ports {leds_tri_o[2]}]
 set_property IOSTANDARD LVCMOS33 [get_ports {leds_tri_o[3]}]
 set_property PACKAGE_PIN A5 [get_ports {leds_tri_o[0]}]
 set_property PACKAGE_PIN A7 [get_ports {leds_tri_o[1]}]
 set_property PACKAGE_PIN A6 [get_ports {leds_tri_o[2]}]
 set_property PACKAGE_PIN B8 [get_ports {leds_tri_o[3]}]
 set_property IOSTANDARD LVCMOS33 [get_ports {keys_tri_i[0]}]
 set_property PACKAGE_PIN AB12 [get_ports {keys_tri_i[0]}]

.. image:: images/11_media/image10.png
      
1)  保存设计，编译生成bit文件

下载调试
--------

1) 点击FileLaunch Vitis进入Vitis

.. image:: images/11_media/image11.png
      
1) 新建platform工程过程不再赘述，参考“PS点亮PL的LED灯” 一章

.. image:: images/11_media/image12.png
      
3) 和前面的教程一样，在不熟悉Vitis程序编写的情况下，我们尽量使用Vitis自带例程来修改

.. image:: images/11_media/image13.png
      
4) 选择“xgpio_intr_tapp_example”

.. image:: images/11_media/image14.png
      
5) 导入例程以后有未定义的错误，我们需要修改部分代码

.. image:: images/11_media/image15.png
      
6) 按下图修改GPIO和中断号的宏定义

.. image:: images/11_media/image16.png
      
7) 修改测试延时时间，让我们有足够的时间去按按键

.. image:: images/11_media/image17.png
      
8) 打开串口终端，运行程序

.. image:: images/11_media/image18.png
      
9) 如果一直不按按键，串口显示“No button pressed.”，如果按下“PL_KEY”显示“Successfully ran Gpio Interrupt Tapp Example”。

.. image:: images/11_media/image19.png
      
实验总结
--------

PL端可以给PS发送中断信号，这提高了PL和PS数据交互的效率，在需要大数量、低延时的应用中需要用到中断处理。
