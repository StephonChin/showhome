/*******************************************************************************
	*
	* @FileName		  Configuration.c
	* @Date					2018.03.29
	* @Author				DS.Chin
	* @CopyRight		(C) CopyRight  @2016 ~ 2026 Willis Ltd. Co.
	* @Description	This file contains all the function prototyped for the config
	*								fimer library
	*
*******************************************************************************/
#include "MCU_Config.h"



/******************************************************************
	*
	* Function Name			MCU_Config
	*
******************************************************************/
void MCU_Config(void)
{
  /* Disable Interrupt */
	IE &= ~BIT7;
    
	CLK_Init();
	
	GPIO_Init();
	
	TIM_Init();
    
  WDT_Init();
    
    /* Enable Interrupt */
	IE |= BIT7;
}

/******************************************************************
	*
	* Function Name			CLK_Init
	*
******************************************************************/
static void CLK_Init(void)
{
  TA		= 0xAA;
  TA		= 0x55;
  CKSWT  &= ~(BIT1 | BIT0);	
}

/******************************************************************
	*
	* Function Name			GPIO_Init
	*
******************************************************************/
static void GPIO_Init(void)
{
	//P00 P01 output, 
  P0M1 &= ~( BIT0 | BIT1);
  P0M2 |= (BIT0 | BIT1);
  P0 &= ~(BIT0 | BIT1);
  
  //p07 - Key P06 Key, 
  P0M1 |= (BIT6 | BIT7);
  P0M2 &= ~(BIT6 | BIT7);
  
  //P15 - ZERO
  P1M1 |= BIT5;
  P1M2 &= ~BIT5;
  
  PICON = 0x41;
  PINEN = 0x20;
  PIPEN = 0x20;
  
  //EIE |= BIT1;
}

/******************************************************************
	*
	* Function Name			TIM_Init
	*
******************************************************************/
static void TIM_Init(void)
{
	/* TIMER 0 */
	TMOD    = 0x2;
	CKCON  &= ~BIT3;    //1.843M
  TL0     = 145;
  TH0     = 145;   //1.382375 / 1.843 = 100us
	ET0     = 1;
	TCON   |= BIT4;
	
  
	/* TIMER 2 */
	T2CON 	= 0x0;
	T2MOD 	= 0xA0;     //22.118 / 16 = 1.382375M
  RCMP2L 	= 0x00;
  RCMP2H 	= 0xE5;				//10ms
	TR2 	= 1;
}





/*******************************************************************
	*
	* Function Name			WDT_Init
	*
******************************************************************/
static void WDT_Init(void)
{
    TA			= 0xAA;
    TA			= 0x55;
    WDCON   = 0xC3;     // 102.4ms
}


