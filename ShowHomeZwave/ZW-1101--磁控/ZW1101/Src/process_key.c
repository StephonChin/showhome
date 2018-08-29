/************************************************
 * FileName: process_key.c
 * Describe: ����ɨ��
*************************************************/
#include "process_key.h"

/*********************************************
 * FunctionName: ProcessKey
 * describe: ����ɨ��
*********************************************/
void ProcessKey(void)
{
	static u8t timeCnt1;
	static u8t timeCnt2;
	static u8t timeCnt3;
	static u8t timeCnt4;
	static FlagStatus protectKeyOnFlag;
	static FlagStatus protectKeyOffFlag;
	static FlagStatus triggerKeyOnFlag;
	static FlagStatus triggerKeyOffFlag;

/////////////////////////////////////
////////���𿪹�
	if (protectPort)
	{
		timeCnt1++;
		timeCnt2 = 0;

		if (timeCnt1 > 200)
		{
			timeCnt1 = 0;

			if (protectKeyOffFlag == 0)
			{
				wakeFlag = 1;			//���𿪹ش�
				sleepFlag = 0;
			}

			protectKeyOnFlag  = 0;
			protectKeyOffFlag = 1;
		}
	}
	else
	{
		timeCnt2++;
		timeCnt1 = 0;

		if (timeCnt2 > 200 )	//80ms
		{
			timeCnt2 = 0;
			
			if (protectKeyOnFlag == 0)
			{
				wakeFlag = 1;			//���𿪹رպ�
				sleepFlag = 0;
			}

			protectKeyOnFlag  = 1;
			protectKeyOffFlag = 0;
		}
	}

////////////////////////////////////////
/////////��������
	if (protectKeyOnFlag)
	{
		if (triggerPort)
		{
			timeCnt3++;
			timeCnt4 = 0;

			if (timeCnt3 > 200)
			{
				timeCnt3 = 0;

				if (triggerKeyOffFlag == 0)
				{
					wakeFlag = 1;
					sleepFlag = 0;
				}
				triggerKeyOffFlag = 1;
				triggerKeyOnFlag  = 0;
			}
		}
		else
		{
			timeCnt4++;
			timeCnt3 = 0;

			if (timeCnt4 > 200)
			{
				timeCnt4 = 0;

				if (triggerKeyOnFlag == 0)
				{
					wakeFlag = 1;
					sleepFlag = 0;
				}

				triggerKeyOnFlag  = 1;
				triggerKeyOffFlag = 0;
			}
		}
	}
	else
	{
		timeCnt3 = 0;
		timeCnt4 = 0;
		triggerKeyOffFlag = 0;
		triggerKeyOnFlag  = 0;
	}
}