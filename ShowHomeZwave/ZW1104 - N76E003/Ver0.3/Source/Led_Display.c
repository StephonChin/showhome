/************************************************************************
	*
	* @FileName		Led_Display.c
	* @Date				2017.03.03
	* @Author			DS.Chin
	*
**************************************************************************/
#include "Led_Display.h"


/* @Gloable Variables ----------------------------------------------------*/
_TypeStLed 	LedData;



/* @File Variabless -----------------------------------------------------*/
static _Uint8	LedTime[2];
static _Uint8	HoldTime[2];
static _Uint8	LedStep;





/*************************************************
	*
	* @FunctionName	Led_Display
	* @Input				None
	* @Output				None
	*
***/
void Led_Display(void)
{
	switch (LedData.Mode)
	{
		case LED_RGB_OFF:						Led_RGB_Off();			break;
		case LED_RGB_SLOW:					Led_RGB_Slow();			break;
		case LED_G_FAST:						Led_G_Fast();				break;
		case LED_B_SLOW:						Led_B_Slow();				break;
		case LED_R_SLOW:						Led_R_Slow();				break;
	}
}


/*************************************************
	*
	* @FunctionName	Led_RGB_Off
	* @Input				None
	* @Output				None
	*
***/
static void Led_RGB_Off(void)
{
	if (LedData.InitFlag == TRUE)
	{
		LedData.InitFlag = FALSE;
		R1OFF;	R2OFF;	R3OFF;
		G1OFF;	G2OFF;	G3OFF;
		B1OFF;	B2OFF;	B3OFF;
	}
}




/*************************************************
	*
	* @FunctionName	Led_RGB_Slow
	* @Input				None
	* @Output				None
	*
***/
static void Led_RGB_Slow(void)
{
	/* Initialize */
	if (LedData.InitFlag == TRUE)
	{
		LedData.InitFlag = FALSE;
		R1OFF;	R2OFF;	R3OFF;
		G1OFF;	G2OFF;	G3OFF;
		B1OFF;	B2OFF;	B3OFF;
		LedTime[0] 	= 0;
		LedTime[1] 	= 0;
		HoldTime[0]	= 0;
		HoldTime[1] = 0;
		LedStep			= 0;
	}
	
	
	/* Step Control */
	LedTime[0]++;
	if (LedTime[0] >= SLOW_SPEED)
	{
		LedTime[0] = 0;
		LedStep++;
		if (LedStep > 8)		LedStep = 0;
	}
	
	
	/* Mode Control */
	switch (LedStep)
	{
		case 0:	B3OFF; R1ON;		break;
		case 1: R1OFF; R2ON;		break;
		case 2:	R2OFF; R3ON;		break;
		case 3: R3OFF; G1ON;		break;
		case 4:	G1OFF; G2ON;		break;
		case 5: G2OFF; G3ON;		break;
		case 6: G3OFF; B1ON;		break;
		case 7: B1OFF; B2ON;		break;
		case 8: B2OFF; B3ON; 		break;
	}
	
	/* Hold Time */
	HoldTime[0]++;
	if (HoldTime[0] >= 100)	//1s
	{
		HoldTime[0] = 0;
		HoldTime[1]++;
		if (HoldTime[1] >= 30) //1s
		{
			HoldTime[1]		= 0;
			LedData.Mode	= LED_RGB_OFF;
			LedData.InitFlag = TRUE;
		}
	}
}





/*************************************************
	*
	* @FunctionName	Led_G_Fast
	* @Input				None
	* @Output				None
	*
***/
static void Led_G_Fast(void)
{
	/* Initialize */
	if (LedData.InitFlag == TRUE)
	{
		LedData.InitFlag = FALSE;
		R1OFF;	R2OFF;	R3OFF;
		G1OFF;	G2OFF;	G3OFF;
		B1OFF;	B2OFF;	B3OFF;
		LedTime[0] 	= 0;
		LedTime[1] 	= 0;
		HoldTime[0]	= 0;
		HoldTime[1] = 0;
		LedStep			= 0;
	}
	
	
	/* Step Control */
	LedTime[0]++;
	if (LedTime[0] >= FAST_SPEED)
	{
		LedTime[0] = 0;
		LedStep++;
		if (LedStep > 2)		LedStep = 0;
	}
	
	
	/* Mode Control */
	switch (LedStep)
	{
		case 0:	G3OFF; G1ON;		break;
		case 1: G1OFF; G2ON;		break;
		case 2:	G2OFF; G3ON;		break;
	}
	
	
	/* Hold Time */
	HoldTime[0]++;
	if (HoldTime[0] >= 100)	//1s
	{
		HoldTime[0] = 0;
		HoldTime[1]++;
		if (HoldTime[1] >= 5) //5s
		{
			HoldTime[1]		= 0;
			LedData.Mode	= LED_RGB_OFF;
			LedData.InitFlag = TRUE;
			NetChgFlag = FALSE;
		}
	}
}


/*************************************************
	*
	* @FunctionName	Led_B_Slow
	* @Input				None
	* @Output				None
	*
***/
static void Led_B_Slow(void)
{
	static _Uint8 WktCnt;
	
	/* Initialize */
	if (LedData.InitFlag == TRUE)
	{
		LedData.InitFlag = FALSE;
		R1OFF;	R2OFF;	R3OFF;
		G1OFF;	G2OFF;	G3OFF;
		B1OFF;	B2OFF;	B3OFF;
		LedTime[0] 		= 0;
		LedTime[1] 		= 0;
		LedStep				= 0;
		WktCnt				= 0;
	}
	
	/* Step Control */
	LedTime[0]++;
	if (LedTime[0] >= SLOW_SPEED)
	{
		LedTime[0] = 0;
		LedStep++;
	}
	
	/* Mode Control */
	switch (LedStep)
	{
		case 0:	B3OFF; B1ON;		break;
		case 1: B1OFF; B2ON;		break;
		case 2:	B2OFF; B3ON;		break;
		case 3: 
		{
			LedStep 					= 0;
			LedData.Mode			= LED_RGB_OFF;
			LedData.InitFlag	= TRUE;
			
			WktCnt++;
			if (WktCnt >= 10)
			{
				WktCnt = 0;
				LedData.ModeBuf = LED_RGB_OFF;
			}
		} break;
	}
}




/*************************************************
	*
	* @FunctionName	Led_R_Slow
	* @Input				None
	* @Output				None
	*
***/
static void Led_R_Slow(void)
{
	/* Initialize */
	if (LedData.InitFlag == TRUE)
	{
		LedData.InitFlag = FALSE;
		R1OFF;	R2OFF;	R3OFF;
		G1OFF;	G2OFF;	G3OFF;
		B1OFF;	B2OFF;	B3OFF;
		LedTime[0] 	= 0;
		LedTime[1] 	= 0;
		LedStep			= 0;
	}
	
	/* Step Control */
	LedTime[0]++;
	if (LedTime[0] >= FAST_SPEED)
	{
		LedTime[0] = 0;
		LedStep++;
		if (LedStep > 2)		LedStep = 0;
	}
	
	/* Mode Control */
	switch (LedStep)
	{
		case 0:	R3OFF; R1ON;		break;
		case 1: R1OFF; R2ON;		break;
		case 2:	R2OFF; R3ON;		break;
	}
}

