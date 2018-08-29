/********************************************************************
 * key_scan.c
 */
#include "iostm8s003f3.h"
#include "system.h"
#include "key_scan.h"

/*********************************************************************
 * defines
 */
#define   	PORT_KEY    							PC_IDR_IDR7
#define			DEF_REPLY_REPEAT()				RepeatFlag = TRUE;\
																			RepeatDelayTime = 0;\
																			RepeatCnt = 0
 
/***********************************************************************
 * Global variables
 */

/************************************************************************
* Function Name:	Key_Scan
* Date: 2016.08.11
*************************************************************************/
void Key_Scan(void)
{
	static _Uchar   KeyTime;
  static _Uchar 	KeyPressLongTime;
  static _Uchar		KeyPressLongFlag;
  static _Flag		FadeInOrOut;
	static _Flag		StatusReplyFlag;		//�ظ������־λ
	
	/* ������� */
	static 	_Uint8	PairCnt;
	static  _Uint8	PairTime;
	static	_Uint8	PairKeyDoneFlag;
	static  _Uint8	PairWaitTime;
	
	/* ������� */
	static _Uint8		PowerRstFlag;
	static _Uint8		RstTime[2];
	static _Flag		RstEnableFlag;
  
	/*******************************************************/
	/* ����ɨ�� */
	if (PowerRstFlag == TRUE)
	{
		if (PORT_KEY == 0)
		{
			KeyTime++;
			if (KeyTime > 4) // 50ms
			{
				KeyTime = 0;
				
				KeyPressLongTime++;
				
				// long press
				if (KeyPressLongTime > 15)
				{
					KeyPressLongFlag = TRUE;
					
					if (DimmerDuty != 0)
					{
						// fade in
						if (FadeInOrOut == FALSE)
						{
							if (DimmerDuty < 100)
							{
								DimmerDuty++;
								DimmerDutyBuf = DimmerDuty;
								StatusReplyFlag	= TRUE;
							}
						} // fade in
						
						
						// fade out
						else
						{
							if (DimmerDuty > 10)
							{
								DimmerDuty--;
								DimmerDutyBuf = DimmerDuty;
								StatusReplyFlag	= TRUE;
							}
						} // fade out
					}

				}
			}
		}
		
		else
		{
			// short press
			if ( (KeyPressLongFlag == FALSE) && (KeyPressLongTime > 0) && (KeyPressLongTime < 10) )
			{
				StatusReplyFlag	= TRUE;
					
				if (DimmerDuty > 0)
				{
					DimmerDutyBuf	= DimmerDuty;
					DimmerDuty		= 0;
					AllStatus_One	= 0;
				}
				else
				{
					DimmerDuty		= DimmerDutyBuf;
					if (DimmerDuty == 0)
					{
						DimmerDuty		= 100;
						DimmerDutyBuf = DimmerDuty;
					}
					AllStatus_One	= 1;
				}
			}
			
			/* ÿ�γ�ɨ���л����ⷽ�� */
			else
			if (KeyPressLongFlag == TRUE)
			{
				FadeInOrOut ^= 1;
			}
			
			/* ��0ʱ������100ʱ���� */
			if (DimmerDuty == 0) 			FadeInOrOut = FALSE;
			if (DimmerDuty == 100)		FadeInOrOut = TRUE;
			
			// clear
			KeyTime = 0;
			KeyPressLongTime = 0;
			KeyPressLongFlag= FALSE;
			
			
			/* �ظ� */
			if (StatusReplyFlag)
			{
				StatusReplyFlag = FALSE;
				
				//���ûظ����ݸ�APP
				DEF_REPLY_REPEAT();
				ReplyData.ReplyNum			= 0x03;
				ReplyData.ReplyCmd 			= 0x03;
				ReplyData.ReplyOpt[0] 	= 0x00;	
				ReplyData.ReplyOpt[1]		= 0x02;						//ռ�ձȻظ�
				ReplyData.ReplyOpt[2]		= DimmerDuty;			//����״̬
				ReplyData.ReplyOpt[3]		= 0x00;	
				ReplyData.ReplyOpt[4]		= 0x00;
				ReplyData.ReplyOpt[5]		= 0x00;
				ReplyData.ReplyOpt[6]		= 0x00;
			}
		}
	}
	
	/*******************************************************/
	/* pairing */
	if (PowerRstFlag == TRUE)
	{
		if (PORT_KEY == 0)
		{
			PairWaitTime = 0;
			PairTime++;
			if (PairTime > 5)
			{
				PairTime = 0;
				if (PairKeyDoneFlag == FALSE)
				{
					PairKeyDoneFlag = TRUE;
					PairCnt++;
				}
			}
		}
		else
		{
			PairTime	= 0;
			PairKeyDoneFlag = FALSE;
			
			/* �޶��찴���Ϊ1s */
			PairWaitTime++;
			if (PairWaitTime > 50) //1s
			{
				PairWaitTime = 0;
				PairCnt			= 0;
			}
			
			/* �찴���ν������ */
			if (PairCnt > 2)
			{
				PairCnt = 0;
				
				ReplyData.ReplyNum		= 0x01;
				ReplyData.ReplyCmd 		= 0x01;
				
				if (IDValue.ID1 == 0 &&
						IDValue.ID2 == 0 &&
						IDValue.ID3 == 0 &&
						IDValue.ID4 == 0)
				{
					ReplyData.ReplyOpt[0] = 0x01;
				}
				else
				{
					ReplyData.ReplyOpt[0] = 0x02;
				}
				
				ReplyData.ReplyOpt[1] = IDValue.ID1;
				ReplyData.ReplyOpt[2] = IDValue.ID2;
				ReplyData.ReplyOpt[3] = IDValue.ID3;
				ReplyData.ReplyOpt[4] = IDValue.ID4;
				ReplyData.ReplyOpt[5] = 0x00;
				ReplyData.ReplyOpt[6] = 0x00;		
				DEF_REPLY_REPEAT();
			}
		}
	}
	
	
	/*******************************************************/
	/* ��λ */
	if (PowerRstFlag == FALSE)
	{
		if (PORT_KEY == 0)
		{
			RstTime[0]++;
			if (RstTime[0] > 100) //1s
			{
				RstTime[0] = 0;
				RstTime[1]++;
				if (RstTime[1] > 2) //3s
				{
					RstTime[1] = 0;
					RstEnableFlag = TRUE;
					PowerRstFlag 	= TRUE;
				}
			}
		}
		else
		{
			PowerRstFlag = TRUE;
		}
	}
	else
	{
		if (RstEnableFlag == TRUE)
		{
			RstEnableFlag = FALSE;
			IDValue.ID1 = 0;
			IDValue.ID2 = 0;
			IDValue.ID3 = 0;
			IDValue.ID4 = 0;
			
			Eprom_Write();
			
			ReplyData.ReplyNum		= 0x01;
			ReplyData.ReplyCmd 		= 0x01;
			ReplyData.ReplyOpt[0]	= 0x03;
			ReplyData.ReplyOpt[1] = IDValue.ID1;
			ReplyData.ReplyOpt[2] = IDValue.ID2;
			ReplyData.ReplyOpt[3] = IDValue.ID3;
			ReplyData.ReplyOpt[4] = IDValue.ID4;
			ReplyData.ReplyOpt[5] = 0x00;
			ReplyData.ReplyOpt[6] = 0x00;		
			DEF_REPLY_REPEAT();
		}
	}
}
                                        
															