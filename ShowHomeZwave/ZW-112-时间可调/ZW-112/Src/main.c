/********************************************************************
 *
 * @ FileName: zw-112.c
 * @ Date: 2015.10.15
 * @ Author: DS.Chin
 * @ Describe:PIR�źż�����ź��������ͨ���������������ڴ�����ֹʱ��
 *
**********************************************************************/
#include "main.h"

/********************************************************************
 * @ FunctionName: main
 * @ Describe: �������������������̿���
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

			//˯��ģʽ
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

			//��������ģʽ�����̿���
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