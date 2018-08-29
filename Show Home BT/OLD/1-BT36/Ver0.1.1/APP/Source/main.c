/*************************************
 * FileName: bt36
 * Date: 2016.05.03
 * Author: DS.Chin
 * Versin: 0.0
 * Describe: APP->one swith

 ++++++++++++++++++++++++++++++++
【修改日期】:2016年8月8日
【修改者】  ：DS.Chin
Version:		Ver0.1.0
【修改内容】:
    1)更改通读协议 -- 依协议《ShowHomeBT协议0803》
	2)重新架构整个框架
	3)对于功能与定时作出相应修改
++++++++++++++++++++++++++++++++++
Ver0.1.1 - 2016.08.16
1)添加对码协议

***************************************/
#include "iostm8s003f3.h"
#include "system.h"
#include "main.h"


/************************************************/
		/* define */
#define			TIM1_UPDATE_FLAG		TIM1_SR1_UIF


/*++++++++++++++++++++++++++++++++++++++
 + FunctionName: main.h
+++++++++++++++++++++++++++++++++++++++*/
void main(void)
{
    _Uchar     MainStep   = 0;
    
    Mcu_Config();
		Respond_App_Init();
    
		while (1)
    {
        if (TIM1_UPDATE_FLAG == TRUE)     	//2ms
        {
            TIM1_UPDATE_FLAG = FALSE;				
						
						BT_Control();
						
            switch (MainStep)   				//2 * 5 = 10ms
            {
                case 0:
                    Rcv_Data_From_App();				//app通信
                    MainStep++;
                break;
                
                case 1:
										Data_Process();
                    MainStep++;
                break;
                
                case 2:
                    Key_Scan();
										Timer_Control();
                    MainStep++;
                break;
                
                case 3:
										Led_Display();
                    MainStep++;
                break;
                
                case 4:
										Respond_App();
                    MainStep = 0;
                break;
                
                default:
                    MainStep = 0;
                break;
            }
        }
    }
}