/*******************************************************************************
	*
	* @FileName		  Key_Scan.c
	* @Date					2018.03.29
	* @Author				DS.Chin
	* @CopyRight		(C) CopyRight  @2016 ~ 2026 Willis Ltd. Co.
	* @Description	This file contains all the function prototyped for the config
	*								fimer library
	*
*******************************************************************************/
#include "Key_Scan.h"


//----------< Gloable Parmaters>--------------
xdata _TypeKey  ModeKeyStatus1;
xdata _TypeKey  ModeKeyStatus2;


//-----------< File Paramters >----------------
xdata _Uint8    KeyTime1,KeyTime2;
xdata _Flag     KeyDoneFlag1,KeyDoneFlag2;

/*******************************************************************
  *
  * FunctionName  Key_Scan
  *
 ******************************************************************/
void Key_Scan(void)
{
  
  // PORT_KEY_MODE   triggered by touch IC
  if (PORT_KEY_1 == RESET)
  {
    KeyTime1++;
    if (KeyTime1 > 10)              //1.5s, Press long time more than 1.5 seconds
    {
      KeyTime1 = 0;
      
      if (Duty2 < 85)
      {
        Duty2++;
      }
    }
  }
  else
  {
    KeyTime1     = 0;
  }
  
  // PORT_KEY_MODE   triggered by touch IC
  if (PORT_KEY_2 == RESET)
  {
    KeyTime2++;
    if (KeyTime2 > 10)              //1.5s, Press long time more than 1.5 seconds
    {
      KeyTime2 = 0;
      if (Duty2 > 0)    Duty2--;
    }
  }
  else
  {
    KeyTime2     = 0;
  }

}
 
 







