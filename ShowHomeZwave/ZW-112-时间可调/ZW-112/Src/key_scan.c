/**********************************************
 * @ FileName: key_scan.c
 * @ Date: 2015.10.15
 * @ Author:　ＤＳ．Ｃｈｉｎ
 * @ Describe: 按键扫描及PIR信号扫描
**********************************************/
#include "key_scan.h"

/********************************************
 * @ FunctionName: KeyScan
*********************************************/
void KeyScan(void)
{
	static uchar 		keyOnCnt;
	static uchar 		keyOffCnt;
	static uchar 		keyOnFlag;			//按键闭合状态标志
	static uchar	 	keyOffFlag;			//按键打开状态标志

	if (portKey)
	{
		keyOffCnt = 0;

		if (keyOnFlag == 0)
		{
			keyOnCnt++;
			if (keyOnCnt > 14)
			{
				keyOnFlag  = 1;
				keyOffFlag = 0;
				sysKeyStatusFlag = 1;
			}
		}
	}
	else
	{
		keyOnCnt = 0;

		if (keyOffFlag == 0)
		{
			keyOffCnt++;
			if (keyOffCnt > 14)
			{
				keyOffFlag = 1;
				keyOnFlag  = 0;
				sysKeyStatusFlag = 1;
			}
		}
	}
}

/*****************************************************
 * @ FunctionName: PirChk
 ******************************************************/
void PirChk(void)
{
	static uchar 		pirCnt;
	static uchar 	pirOnFlag;	//PIR已经检测到标志

	if (!portPir)
	{
		if (pirOnFlag == 0)
		{
			pirCnt++;
			if (pirCnt > 10)
			{
				pirOnFlag = 1;
				sysPirStatusFlag = 1;
				sysTriacFlag = 1;
				sysTriacInit = 1;
			}
		}
	}
	else
	{
		pirCnt = 0;
		pirOnFlag = 0;
	}
}