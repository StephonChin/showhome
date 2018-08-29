/*******************************************************************************
	*
	* @File Name		Speaker.c
	*
*******************************************************************************/

/*Includes--------------------------------------------------------------------*/
#include "Speaker.h"


/*Gloable Variables-----------------------------------------------------------*/
_TypeStructSpeaker SpkData;


/**
	* @Function Name		Speaker_Control
	* @Parameters				None
	* @Return						None
	*/
void Speaker_Control(void)
{
	static _Uint8	PlayTime;
	static _Uint8	ItemTime;
	//static _Uint8	VoiceTime;
	//static _Uint8	VoiceCnt;
	
	/*------------------------Play------------------------*/
	if (SpkData.PlayFlag == TRUE)
	{
		PORT_PLAY = SET;
		PlayTime++;
		if (PlayTime > TQ1015_PULSE_TIME)
		{
			PlayTime = 0;
			SpkData.PlayFlag = FALSE;
		}
	}
	else
	{
		PORT_PLAY = RESET;
		PlayTime	= 0;
	}

	/*------------------------Item-------------------------*/
	if (SpkData.ItemFlag == TRUE)
	{
		SpkData.ItemFlag = FALSE;
		PORT_ITEM = SET;
		ItemTime++;
		if (ItemTime > TQ1015_PULSE_TIME)
		{
			ItemTime = 0;
			SpkData.ItemFlag = FALSE;
		}
	}
	else
	{
		ItemTime  = 0;
		PORT_ITEM = RESET;
	}
	
	/*------------------------Voice------------------------*/
	if (SpkData.VoiceFlag == TRUE)
	{
		
	}
}