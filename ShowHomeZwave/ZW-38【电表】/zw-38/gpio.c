/*--------------------------------
*author:chenyk
*data:2015.5.4
*ver:ver1
--------------------------------*/
#include "stm8s003f3.h"
#include "gpio.h"

#define enableInterrupts() {_asm("rim\n");} /* enable interrupts */
#define disableInterrupts() {_asm("sim\n");} /* disable interrupts */


/********************************
*函数名:clk_config
*功能:
*输入参数:
*输出参数:
*********************************/
void gpio_config(void)
{
	PA_DDR=0xf7; //
	PA_CR1=0xff; //
	PA_CR2=0x08; //
	PA_ODR=0x00; //
	
	EXTI_CR1=0x02;
	enableInterrupts();
	
	PB_DDR=0xff; //
	PB_CR1=0xcf; //
	PB_CR2=0x00; //
	PB_ODR=0x00; //
	
	PC_DDR=0x7f; //
	PC_CR1=0x7f; //
	PC_CR2=0x00; //
	PC_ODR=0x00; //
	
	PD_DDR=0xbf; //
	PD_CR1=0xbf; //
	PD_CR2=0x00; //
	PD_ODR=0x00; //

  
}