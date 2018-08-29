/*******************************************************************************
	*
	* @File Name	Data_Process.c
	*
*******************************************************************************/
#include "Data_Process.h"



/**
	* @Function Name		Data_Process
	* @Parameters				None
	* @Return						None
	*/
void Data_Process(void)
{
	Key_Process();	//按键处理
	Dial_Process();	//拨码开关处理
}


/**
	* @Function Name		Key_Process
	* @Parameters				None
	* @Return						None
	*/
static void Key_Process(void)
{
	if (KeyStatus == KEY_SHORT)
	{
		KeyStatus = KEY_IDLE;
		SpkData.PlayFlag = TRUE;
	}
}

/**
	* @Function Name		Dial_Process
	* @Parameters				None
	* @Return						None
	*/
static void Dial_Process(void)
{	
	if (DialData.TrigNum >= 2)
	{
		DialData.TrigNum = 0;
		
		DisplayData.InitFlag = TRUE;

		switch (DisplayData.RollStep)
		{
			//-------------------------------Red Blue-------------------------------//
			case 0:
			{
				/**
					* @ Clockwise
					*/
				if (DialData.Status == DIAL_CLKWISE)
				{
					if (DisplayData.ColorR < 230)					DisplayData.ColorR += 15;
					else if (DisplayData.ColorR < 255)		DisplayData.ColorR = 255;	
					
					if (DisplayData.ColorB > 20)					DisplayData.ColorB -= 15;
					else if (DisplayData.ColorB > 0)			DisplayData.ColorB = 0;
					
					if (DisplayData.ColorR == 255 && DisplayData.ColorB == 0)
					{
						DisplayData.RollStep++;
					}
				}
				
				/**
					* @Anticlockwise
					*/
				else if (DialData.Status == DIAL_ANTICLKWISE)
				{
					if (DisplayData.ColorR > 20)					DisplayData.ColorR -= 15;
					else if (DisplayData.ColorR > 0)			DisplayData.ColorR = 0;
					
					if (DisplayData.ColorB < 230)					DisplayData.ColorB += 15;
					else if (DisplayData.ColorB < 255)		DisplayData.ColorB = 255;
					
					if (DisplayData.ColorR == 0 && DisplayData.ColorB == 255)
					{
						DisplayData.RollStep++;
					}
				}
			} break;
		
			//--------------------------------Green Red-------------------------------//
			case 1:
			{
				/**
					* @Clockwise
					*/
				if (DialData.Status == DIAL_CLKWISE)
				{	
					if (DisplayData.ColorG < 230)					DisplayData.ColorG += 15;
					else if (DisplayData.ColorG < 255)		DisplayData.ColorG = 255;
					
					if (DisplayData.ColorR > 20)					DisplayData.ColorR -= 15;
					else if (DisplayData.ColorR > 0)			DisplayData.ColorR = 0;
					
					if (DisplayData.ColorG == 255 && DisplayData.ColorR == 0)
					{;
						DisplayData.RollStep++;
					}
				}
				
				/**
					* @Anticlockwise
					*/
				else if (DialData.Status == DIAL_ANTICLKWISE)
				{
					if (DisplayData.ColorG > 20)					DisplayData.ColorG -= 15;
					else if (DisplayData.ColorG > 0)			DisplayData.ColorG = 0;
					
					if (DisplayData.ColorR < 230)					DisplayData.ColorR += 15;
					else if (DisplayData.ColorR < 255)		DisplayData.ColorR = 255;
					
					if (DisplayData.ColorG == 0 && DisplayData.ColorR == 255)
					{
						DisplayData.RollStep++;
					}
				}
			} break;
		
		//--------------------------------Blue Green------------------------------//
			case 2:
			{
				/**
					* @Clockwise
					*/
				if (DialData.Status == DIAL_CLKWISE)
				{
					if (DisplayData.ColorB < 230)					DisplayData.ColorB += 15;
					else if (DisplayData.ColorB < 255)		DisplayData.ColorB = 255;
					
					if (DisplayData.ColorG > 20)					DisplayData.ColorG -= 15;
					else if (DisplayData.ColorG > 0)			DisplayData.ColorG = 0;
					
					if (DisplayData.ColorB == 255 && DisplayData.ColorG == 0)
					{
						DisplayData.RollStep = 0;
					}
				}
				
				/**
					* @Anticlockwise
					*/
				else if (DialData.Status == DIAL_ANTICLKWISE)
				{
					DisplayData.ClkwiseStep = 0;
					
					if (DisplayData.ColorB > 20)					DisplayData.ColorB -= 15;
					else if (DisplayData.ColorB > 0)			DisplayData.ColorB = 0;
					
					if (DisplayData.ColorG < 230)					DisplayData.ColorG += 15;
					else if (DisplayData.ColorG < 255)		DisplayData.ColorG = 255;
					
					if (DisplayData.ColorB == 0 && DisplayData.ColorG == 255)
					{
						DisplayData.RollStep = 0;
					}
				}
			} break;
		}
	}
}



	