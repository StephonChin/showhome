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
  static _Uchar 	KeyPressLongTime;
  static _Uchar	KeyPressLongFlag;
  static _Flag	FadeInOrOut;
  
  if (PORT_KEY == 0)
  {
	  KeyTime++;
	  if (KeyTime > 4) // 50ms
	  {
		  KeyTime = 0;
		  
		  KeyPressLongTime++;
		  
		  // long press
		  if (KeyPressLongTime > 19)
		  {
			  KeyPressLongFlag = TRUE;
			  
			  
			  // fade in
			  if (FadeInOrOut == FALSE)
			  {
				  if (DimmerDuty < 100)
				  {
					  DimmerDuty++;
				  }
			  } // fade in
			  
			  
			  // fade out
			  else
			  {
				  if (DimmerDuty > 1)
				  {
					  DimmerDuty--;
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
			SwitchInit = TRUE;
			DimmerBySwitchFlag = TRUE;
        
			if (SwitchStatus == 0x01)
			{
				SwitchStatus = 0x00;
			}
			else
			{
			SwitchStatus = 0x01;
			}
	  }
	  
	  else
	  if (KeyPressLongFlag == TRUE)
	  {
		  FadeInOrOut ^= 1;
	  }
	  
	  // clear
	  KeyTime = 0;
	  KeyPressLongTime = 0;
	  KeyPressLongFlag= FALSE;
  }
  /* when  press key */
  /*if (PORT_KEY == 0)
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
  
  // when key released
  else
  {
    KeyTime = 0;
    KeyPressDone = FALSE;
  } //when key released*/
}