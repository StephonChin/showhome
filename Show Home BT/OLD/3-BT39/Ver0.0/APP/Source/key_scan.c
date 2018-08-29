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
        
        SwitchInit = TRUE;
		DimmerBySwitchFlag = TRUE;
        
        /* CDS caculate time from 0 */
        //ShakeTime = 0;
        //StatusChgFlag = TRUE;
       // ADActivedFlag = FALSE;
        
        if (SwitchStatus == 0x01)
        {
			SwitchStatus = 0x00;
        }
        else
        {
          SwitchStatus = 0x01;
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