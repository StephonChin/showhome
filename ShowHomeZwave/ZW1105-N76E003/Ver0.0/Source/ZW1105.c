/******************************************************************************
	*
	* @ProjectName				ZW1104
	* @Date								2017.03.03
	* @Author							DS.Chin
	* @Hardware				
	* 										N76E003
	*											TSSOP20
	*											HIRC16M
	* @Version						0.0
	*
	* 										根据1104 0.3版本更改
	*											仅把触发后的报警方式更改为三灯同时红色闪烁
	*	
*******************************************************************************/
#include "ZW1105.h"


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
			
			Key_Scan();				//按键处理
			
			Data_Process();		//数据处理
			
			Comm_Process();		//与Z-WAVE通信
			
			Led_Display();		//LED显示
			
			Sleep_Control();	//睡眠控制
		}
	}
}

