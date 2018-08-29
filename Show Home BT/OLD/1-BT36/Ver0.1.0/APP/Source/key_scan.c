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
				ReplyData.ReplyOpt[0] 	= 0x01;	
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