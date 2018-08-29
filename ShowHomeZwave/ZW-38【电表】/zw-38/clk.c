/*--------------------------------
*author:chenyk
*data:2015.5.4
*ver:ver1
--------------------------------*/
#include "stm8s003f3.h"
#include "clk.h"

/********************************
*函数名:clk_config
*功能:
*输入参数:
*输出参数:
*********************************/
void clk_config(void)
{
	CLK_ICKR=0x01;
	while(!(CLK_ICKR&0x02)==0x02);   //4m
	CLK_CMSR=0xe1;
	
	CLK_CKDIVR=0x10;
}

/********************************
*函数名:timr4_config
*功能:
*输入参数:
*输出参数:
*********************************/
void timr4_config(void)
{
	TIM4_PSCR=0x04;   //8分频
	TIM4_ARR=250;     //100*1us=100us
	TIM4_CNTR=0;
	TIM4_IER=0x01;
	TIM4_CR1|=0X01;
}
/********************************
*函数名:timr2_config
*功能:
*输入参数:
*输出参数:
*********************************/
/*void timr2_config(void)
{
	TIM2_PSCR=0x01;  //4分频
	TIM2_ARRH=0xff;
	TIM2_ARRL=0xff;
	  //
	TIM2_CNTRH=0x00;
	TIM2_CNTRL=0x00;
	//TIM2_IER=0x01;
	TIM2_CR1=0x01;
}*/