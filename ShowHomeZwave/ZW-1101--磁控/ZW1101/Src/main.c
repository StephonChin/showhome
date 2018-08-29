/**************************************************
 * FileName: zw1101
 * Date: 2015.08.05
 * Author: DS.Chin
 * Describe: ´Å¿Ø´«¸ÐÆ÷8½ÅSN2511³ÌÐò
***************************************************/
#include "main.h"

void main(void)
{
	u8t mainStep = 0;

	McuConfig();

	while(1)
	{
		if (FTC0IRQ)
		{
			FTC0IRQ = 0;
			switch (mainStep)
			{
				case 0:
					ProcessKey();
					mainStep++;
					break;
				case 1:
					ProcessCom();
					mainStep = 0;
					break;
				default:
					mainStep = 0;
					break;
			}

			SleepMode();
		}
	}
}