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
	*
	* @Version						0.0
	* 										根据1104 0.3版本更改
	*											仅把触发后的报警方式更改为三灯同时红色闪烁
	*
	*
	* @Version						0.1
	*											更改触发方式，RST脚位定为触发方式选择判定脚
	*											a)当RST脚为高电平时，在2秒内持续有超过20次的触发方可判定为触发有效
	*											b)当RST脚为低电平时，一次触发则判定为触发有效
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

