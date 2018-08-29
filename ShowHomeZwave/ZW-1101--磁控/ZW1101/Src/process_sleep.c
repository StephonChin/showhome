/*******************************************
 * FileName: process_sleep
 * Describe: 进入睡眠模式
********************************************/
#include "process_sleep.h"

/****************************************
* FunctionName: SleepMode
*****************************************/
void SleepMode(void)
{
	static u8t sleepTime1;
	static u8t sleepTime2;

	if (!sleepFlag)
	{
		sleepFlag = 1;
		sleepTime1 = 0;
		sleepTime2 = 0;
	}
	else
	{
		sleepTime1++;

		if (sleepTime1 > 99)	//10ms
		{
			sleepTime1 = 0;
			sleepTime2++;
			if (sleepTime2 > 199) //2s
			{
				sleepTime2 = 0;
				FCPUM1 = 0;
				FCPUM0 = 1;
			}
		}
	}
}