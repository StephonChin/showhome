/*******************************************************************************
	*
	* @File Name	Data_Process.c
	*
*******************************************************************************/
#include "Data_Process.h"


/**
	* @Function Name		User_Data_Init
	* @Parameters				None
	* @Return						None
	* @Description			上电用户数据初始化
	*/
void User_Data_Init(void)
{
	/* 上电读取断电前记忆 */
	DisplayData.NightR 		= 200;
	DisplayData.NightG 		= 200;
	DisplayData.NightB 		= 200;
	
	
	#if	EPROM_VAL == 1
	DisplayData.ColorToR 	= Eprom_Read(EPROM_COLOR_R);
	DisplayData.ColorToG 	= Eprom_Read(EPROM_COLOR_G);
	DisplayData.ColorToB 	= Eprom_Read(EPROM_COLOR_B);
	DisplayData.Mode			= Eprom_Read(EPROM_MODE);
	DisplayData.Duty	 		= Eprom_Read(EPROM_DUTY);
	if (DisplayData.ColorToR == 0 && DisplayData.ColorToG == 0 && DisplayData.ColorToB == 0)
	{
		DisplayData.ColorToG = 255;
	}
	#else
	DisplayData.Mode			= 0x2;
	DisplayData.Duty			= 100;
	#endif
	if (DisplayData.Mode == 0x0)		DisplayData.Mode = 0x2;

				

	
	#if EPROM_VAL == 1
	SpkData.VoiceLevel = Eprom_Read(EPROM_VOICE);
	SpkData.VoiceLevelBuf = SpkData.VoiceLevel;
	#endif
	
	#if EPROM_VAL == 1
	DisplayData.ColorDuty	= Eprom_Read(EPROM_COLOR_DUTY);
	DisplayData.NightDuty	= Eprom_Read(EPROM_NIGHT_DUTY);
	
	if (DisplayData.ColorDuty == 0x0)	{	DisplayData.ColorDuty = 100;	Eprom_Write(EPROM_COLOR_DUTY, DisplayData.ColorDuty);}
	if (DisplayData.NightDuty == 0x0)	{	DisplayData.NightDuty = 100;	Eprom_Write(EPROM_COLOR_DUTY, DisplayData.NightDuty);}
	
	if (DisplayData.Mode == 0x1)	DisplayData.Duty = DisplayData.NightDuty;
	else													DisplayData.Duty = DisplayData.ColorDuty;
	
	if (DisplayData.Duty == 0x0)					DisplayData.Dimmer.FreqT 	= 0;
	else																	DisplayData.Dimmer.FreqT = 0x6400 / (_Uint16)DisplayData.Duty ;  // 256 * D%
	
	TIM2_CR1 &= 0xFE;
	TIM2_ARRH = DisplayData.Dimmer.Freq[0];
	TIM2_ARRL = DisplayData.Dimmer.Freq[1];
	TIM2_CR1 |= 0x01;
	
	#endif
	
	
	/* 上电RF接收的标志位置最大 */
	RfData.FlagBuf = 0xFF;
}



/**
	* @Function Name		Data_Process
	* @Parameters				None
	* @Return						None
	* @Description			数据总处理函数
	*/
void Data_Process(void)
{
	Key_Process();		//按键处理
	Dial_Process();		//拨码开关处理
	Color_To_Duty();	//控制颜色微变至目标值
	Rf_Process();			//RF接收数据处理
}


/**
	* @Function Name		Key_Process
	* @Parameters				None
	* @Return						None
	* @Description			按键扫描数据处理
	*/
