/********************************************
 * @FileName: mcu_config.c
 * @Date: 2015.10.15
 * @Author: DS.Chin
 * @Describe: 单片机外设配置文件
*********************************************/
#include "mcu_config.h"

/********************************************
 * @FunctionName: GpioInit
*********************************************/
static void GpioInit(void)
{
	P0M  = 0xeb;	//P04 P02 input
	P0UR = 0X00;
	
	P4M   = 0xef;	//P40 output P44 input
	P4UR  = 0x00;
	P4CON = 0x10;	//P44 selected as AD input only
	ADM  |= 0x14;	//open A/D in channel, AIN4 ,ADENB = 1
	ADR  |= 0x50;
	FP40  = 1;
	VREFH &= 0x7f;	//vref = VDD;
	VREFH |= 0x03;

	P5M  = 0xff;	//P53 output
	P5UR = 0x00;
	FP53 = 0;
}

/*******************************************
 * @FunctionName: TimerInit
********************************************/
static void TimerInit(void)
{
	TC0M  = 0x64;	//CPU/4 = 4us
	T0M   = 0x00;
	TC0C  = 6;		//1ms
	TC0R  = 6;
	TC0M |= 0x80;
}

/******************************************
* @FunctionName: McuConfig
*******************************************/
void McuConfig(void)
{
	GpioInit();
	TimerInit();
}
