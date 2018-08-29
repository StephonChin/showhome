/*************************************************************
 * FileName: main.c
 * Author: DS.Chin
 * Date: 2015.04.28
**************************************************************/
#include "system.h"

void main(void)
{
	FlagStatus flagSingle = 0;
	GpioInit();
	TimerInit();

	while(1)
	{
		while (!flagSingle)
		{
			flagSingle = SingleJudge();
		}

		rfOnPulse();
	
		Delay5s();
		
		rfOffPulse();
	
		waveOffPulse();

		flagSingle = 0;
	}
}

/*--------------------------------------------------
 * Function: Delay5s
 */
void Delay5s(void)
{
	u8t catNum1 = 0;
	u8t catNum2 = 0;

	FTC0ENB = 1;
	while (catNum2 < 200)
	{
		if (FTC0IRQ == 1)
		{
			FTC0IRQ = 0;
			catNum1++;
			if (catNum1 > 30)
			{
				catNum1 = 0;
				catNum2++;
			}
		}
	}
	FTC0ENB = 0;
}
/*--------------------------------------------------
 * Function: singleJudge
 */
FlagStatus SingleJudge(void)
{
	u8t catNum = 0;

	while (zWaveSingle);
	FTC0ENB = 1;
	while (catNum < 30)
	{
		if (FTC0IRQ)
		{
			catNum++;
			FTC0IRQ = 0;
		}
	}
	FTC0ENB = 0;

	if (zWaveSingle)
		 return 1;
	else
		 return 0;
}

/*---------------------------------------------------
 * Function: send an 100ms low pulse--rf on
 */
void rfOnPulse(void)
{
	u8t catNum = 0;
	FP22 = 1;
	FTC0ENB = 1;
	while (catNum < 200)
	{
		if (FTC0IRQ)
		{
			catNum++;
			FTC0IRQ = 0;
		}
	}
	FP22 = 0;
	FTC0ENB = 0;
}

/*---------------------------------------------------
 * Function: send an 100ms low pulse--rf off
 */
void rfOffPulse(void)
{
	u8t catNum = 0;
	FP54 = 1;
	FTC0ENB = 1;
	while (catNum < 200)
	{
		if (FTC0IRQ)
		{
			catNum++;
			FTC0IRQ = 0;
		}
	}
	FP54 = 0;
	FTC0ENB = 0;
}

/*---------------------------------------------------
 * Function: send an 100ms low pulse--rf on
 */
void waveOffPulse(void)
{
	u8t catNum = 0;
	FP23 = 0;
	FTC0ENB = 1;
	while (catNum < 100)
	{
		if (FTC0IRQ)
		{
			catNum++;
			FTC0IRQ = 0;
		}
	}
	FP23 = 1;
	FTC0ENB = 0;
}
