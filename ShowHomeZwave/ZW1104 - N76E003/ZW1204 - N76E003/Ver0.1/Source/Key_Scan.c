/************************************************************************
	*
	* @FileName		Key_Scan.c
	* @Date				21-April-2017
	* @Author			DS.Chin
	* 
*************************************************************************/
#include "Key_Scan.h"


/*<-- Gloable Variables ----------------------------------------------> */
_TypeSensor_E		SensorStatus;


/*<-- File Variables -------------------------------------------------> */
_Flag						TrigStartFlag;					//Start to SET the PORT_START
_Flag						TrigForbidFlag;				


/**********************************************************************
	* @FunctionName		Key_Scan
	* @Date						21-April-2017
	* @Author					DS.Chin
	*/
void Key_Scan(void)
{
	_Uint8		TimeDelay = 0;
	
	/* Set the PORT_START high every 1 second */
	if (TrigStartFlag == TRUE)
	{
		TrigStartFlag = FALSE;
		
		PORT_START		= SET;
		
		/* Wait some microseconds to check the PORT_WATER & PORT_VERIFY */
		TimeDelay = 200;
		while (TimeDelay--);
		
		/* If PORT_VERIFY is high and PORT_WATER is LOW */
		if (!PORT_WATER && PORT_VERIFY)					
		{
			SensorStatus	= SENSOR_TRIG;
		}
		
		/* If PORT_VERIFY is high and PORT_WATER is HIGH */
		else if (PORT_VERIFY && PORT_WATER)		
		{
			SensorStatus 			= SENSOR_RELEASE;
			TrigForbidFlag		= TRUE;
		}
	}
	
	else
	{
		PORT_START = RESET;
	}
}

/***********************************************************************
	*
	* @FunctionName		WKT_Interrupt
	* 
***/
void WKT_Interrupt(void) interrupt 17
{
	static _Uint8		TimeCnt = 0;
	
	WKCON &= ~BIT4;
	
	if (TrigForbidFlag == TRUE)
	{
		TimeCnt++;
		if (TimeCnt >= 10)
		{
			TimeCnt = 0;
			TrigForbidFlag = FALSE;
		}
	}
	else
	{
		TrigStartFlag = TRUE;
	}
}
