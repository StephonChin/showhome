/*******************************************************************************
	*
	* @File Name		Dial_Switch.c
	* @Date					2016.12.24
	* @Author				DS.Chin
	*
*******************************************************************************/
#include "Dial_Switch.h"


/*Gloable Variables-----------------------------------------------------------*/
_TypeStructDial DialData;


/*File Variables--------------------------------------------------------------*/
enum
{
	PULSE_IDLE,
	PULSE_LOW,
	PULSE_HIGH
}DialAStatus,DialBStatus;


/**
	* @Function Name		Dial_Switch_Scan
	* @Parameters				None
	* @Return						None
	*/
void Dial_Switch_Scan(void)
{
	static _Uint8	DialALowTime;
	static _Uint8	DialAHighTime;
	static _Uint8	DialBLowTime;
	static _Uint8	DialBHighTime;
	
	/*------------A高电压到低电平变化时判断转向-------------*/
	if (PORT_DIAL_A == RESET)
	{
		DialAHighTime = 0;
		DialALowTime++;
		if (DialALowTime > 0)
		{
			DialALowTime = 0;
			if (DialAStatus != PULSE_LOW)
			{
				if (DialBStatus == PULSE_HIGH)
				{
					if (DialData.Status == DIAL_ANTICLKWISE)		DialData.TrigNum = 0;
					
					DialData.Status 	= DIAL_CLKWISE;		//判断方向顺时针
					DialData.TrigNum++;
					DialData.TrigFlag = TRUE;
				}
			}
			DialAStatus = PULSE_LOW;
		}
	}
	else
	{
		DialALowTime = 0;
		DialAHighTime++;
		if (DialAHighTime > 0)
		{
			DialAHighTime = 0;
			DialAStatus = PULSE_HIGH;
		}
	}
	
	/*------------B高电压到低电平变化时判断转向-------------*/
	if (PORT_DIAL_B == RESET)
	{
		DialBHighTime = 0;
		DialBLowTime++;
		if (DialBLowTime > 0)
		{
			DialBLowTime = 0;
			if (DialBStatus != PULSE_LOW)
			{
				if (DialAStatus == PULSE_HIGH)
				{
					if (DialData.Status == DIAL_CLKWISE)		DialData.TrigNum = 0;
						
					DialData.Status = DIAL_ANTICLKWISE;		//判断方向顺时针
					DialData.TrigNum++;
					DialData.TrigFlag = TRUE;
				}
			}
			DialBStatus = PULSE_LOW;
		}
	}
	else
	{
		DialBLowTime = 0;
		DialBHighTime++;
		if (DialBHighTime > 0)
		{
			DialBHighTime = 0;
			DialBStatus = PULSE_HIGH;
		}
	}
}


