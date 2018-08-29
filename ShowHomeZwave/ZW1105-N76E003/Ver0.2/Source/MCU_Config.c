/*************************************************************************
	*
	* @FileName		MCU_Config.c
	* @Date				2017.03.03
	* @Author			DS.Chin
	*
**************************************************************************/
#include "MCU_Config.h"


/****************************************
	* 
	* @FunctionName		MCU_Config
	* @Output					None
	* @Input					None
	*
	*/
void MCU_Config(void)
{
	// 关闭总中断
	IE &= ~BIT7;
	CLK_Init();
	GPIO_Init();
	TIM_Init();
	INT_Init();
	//WKT_Init();
	IE |= BIT7;
}



/********************************************
	*
	* @FunctionName		CLK_Init
	* @Output					None
	* @Input					None
	*
	*/
static void CLK_Init(void)
{
	CKSWT	= 0x00;
	CKDIV	= 0x00;
}

/********************************************
	*
	* @FunctionName		GPIO_Init
	* @Output					None
	* @Input					None
	*
	*/
static void GPIO_Init(void)
{
	// P00~P07 output push-pull
	P0M1 = 0x00;
	P0M2 = 0xFF;
	P0   = 0xFF;
	
	// P10 P11 P12 output push-pull
	P1M1 &= ~(BIT0 | BIT1 | BIT2);
	P1M2 |= BIT0 | BIT1 | BIT2;
	P1   |= BIT0 | BIT1 | BIT2;
	
	// P14 P15 P17 input
	P1M1 |= (BIT4 | BIT5 | BIT7);
	P1M2 |= (BIT4 | BIT5 | BIT7);
	
	// P13 P16 unused
	P1M1 &= ~(BIT3 | BIT6);
	P1M2 |= (BIT3 | BIT6);
	P1   &= ~(BIT3 | BIT6);
	
	// P30 unused
	P3M1 &= ~BIT0;
	P3M2 |= BIT0;
	P3   &= ~BIT0;
	
	// P20 input
	P2S &= ~BIT7;			//上拉功能关闭 P20UP = 0
	
	// Close the BOD
	TA = 0xAA;
	TA = 0x55;
	BODCON0 = 0x0;
}



/********************************************
	*
	* @FunctionName		TIM_Init
	* @Output					None
	* @Input					None
	*
	*/
static void TIM_Init(void)
{
	T2CON 	= 0x0;
	T2MOD 	= 0xA0;
	RCMP2L 	= 0xEF;
	RCMP2H 	= 0xD8;
	TR2 		= 1;
}


/********************************************
	*
	* @FunctionName		INT_Init
	* @Output					None
	* @Input					None
	*
	*/
static void INT_Init(void)
{
	PICON 	|= (BIT6 | BIT7 | BIT0);
	PINEN 	|= (BIT4 | BIT5 | BIT7);
	PIPEN 	|= (BIT4 | BIT5 | BIT7);
	EIE			|= BIT1;
}



///********************************************
//	*
//	* @FunctionName		WKT_Init
//	* @Output					None
//	* @Input					None
//	*
//	*/
//static void WKT_Init(void)
//{
//	WKCON = 0x07;
//	RWK		= 207;		//10s
//	EIE1	= 0x04;
//}
