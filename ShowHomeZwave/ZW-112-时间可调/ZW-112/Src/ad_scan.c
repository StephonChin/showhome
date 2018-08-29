/*************************************************
 * @ FileName: ad_scan.c
 * @ Date: 2015.10.15
 * @ Author: DS.Chin
 * @ Describe: AD扫描确定禁卡PIR触发时唤醒信号时间
**************************************************/
#include "ad_scan.h"

/**************************************************
 * @ FunctionName: AdScan
***************************************************/
void AdScan(void)
{
	static uint 	adDataBuf[5] = { 0 };
	uint			adDataAve = 0;;
	uchar			iCnt = 0;
	uchar 			adTime = 100;
	static uchar	adCnt;

	FADENB = 1;
	FADS = 1;		//start to A/D

//	while (adTime && FEOC == 0)
	{
//		adTime--;
	}
	while (FEOC == 0);
	adDataBuf[adCnt] = (uint)ADB * 16 + (uint)(ADR & 0x0F);
	adCnt++;
	if (adCnt > 4)
	{
		adCnt = 0;
		adDataAve = 0;

		for (iCnt = 1; iCnt < 4; iCnt++)
		{
			adDataAve += adDataBuf[adCnt];
		}
		adDataAve /= 3;

		if (adDataAve < 367)
		{
			sysForbidTime = 0;
		}
		else if (adDataAve < 733)
		{
			sysForbidTime = 30;
		}
		else if (adDataAve < 1100)
		{
			sysForbidTime = 60;
		}
		else if (adDataAve < 1466)
		{
			sysForbidTime = 90;
		}
		else
		{
			sysForbidTime = 120;
		}
	}

}