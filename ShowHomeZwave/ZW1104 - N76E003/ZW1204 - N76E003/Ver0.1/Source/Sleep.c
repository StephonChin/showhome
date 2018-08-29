/*******************************************************************
	*
	* @FileName		Sleepp.c
	* @Date				2017.03.03
	* @Author			DS.Chin
	*
*********************************************************************/
#include "Sleep.h"



/*********************************************
	*
	* @FunctionName	Sleep_Control
	*
***/
void Sleep_Control(void)
{
	static _Uint8	SleepTime;
	
	if ((LedData.Mode != LED_RGB_OFF) || (WakeUpMode != 0))
	{
		SleepTime = 0;
	}
	else
	{
		SleepTime++;
		if (SleepTime > 10)
		{
			SleepTime = 0;
			
			/* Set PD as 1, turn into power drop mode */
			PCON |= BIT1; 
		}
	}
}