static void Key_Process(void)
{
	if (KeyStatus == KEY_SHORT)
	{
		KeyStatus = KEY_IDLE;
		
		SpkData.PlayFlag = TRUE;
		
//		if (DisplayData.Mode == 0x1)		
//		{
//			DisplayData.Mode = 0x2;
//			Dimmer_Control(DisplayData.ColorDuty);
//		}
//		else														
//		{
//			DisplayData.Mode = 0x1;
//			Dimmer_Control(DisplayData.NightDuty);
//		}
//		
//		#if EPROM_VAL == 1
//		Eprom_Write(EPROM_MODE, DisplayData.Mode);
//		#endif
	}
//	else if (KeyStatus == KEY_LONG)
//	{
//		KeyStatus = KEY_IDLE;
//		
//		Eprom_Write(EPROM_MODE, 2);
//		Eprom_Write(EPROM_COLOR_R, 0);
//		Eprom_Write(EPROM_COLOR_G, 100);
//		Eprom_Write(EPROM_COLOR_B, 0);
//		Eprom_Write(EPROM_COLOR_DUTY, 100);
//		Eprom_Write(EPROM_NIGHT_DUTY, 100);
//		Eprom_Write(EPROM_VOICE, 0);
//		
//		DisplayData.Mode = 2;
//		DisplayData.ColorDuty = 100;
//		Dimmer_Control(100);
//		DisplayData.ColorToR = 0;
//		DisplayData.ColorToG = 100;
//		DisplayData.ColorToB = 0;
//		SpkData.VoiceLevel = 0;
//		SpkData.VoiceFlag = TRUE;
//		SpkData.VoiceInitFlag = TRUE;
//	}
}

/**
	* @Function Name		Dial_Process
	* @Parameters				None
	* @Return						None
	* @Description			拨码开关数据处理
	*/
