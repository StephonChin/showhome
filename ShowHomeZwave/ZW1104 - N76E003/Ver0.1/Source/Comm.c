/************************************************************************
	*
	* @FileName		Comm.c
	* @Date				2017.03.03
	* @Author			DS.Chin
	*
**************************************************************************/
#include "Comm.h"


/* @Variables -------------------------------------------------------------*/
_Uint8		WakeUpMode;
_Flag			WakeUpInit;
_Uint8		TriggerMode;



/****************************
	*
	* @FunctionName		Comm_Process
	*
***/
void Comm_Process(void)
{
	static _Uint8	WakeUpTime;
	
	
	/* Wake Up */
	if (WakeUpMode == 0)		
	{
		PORT_WAKE_UP = SET;
	}
	else
	{
		PORT_WAKE_UP = RESET;
		if (WakeUpInit == TRUE)	
		{
			WakeUpTime = 0;
			WakeUpInit = FALSE;
		}
		WakeUpTime++;
		if (WakeUpTime > 5)
		{
			WakeUpTime = 0;
			WakeUpMode = 0;
		}
	}
	
	
	/* Trigger */
	if (TriggerMode == 0)	PORT_TRIGGER = RESET;
	else 									PORT_TRIGGER = SET;
}