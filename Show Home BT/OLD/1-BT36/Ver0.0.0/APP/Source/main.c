/*************************************
 * FileName: bt36
 * Date: 2016.05.03
 * Author: DS.Chin
 * Versin: 0.0
 * Describe: APP->one swith
***************************************/
#include "stm8s003f3p.h"
#include "stm8s_bitsdefine.h"
#include "system.h"
#include "main.h"

/*++++++++++++++++++++++++++++++++++++++
 + FunctionName: main.h
+++++++++++++++++++++++++++++++++++++++*/
void main(void)
{
    _Uchar     MainStep   = 0;
    
    Mcu_Config();
    Power_On_Init();
    
	while (1)
    {
        if (TIM1_UPDATE_FLAG == TRUE)     	//2ms
        {
            TIM1_UPDATE_FLAG = FALSE;
			
            Led_Display();						//ledœ‘ æ
				
            switch (MainStep)   				//2 * 5 = 10ms
            {
                case 0:
                    Rcv_Data_From_App();				//appÕ®–≈
                    MainStep++;
                break;
                
                case 1:
					Data_Process();
                    MainStep++;
                break;
                
                case 2:
                    Key_Scan();
                    MainStep++;
                break;
                
                case 3:
					Switch_On_Off();
                    //AD_Scan();
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