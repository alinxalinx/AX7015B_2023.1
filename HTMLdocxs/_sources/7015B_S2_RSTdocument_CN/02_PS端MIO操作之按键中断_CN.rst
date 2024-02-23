PS端MIO操作之按键中断
=======================

前面向大家介绍了MIO的输出操作，本章介绍输入部分，采用按键中断的方式，实现PS端LED灯的亮灭。

Vivado工程基于PS端MIO操作之点亮LED灯，不需要修改，只要打开Vitis软件即可。在原理图中看到AX7015和AX7021按键位置为MIO 11；AX7020和AX7010为MIO50和MIO51，本实验中采用MIO50。

.. image:: images/02_media/image1.png
      
AX7015、AX7021原理图

|image1|\ |image2|

AX7020/AX7010原理图

中断介绍
--------

翻开UG585中断部分，Zynq中断大致可分为三个部分，1为SGI，软件生成的中断，共16个端口；2为PPI，CPU私有外设中断，有5个；3为SPI，共享外设中断，来自于44个PS端的IO外设以及16个PL端的中断。中间部分为GIC，也即中断控制器，用于对中断进行使能、关闭、掩码、设置优先等。

.. image:: images/02_media/image4.png
      
以下为中断控制器框图，主要的控制器部分为ICC和ICD，ICD连接SGI和PPI，ICD连接SPI，可配置两者的寄存器来控制中断。

.. image:: images/02_media/image5.png
      
SGI中断（软件产生中断），共16个IRQ ID号

.. image:: images/02_media/image6.png
      
PPI中断，CPU私有中断，共5个IRQ ID号

.. image:: images/02_media/image7.png
      
.. image:: images/02_media/image8.png
      
SPI中断部分，共60个IRQ ID号

.. image:: images/02_media/image9.png
      
.. image:: images/02_media/image10.png
      
寄存器介绍
----------

.. image:: images/02_media/image11.png
      
本章中重点了解中断控制分配器ICD中的寄存器。可以在寄存器表中看到说明。

ICDICFR:
配置寄存器，用于配置触发方式，电平触发或边沿触发，共有6个，每个寄存器32位，每两位表示一个中断，32*6/2=96个中断号，能覆盖所有中断。

ICDICFR0: IRQ ID#0~#15

ICDICFR1: IRQ ID#16~#31

ICDICFR2: IRQ ID#32~#47

ICDICFR3: IRQ ID#48~#63

ICDICFR4: IRQ ID#64~#79

ICDICFR5: IRQ ID#80~#95

对于SPI中断 0b01：高电平触发 0b11：上升沿触发

ICDIPR:
中断优先级寄存器，设置优先级，共24个寄存器，每8位代表一个中断号，共96个中断号。

ICDIRTR: CPU选择寄存器，24个寄存器，每8位代表一个中断号，共96个

0bxxxxxxx1: CPU interface 0

0bxxxxxx1x: CPU interface 1

ICDICER: 中断关闭寄存器，3个寄存器，每1位代表一个中断号，共96个

ICDISER: 中断使能寄存器，3个寄存器，每1位代表一个中断号，共96个

关于其余的寄存器，大家可以研究UG585的寄存器表中的mpcore部分。

.. image:: images/02_media/image12.png
      
GPIO结构介绍
------------

1. 了解过Zynq中断控制器，再来看GPIO的结构图，同样有中断的寄存器：

INT_MASK：中断掩码

INT_DIS: 中断关闭

INT_EN: 中断使能

INT_TYPE: 中断类型，设置电平敏感还是边沿敏感

INT_POLARITY: 中断极性，设置低电平或下降沿还是高电平或上升沿

INT_ANY: 边沿触发方式，需要INT_TYPE设置为边沿敏感才能使用

设置中断产生方式时需要INT_TYPE、INT_POLARITY、INT_ANY配合使用。具体寄存器含义请参考UG585 Register Details部分。

.. image:: images/02_media/image13.png
      
2. 本实验设计为接下按键LED灯亮，再按下LED灭。

主程序设计流程如下：

GPIO初始化设置按键和LED方向设置产生中断方式设置中断打开中断控制器打开中断异常打开GPIO中断判断KEY_FLAG值，是1，写LED

中断处理流程：

查询中断状态寄存器判断状态清除中断设置KEY_FLAG值

Vitis程序开发
-------------

1. 新建Vitis工程

.. image:: images/02_media/image14.png
      
2. 以AX7015开发板为例，在main函数中，将MIO 11设置为输入，MIO 9设置为输出，将中断类型设置为上升沿产生中断。在本实验中，即按键信号的上升沿产生中断。

.. image:: images/02_media/image15.png
      
3. 在中断控制器设置函数IntrInitFuntions中，下面的语句即为设置中断优先级和触发方式。即操作ICDIPR和ICDICFR寄存器。

.. image:: images/02_media/image16.png
      
4. 在中断服务程序GpioHandler中，判断中断状态寄存器，清除中断，并将按键标志置1。

.. image:: images/02_media/image17.png
      
5. 在main函数中，判断按键标志key_flag，向LED写入数据。

.. image:: images/02_media/image18.png
      
6. 下载程序界面

.. image:: images/02_media/image19.png
      
7. 观察实验现象，按下PS端按键，就可以控制PS端LED的亮灭。

..

   PS端按键位置：AX7015开发板丝印为PS_KEY；AX7021开发板丝印为KEY1；AX7020/AX7010开发板丝印为PS
   KEY1；

   PS端LED灯位置：AX7015开发板丝印为PS_LED；AX7021开发板丝印为LED1；AX7020/AX7010开发板丝印为PS
   LED1;

本章小结
--------

本章介绍了PS端的按键中断，主要知识点为GPIO的配置。多看文档，了解寄存器的功能，为后续实验打下基础。

.. |image1| image:: images/02_media/image2.png
.. |image2| image:: images/02_media/image3.png
      