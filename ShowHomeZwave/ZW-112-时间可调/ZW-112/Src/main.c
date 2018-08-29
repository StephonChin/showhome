/********************************************************************
 *
 * @ FileName: zw-112.c
 * @ Date: 2015.10.15
 * @ Author: DS.Chin
 * @ Describe:PIR信号检测与信号输出，可通过滑动变阻器调节触发禁止时间
 *
**********************************************************************/
#include "main.h"

/********************************************************************
 * @ FunctionName: main
 * @ Describe: 主函数，程序整体流程控制
********************************************************************/
void main(void)
{
	static uchar 		programmStep = 0;
	static uchar		sleepCnt;

	McuConfig();

	while(1)
	{
		if (FTC0IRQ == 1)//	1ms
		{
			FTC0IRQ =0;

			//睡眠模式
			if (!sysKeyStatusFlag && !sysPirStatusFlag && !sysTriacFlag && !forbidFlag)
			{
				sleepCnt++;
				if (sleepCnt > 200)	//200ms
				{
					sleepCnt = 0;

					FADENB = 0;
					FCPUM0 = 1;
					FCPUM1 = 0;
				}
			}
			else
			{
				sleepCnt = 0;
			}

			//正常工作模式下流程控制
			switch(programmStep)//4ms
			{
				case 0:
					KeyScan();
					programmStep++;
					break;
				case 1:
					PirChk();
					programmStep++;
					break;
				case 2:
					AdScan();
					programmStep++;
					break;
				case 3:
					SingleOutput();
					programmStep = 0;
					break;
				default:
					programmStep = 0;
					break;
			}
		}
	}

}