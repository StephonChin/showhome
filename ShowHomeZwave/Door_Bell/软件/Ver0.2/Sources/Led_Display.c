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
	RedDuty		= 0;
	GreenDuty	= 0;
	BlueDuty	= 0;
}


/**
	* @Function Name			Led_Night
	* @Parameters					None
	* @Return							None
	*/
static void Led_Night(void)
{
	RedDuty		= DisplayData.NightR;
	GreenDuty	= DisplayData.NightG;
	BlueDuty	= DisplayData.NightB;
}


/**
	* @Function Name			Led_Color
	* @Parameters					None
	* @Return							None
	*/
static void Led_Color(void)
{
	RedDuty		= DisplayData.ColorR;
	GreenDuty	= DisplayData.ColorG;
	BlueDuty	= DisplayData.ColorB;
}




