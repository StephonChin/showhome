/*****************************************
 * FileName: mcu_config.h
 * Date: 2016.01.16
 * Author: DS.Chin
*******************************************/
#include "stm8s003f3p.h"
#include "stm8s_bitsdefine.h"
#include "system.h"

/*++++++++++++++++++++++++++++++++++++++++
 + FunctionName: ClkInit
+++++++++++++++++++++++++++++++++++++++++*/
static void Clk_Init(void)
{
    CLK_CKDIVR = 0x00;   //Fcpu = 16/1 = 16M
    CLK_SWR    = 0xE1;   //HSI selected as system clock
}

/*+++++++++++++++++++++++++++++++++++++++
 + FunctionName: GpioInit
++++++++++++++++++++++++++++++++++++++++*/
static void Gpio_Init(void)
{
  /* Tx - PD5*/
  PD_DDR |= 0x20;
  PD_CR1 |= 0x20;
  
  /* Rx - PD6 */
  PD_DDR &= (~0x40);
  PD_CR1 |= 0x40;
  PD_CR2 &= (~0x40);
  
  /* Led port - PA3 */
  PA_DDR |= 0x08;
  PA_CR1 |= 0x08;
  PA_ODR |= 0x08;
  
  /* Relay port - PD4 */
  PD_DDR |= 0x10;
  PD_CR1 |= 0x10;
  PD_ODR &= (~0x10);
  
  /* Key port - PC7 */
  PC_DDR &= (~0x80);
  PC_CR1 |= 0x80;
  PC_CR2 &= (~0x80);
  
	#ifdef		TEST_CODE
		/* test Red port - PC4 */
		PC_DDR |= 0x10;
		PC_CR1 |= 0x10;
		PC_ODR |= 0x10;
	  
		/* test Green port - PC5 */
		PC_DDR |= 0x20;
		PC_CR1 |= 0x20;
		PC_ODR &= (~0x20);
	#endif
  
}

/*********************************************************************
    * @ Function Name: TIM1_Init
	* @ Input: None
	* @Output: None
	*/
static void TIM1_Init(void)
{
	TIM1_CR1	  |= 0x80;
	TIM2_IER		 = 0x00;
	TIM1_SR1	   = 0x00;
	TIM1_PSCRH	 = 0x00;
	TIM1_PSCRL   = 159;    //16M/160 Hz = 10 us
	TIM1_CNTRH   = 0;
	TIM1_CNTRL	 = 199;		//2ms
	TIM1_ARRH		 = 0;
	TIM1_ARRL    = 199;
	TIM1_CR1	  |= 0x01;	//Timer 4 enable
}
/*++++++++++++++++++++++++++++++++++++++++++
 + FunctionName: UartInit
+++++++++++++++++++++++++++++++++++++++++++*/
static void Uart_Init(void)
{ 
  UART1_SR   = 0x00;
  UART1_BRR2 = 0x02;
  UART1_BRR1 = 0x68;   //115200b/s
  UART1_CR1  = 0x00;
  UART1_CR2  = 0x2C;   //REN = 1, TEN = 1, RIEN = 1
}

/*********************************************
 * Tim4_Init
 */
void Tim4_Init(void)
{
	TIM4_PSCR = 0x06;  	 //64·ÖÆµ  4us
	TIM4_ARR  = 249;     //1ms
	TIM4_CNTR = 0;
  TIM4_IER = 0x01; // interrupt enable
	TIM4_CR1 |= 0x01;
}

/**********************************************
 * AD_Init
 */
void AD_Init(void)
{
	ADC_CSR = 0x04;
	ADC_CR1 = 0x00;
	ADC_CR2 = 0x08;
	ADC_CR3 = 0x00;	
	ADC_CR1 |= 0x01;
}

/*+++++++++++++++++++++++++++++++++++++++++
 + FunctionName: McuConfig
++++++++++++++++++++++++++++++++++++++++++*/
void Mcu_Config(void)
{
  _asm("sim");         //interrupt disable
  
  Clk_Init();
  Gpio_Init();
  TIM1_Init();
  Tim4_Init();
  Uart_Init();
 // AD_Init();
    
  _asm("rim");         //interrupt enable
}

