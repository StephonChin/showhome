/******************************************************************************
	*
	* @ProjectName				ZW1204
	* @Date								2017.05.27
	* @Author							DS.Chin
	* @Hardware				
	* 										N76E003
	*											TSSOP20
	*											HIRC16M
	* @Version						0.0
	*
	*
	* @Version 						0.1
	* @Date								27-May-2017
	* @Author							DS.Chin
	* @Description				
	* 										++ 连续触发2秒才认为触发
	*											++ 解除触发持续2秒才认为解除成功
	*											++ 解除触发后10秒后再触发方有效
	*											++ 取消每隔10秒
	*	
*******************************************************************************/
#include "ZW1204.h"


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

