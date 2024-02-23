/******************************************************************************
 *
 * Copyright (C) 2009 - 2014 Xilinx, Inc.  All rights reserved.
 *
 * Permission is hereby granted, free of charge, to any person obtaining a copy
 * of this software and associated documentation files (the "Software"), to deal
 * in the Software without restriction, including without limitation the rights
 * to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
 * copies of the Software, and to permit persons to whom the Software is
 * furnished to do so, subject to the following conditions:
 *
 * The above copyright notice and this permission notice shall be included in
 * all copies or substantial portions of the Software.
 *
 * Use of the Software is limited solely to applications:
 * (a) running on a Xilinx device, or
 * (b) that interact with a Xilinx device through a bus or interconnect.
 *
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL
 * XILINX  BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY,
 * WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF
 * OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
 * SOFTWARE.
 *
 * Except as contained in this notice, the name of the Xilinx shall not be used
 * in advertising or otherwise to promote the sale, use or other dealings in
 * this Software without prior written authorization from Xilinx.
 *
 ******************************************************************************/

/*
 * helloworld.c: simple test application
 *
 * This application configures UART 16550 to baud rate 9600.
 * PS7 UART (Zynq) is not initialized by this application, since
 * bootrom/bsp configures it to baud rate 115200
 *
 * ------------------------------------------------
 * | UART TYPE   BAUD RATE                        |
 * ------------------------------------------------
 *   uartns550   9600
 *   uartlite    Configurable only in HW design
 *   ps7_uart    115200 (configured by bootrom/bsp)
 */

#include "xparameters.h"
#include "xscugic.h"
#include "xgpiops.h"
#include "xil_printf.h"
#include "xil_exception.h"

/* GPIO paramter */
#define MIO_0_ID        XPAR_PS7_GPIO_0_DEVICE_ID
#define INTC_DEVICE_ID	XPAR_SCUGIC_SINGLE_DEVICE_ID
#define KEY_INTR_ID     XPAR_XGPIOPS_0_INTR

#define GPIO_INPUT      0
#define GPIO_OUTPUT     1

int key_flag ;
XGpioPs GPIO_PTR ;

XScuGic INTCInst;


int IntrInitFuntion(XScuGic *InstancePtr, u16 DeviceId, XGpioPs *GpioInstancePtr);
void GpioHandler(void *CallbackRef);

int main()
{
	XGpioPs_Config *GPIO_CONFIG ;
	int Status ;
	int key_val  = 0 ;

	key_flag = 0 ;

	GPIO_CONFIG = XGpioPs_LookupConfig(MIO_0_ID) ;
	Status = XGpioPs_CfgInitialize(&GPIO_PTR, GPIO_CONFIG, GPIO_CONFIG->BaseAddr) ;
	if (Status != XST_SUCCESS)
	{
		return XST_FAILURE ;
	}
	//set MIO 11 as input
	XGpioPs_SetDirectionPin(&GPIO_PTR, 11, GPIO_INPUT) ;
	//set MIO 9 as output
	XGpioPs_SetDirectionPin(&GPIO_PTR, 9, GPIO_OUTPUT) ;
	//enable MIO 9 output
	XGpioPs_SetOutputEnablePin(&GPIO_PTR, 9, GPIO_OUTPUT) ;
	//set interrupt type
	XGpioPs_SetIntrTypePin(&GPIO_PTR, 11, XGPIOPS_IRQ_TYPE_EDGE_RISING) ;

	//enable GPIO interrupt
	XGpioPs_IntrEnablePin(&GPIO_PTR, 11) ;

	Status = IntrInitFuntion(&INTCInst, MIO_0_ID, &GPIO_PTR) ;
	if (Status != XST_SUCCESS)
		return XST_FAILURE ;

	while(1)
	{
		if (key_flag)
		{
			XGpioPs_WritePin(&GPIO_PTR, 9, key_val) ;
			key_val = ~key_val ;
			key_flag = 0 ;
		}

	}

	return 0 ;
}


int IntrInitFuntion(XScuGic *InstancePtr, u16 DeviceId, XGpioPs *GpioInstancePtr)
{
	XScuGic_Config *IntcConfig;
	int Status ;


	//check device id
	IntcConfig = XScuGic_LookupConfig(INTC_DEVICE_ID);
	//intialization
	Status = XScuGic_CfgInitialize(InstancePtr, IntcConfig, IntcConfig->CpuBaseAddress) ;
	if (Status != XST_SUCCESS)
		return XST_FAILURE ;

	//set priority and trigger type
	XScuGic_SetPriorityTriggerType(InstancePtr, KEY_INTR_ID,
			0xA0, 0x3);

	Status = XScuGic_Connect(InstancePtr, KEY_INTR_ID,
			(Xil_ExceptionHandler)GpioHandler,
			(void *)GpioInstancePtr) ;
	if (Status != XST_SUCCESS)
		return XST_FAILURE ;

	//Enable GIC
	XScuGic_Enable(InstancePtr, KEY_INTR_ID) ;


	Xil_ExceptionRegisterHandler(XIL_EXCEPTION_ID_INT,
			(Xil_ExceptionHandler)XScuGic_InterruptHandler,
			InstancePtr);
	Xil_ExceptionEnable();

	return XST_SUCCESS ;

}


void GpioHandler(void *CallbackRef)
{
	XGpioPs *GpioInstancePtr = (XGpioPs *)CallbackRef ;
	int Int_val ;

	Int_val = XGpioPs_IntrGetStatusPin(GpioInstancePtr, 11) ;
	//clear key interrupt
	XGpioPs_IntrClearPin(GpioInstancePtr, 11) ;
	if (Int_val == TRUE)
		key_flag = 1 ;
}
