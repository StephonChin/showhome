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
		* @Input			
		*							PD6 - Rf Port
		*							PD2 - Key Input
		*/
	PD_DDR &= ~(BIT2 | BIT6);
	PD_CR1 |= BIT2;
	PD_CR1 &= ~BIT6;
	
	/**
		* @PC	Output
		*			PC5 - S1
		*			PC6 - S2
		*			PC7 - S3
		* @PC Input
		*			PC3 - Dial A
		* 		PC4 - Dial B
		*/
	PC_DDR |= (BIT5 | BIT6 | BIT7);
	PC_CR1 |= (BIT5 | BIT6 | BIT7);
	PC_ODR &= (BIT5 | BIT6 | BIT7);
	
	PC_DDR &= ~(BIT3 | BIT4);
	PC_CR1 &= ~(BIT3 | BIT4);
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
	TIM4_ARR  = 100;     	//100us
	TIM4_CNTR = 100;
	TIM4_IER  = 0x01;			//Update Interrupt Enable
	TIM4_SR		= 0x0;
	TIM4_CR1 |= 0x01;
	
	/*----------------TIMER 2-----------------------*/
	/* TIM2 CH1 CH2 CH3 */
	TIM2_CCMR1 = 0x68;	    //PWM1
	TIM2_CCMR2 = 0x68;	    //PWM1
	TIM2_CCMR3 = 0x68;	    //PWM1
  
  TIM2_CCER1 = 0x11;
	TIM2_CCER2 = 0x01;
	
	TIM2_PSCR = 3; //16M/16 == 1 us
	TIM2_ARRH = 0x01;
	TIM2_ARRL = 0; // 256us
	  
	TIM2_CCR1H = 0x00;
	TIM2_CCR1L = 0;    //green Duty
	TIM2_CCR2H = 0x00;
	TIM2_CCR2L = 0;    //red Duty
	TIM2_CCR3H = 0x00;
	TIM2_CCR3L = 0;    //red Duty
	
	TIM2_CNTRH = 0x00;
	TIM2_CNTRL = 0;
	TIM2_CR1 |= 0x01;
	
	/*----------------TIMER 1-----------------------*/
	TIM1_CR1	  |= 0x80;
	TIM2_IER		 = 0x00;
	TIM1_SR1	   = 0x00;
	TIM1_PSCRH	 = 0x00;
	TIM1_PSCRL   = 159;    	//16M/160 Hz = 10 us
	TIM1_ARRH		 = 0x01;
	TIM1_ARRL    = 0xF3;		//5MS
	TIM1_CR1	  |= 0x01;		//Timer 1 enable
}

