/*******************************************************************************
	*
	* @File Name		Key_Scan.c
	* @Date					2016.12.23
	* @Author				DS.Chin
	* @Description	°´¼üÉ¨Ãè
	*
*******************************************************************************/

/*Include---------------------------------------------------------------------*/
#include "Key_Scan.h"


/*Global Variables------------------------------------------------------------*/
_TypeEnumKey	KeyStatus;


/**
	* @Function Name		Key_Scan
	* @Parameters				None
	* @Return						None
	*/
void Key_Scan(void)
{
	static _Uint8	KeyTime;
	static _Flag	KeyDoneFlag;
	static _Uint8	KeyLongTime;
	
	if (PORT_KEY == 0)
	{
		KeyTime++;
		if (KeyTime > 10)
		{
			KeyTime = 0;
			KeyLongTime++;
			if (KeyLongTime > 100) //5s
			{
				KeyLongTime = 100;
				if (KeyDoneFlag == FALSE)
				{
					KeyDoneFlag = TRUE;
					KeyStatus 	= KEY_LONG;
				}
			}
		}
	}
	else
	{
		if (KeyDoneFlag == FALSE && KeyLongTime > 0)
		{
			KeyStatus = KEY_SHORT;
		}
		KeyTime 			= 0;
		KeyLongTime		= 0;
		KeyDoneFlag 	= FALSE;
	}
}