static void Dial_Process(void)
{	
	static _Uint8	HoldTime;
	
	if (DialData.TrigNum > 0)
	{
		DialData.TrigNum--;
		
		
//		/*--------------------------夜景模式--------------------------------------*/
//		if (DisplayData.Mode == 0x1)
//		{
//			/* Clockwise */
//			if (DialData.Status == DIAL_CLKWISE)
//			{
//				if (DisplayData.NightDuty < 98)		DisplayData.NightDuty += 2;
//				Dimmer_Control(DisplayData.NightDuty);
//			}
//			
//			/* Anticlockwise */
//			else if (DialData.Status == DIAL_ANTICLKWISE)
//			{
//				if (DisplayData.NightDuty > 2)		DisplayData.NightDuty -= 2;
//				Dimmer_Control(DisplayData.NightDuty);	
//			}
//			
//			#if EPROM_VAL == 1
//			Eprom_Write(EPROM_NIGHT_DUTY, DisplayData.NightDuty);
//			#endif
//		}
//		
//		
//		
//		/*---------------------------多彩模式-------------------------------------*/
//		if (DisplayData.Mode == 0x2)
		{
			switch (DisplayData.RollStep)
			{
				////////  RED BLUE  ////////////////////////////////////////////////////
				case 0:
				{
					/* Clockwise */
					if (DialData.Status == DIAL_CLKWISE)
					{
						if (DisplayData.ColorToR < COLOR_MAX)					DisplayData.ColorToR += COLOR_LEVEL;
						else if (DisplayData.ColorToR < 255)					DisplayData.ColorToR = 255;	
						
						if (DisplayData.ColorToB > COLOR_MIN)						DisplayData.ColorToB -= COLOR_LEVEL;
						else if (DisplayData.ColorToB > 0)							DisplayData.ColorToB = 0;
						
						if (DisplayData.ColorR == 255 && DisplayData.ColorB == 0)
						{
							DisplayData.RollStep++;
							HoldTime = 0;
						}
					}
					
					/* Anticlockwise */
					else if (DialData.Status == DIAL_ANTICLKWISE)
					{
						if (DisplayData.ColorToR > COLOR_MIN)					DisplayData.ColorToR -= COLOR_LEVEL;
						else if (DisplayData.ColorToR > 0)						DisplayData.ColorToR = 0;
						
						if (DisplayData.ColorToB < COLOR_MAX)					DisplayData.ColorToB += COLOR_LEVEL;
						else if (DisplayData.ColorToB < 255)					DisplayData.ColorToB = 255;
						
						if (DisplayData.ColorR == 0 && DisplayData.ColorB == 255)
						{
							DisplayData.RollStep = 5;
							HoldTime = 0;
						}
					}
				} break;
				
				
				///////// Hold  ////////////////////////////////////////////////////////
				case 1:
				{
					HoldTime++;
					if (HoldTime >= HOLD_TIME)
					{
						HoldTime = 0;
						if (DialData.Status == DIAL_CLKWISE)						DisplayData.RollStep++;
						else if (DialData.Status == DIAL_ANTICLKWISE)		DisplayData.RollStep--;
					}
				} break;
				
				
				////////  RED GREEN  ///////////////////////////////////////////////////
				case 2:
				{
					/* Clockwise */
					if (DialData.Status == DIAL_CLKWISE)
					{
						if (DisplayData.ColorToG < COLOR_MAX)					DisplayData.ColorToG += COLOR_LEVEL;
						else if (DisplayData.ColorToG < 255)					DisplayData.ColorToG = 255;
						
						if (DisplayData.ColorToR > COLOR_MIN)					DisplayData.ColorToR -= COLOR_LEVEL;
						else if (DisplayData.ColorToR > 0)						DisplayData.ColorToR = 0;
						
						if (DisplayData.ColorG == 255 && DisplayData.ColorR == 0)
						{
							DisplayData.RollStep++;
							HoldTime = 0;
						}
					}
					
					/* Anticlockwise Red GREEN */
					else if (DialData.Status == DIAL_ANTICLKWISE)
					{
						if (DisplayData.ColorToG > COLOR_MIN)					DisplayData.ColorToG -= COLOR_LEVEL;
						else if (DisplayData.ColorToG > 0)						DisplayData.ColorToG = 0;
						
						if (DisplayData.ColorToR < COLOR_MAX)					DisplayData.ColorToR += COLOR_LEVEL;
						else if (DisplayData.ColorToR < 255)					DisplayData.ColorToR = 255;
						
						if (DisplayData.ColorG == 0 && DisplayData.ColorR == 255)
						{
							DisplayData.RollStep--;
							HoldTime = 0;
						}
					}
				} break;
				
				
				///////// Hold  ////////////////////////////////////////////////////////
				case 3:
				{
					HoldTime++;
					if (HoldTime >= HOLD_TIME)
					{
						HoldTime = 0;
						if (DialData.Status == DIAL_CLKWISE)						DisplayData.RollStep++;
						else if (DialData.Status == DIAL_ANTICLKWISE)		DisplayData.RollStep--;
					}
				} break;
			
				
				//////////  Green Blue  ////////////////////////////////////////////////
				case 4:
				{
					/* Clockwise */
					if (DialData.Status == DIAL_CLKWISE)
					{	
						if (DisplayData.ColorToB < COLOR_MAX)					DisplayData.ColorToB += COLOR_LEVEL;
						else if (DisplayData.ColorToB < 255)					DisplayData.ColorToB = 255;
						
						if (DisplayData.ColorToG > COLOR_MIN)					DisplayData.ColorToG -= COLOR_LEVEL;
						else if (DisplayData.ColorToG > 0)						DisplayData.ColorToG = 0;
						
						if (DisplayData.ColorB == 255 && DisplayData.ColorG == 0)
						{;
							DisplayData.RollStep++;
							HoldTime = 0;
						}
					}
					
					/* Anticlockwise Green Blue */
					else if (DialData.Status == DIAL_ANTICLKWISE)
					{
						if (DisplayData.ColorToB > COLOR_MIN)					DisplayData.ColorToB -= COLOR_LEVEL;
						else if (DisplayData.ColorToB > 0)						DisplayData.ColorToB = 0;
						
						if (DisplayData.ColorToG < COLOR_MAX)					DisplayData.ColorToG += COLOR_LEVEL;
						else if (DisplayData.ColorToG < 255)					DisplayData.ColorToG = 255;
						
						if (DisplayData.ColorB == 0 && DisplayData.ColorG == 255)
						{
							DisplayData.RollStep--;
							HoldTime = 0;
						}
					}
				} break;
				
				///////// Hold  ////////////////////////////////////////////////////////
				case 5:
				{
					HoldTime++;
					if (HoldTime >= HOLD_TIME)
					{
						HoldTime = 0;
						if (DialData.Status == DIAL_CLKWISE)						DisplayData.RollStep = 0;
						else if (DialData.Status == DIAL_ANTICLKWISE)		DisplayData.RollStep--;
					}
				} break;
				
			}
			
			#if	EPROM_VAL == 1
			Eprom_Write(EPROM_COLOR_R, DisplayData.ColorToR);
			Eprom_Write(EPROM_COLOR_G, DisplayData.ColorToG);
			Eprom_Write(EPROM_COLOR_B, DisplayData.ColorToB);
			#endif
		}	
	}
}


