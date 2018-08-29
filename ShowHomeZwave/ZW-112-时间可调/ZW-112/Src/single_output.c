/*********************************************************
 * @ FileName: single_output.c
 * @ Date: 2015.10.15
 * @ Author: DS.Chin
 * @ Describe: �ź��������
*********************************************************/
#include "single_output.h"

/********************************************************
 * @ FunctionName: SingleOutput
*********************************************************/
void SingleOutput(void)
{
	static uchar			wakeCnt1;
	static uchar			wakeCnt2;
	static uchar			triacCnt1;
	static uchar			triacCnt2;
	static BitStatus		pirForbidFlag;		//PIR�������ֹ���ͻ����źű�־λ
	static BitStatus		wakeDoneFlag;		//�����źŽ�����־λ
	static BitStatus		wakeLastFlag;
	static uchar			forbidTime[2];

	if (sysKeyStatusFlag)
	{
		portWake = 0;
		wakeCnt1++;
		if (wakeCnt1 > 24)	//100ms low pulse
		{
			sysKeyStatusFlag = 0;
			wakeCnt1 = 0;
			portWake = 1;
		}
	}

	if ((sysPirStatusFlag == 1 && pirForbidFlag == 0 && forbidFlag == 0)|| wakeLastFlag == 1)
	{
		portWake = 0;
		wakeCnt2++;
		if (wakeCnt2 > 24)
		{
			wakeCnt2 = 0;
			wakeLastFlag = 0;
			sysPirStatusFlag = 0;
			portWake = 1;
			wakeDoneFlag = 1;
		}
	}

	else
	{
		wakeDoneFlag = 0;
		sysPirStatusFlag = 0;
	}

//	sysForbidTime = 30;
	if (sysTriacFlag)
	{
		if (forbidFlag == 0)
		{
			if (sysTriacInit)
			{
				sysTriacInit = 0;
				triacCnt1    = 0;
				triacCnt2    = 0;
			}
		
			if (sysForbidTime != 0)
			{
				if (wakeDoneFlag)
				{
					pirForbidFlag = 1;
				}
				portTriac = 1;

				triacCnt1++;
		
				if (triacCnt1 > 249)			//1s
				{
					triacCnt1 = 0;
					triacCnt2++;

					if (triacCnt2 > sysForbidTime - 1)
					{
						sysTriacFlag = 0;
						triacCnt2 = 0;
						portTriac = 0;
						pirForbidFlag = 0;
						wakeLastFlag = 1;	//triac�ź�
						forbidFlag = 1;		//z-wave�����ź�ʱ����PIR
					}
				}
			}
			else
			{
				wakeDoneFlag = 0;
				sysTriacFlag = 0;
				forbidFlag = 1;
			}
		}
		else
		{
			sysTriacFlag = 0;
		}
	}

	if (forbidFlag == 1)
	{
		forbidTime[0]++;
		if (forbidTime[0] > 249) //4 * 250 = 1s
		{
			forbidTime[0] = 0;
			forbidTime[1]++;
			if (forbidTime[1] > 4)
			{
				forbidTime[1] = 0;
				forbidFlag = 0;
			}
		}
	}
}