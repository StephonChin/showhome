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
	static _Uint8	VoiceTime;
	static _Uint8	VoiceCnt;
	static _Uint8	VoiceStep;
	
	/*------------------------����------------------------*/
	if (SpkData.PlayFlag == TRUE)
	{
		PORT_PLAY = SET;
		PlayTime++;
		if (PlayTime >= TQ1015_PULSE_TIME)
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

	
	
	
	
	/*------------------------��Ŀ-------------------------*/
	if (SpkData.ItemFlag == TRUE)
	{
		PORT_ITEM = SET;
		ItemTime++;
		if (ItemTime >= TQ1015_PULSE_TIME)
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
	
	
	
	
	
	/*------------------------����------------------------*/
	if (SpkData.VoiceFlag == TRUE)
	{
		if (SpkData.VoiceInitFlag == TRUE)
		{
			SpkData.VoiceInitFlag = FALSE;
			
			/*Ŀ�������ȵ�ǰ����С*/
			if (SpkData.VoiceLevelBuf < SpkData.VoiceLevel)
			{
				VoiceCnt = SpkData.VoiceLevel - SpkData.VoiceLevelBuf;
			}
			
			/*Ŀ�������ȵ�ǰ������*/
			else if (SpkData.VoiceLevelBuf > SpkData.VoiceLevel)
			{
				VoiceCnt = SpkData.VoiceLevel + 4 - SpkData.VoiceLevelBuf;
			}
			
			/*��ǰ����ʱ,�ط�һ������*/
			else if (SpkData.VoiceLevelBuf == SpkData.VoiceLevel)
			{
				SpkData.VoiceFlag = FALSE;
				SpkData.PlayFlag	= TRUE;
			}
			
			SpkData.VoiceLevelBuf = SpkData.VoiceLevel;
			VoiceStep = 0;
			return;
		}
		
		/*������������*/
		switch (VoiceStep)
		{
			case 0:
			{
				PORT_VOICE = SET;
				VoiceTime++;
				if (VoiceTime >= TQ1015_PULSE_TIME)
				{
					VoiceTime = 0;
					VoiceStep++;
				}
			} break;
			
			case 1:
			{
				PORT_VOICE = RESET;
				VoiceTime++;
				if (VoiceTime >= 6)
				{
					VoiceTime = 0;
					VoiceCnt--;
					if (VoiceCnt == 0)	SpkData.VoiceFlag = FALSE;
					else								VoiceStep++;
				}
			}
		}
	}
}