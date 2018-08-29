/********************************************************************
 * key_scan.c
 */
#include "stm8s003f3p.h"
#include "stm8s_bitsdefine.h"
#include "system.h"
#include "key_scan.h"

/*********************************************************************
 * defines
 */
#define   PORT_KEY    PC_IDR_7
 
 
/***********************************************************************
 * variables
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
        
        /* CDS caculate time from 0 */
        //ShakeTime = 0;
        //StatusChgFlag = TRUE;
       // ADActivedFlag = FALSE;
        
        if ( (SwitchStatus[0] == 0x01)  || (SwitchStatus[1] == 0x01))
        {
			// switch 0
			if (SwitchStatus[0] == 0x01)
			{
				SwitchStatus[0] = 0x00;
				SwitchInit[0] = TRUE;
			}
			
			//switch 1
			if (SwitchStatus[1] == 0x01)
			{
				SwitchStatus[1] = 0x00;
				SwitchInit[1] = TRUE;
			}
        }
        else
        {
			SwitchStatus[0] = 0x01;
			SwitchStatus[1] = 0x01;
			SwitchInit[0] = TRUE;
			SwitchInit[1] = TRUE;
        }
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