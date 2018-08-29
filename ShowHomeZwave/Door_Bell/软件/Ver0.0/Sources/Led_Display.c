/*******************************************************************************
	*
	* @File Name		Led_Display.c
	* @Date					2016.12.24
	* @Author				DS.Chin
	*
*******************************************************************************/
#include "Led_Display.h"

/*Global Variables------------------------------------------------------------*/
_TypeStructLed	DisplayData;


/*File Variables--------------------------------------------------------------*/



/**
	* @Function Name		Led_Display
	* @Parameters				None
	* @Return						None
	*/
void Led_Display(void)
{
	DisplayData.Mode = 2;
	switch (DisplayData.Mode)
	{
		case 0:		Led_Off();		break;
		case 1:		Led_Night();	break;
		case 2:		Led_Color();	break;
	}
}

/**
	* @Function Name			Led_Off
	* @Parameters					None
	* @Return							None
	*/
static void Led_Off(void)
{
	if (DisplayData.InitFlag == TRUE)
	{
		DisplayData.InitFlag = FALSE;
		
		DisplayData.RedDuty		= 0;
		DisplayData.GreenDuty	= 0;
		DisplayData.BlueDuty	= 0;
	}
}


/**
	* @Function Name			Led_Night
	* @Parameters					None
	* @Return							None
	*/
static void Led_Night(void)
{
	if (DisplayData.InitFlag == TRUE)
	{
		DisplayData.InitFlag = FALSE;
		
		DisplayData.RedDuty		= DisplayData.NightR;
		DisplayData.GreenDuty	= DisplayData.NightG;
		DisplayData.BlueDuty	= DisplayData.NightB;
	}
}


/**
	* @Function Name			Led_Color
	* @Parameters					None
	* @Return							None
	*/
static void Led_Color(void)
{
	if (DisplayData.InitFlag == TRUE)
	{
		DisplayData.InitFlag = FALSE;
		
		DisplayData.RedDuty		= DisplayData.ColorR;
		DisplayData.GreenDuty	= DisplayData.ColorG;
		DisplayData.BlueDuty	= DisplayData.ColorB;
	}
}


/**
	* @Function Name		Duty_Control
	* @Parameters				None
	* @Return						None
	*/
void Duty_Control(void)
{
	static _Uint8	DutyCnt;
	
	DutyCnt++;
	if (DutyCnt < DisplayData.RedDuty)		PORT_RED		= SET;
	else																	PORT_RED		= RESET;
	
	if (DutyCnt < DisplayData.GreenDuty)	PORT_GREEN	= SET;
	else																	PORT_GREEN	= RESET;
	
	if (DutyCnt < DisplayData.BlueDuty)		PORT_BLUE		= SET;
	else																	PORT_BLUE		= RESET;
}



