#include "mcu_config.h"

/*--------------------------
 * FunctionName: GpioConfig
 */
void GpioConfig(void)
{
	PA_DDR = 0xFF;
	PA_CR1 = 0xFF;
	PA_ODR = 0x00;
	
	PB_DDR = 0xFF;
	PB_CR1 = 0xFF;
	PB_ODR = 0x00;
	
	PC_DDR = 0xFF;
	PC_CR1 = 0x3F;
	PC_ODR = 0x00;
	
	PD_DDR = 0xBF;
	PD_CR1 = 0xFF;
	PD_ODR = 0x00;
}

/*-------------------------
 * FunctionName: ClkConfig
 */
void ClkConfig(void)
{
	CLK_CKDIVR = 0x04;
	CLK_SWR    = 0xE1;
}

/*--------------------------
 * FunctionName: UartConfig
 */
void UartConfig(void)
{
	_asm("sim");
	UART1_BRR2 = 0;
	UART1_BRR1 = 0;
	UART1_CR1 = 0;
	UART1_CR2 = 0;
	UART1_SR  = 0;
	
	UART1_BRR2 = 0x02;
	UART1_BRR1 = 0x68;
	UART1_CR1  = 0x00;
	UART1_CR2  = 0x2C;
	UART1_SR   = 0x00;
	_asm("rim");
}

/*--------------------------
 * FunctionName: TimerConfig
 */
void TimerConfig(void)
{
	_asm("sim");
	TIM4_PSCR = 0x04;
	TIM4_IER  = 0x01;
	TIM4_ARR  = 56;
	TIM4_CNTR = 56;
	TIM4_CR1  = 0x01;
	_asm("rim");
}

