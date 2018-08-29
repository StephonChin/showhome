/******************************************************************************
	*
	* @ProjectName				ZW1104
	* @Date								2017.03.03
	* @Author							DS.Chin
	* @Hardware				
	* 										N76E003
	*											TSSOP20
	*											HIRC16M
	*	
*******************************************************************************/
#include "ZW1104.h"


/******************************************
	* 
	* @FunctionName	main
	* @Output				None
	* @Input				None
	* @Description	Programm Entrance
	*
***/
void main(void)
{
	MCU_Config();
	Power_On_Init();
	
	while (1)
	{
		if (TF2 == SET)
		{
			TF2 = RESET;
			
			Data_Process();		//数据处理
			
			Comm_Process();		//与Z-WAVE通信
			
			Led_Display();		//LED显示
			
			Sleep_Control();	//睡眠控制
		}
	}
}

