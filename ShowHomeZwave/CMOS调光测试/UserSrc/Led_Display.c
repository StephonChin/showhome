/*******************************************************************************
	*
	* @FileName		  Led_Display.c
	* @Date					2018.03.29
	* @Author				DS.Chin
	* @CopyRight		(C) CopyRight  @2016 ~ 2026 Willis Ltd. Co.
	* @Description	This file contains all the function prototyped for the config
	*								fimer library
	*
*******************************************************************************/
#include "Led_Display.h"


xdata _Uint8    DutyCnt;
xdata _Uint8    Duty1;
xdata _Uint8    Duty2;
/*******************************************************
	*
	* Function Name		| TIM0_Update_Interrupt
	* Description		  | TIM0 100us
	*
********************************************************/
void Led_Duty_Control(void) interrupt 1
{
	TF0 = RESET;
	
  if (DutyCnt < 100)
  {
    DutyCnt++;
  
    if (DutyCnt < Duty1)    PORT_OUT_1 = SET;
    else                    PORT_OUT_1 = RESET;
    
    if (DutyCnt < Duty2)    PORT_OUT_2 = SET;
    else                    PORT_OUT_2 = RESET;
  }
  else
  {
    DutyCnt = 0;
    PORT_OUT_1 = RESET;
    PORT_OUT_2 = RESET;
  }
}


/********************************************************
  *
  * FunctioName P15_Interrupt
  *
*********************************************************/
void P15_Interrupt(void) interrupt 7
{
  PIF = 0x0;
 // DutyCnt = 0;
}