/**
	* @Function Name		Rf_Process
	* @Parameters				None
	* @Return						None
	* @Description			RF数据处理
	*/
static void Rf_Process(void)
{
	if (RfData.RcvFlag == TRUE)
	{
		RfData.RcvFlag = FALSE;
		
		/* 当接收到的指令头与上次一致时,认为是同一条指令的连续发送,不作处理*/
		if (RfData.FlagBuf == (RfData.RcvData.Opt[0] >> 4))
		{
			return;
		}
		
		/* 指令处理 */
		RfData.FlagBuf = RfData.RcvData.Opt[0] >> 4;	//指令头存储
		
		switch (RfData.RcvData.Opt[0] & 0xF)
		{
			//KEY TEST
			case 0x0:
			{
				if (		(RfData.RcvData.Opt[1] == 0x0 
						&& 	RfData.RcvData.Opt[2] == 0x0 
						&& 	RfData.RcvData.Opt[3] == 0x0)
						||
						(RfData.RcvData.Opt[1] == 0xff 
						&& 	RfData.RcvData.Opt[2] == 0x0 
						&& 	RfData.RcvData.Opt[3] == 0xff)	
						)		
				SpkData.PlayFlag = TRUE;
			} break;
			
			// APP TEST
			case 0x1:
			{
				if (		(RfData.RcvData.Opt[1] == 0x0 
						&& 	RfData.RcvData.Opt[2] == 0x0 
						&& 	RfData.RcvData.Opt[3] == 0x0)
						||
						(RfData.RcvData.Opt[1] == 0xff 
						&& 	RfData.RcvData.Opt[2] == 0x0 
						&& 	RfData.RcvData.Opt[3] == 0xff)	
						)		
				{
					SpkData.PlayFlag = TRUE;
				}
				
			} break;
			
			//Voice
			case 0x2:
			{
				if (	(	RfData.RcvData.Opt[2] == 0x0 && RfData.RcvData.Opt[3] == 0x0)
						||(	RfData.RcvData.Opt[2] == 0x0 && RfData.RcvData.Opt[3] == 0xff)	
					 )		
				{
					if (RfData.RcvData.Opt[1] > 3 || RfData.RcvData.Opt[1] < 1)
					{
						break;
					}
					SpkData.VoiceFlag			= TRUE;
					SpkData.VoiceLevel 		= 3 - RfData.RcvData.Opt[1];
					SpkData.VoiceInitFlag	= TRUE;
					
					#if	EPROM_VAL == 1
					Eprom_Write(EPROM_VOICE, SpkData.VoiceLevel);
					#endif
				}
			} break;
			
			//Night Mode
			case 0x3:
			{
				if (	(	RfData.RcvData.Opt[2] == 0x0 && RfData.RcvData.Opt[3] == 0x0)
						||(	RfData.RcvData.Opt[2] == 0x0 && RfData.RcvData.Opt[3] == 0xff)	
					 )		
				{
					if (RfData.RcvData.Opt[1] > 1)
					{
						break;
					}
				
					if (RfData.RcvData.Opt[1] == 0x0)
					{
						DisplayData.Mode = 0x2;
						Dimmer_Control(DisplayData.ColorDuty);
					}
					else
					{
						DisplayData.Mode = 0x1;
						Dimmer_Control(DisplayData.NightDuty);
					}
					
					#if	EPROM_VAL == 1
					Eprom_Write(EPROM_MODE, DisplayData.Mode);
					#endif
				}
			} break;
			
			//Dimmer
			case 0x5:
			{
				if (	(	RfData.RcvData.Opt[2] == 0x0 && RfData.RcvData.Opt[3] == 0x0)
						||(	RfData.RcvData.Opt[2] == 0x0 && RfData.RcvData.Opt[3] == 0xff)	
					 )		
				{
					if (RfData.RcvData.Opt[1] > 100)
					{
						break;
					}
				
					Dimmer_Control(RfData.RcvData.Opt[1]);
					
					if (DisplayData.Mode == 0x2)
					{
						DisplayData.ColorDuty	= DisplayData.Duty;
						#if EPROM_VAL == 1
						Eprom_Write(EPROM_COLOR_DUTY, DisplayData.ColorDuty);
						#endif
					}
					else
					{
						DisplayData.NightDuty	= DisplayData.Duty;
						#if EPROM_VAL == 1
						Eprom_Write(EPROM_NIGHT_DUTY, DisplayData.NightDuty);
						#endif
					}
				}
			} break;
			
			//Color
			case 0x4:
			{
				DisplayData.Mode 	= 0x2;
				
				DisplayData.ColorToR 		= RfData.RcvData.Opt[1];
				DisplayData.ColorToG		= RfData.RcvData.Opt[2];
				DisplayData.ColorToB		= RfData.RcvData.Opt[3];
				
				#if	EPROM_VAL == 1
				Eprom_Write(EPROM_COLOR_R, DisplayData.ColorR);
				Eprom_Write(EPROM_COLOR_G, DisplayData.ColorG);
				Eprom_Write(EPROM_COLOR_B, DisplayData.ColorB);
				#endif
			} break;
			
			default:	
			{
				RfData.RcvFlag = FALSE;
			}break;
		}
	}
}


