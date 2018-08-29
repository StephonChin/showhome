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
	* 										++ ��������2�����Ϊ����
	*											++ �����������2�����Ϊ����ɹ�
	*											++ ���������10����ٴ�������Ч
	*											++ ȡ��ÿ��10��
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
			
			Key_Scan();				//��������
			
			Data_Process();		//���ݴ���
			
			Comm_Process();		//��Z-WAVEͨ��
			
			Led_Display();		//LED��ʾ
			
			Sleep_Control();	//˯�߿���
		}
	}
}

