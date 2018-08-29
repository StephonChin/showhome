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
	
	
	/* ��P20��Ϊ�ߵ�ƽʱ��2���������Ч */
	if (PORT_DELAY == SET)
	{
		//SENSOR�Ŵ�
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
					KeyPressFlag		= FALSE;
				}
			}
			else
			{
				KeySleepFlag = TRUE;
			}
		}
		
		
		//SENSOR�Ŵ���
		else 
		{
			KeyReleaseTime = 0;
			
			if (KeyPressFlag == FALSE)
			{
				KeySleepFlag = FALSE;
				
				PressCntFlag = TRUE;				//SENSOR�����ſ�ʼ��ʱ��־λ
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
				
				//����2���ڴ�����������20��ʱ�������ɹ�
				if (KeyPressCnt >=  20)
				{
					KeyPressCnt 	= 0;
					
					SensorStatus 	= SENSOR_CLOSE;
					KeyPressFlag 	= TRUE;
					KeyReleaseFlag = FALSE;
				}
			}
		}
		else
		{
			PressCntTime = 0;
		}
	}
	
	
	
	
	/* ��P20��Ϊ�͵�ƽʱ��˲ʱ�ж���Ч */
	else
	{
		//SENSOR�Ŵ�
		if (PORT_SENSOR == RESET)
		{
			KeyPressTime = 0;
			
			if (KeyReleaseFlag == FALSE)
			{
				KeySleepFlag = FALSE;
				KeyReleaseTime++;
				if (KeyReleaseTime >= 5)	//50ms
				{
					SensorStatus 		= SENSOR_OPEN;
					KeyReleaseFlag	= TRUE;
					KeyPressFlag		= FALSE;
				}
			}
			else
			{
				KeySleepFlag = TRUE;
			}
		}
		
		
		//SENSOR�Ŵ���
		else 
		{
			KeyReleaseTime = 0;
			
			if (KeyPressFlag == FALSE)
			{
				KeySleepFlag = FALSE;
				
				KeyPressTime++;
				if (KeyPressTime >= 5)		//50ms
				{
					KeyPressTime = 0;
					
					KeyPressFlag 		= TRUE;
					KeyReleaseFlag 	= FALSE;
					SensorStatus 		= SENSOR_CLOSE;
				}
			}
			else
			{
				KeySleepFlag = TRUE;
			}
		}
	}
}