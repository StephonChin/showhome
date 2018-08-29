/************************************************************************
	*
	* @FileName		Key_Scan.c
	* @Date				21-April-2017
	* @Author			DS.Chin
	* 
*************************************************************************/
#include "Key_Scan.h"



/* <---- Gloable Variables -----------------------------------> */
_TypeSensor_E		SensorStatus;
_Flag						KeySleepFlag;
_Flag						TrigForbidFlag;
_Uint8					BattCheckNum;

/**
	* @FunctionName		Key_Scan
	* @Date						21-April-2017
	* @Author					DS.Chin
	*/
void Key_Scan(void)
{
	static _Uint8		KeyReleaseTime;
	static _Flag		KeyReleaseFlag;
	
	static _Uint8		KeyPressTime;
	static _Flag		KeyPressFlag;
	
	static _Flag		PressCntFlag;
	static _Uint8		PressCntTime;
	static _Uint8		KeyPressCnt;
	
	
	static _Uint8		BattCheckOnTime;
	static _Uint8		BattCheckOffTime;
	static _Uint8		BattCheckOnFlag;
	static _Uint8		BattCheckOffFlag = TRUE;
	
	
	//SENSOR脚打开
	if (PORT_SENSOR == RESET)
	{
		KeyPressTime = 0;
		
		if (KeyReleaseFlag == FALSE)
		{
			KeySleepFlag = FALSE;
			KeyReleaseTime++;
			if (KeyReleaseTime >= 200)	//2s
			{
				SensorStatus 		= SENSOR_OPEN;
				KeyReleaseFlag	= TRUE;
				TrigForbidFlag	= TRUE;
				WKCON |= BIT3;
				KeyPressFlag		= FALSE;
			}
		}
		else
		{
			KeySleepFlag = TRUE;
		}
	}
	
	
	//SENSOR脚触发
	else 
	{
		KeyReleaseTime = 0;
		
		if (KeyPressFlag == FALSE)
		{
			KeySleepFlag = FALSE;
			
			PressCntFlag = TRUE;				//SENSOR触发脚开始计时标志位
			KeyPressTime++;
			if (KeyPressTime > 2)
			{
				KeyPressTime = 0;
				if (KeyPressCnt < 50)
				{
					KeyPressCnt++;
				}
			}
		}
		else
		{
			KeySleepFlag = TRUE;
		}
	}
	
	
	if (PressCntFlag  == TRUE)
	{
		PressCntTime++;
		if (PressCntTime >= 200)
		{
			PressCntTime = 0;
			PressCntFlag = FALSE;
			
			//当在2秒内触发次数超过20次时，触发成功
			if (KeyPressCnt >=  20)
			{
				KeyPressCnt 	= 0;
				
				if (TrigForbidFlag == FALSE)		
				{
					SensorStatus 	= SENSOR_CLOSE;
					KeyPressFlag 	= TRUE;
					KeyReleaseFlag = FALSE;
				}
			}
		}
	}
	else
	{
		PressCntTime = 0;
	}
	
	
	
	
	if (PORT_BATT == SET)
	{
		BattCheckOffTime 	= 0;
		BattCheckOffFlag	= FALSE;
		
		BattCheckOnTime++;
		if (BattCheckOnTime > 1)
		{
			BattCheckOnTime = 0;
			if (BattCheckOnFlag == FALSE)
			{
				BattCheckOnFlag = TRUE;
				BattCheckNum	= 1;
			}
		}
	}
	else
	{
		BattCheckOnTime = 0;
		BattCheckOnFlag	= FALSE;
		
		BattCheckOffTime++;
		if (BattCheckOffTime > 1)
		{
			BattCheckOffTime = 0;
			if (BattCheckOffFlag == FALSE)
			{
				BattCheckOffFlag = TRUE;
				BattCheckNum = 2;
			}
		}
	}
	
	

}