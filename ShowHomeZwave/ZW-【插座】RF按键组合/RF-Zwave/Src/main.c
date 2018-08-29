/*************************************************************
 * FileName: main.c
 * Author: DS.Chin
 * Date: 2015.04.28
**************************************************************/
#include "system.h"

FlagStatus flagSingle;
FlagStatus flagPowerOn;
void main(void)
{
	GpioInit();
	TimerInit();

	while(1)
	{
		if(flagSingle)
		{
			flagSingle = 0;

			//Delay1s(1);
			rfOnPulse();
				
			Delay1s(20);			
			if (flagPowerOn)
				waveOffPulse();
		}
	}
}

void __interrupt[0x08] interrupt_isr(void)
{
	FP00IRQ = 0;
	flagPowerOn = 1;
	flagSingle = 1;
}

/*--------------------------------------------------
 * Function: Delay5s
 */
void Delay1s(u8t secNum)
{
	u8t catNum1 = 0;
	u8t catNum2 = 0;

	FTC0ENB = 1;
	while (catNum2 < (2 * secNum))
	{
		if (!zWaveSingle)
		{
			flagPowerOn = 0;
			break;
		}
		else
		{
			if (FTC0IRQ == 1)
			{
				FTC0IRQ = 0;
				catNum1++;
				if (catNum1 > 124) 
				{
					catNum1 = 0;
					catNum2++;
				}
			}
		}
	}
	FTC0ENB = 0;
}

/*---------------------------------------------------
 * Function: send an 100ms low pulse--rf on
 */
void rfOnPulse(void)
{
	u8t catNum = 0;
	u8t catNum2 = 0;

	FP22M = 1;
	FP22 = 0;
	FTC0ENB = 1;
	while (catNum2 < 50)
	{
		if (FTC0IRQ)
		{
			FTC0IRQ = 0;
			catNum++;
			if (catNum > 7)
			{
				catNum = 0;
				catNum2++;
			}
		}
	}
	FP22M = 0;
	FTC0ENB = 0;
}


/*---------------------------------------------------
 * Function: send an 100ms low pulse--rf on
 */
void waveOffPulse(void)
{
	u8t catNum = 0;
	zWavePower = 0;
	FTC0ENB = 1;
	while (catNum < 200)
	{
		if (FTC0IRQ)
		{
			catNum++;
			FTC0IRQ = 0;
		}
	}
	zWavePower = 1;
	FTC0ENB = 0;
}
