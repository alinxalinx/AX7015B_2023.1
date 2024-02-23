/* ------------------------------------------------------------ */
/*				Include File Definitions						*/
/* ------------------------------------------------------------ */

#include "xil_printf.h"
#include "xbram.h"
#include <stdio.h>
#include "pl_ram_ctrl.h"
#include "xscugic.h"
#include "xgpio.h"

#define BRAM_CTRL_BASE      XPAR_AXI_BRAM_CTRL_0_S_AXI_BASEADDR
#define BRAM_CTRL_HIGH      XPAR_AXI_BRAM_CTRL_0_S_AXI_HIGHADDR
#define PL_RAM_BASE         XPAR_PL_RAM_CTRL_0_S00_AXI_BASEADDR
#define PL_RAM_START        PL_RAM_CTRL_S00_AXI_SLV_REG0_OFFSET
#define PL_RAM_INIT_DATA    PL_RAM_CTRL_S00_AXI_SLV_REG1_OFFSET
#define PL_RAM_LEN          PL_RAM_CTRL_S00_AXI_SLV_REG2_OFFSET
#define PL_RAM_ST_ADDR      PL_RAM_CTRL_S00_AXI_SLV_REG3_OFFSET

#define GPIO_DEVICE_ID      XPAR_AXI_GPIO_0_DEVICE_ID
#define INTC_DEVICE_ID	    XPAR_SCUGIC_SINGLE_DEVICE_ID
#define GPIO_INTR_ID        XPAR_FABRIC_AXI_GPIO_0_IP2INTC_IRPT_INTR
#define GPIO_INTR_MASK      XGPIO_IR_CH1_MASK
#define GPIO_BASE_ADDR      XPAR_AXI_GPIO_0_BASEADDR

#define TEST_START_VAL      0xC
/*
 * BRAM bytes number
 */
#define BRAM_BYTENUM        4

XGpio PL_Gpio ;
XScuGic INTCInst;

int Len  ;
int Start_Addr ;
int Gpio_flag ;
/*
 * Function declaration
 */
int bram_read_write() ;
int IntrInitFuntion(u16 DeviceId, XGpio *GpioInstancePtr);
void GpioHandler(void *InstancePtr);

int main()
{

	int Status;
	Gpio_flag = 1 ;

	Status = XGpio_Initialize(&PL_Gpio, GPIO_DEVICE_ID) ;
	if (Status != XST_SUCCESS)
		return XST_FAILURE ;

	Status = IntrInitFuntion(GPIO_DEVICE_ID, &PL_Gpio) ;
	if (Status != XST_SUCCESS)
		return XST_FAILURE ;


	while(1)
	{
		if (Gpio_flag)
		{
			Gpio_flag = 0 ;
			printf("Please provide start address\t\n") ;
			scanf("%d", &Start_Addr) ;
			printf("Start address is %d\t\n", Start_Addr) ;
			printf("Please provide length\t\n") ;
			scanf("%d", &Len) ;
			printf("Length is %d\t\n", Len) ;
			Status = bram_read_write() ;
			if (Status != XST_SUCCESS)
			{
				xil_printf("Bram Test Failed!\r\n") ;
				xil_printf("******************************************\r\n");
				Gpio_flag = 1 ;
			}
		}
	}
}


int bram_read_write()
{

	u32 Write_Data = TEST_START_VAL ;
	int i ;

	/*
	 * if exceed BRAM address range, assert error
	 */
	if ((Start_Addr + Len) > (BRAM_CTRL_HIGH - BRAM_CTRL_BASE + 1)/4)
	{
		xil_printf("******************************************\r\n");
		xil_printf("Error! Exceed Bram Control Address Range!\r\n");
		return XST_FAILURE ;
	}
	/*
	 * Write data to BRAM
	 */
	for(i = BRAM_BYTENUM*Start_Addr ; i < BRAM_BYTENUM*(Start_Addr + Len) ; i += BRAM_BYTENUM)
	{
		XBram_WriteReg(XPAR_BRAM_0_BASEADDR, i , Write_Data) ;
		Write_Data += 1 ;
	}
	//Set ram read and write length
	PL_RAM_CTRL_mWriteReg(PL_RAM_BASE, PL_RAM_LEN , BRAM_BYTENUM*Len) ;
	//Set ram start address
	PL_RAM_CTRL_mWriteReg(PL_RAM_BASE, PL_RAM_ST_ADDR , BRAM_BYTENUM*Start_Addr) ;
	//Set pl initial data
	PL_RAM_CTRL_mWriteReg(PL_RAM_BASE, PL_RAM_INIT_DATA , (Start_Addr+1)) ;
	//Set ram start signal
	PL_RAM_CTRL_mWriteReg(PL_RAM_BASE, PL_RAM_START , 1) ;

	return XST_SUCCESS ;
}



int IntrInitFuntion(u16 DeviceId, XGpio *GpioInstancePtr)
{
	XScuGic_Config *IntcConfig;
	int Status ;


	//check device id
	IntcConfig = XScuGic_LookupConfig(INTC_DEVICE_ID);
	//intialization
	Status = XScuGic_CfgInitialize(&INTCInst, IntcConfig, IntcConfig->CpuBaseAddress) ;
	if (Status != XST_SUCCESS)
		return XST_FAILURE ;


	XScuGic_SetPriorityTriggerType(&INTCInst, GPIO_INTR_ID,
			0xA0, 0x3);

	Status = XScuGic_Connect(&INTCInst, GPIO_INTR_ID,
			(Xil_ExceptionHandler)GpioHandler,
			(void *)GpioInstancePtr) ;
	if (Status != XST_SUCCESS)
		return XST_FAILURE ;

	XScuGic_Enable(&INTCInst, GPIO_INTR_ID) ;
	//enable interrupt
	XGpio_InterruptEnable(GpioInstancePtr, GPIO_INTR_MASK) ;
	XGpio_InterruptGlobalEnable(GpioInstancePtr) ;


	Xil_ExceptionRegisterHandler(XIL_EXCEPTION_ID_INT,
			(Xil_ExceptionHandler)XScuGic_InterruptHandler,
			&INTCInst);
	Xil_ExceptionEnable();


	return XST_SUCCESS ;

}

void GpioHandler(void *CallbackRef)
{
	XGpio *GpioInstancePtr = (XGpio *)CallbackRef ;
	int Read_Data ;

	int i ;
	printf("Enter interrupt\t\n");
	//clear interrupt status
	XGpio_InterruptClear(GpioInstancePtr, GPIO_INTR_MASK) ;

	for(i = BRAM_BYTENUM*Start_Addr ; i < BRAM_BYTENUM*(Start_Addr + Len) ; i += BRAM_BYTENUM)
	{
		Read_Data = XBram_ReadReg(XPAR_BRAM_0_BASEADDR , i) ;
		printf("Address is %d\t Read data is %d\t\n",  i/BRAM_BYTENUM ,Read_Data) ;
	}
	Gpio_flag = 1 ;
}
