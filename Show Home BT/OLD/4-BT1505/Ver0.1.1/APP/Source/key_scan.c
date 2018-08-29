/********************************************************************
 * key_scan.c
 */
#include "iostm8s003f3.h"
#include "system.h"
#include "key_scan.h"
#include "Eprom.h"

/*********************************************************************
 * defines
 */
#define   	PORT_KEY_3    						PD_IDR_IDR2
#define			PORT_KEY_4								PD_IDR_IDR3
#define			PORT_KEY_2								PD_IDR_IDR1
#define			PORT_KEY_1								PC_IDR_IDR7
#define			PORT_KEY_0								PB_IDR_IDR5

#define			PORT_SWITCH_0							PA_ODR_ODR3
#define			PORT_SWITCH_1							PC_ODR_ODR6
#define			PORT_SWITCH_2							PC_ODR_ODR3
#define			PORT_SWITCH_3							PC_ODR_ODR4
#define			PORT_SWITCH_4							PC_ODR_ODR5

#define			DEF_REPLY_REPEAT()				RepeatFlag = TRUE;\
																			RepeatDelayTime = 0;\
																			RepeatCnt = 0
 
/***********************************************************************
 * Global variables
 */

 
/**********************************************************************
 * Function
 */
void Key_Scan(void)
{
	static _Flag		StatusReplyFlag;
  static _Uchar   KeyTime[5];
  static _Flag    KeyPressDone[5];
	
	/* 对码参数 */
	static 	_Uint8	PairCnt;
	static  _Uint8	PairTime;
	static	_Uint8	PairKeyDoneFlag;
	static  _Uint8	PairWaitTime;
	
	/* 清码参数 */
	static _Uint8		PowerRstFlag;
	static _Uint8		RstTime[2];
	static _Flag		RstEnableFlag;
  
	if (PowerRstFlag == TRUE)
	{
		/**************************************/
		/* Key - 0 */
		if (PORT_KEY_0 == 0)
		{
			if (KeyPressDone[0] == FALSE)
			{
				KeyTime[0]++;
				
				if (KeyTime[0] > 5)  // 60ms
				{
					KeyTime[0] = 0;
					KeyPressDone[0] = TRUE;
					
					//更改按键状态
					if (PORT_SWITCH_0	 == 1)
					{
						PORT_SWITCH_0	 	= 0;
						AllStatus_One		= 0;		//按键状态实时更新
					}
					else
					{
						PORT_SWITCH_0	 	= 1;
						AllStatus_One		= 1;		//按键状态实时更新
					}
					
					StatusReplyFlag 	= TRUE;
					
				} //60ms
			} // KeyPressDone == FALSE;
		} // when press key
		
		/* when key released */
		else
		{
			KeyTime[0] 			= 0;
			KeyPressDone[0] = FALSE;
		} //when key released
		
		
		/**************************************/
		/* Key - 1 */
		if (PORT_KEY_1 == 0)
		{
			if (KeyPressDone[1] == FALSE)
			{
				KeyTime[1]++;
				
				if (KeyTime[1] > 5)  // 60ms
				{
					KeyTime[1] = 0;
					KeyPressDone[1] = TRUE;
					
					//更改按键状态
					if (PORT_SWITCH_1	 == 1)
					{
						PORT_SWITCH_1	 	= 0;
						AllStatus_Two		= 0;		//按键状态实时更新
					}
					else
					{
						PORT_SWITCH_1	 	= 1;
						AllStatus_Two		= 1;		//按键状态实时更新
					}
					
					StatusReplyFlag 	= TRUE;
					
				} //60ms
			} // KeyPressDone == FALSE;
		} // when press key
		
		/* when key released */
		else
		{
			KeyTime[1] 			= 0;
			KeyPressDone[1] = FALSE;
		} //when key released
		
		
		/**************************************/
		/* Key - 2 */
		if (PORT_KEY_2 == 0)
		{
			if (KeyPressDone[2] == FALSE)
			{
				KeyTime[2]++;
				
				if (KeyTime[2] > 5)  // 60ms
				{
					KeyTime[2] = 0;
					KeyPressDone[2] = TRUE;
					
					//更改按键状态
					if (PORT_SWITCH_2	 == 1)
					{
						PORT_SWITCH_2	 	= 0;
						AllStatus_Three		= 0;		//按键状态实时更新
					}
					else
					{
						PORT_SWITCH_2	 	= 1;
						AllStatus_Three		= 1;		//按键状态实时更新
					}
					
					StatusReplyFlag 	= TRUE;
					
				} //60ms
			} // KeyPressDone == FALSE;
		} // when press key
		
		/* when key released */
		else
		{
			KeyTime[2] 			= 0;
			KeyPressDone[2] = FALSE;
		} //when key released
		
		
		/**************************************/
		/* Key - 3 */
		if (PORT_KEY_3 == 0)
		{
			if (KeyPressDone[3] == FALSE)
			{
				KeyTime[3]++;
				
				if (KeyTime[3] > 5)  // 60ms
				{
					KeyTime[3] = 0;
					KeyPressDone[3] = TRUE;
					
					//更改按键状态
					if (PORT_SWITCH_3	 == 1)
					{
						PORT_SWITCH_3	 	= 0;
						AllStatus_Four		= 0;		//按键状态实时更新
					}
					else
					{
						PORT_SWITCH_3	 	= 1;
						AllStatus_Four		= 1;		//按键状态实时更新
					}
					
					StatusReplyFlag 	= TRUE;
					
				} //60ms
			} // KeyPressDone == FALSE;
		} // when press key
		
		/* when key released */
		else
		{
			KeyTime[3] 			= 0;
			KeyPressDone[3] = FALSE;
		} //when key released
		
		
		/**************************************/
		/* Key - 4 */
		if (PORT_KEY_4 == 0)
		{
			if (KeyPressDone[4] == FALSE)
			{
				KeyTime[4]++;
				
				if (KeyTime[4] > 5)  // 60ms
				{
					KeyTime[4] = 0;
					KeyPressDone[4] = TRUE;
					
					//更改按键状态
					if (PORT_SWITCH_4	 == 1)
					{
						PORT_SWITCH_4	 	= 0;
						AllStatus_Five		= 0;		//按键状态实时更新
					}
					else
					{
						PORT_SWITCH_4	 	= 1;
						AllStatus_Five		= 1;		//按键状态实时更新
					}
					
					StatusReplyFlag 	= TRUE;
					
				} //60ms
			} // KeyPressDone == FALSE;
		} // when press key
		
		/* when key released */
		else
		{
			KeyTime[4] 			= 0;
			KeyPressDone[4] = FALSE;
		} //when key released
		
		
		
		//数据回复
		if (StatusReplyFlag)
		{
			StatusReplyFlag = FALSE;
			//设置回复数据给APP
			DEF_REPLY_REPEAT();
			ReplyData.ReplyNum			= 0x02;
			ReplyData.ReplyCmd 			= 0x02;							// 回复数据指令字	
			ReplyData.ReplyOpt[0]		= AllStatus;					// 开关状态
			ReplyData.ReplyOpt[1]		= 0x00;
			ReplyData.ReplyOpt[2]		= AllPrgCheckSum[0];
			ReplyData.ReplyOpt[3]		= AllPrgCheckSum[1];
			ReplyData.ReplyOpt[4]		= AllPrgCheckSum[2];
			ReplyData.ReplyOpt[5]		= AllPrgCheckSum[3];
			ReplyData.ReplyOpt[6]		= AllPrgCheckSum[4];
			DEF_REPLY_REPEAT();
		}
	}
	
	/*******************************************************/
	/* pairing */
	if (PowerRstFlag == TRUE)
	{
		if (PORT_KEY_0 == 0)
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
			
			/* 限定快按间隔为1s */
			PairWaitTime++;
			if (PairWaitTime > 50) //1s
			{
				PairWaitTime = 0;
				PairCnt			= 0;
			}
			
			/* 快按三次进入对码 */
			if (PairCnt > 2)
			{
				PairCnt = 0;
				
				ReplyData.ReplyNum		= 0x01;
				ReplyData.ReplyCmd 		= 0x01;
				
				if (!(ID[0] | ID[1] | ID[2] | ID[3]))
				{
					ReplyData.ReplyOpt[0] = 0x01;
				}
				else
				{
					ReplyData.ReplyOpt[0] = 0x02;
				}
				
				ReplyData.ReplyOpt[1] = ID[0];
				ReplyData.ReplyOpt[2] = ID[1];
				ReplyData.ReplyOpt[3] = ID[2];
				ReplyData.ReplyOpt[4] = ID[3];
				ReplyData.ReplyOpt[5] = 0x00;
				ReplyData.ReplyOpt[6] = 0x00;
				DEF_REPLY_REPEAT();
			}
		}
	}
	
	
	/*******************************************************/
	/* 复位 */
	if (PowerRstFlag == FALSE)
	{
		if (PORT_KEY_0 == 0)
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
			ID[0] = 0;
			ID[1] = 0;
			ID[2] = 0;
			ID[3] = 0;
			
			Eprom_Write(EPROM_ID1, ID[0]);
			Eprom_Write(EPROM_ID2, ID[1]);
			Eprom_Write(EPROM_ID3, ID[2]);
			Eprom_Write(EPROM_ID4, ID[3]);
			
			ReplyData.ReplyNum		= 0x01;
			ReplyData.ReplyCmd 		= 0x01;
			ReplyData.ReplyOpt[0]	= 0x03;
			ReplyData.ReplyOpt[1] = 0x0;
			ReplyData.ReplyOpt[2] = 0x0;
			ReplyData.ReplyOpt[3] = 0x0;
			ReplyData.ReplyOpt[4] = 0x0;
			ReplyData.ReplyOpt[5] = 0x00;
			ReplyData.ReplyOpt[6] = 0x00;		
			DEF_REPLY_REPEAT();
		}
	}
}