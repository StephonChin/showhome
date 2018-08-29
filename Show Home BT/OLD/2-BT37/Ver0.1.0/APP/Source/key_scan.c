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
#define			PORT_SWITCH_0							PD_ODR_ODR2
#define			PORT_SWITCH_1							PD_ODR_ODR3
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
  
  /* when  press key */
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
				if ((PORT_SWITCH_0	 == 1) || (PORT_SWITCH_1	 == 1))
				{
					PORT_SWITCH_0	 	= 0;
					PORT_SWITCH_1		= 0;
					AllStatus_One		= 0;		//按键状态实时更新
					AllStatus_Two		= 0;
				}
				else
				{
					PORT_SWITCH_0	 	= 1;
					PORT_SWITCH_1		= 1;
					AllStatus_One		= 1;		//按键状态实时更新
					AllStatus_Two		= 1;
				}
				
				//设置回复数据给APP
				DEF_REPLY_REPEAT();
				ReplyData.ReplyNum			= 0x02;
				ReplyData.ReplyCmd 			= 0x02;			// 回复数据指令字	
				ReplyData.ReplyOpt[0]		= AllStatus;					// 开关状态
				ReplyData.ReplyOpt[1]		= 0x00;
				ReplyData.ReplyOpt[2]		= AllPrgCheckSum[0];
				ReplyData.ReplyOpt[3]		= AllPrgCheckSum[1];
				ReplyData.ReplyOpt[4]		= 0x00;
				ReplyData.ReplyOpt[5]		= 0x00;
				ReplyData.ReplyOpt[6]		= 0x00;
				DEF_REPLY_REPEAT();
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