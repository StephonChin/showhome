/*************************************
 * FileName: BT37
 * Date: 2016.05.03
 * Author: DS.Chin
 * Versin: 0.0
 * Describe: APP->one swith

 ++++++++++++++++++++++++++++++++
���޸����ڡ�:2016��8��10��
���޸��ߡ�  ��DS.Chin
���޸����ݡ�:
    1)����ͨ��Э�� -- ��Э�顶ShowHomeBTЭ��0803��
	2)���¼ܹ��������
	3)���ڹ����붨ʱ������Ӧ�޸�

++++++++++++++++++++++++++++++++++
Ver0.1.1
��Ӷ���Э��

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
                    Rcv_Data_From_App();				//appͨ��
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