/*******************************************************************************
	* @Function Name		Color_To_Duty
	* @Parameters				None
	* @Return						None
	* @Description			颜色渐变处理
	*/
static void Color_To_Duty(void)
{
	if (DisplayData.ColorR < DisplayData.ColorToR)				DisplayData.ColorR++;
	else if (DisplayData.ColorR > DisplayData.ColorToR)		DisplayData.ColorR--;

	if (DisplayData.ColorG < DisplayData.ColorToG)				DisplayData.ColorG++;
	else if (DisplayData.ColorG > DisplayData.ColorToG)		DisplayData.ColorG--;
	
	if (DisplayData.ColorB < DisplayData.ColorToB)				DisplayData.ColorB++;
	else if (DisplayData.ColorB > DisplayData.ColorToB)		DisplayData.ColorB--;
}


/*******************************************************************************
	* @Function Name		Dimmer_Control
	* @Parameters				None
	* @Return						None
	* @Description			亮度变化
	*/
static void Dimmer_Control(_Uint8 DimmerBuffer)
{
	if (DisplayData.Duty != DimmerBuffer)		
	{
		DisplayData.Duty = DimmerBuffer;
		
		if (DisplayData.Duty == 0x0)					DisplayData.Dimmer.FreqT 	= 0;
		else																	DisplayData.Dimmer.FreqT = 0x6400 / (_Uint16)DisplayData.Duty ;  // 256 * D%
		
		TIM2_CR1 &= 0xFE;
		TIM2_CNTRH = 0x0;
		TIM2_CNTRL = 0x0;
		TIM2_ARRH = DisplayData.Dimmer.Freq[0];
		TIM2_ARRL = DisplayData.Dimmer.Freq[1];
		TIM2_CR1 |= 0x01;
	}
}



	