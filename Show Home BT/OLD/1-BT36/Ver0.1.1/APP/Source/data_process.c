/************************************************
 * FileName: data_process.c
 * Date: 2016.07.28
 * Author: DS.Chin
 * Input:  RcvData[3],RcvStatus,MotorOpenFlag,TimerOpenFlag,SaveFlag
 * Output: 
 * Description: process the recieve data
*************************************************/

/***************************************************************
 * Include Files
 */
#include "iostm8s003f3.h"
#include "system.h"
#include "data_process.h"

/***************************************************************
 * Defines
 */
#define			PORT_SWITCH								PD_ODR_ODR2
#define     NULL              				0
#define			DEF_REPLY_REPEAT()				RepeatFlag = TRUE;\
																			RepeatDelayTime = 0;\
																			RepeatCnt = 0

/***************************************************************
 * Global variables
 */
_TypeSwitchStatus(AllStatus);
_Uchar				OneStatus;

/**************************************************************
 * FunctionName: Data_Process
 */
void Data_Process(void)
{
	/* �������APP���� */
	APP_Data_Process();
}


/****************************************************************
* FunctionName: APP_Data_Process
*/
void APP_Data_Process(void)
{
	static _Flag       	BtInitFlag;        		//������ʼ����־λ
	_Uchar							GroupNum	= 0;
	_Uchar							ClassNum	= 0;
  
	//���յ�����
   if (RcvStatus)
   {
      RcvStatus = FALSE;  //clear recieved flag
     
	  	
		/*  # ������ʼ���ж� # */
    if (FALSE == BtInitFlag)
    {
       if (RcvData.Header == 0xF0) //���յ���ʼ��ָ��
       {
          
          BtInitFlag = TRUE;    // ������ʼ����־λ��λ
					
              		  
         
					/* ��ȡID */
					Eprom_Read();
					
          // �ϵ�ָ��ظ�
			  	TypeReply							= FALSE;
          ReplyData.ReplyNum		= 0x01;
			  	ReplyData.ReplyCmd 		= 0x01;
					ReplyData.ReplyOpt[0] = 0x00;
					ReplyData.ReplyOpt[1] = IDValue.ID1;
					ReplyData.ReplyOpt[2] = IDValue.ID2;
					ReplyData.ReplyOpt[3] = IDValue.ID3;
					ReplyData.ReplyOpt[4] = IDValue.ID4;
					ReplyData.ReplyOpt[5] = 0x00;
					ReplyData.ReplyOpt[6] = 0x00;
					DEF_REPLY_REPEAT();
					
					// �˳����ݴ���
					return;
       }
		}  /* # ������ʼ���ж� # */
				

		
		
		/* ## ָ�����ж� ## */
		switch (RcvData.Header & 0x0F)
		{	
			
			
			//APP�ظ�x1ʱ��MCUֹͣ��Ϣ�ظ�
		  case 0x01:
				{
			  	switch (RcvData.GroupClass)
					{
						case 0x00:
						{
							ReplyData.ReplyNum	 = 0x00;	
						}break;
						
						case 0x01:
						{
							IDValue.ID1 = RcvData.RcvOpt[0];
							IDValue.ID2 = RcvData.RcvOpt[1];
							IDValue.ID3 = RcvData.RcvOpt[2];
							IDValue.ID4 = RcvData.RcvOpt[3];
							
							/* ��IDд��EPROM */
							Eprom_Write();
							
							/* ���ûظ�ָ�� */
							ReplyData.ReplyNum	= 0x01;
							DEF_REPLY_REPEAT();
							ReplyData.ReplyCmd		= RcvData.Header;
							ReplyData.ReplyOpt[0]	= RcvData.GroupClass;
							ReplyData.ReplyOpt[1]	= RcvData.RcvOpt[0];
							ReplyData.ReplyOpt[2]	= RcvData.RcvOpt[1];
							ReplyData.ReplyOpt[3]	= RcvData.RcvOpt[2];
							ReplyData.ReplyOpt[4]	= RcvData.RcvOpt[3];
							ReplyData.ReplyOpt[5]	= 0;
							ReplyData.ReplyOpt[6]	= 0;
						} break;
						
						case 0x2:
						{
							/* ���ûظ�ָ�� */
							ReplyData.ReplyNum	= 0x01;
							DEF_REPLY_REPEAT();
							ReplyData.ReplyCmd		= RcvData.Header;
							ReplyData.ReplyOpt[0]	= RcvData.GroupClass;
							ReplyData.ReplyOpt[1]	= IDValue.ID1;
							ReplyData.ReplyOpt[2]	= IDValue.ID2;
							ReplyData.ReplyOpt[3]	= IDValue.ID3;
							ReplyData.ReplyOpt[4]	= IDValue.ID4;
							ReplyData.ReplyOpt[5]	= 0;
							ReplyData.ReplyOpt[6]	= 0;
						} break;
					}
					
					
				}break;
			
			
				
				
				
			//APP���������ѯָ��
			case 0x02:
			  {
						ReplyData.ReplyNum			= 0x02;
						ReplyData.ReplyCmd 			= RcvData.Header;			// �ظ�����ָ����	
						ReplyData.ReplyOpt[0]		= AllStatus;				// ����״̬
						ReplyData.ReplyOpt[1]		= 0x00;
						ReplyData.ReplyOpt[2]		= AllPrgCheckSum;
						ReplyData.ReplyOpt[3]		= 0x00;
						ReplyData.ReplyOpt[4]		= 0x00;
						ReplyData.ReplyOpt[5]		= 0x00;
						ReplyData.ReplyOpt[6]		= 0x00;
						DEF_REPLY_REPEAT();
			  } break;
			
				
				
				
				
			// APP������ϸ��ѯָ��
		  case 0x03:
				{
						ReplyData.ReplyNum		= 0x03;
						ReplyData.ReplyCmd 		= RcvData.Header;
						GroupNum							= RcvData.GroupClass >> 4;
						ClassNum							= RcvData.GroupClass & 0x0F;
						
						switch (RcvData.RcvOpt[0])
						{
							//״̬��ѯ
							case 0x01:
								{
									OneStatus								= (AllStatus >> GroupNum) & 0x01;
									ReplyData.ReplyOpt[0] 	= RcvData.GroupClass;	
									ReplyData.ReplyOpt[1]		= 0x01;
									ReplyData.ReplyOpt[2]		= OneStatus;			//����״̬
									ReplyData.ReplyOpt[3]		= 0x00;
									ReplyData.ReplyOpt[4]		= 0x00;
									ReplyData.ReplyOpt[5]		= 0x00;
									ReplyData.ReplyOpt[6]		= 0x00;
								} break;
								
								
							//��ʱ����ѯ
							case 0x03:
								{
									ReplyData.ReplyOpt[0]		=	RcvData.GroupClass;		//ȡ��class����ֵ
									ReplyData.ReplyOpt[1]		= 0x03;
									ReplyData.ReplyOpt[2]		= PrgTimer[ClassNum].OnHour;
									ReplyData.ReplyOpt[3]		= PrgTimer[ClassNum].OnMinute;
									ReplyData.ReplyOpt[4]		= 0x00;
									ReplyData.ReplyOpt[5]		= 0x00;
									ReplyData.ReplyOpt[6]		= 0x00;
								} break;
							
							//��ʱ�ز�ѯ
							case 0x04:
								{
									ReplyData.ReplyOpt[0]		=	RcvData.GroupClass;		//ȡ��class����ֵ
									ReplyData.ReplyOpt[1]		= 0x04;
									ReplyData.ReplyOpt[2]		= PrgTimer[ClassNum].OffHour;
									ReplyData.ReplyOpt[3]		= PrgTimer[ClassNum].OffMinute;
									ReplyData.ReplyOpt[4]		= 0x00;
									ReplyData.ReplyOpt[5]		= 0x00;
									ReplyData.ReplyOpt[6]		= 0x00;
								} break;
								
							//�������
							default:
								{
									ReplyData.ReplyNum			= 0x00;				//��Ч��������ظ�
								} break;
						}
						
				} break;
		  
				
				
				
				
			// APP����ָ��
			case 0x04:
				{
						//Group & Class' value
						GroupNum	= RcvData.GroupClass >> 4;
						ClassNum	= RcvData.GroupClass & 0x0F;
						
						
						//��ȡ����ָ��
						switch (RcvData.RcvOpt[0] & 0x0F)
						{
							//���ÿ���
							case 0x01:
								{
									if (RcvData.RcvOpt[1] == 0x00)
									{
										PORT_SWITCH		= 0;
										AllStatus_One	= 0;		//����״̬ʵʱ����
									}
									else
									{
										PORT_SWITCH		= 1;
										AllStatus_One	= 1;		//����״̬ʵʱ����
									}
								} break;
								
							//���ÿ���ʱ��
							case 0x03:
								{
									AllPrgCheckSum						 			^= PrgTimer[ClassNum].CheckSum;	//ȥ���˶�ʱ�ƻ���У��ֵ
									PrgTimer[ClassNum].CheckSum			^= PrgTimer[ClassNum].OnHour;		//�˶�ʱ�ƻ�������������У��ֵ
									PrgTimer[ClassNum].CheckSum			^= PrgTimer[ClassNum].OnMinute;	//�˶�ʱ�ƻ����������������У��ֵ
									PrgTimer[ClassNum].OnHour				 = RcvData.RcvOpt[1];
									PrgTimer[ClassNum].OnMinute			 = RcvData.RcvOpt[2];
									PrgTimer[ClassNum].CheckSum 		^= PrgTimer[ClassNum].OnHour; 
									PrgTimer[ClassNum].CheckSum 		^= PrgTimer[ClassNum].OnMinute;
									AllPrgCheckSum						 			^= PrgTimer[ClassNum].CheckSum;	//�ؼ���У��ֵ
									
								} break;
								
							//���ùػ�ʱ��
							case 0x04:
								{
									AllPrgCheckSum						 			^= PrgTimer[ClassNum].CheckSum;		//ȥ���˶�ʱ�ƻ���У��ֵ
									PrgTimer[ClassNum].CheckSum			^= PrgTimer[ClassNum].OffHour;		//�˶�ʱ�ƻ����������������У��ֵ
									PrgTimer[ClassNum].CheckSum			^= PrgTimer[ClassNum].OffMinute;	//�˶�ʱ�ƻ����������������У��ֵ
									PrgTimer[ClassNum].OffHour			 = RcvData.RcvOpt[1];
									PrgTimer[ClassNum].OffMinute		 = RcvData.RcvOpt[2];
									PrgTimer[ClassNum].CheckSum 		^= PrgTimer[ClassNum].OffHour; 
									PrgTimer[ClassNum].CheckSum 		^= PrgTimer[ClassNum].OffMinute;
									AllPrgCheckSum						 			^= PrgTimer[ClassNum].CheckSum;		//�ؼ���У��ֵ
								} break;
								
							//����ʵʱʱ��
							case 0x05:
								{
									RealTime.Hour		=	RcvData.RcvOpt[1];
									RealTime.Minute	= RcvData.RcvOpt[2];
									RealTime.Second	= RcvData.RcvOpt[3];
								} break;
								
							//����ָ����Ϊ��Ч	
							default:
								{
									ReplyData.ReplyNum	= 0;			//��ʱ���ظ��κ�����
								} break;		
						}//��ȡ����ָ��
		
				} break;
				
				
				
				
				
			// APP���͵�����ָ����κδ���
			default:
				{
					asm("nop");
				} break;
				
				
		}/* ## ָ�����ж� ## */		               
  } //���յ�����
}
