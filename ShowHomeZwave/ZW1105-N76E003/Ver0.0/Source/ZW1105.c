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
	* 										����1104 0.3�汾����
	*											���Ѵ�����ı�����ʽ����Ϊ����ͬʱ��ɫ��˸
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
			
			Key_Scan();				//��������
			
			Data_Process();		//���ݴ���
			
			Comm_Process();		//��Z-WAVEͨ��
			
			Led_Display();		//LED��ʾ
			
			Sleep_Control();	//˯�߿���
		}
	}
}

