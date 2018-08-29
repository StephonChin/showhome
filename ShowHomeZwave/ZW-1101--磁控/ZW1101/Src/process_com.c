/************************************************************
 * FileName: process_com.c
 * Describe: 唤醒信号
*************************************************************/
#include "process_com.h"

/**********************************************************
 * FunctionName: ProcessCom
 * Describe: 当按键有变化时，发送信号100ms low pulse
**********************************************************/
void ProcessCom(void)
{
	static u8t pulseTimeCnt1;
	static u8t pulseTimeCnt2;

	if (!wakeFlag)
	{
		comPort = 1;
		pulseTimeCnt1 = 0;
		pulseTimeCnt2 = 0;
	}
	else
	{
		comPort = 0;
		pulseTimeCnt1++;
		if (pulseTimeCnt1 > 99)	//20ms
		{
			pulseTimeCnt1 = 0;
			pulseTimeCnt2++;

			if (pulseTimeCnt2 > 4) //100ms
			{
				pulseTimeCnt2 = 0;
				comPort = 1;
				wakeFlag = 0;
			}
		}
	}
}