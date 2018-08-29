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
#define			PORT_SWITCH_0							PA_ODR_ODR3
#define			PORT_SWITCH_1							PB_ODR_ODR5
#define			PORT_SWITCH_2							PC_ODR_ODR3
#define			PORT_SWITCH_3							PC_ODR_ODR4
#define			PORT_SWITCH_4							PC_ODR_ODR5
		

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
  _Uchar							GroupNum 	= 0;
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
					}
				}break;
			
			
				
				
				
			//APP���������ѯָ��
			case 0x02:
			  {
						ReplyData.ReplyNum			= 0x02;
						ReplyData.ReplyCmd 			= RcvData.Header;			// �ظ�����ָ����	
						ReplyData.ReplyOpt[0]		= AllStatus;					// ����״̬
						ReplyData.ReplyOpt[1]		= 0x00;
						ReplyData.ReplyOpt[2]		= AllPrgCheckSum[0];
						ReplyData.ReplyOpt[3]		= AllPrgCheckSum[1];
						ReplyData.ReplyOpt[4]		= AllPrgCheckSum[2];
						ReplyData.ReplyOpt[5]		= AllPrgCheckSum[3];
						ReplyData.ReplyOpt[6]		= AllPrgCheckSum[4];
						DEF_REPLY_REPEAT();
			  } break;
			
				
				
				
				
			// APP������ϸ��ѯָ��
		  case 0x03:
				{
						ReplyData.ReplyNum		= 0x03;
						ReplyData.ReplyCmd 		= RcvData.Header;
						ReplyData.ReplyOpt[0] = RcvData.GroupClass;
						ReplyData.ReplyOpt[1] = RcvData.RcvOpt[0];	
						//ȡ��Group����ֵ
						GroupNum	= RcvData.GroupClass >> 4;			
						ClassNum	= RcvData.GroupClass & 0x0F;
						
						switch (RcvData.RcvOpt[0])
						{
							//״̬��ѯ
							case 0x01:
								{
									OneStatus								= (AllStatus >> GroupNum) & 0x01;
									ReplyData.ReplyOpt[2]		= OneStatus;			//����״̬
									ReplyData.ReplyOpt[3]		= 0x00;
									ReplyData.ReplyOpt[4]		= 0x00;
									ReplyData.ReplyOpt[5]		= 0x00;
									ReplyData.ReplyOpt[6]		= 0x00;
								} break;
								
								
							//��ʱ����ѯ
							case 0x03:
								{	
									ReplyData.ReplyOpt[2]		= PrgTimer[GroupNum][ClassNum].OnHour;
									ReplyData.ReplyOpt[3]		= PrgTimer[GroupNum][ClassNum].OnMinute;
									ReplyData.ReplyOpt[4]		= 0x00;
									ReplyData.ReplyOpt[5]		= 0x00;
									ReplyData.ReplyOpt[6]		= 0x00;
								} break;
							
							//��ʱ�ز�ѯ
							case 0x04:
								{
									ReplyData.ReplyOpt[2]		= PrgTimer[GroupNum][ClassNum].OffHour;
									ReplyData.ReplyOpt[3]		= PrgTimer[GroupNum][ClassNum].OffMinute;
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
						//�յ�APPָ��󣬻ظ�
						//ReplyData.ReplyNum		= 0x04;
						ReplyData.ReplyCmd 		= RcvData.Header;
						ReplyData.ReplyOpt[0]	= RcvData.GroupClass;
						ReplyData.ReplyOpt[1] = RcvData.RcvOpt[0];
						for (_Uchar TempCnt = 2; TempCnt < 7; TempCnt++)
						{
							ReplyData.ReplyOpt[TempCnt]	= 0x00;
						}
						
						
						//ȡ��Group����ֵ
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
										switch (GroupNum)
										{
											case 0:
												PORT_SWITCH_0	= 0;
												AllStatus_One	= 0;
											break;
											
											case 1:
												PORT_SWITCH_1	= 0;
												AllStatus_Two	= 0;
											break;
											
											case 2:
												PORT_SWITCH_2	= 0;
												AllStatus_Three = 0;
											break;
											
											case 3:
												PORT_SWITCH_3	= 0;
												AllStatus_Four = 0;
											break;
											
											case 4:
												PORT_SWITCH_4	= 0;
												AllStatus_Five = 0;
											break;
										}
									}
									else
									{
										switch (GroupNum)
										{
											case 0:
												PORT_SWITCH_0	= 1;
												AllStatus_One	= 1;
											break;
											
											case 1:
												PORT_SWITCH_1	= 1;
												AllStatus_Two	= 1;
											break;
											
											case 2:
												PORT_SWITCH_2	= 1;
												AllStatus_Three = 1;
											break;
											
											case 3:
												PORT_SWITCH_3	= 1;
												AllStatus_Four = 1;
											break;
											
											case 4:
												PORT_SWITCH_4	= 1;
												AllStatus_Five = 1;
											break;
										}
									}
								} break;
								
							//���ÿ���ʱ��
							case 0x03:
								{
									AllPrgCheckSum[GroupNum]									^= PrgTimer[GroupNum][ClassNum].CheckSum;	//ȥ���˶�ʱ�ƻ���У��ֵ
									PrgTimer[GroupNum][ClassNum].CheckSum			^= PrgTimer[GroupNum][ClassNum].OnHour;		//�˶�ʱ�ƻ�������������У��ֵ
									PrgTimer[GroupNum][ClassNum].CheckSum			^= PrgTimer[GroupNum][ClassNum].OnMinute;	//�˶�ʱ�ƻ����������������У��ֵ
									PrgTimer[GroupNum][ClassNum].OnHour				 = RcvData.RcvOpt[1];
									PrgTimer[GroupNum][ClassNum].OnMinute			 = RcvData.RcvOpt[2];
									PrgTimer[GroupNum][ClassNum].CheckSum 		^= PrgTimer[GroupNum][ClassNum].OnHour; 
									PrgTimer[GroupNum][ClassNum].CheckSum 		^= PrgTimer[GroupNum][ClassNum].OnMinute;
									AllPrgCheckSum[GroupNum]									^= PrgTimer[GroupNum][ClassNum].CheckSum;	//�ؼ���У��ֵ
									
								} break;
								
							//���ùػ�ʱ��
							case 0x04:
								{
									AllPrgCheckSum[GroupNum]									^= PrgTimer[GroupNum][ClassNum].CheckSum;	//ȥ���˶�ʱ�ƻ���У��ֵ
									PrgTimer[GroupNum][ClassNum].CheckSum			^= PrgTimer[GroupNum][ClassNum].OffHour;		//�˶�ʱ�ƻ�������������У��ֵ
									PrgTimer[GroupNum][ClassNum].CheckSum			^= PrgTimer[GroupNum][ClassNum].OffMinute;	//�˶�ʱ�ƻ����������������У��ֵ
									PrgTimer[GroupNum][ClassNum].OffHour			 = RcvData.RcvOpt[1];
									PrgTimer[GroupNum][ClassNum].OffMinute		 = RcvData.RcvOpt[2];
									PrgTimer[GroupNum][ClassNum].CheckSum 		^= PrgTimer[GroupNum][ClassNum].OffHour; 
									PrgTimer[GroupNum][ClassNum].CheckSum 		^= PrgTimer[GroupNum][ClassNum].OffMinute;
									AllPrgCheckSum[GroupNum]									^= PrgTimer[GroupNum][ClassNum].CheckSum;	//�ؼ���У��ֵ
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
