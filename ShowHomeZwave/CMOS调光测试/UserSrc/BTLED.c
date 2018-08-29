/*******************************************************************************
	*
	* @FileName		  BTLED.c
	* @Date					2018.03.29
	* @Author				DS.Chin
	* @CopyRight		(C) CopyRight  @2016 ~ 2026 Willis Ltd. Co.
	* @Description	This file contains all the function prototyped for the config
	*								fimer library
	*
*******************************************************************************/
#include "BTLED.h"




/********************************************************************
    *
    * FunctionName      main.c
    * Brief             programme entrance
    *
*********************************************************************/
void main(void)
{
  MCU_Config();
  
  User_Data_Init();
  
  while (1)
  {
    if (TF2 == SET)
		{
			TF2 = RESET;
            
      TA			= 0xAA;
      TA			= 0x55;
      WDCON   |= BIT6;        //WDCLR = 1, clear the WDT 
      
      Key_Scan();
      
      Data_Process();
    }
  }
}



