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
	
	if (PORT_KEY == 0)
	{
		KeyTime++;
		if (KeyTime > 10)
		{
			KeyTime = 0;
			if (KeyDoneFlag == FALSE)
			{
				KeyDoneFlag = TRUE;
				KeyStatus		= KEY_SHORT;
			}
		}
	}
	else
	{
		KeyTime 		= 0;
		KeyDoneFlag = FALSE;
	}
}