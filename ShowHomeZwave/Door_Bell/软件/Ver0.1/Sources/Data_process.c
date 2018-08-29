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
	* @Description			�ϵ��û����ݳ�ʼ��
	*/
void User_Data_Init(void)
{
	/* �ϵ��ȡ�ϵ�ǰ���� */
	DisplayData.NightR 		= 200;
	DisplayData.NightG 		= 200;
	DisplayData.NightB 		= 200;
	
	
	#if	EPROM_VAL == 1
	DisplayData.ColorToR 	= Eprom_Read(EPROM_COLOR_R);
	DisplayData.ColorToG 	= Eprom_Read(EPROM_COLOR_G);
	DisplayData.ColorToB 	= Eprom_Read(EPROM_COLOR_B);
	DisplayData.Mode			= Eprom_Read(EPROM_MODE);
	DisplayData.Duty	 		= Eprom_Read(EPROM_DUTY);
	#else
	DisplayData.Mode			= 0x2;
	DisplayData.Duty			= 100;
	#endif
	if (DisplayData.Mode == 0x0)		DisplayData.Mode = 0x2;

				

	
	#if EPROM_VAL == 1
	SpkData.VoiceLevel = Eprom_Read(EPROM_VOICE);
	if (SpkData.VoiceLevel != 0)
	{
		SpkData.VoiceFlag 		= TRUE;
		SpkData.VoiceInitFlag	= TRUE;
	}
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
	
	
	/* �ϵ�RF���յı�־λ����� */
	RfData.FlagBuf = 0xFF;
}



/**
	* @Function Name		Data_Process
	* @Parameters				None
	* @Return						None
	* @Description			�����ܴ�����
	*/
void Data_Process(void)
{
	Key_Process();		//��������
	Dial_Process();		//���뿪�ش���
	Color_To_Duty();	//������ɫ΢����Ŀ��ֵ
	Rf_Process();			//RF�������ݴ���
}


/**
	* @Function Name		Key_Process
	* @Parameters				None
	* @Return						None
	* @Description			����ɨ�����ݴ���
	*/
static void Key_Process(void)
{
	if (KeyStatus == KEY_SHORT)
	{
		KeyStatus = KEY_IDLE;
		if (DisplayData.Mode == 0x1)		
		{
			DisplayData.Mode = 0x2;
			Dimmer_Control(DisplayData.ColorDuty);
		}
		else														
		{
			DisplayData.Mode = 0x1;
			Dimmer_Control(DisplayData.NightDuty);
		}
		
		#if EPROM_VAL == 1
		Eprom_Write(EPROM_MODE, DisplayData.Mode);
		#endif
	}
}

/**
	* @Function Name		Dial_Process
	* @Parameters				None
	* @Return						None
	* @Description			���뿪�����ݴ���
	*/
