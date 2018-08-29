/*******************************************************************************
	*
	* @ProjectName		Door_Bell
	* @Date						2016.12.23~2016.12.30
	* @Author					DS.Chin
	* @Description		Door_Bell, Rf, Wifi, RGB, Dial Switch,
	*
	*
	
	***
		* @Version			0.0
		* @Description	初版
	***

*******************************************************************************/

/*Include---------------------------------------------------------------------*/
#include "Door_Bell.h"

/**
	* @Function Name		main
	* @Parameters				None
	* @Return						None
	*/
void main(void)
{
	MCU_Config();  

	while (1)
	{
    /* 定时时间 5ms */
		if (TIM1_UPDATE_FLAG == TRUE) 
		{
			TIM1_UPDATE_FLAG = FALSE;
			
			//PORT_BLUE = 1;
			//PORT_RED = 1;

			Key_Scan();
				
			Data_Process();
						
			Speaker_Control();
			
			Dial_Switch_Scan();
			
			Led_Display();
		}
	}
}



/**
	* @Function Name		TIM4_Update_Interrupt
	* @Parameters				None
	* @Return						None
	*/
#pragma	vector = TIM4_OVR_UIF_vector
__interrupt void TIM4_Update_Interrupt(void)
{
	TIM4_SR = 0x0;
	
	Duty_Control();
}






