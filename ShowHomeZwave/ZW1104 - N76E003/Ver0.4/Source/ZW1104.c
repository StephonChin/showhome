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
	*
	* @Version 						0.1
	* @Date								21-April-2017
	* @Author							DS.Chin
	* @Description				
	* 										++ ��������2�����Ϊ����
	*											++ �����������2�����Ϊ����ɹ�
	*											++ ���������10����ٴ�������Ч
	*											++ ȡ��ÿ��10��
	*	
	
	* 2017.08.11 V0.4
	* ���Ľ�λ
	* ���Ĵ����������ܣ����ܷ�ժ����Ӱ��
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
			
			Key_Scan();				//��������
			
			Data_Process();		//���ݴ���
			
			Comm_Process();		//��Z-WAVEͨ��
			
			Led_Display();		//LED��ʾ
			
			Sleep_Control();	//˯�߿���
		}
	}
}

