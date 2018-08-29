/*******************************************************************************
	*
	* @File Name		MCU_Config.c
	* @Date					2016.12.23
	* @Author				DS.Chin
	* @Description	单片配置文件
	*
*******************************************************************************/

/*Include---------------------------------------------------------------------*/
#include "MCU_Config.h"


/**
	* @Function Name	MCU_Config
	*	@Parameters			None
	* @Return					None
	*/
void MCU_Config(void)
{
	asm("sim");
	CLK_Init();		//System Clock Initialize
	GPIO_Init();	//GPIO Initialize
	TIM_Init();		//Timer Initialize
	asm("rim");
}

/**
	* @Function Name	CLK_Init
	* @Parameters			None
	* @Return					None
	*/
static void CLK_Init(void)
{
	CLK_CKDIVR 	= 0x00;
	CLK_SWR 		= 0xE1;
}


/**
	* @Function Name	GPIO_Init
	* @Parameters			None
	* @Return					None
	*/
static void GPIO_Init(void)
{
	/**
		* @PD 				Output & Input
		* @Input			PD4 - Dial Switch A 
		*							PD5 - Dial Switch B
		*							PD6 - Rf Port
		*							PD2 - Key Input
		*
		* @Output			PD3 - Red
		*/
	PD_DDR |= BIT3;
	PD_CR1 |= BIT3;
	PD_ODR &= ~BIT3;
	
	PD_DDR &= ~(BIT2 | BIT4 | BIT5 | BIT6);
	PD_CR1 |= (BIT2 | BIT4 | BIT5 | BIT6);
	
	/**
		* @PC	Output
		*			PC3 - Blue
		*			PC4 - Green
		*			PC5 - S3
		*			PC6 - S2
		*			PC7 - S1
		*/
	PC_DDR |= (BIT3 | BIT4 | BIT5 | BIT6 | BIT7);
	PC_CR1 |= (BIT3 | BIT4 | BIT5 | BIT6 | BIT7);
	PC_ODR &= (BIT3 | BIT4 | BIT5 | BIT6 | BIT7);
}


/**
	* @Function Name	TIM_Init
	* @Parameters			None
	* @Return					None
	*/
static void TIM_Init(void)
{
	/*-----------------TIMER 4----------------------*/
	TIM4_PSCR = 0x04;  	 	//16分频 = 1us
	TIM4_ARR  = 50;     	//50us
	TIM4_CNTR = 50;
	TIM4_IER  = 0x01;			//Update Interrupt Enable
	TIM4_SR		= 0x0;
	TIM4_CR1 |= 0x01;
	
	/*----------------TIMER 1-----------------------*/
	TIM1_CR1	  |= 0x80;
	TIM2_IER		 = 0x00;
	TIM1_SR1	   = 0x00;
	TIM1_PSCRH	 = 0x00;
	TIM1_PSCRL   = 159;    	//16M/160 Hz = 10 us
	TIM1_ARRH		 = 0x01;
	TIM1_ARRL    = 0xF4;		//5MS
	TIM1_CR1	  |= 0x01;		//Timer 1 enable
}