static void Dial_Process(void)
{	
	static _Uint8	HoldTime;
	
	if (DialData.TrigNum > 0)
	{
		DialData.TrigNum--;
//		if (DialData.TrigFlag == TRUE)
//		{
//			DialData.TrigFlag = FALSE;
		
		/*--------------------------ҹ��ģʽ--------------------------------------*/
		if (DisplayData.Mode == 0x1)
		{
			/* Clockwise */
			if (DialData.Status == DIAL_CLKWISE)
			{
				if (DisplayData.NightDuty < 98)		DisplayData.NightDuty += 2;
				Dimmer_Control(DisplayData.NightDuty);
			}
			
			/* Anticlockwise */
			else if (DialData.Status == DIAL_ANTICLKWISE)
			{
				if (DisplayData.NightDuty > 2)		DisplayData.NightDuty -= 2;
				Dimmer_Control(DisplayData.NightDuty);	
			}
			
			#if EPROM_VAL == 1
			Eprom_Write(EPROM_NIGHT_DUTY, DisplayData.NightDuty);
			#endif
		}
		
		
		
		/*---------------------------���ģʽ-------------------------------------*/
		if (DisplayData.Mode == 0x2)
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
	* @Description			RF���ݴ���
	*/
static void Rf_Process(void)
{
	if (RfData.RcvFlag == TRUE)
	{
		RfData.RcvFlag = FALSE;
		
		/* �����յ���ָ��ͷ���ϴ�һ��ʱ,��Ϊ��ͬһ��ָ�����������,��������*/
		if (RfData.FlagBuf == (RfData.RcvData.Opt[0] >> 4))
		{
			return;
		}
		
		/* ָ��� */
		RfData.FlagBuf = RfData.RcvData.Opt[0] >> 4;	//ָ��ͷ�洢
		
		switch (RfData.RcvData.Opt[0] & 0xF)
		{
			//Test
			case 0x0:
			case 0x1:
			{
					SpkData.PlayFlag = TRUE;
			} break;
			
			//Voice
			case 0x2:
			{
				SpkData.VoiceFlag			= TRUE;
				SpkData.VoiceLevel 		= 2- RfData.RcvData.Opt[1];
				SpkData.VoiceInitFlag	= TRUE;
				
				#if	EPROM_VAL == 1
				Eprom_Write(EPROM_VOICE, SpkData.VoiceLevel);
				#endif
			} break;
			
			//Night Mode
			case 0x3:
			{
				if (RfData.RcvData.Opt[1] == 0x0)
				{
					DisplayData.Mode = 0x2;
					if (DisplayData.Duty != DisplayData.ColorDuty)		
					{
						DisplayData.Duty = DisplayData.ColorDuty;
						if (DisplayData.Duty == 0x0)					DisplayData.Dimmer.FreqT 	= 0;
						else																	DisplayData.Dimmer.FreqT = 0x6400 / (_Uint16)DisplayData.Duty ;  // 256 * D%
						
						TIM2_CR1 &= 0xFE;
						TIM2_ARRH = DisplayData.Dimmer.Freq[0];
						TIM2_ARRL = DisplayData.Dimmer.Freq[1];
						TIM2_CR1 |= 0x01;
					}
				}
				else
				{
					DisplayData.Mode = 0x1;
					
					if (DisplayData.Duty != DisplayData.NightDuty)		
					{
						DisplayData.Duty = DisplayData.NightDuty;
						if (DisplayData.Duty == 0x0)					DisplayData.Dimmer.FreqT 	= 0;
						else																	DisplayData.Dimmer.FreqT = 0x6400 / (_Uint16)DisplayData.Duty ;  // 256 * D%
						
						TIM2_CR1 &= 0xFE;
						TIM2_ARRH = DisplayData.Dimmer.Freq[0];
						TIM2_ARRL = DisplayData.Dimmer.Freq[1];
						TIM2_CR1 |= 0x01;
					}
				}
				
				#if	EPROM_VAL == 1
				Eprom_Write(EPROM_MODE, DisplayData.Mode);
				#endif
			} break;
			
			//Dimmer
			case 0x7:
			{
				DisplayData.Duty = RfData.RcvData.Opt[1]; //ȡ��DUTYֵ
				
				if (DisplayData.Duty == 0x0)
				{
					DisplayData.Dimmer.FreqT 	= 0;
				}
				else
				{
					DisplayData.Dimmer.FreqT = 0x6400 / (_Uint16)DisplayData.Duty ;  // 256 * D%
				}
				
				TIM2_CR1 &= 0xFE;
				TIM2_ARRH = DisplayData.Dimmer.Freq[0];
				TIM2_ARRL = DisplayData.Dimmer.Freq[1];
				TIM2_CR1 |= 0x01;
				
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
			} break;
			
			//Color
			case 0x4:
			{
				DisplayData.Mode 	= 0x2;
				
				DisplayData.ColorR 		= RfData.RcvData.Opt[1];
				DisplayData.ColorG		= RfData.RcvData.Opt[2];
				DisplayData.ColorB		= RfData.RcvData.Opt[3];
				
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
	* @Description			��ɫ���䴦��
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
	* @Description			���ȱ仯
	*/
static void Dimmer_Control(_Uint8 DimmerBuffer)
{
		if (DisplayData.Duty != DimmerBuffer)		
		{
			DisplayData.Duty = DimmerBuffer;
			if (DisplayData.Duty == 0x0)					DisplayData.Dimmer.FreqT 	= 0;
			else																	DisplayData.Dimmer.FreqT = 0x6400 / (_Uint16)DisplayData.Duty ;  // 256 * D%
			
			TIM2_CR1 &= 0xFE;
			TIM2_ARRH = DisplayData.Dimmer.Freq[0];
			TIM2_ARRL = DisplayData.Dimmer.Freq[1];
			TIM2_CR1 |= 0x01;
		}
}



	