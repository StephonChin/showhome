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
#define			PORT_SWITCH								PD_ODR_ODR2
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
  static _Uchar   KeyTime;
  static _Flag    KeyPressDone;
	
	/* 对码参数 */
	static 	_Uint8	PairCnt;
	static  _Uint8	PairTime;
	static	_Uint8	PairKeyDoneFlag;
	static  _Uint8	PairWaitTime;
	
	/* 清码参数 */
	static _Uint8		PowerRstFlag;
	static _Uint8		RstTime[2];
	static _Flag		RstEnableFlag;
  
  /* when  press key */
	if (PowerRstFlag == TRUE)
	{
		if (PORT_KEY == 0)
		{
			if (KeyPressDone == FALSE)
			{
				KeyTime++;
				
				if (KeyTime > 5)  // 60ms
				{
					KeyTime = 0;
					KeyPressDone = TRUE;
					
					//更改按键状态
					if (PORT_SWITCH	 == 1)
					{
						PORT_SWITCH	 = 0;
						AllStatus_One	= 0;		//按键状态实时更新
					}
					else
					{
						PORT_SWITCH		= 1;
						AllStatus_One	= 1;		//按键状态实时更新
					}
					
					//设置回复数据给APP
					DEF_REPLY_REPEAT();
					OneStatus								= AllStatus;
					ReplyData.ReplyNum			= 0x03;
					ReplyData.ReplyCmd 			= 0x03;
					ReplyData.ReplyOpt[0] 	= 0x00;	
					ReplyData.ReplyOpt[1] 	= 0x01;	
					ReplyData.ReplyOpt[2]		= OneStatus;			//开关状态
					ReplyData.ReplyOpt[3]		= 0x00;
					ReplyData.ReplyOpt[4]		= 0x00;
					ReplyData.ReplyOpt[5]		= 0x00;
					ReplyData.ReplyOpt[6]		= 0x00;			
				} //60ms
			} // KeyPressDone == FALSE;
		} // when press key
		
		/* when key released */
		else
		{
			KeyTime = 0;
			KeyPressDone = FALSE;
		} //when key released
	}	
	
	/**********************************/
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
	/* 复位 */
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