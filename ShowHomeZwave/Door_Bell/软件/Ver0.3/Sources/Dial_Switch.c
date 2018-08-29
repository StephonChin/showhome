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


/**
	* @Function Name		Dial_Switch_Scan
	* @Parameters				None
	* @Return						None
	*/
void Dial_Switch_Scan(void)
{
	if (PORT_DIAL_B == SET)
	{
		if (DialData.Status != DIAL_CLKWISE)		DialData.TrigNum = 0;	
		DialData.Status 	= DIAL_CLKWISE;		//判断方向顺时针
		DialData.TrigNum++;
	}
	else
	{
		if (DialData.Status != DIAL_ANTICLKWISE)		DialData.TrigNum = 0;
		DialData.Status = DIAL_ANTICLKWISE;		//判断方向顺时针
		DialData.TrigNum++;
	}
}


