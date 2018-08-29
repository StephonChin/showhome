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
	static _Flag		StatusReplyFlag;		//回复允许标志位
  
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
				  if (DimmerDuty > 0)
				  {
					  DimmerDuty--;
						DimmerDutyBuf = DimmerDuty;
						StatusReplyFlag	= TRUE;
				  }
			  } // fade out

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
	  
		/* 每次长扫键切换调光方向 */
	  else
	  if (KeyPressLongFlag == TRUE)
	  {
		  FadeInOrOut ^= 1;
	  }
		
		/* 当0时调亮，100时调暗 */
		if (DimmerDuty == 0) 			FadeInOrOut = FALSE;
		if (DimmerDuty == 100)		FadeInOrOut = TRUE;
	  
	  // clear
	  KeyTime = 0;
	  KeyPressLongTime = 0;
	  KeyPressLongFlag= FALSE;
		
		
		/* 回复 */
		if (StatusReplyFlag)
		{
			StatusReplyFlag = FALSE;
			
			//设置回复数据给APP
			DEF_REPLY_REPEAT();
			ReplyData.ReplyNum			= 0x03;
			ReplyData.ReplyCmd 			= 0x03;
			ReplyData.ReplyOpt[0] 	= 0x00;	
			ReplyData.ReplyOpt[1]		= 0x02;						//占空比回复
			ReplyData.ReplyOpt[2]		= DimmerDuty;			//开关状态
			ReplyData.ReplyOpt[3]		= 0x00;	
			ReplyData.ReplyOpt[4]		= 0x00;
			ReplyData.ReplyOpt[5]		= 0x00;
			ReplyData.ReplyOpt[6]		= 0x00;
		}
  }
}
                                        
															