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
#include "Eprom.h"

/***************************************************************
 * Defines
 */
#define			PORT_SWITCH_0							PA_ODR_ODR3
#define			PORT_SWITCH_1							PC_ODR_ODR6
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

_Uchar 				ID[4];



/**
	* FUN...Power_On_Init
	*/
void Power_On_Init(void)
{
	/* Get the ID value from EPROM */
	ID[0] = Eprom_Read(EPROM_ID1);
	ID[1] = Eprom_Read(EPROM_ID2);
	ID[2] = Eprom_Read(EPROM_ID3);
	ID[3] = Eprom_Read(EPROM_ID4);
	
	
	/* If it's the first time to power on */
	if (Eprom_Read(EPROM_TIMER_ENABLE) != 0xAA)
	{
		Eprom_Write(EPROM_TIMER_ENABLE, 0xAA);
		for (_Uint8 TempGrp = 0; TempGrp < 5; TempGrp++)
		{
			for (_Uchar TempCnt = 0; TempCnt < 10; TempCnt++)
			{
				PrgTimer[TempGrp][TempCnt].OnHour			= 0xFF;
				PrgTimer[TempGrp][TempCnt].OnMinute		= 0xFF;
				PrgTimer[TempGrp][TempCnt].OffHour		= 0xFF;
				PrgTimer[TempGrp][TempCnt].OffMinute	= 0xFF;
				
				PrgTimer[TempGrp][TempCnt].CheckSum	= PrgTimer[TempGrp][TempCnt].OnHour ^ PrgTimer[TempGrp][TempCnt].OnMinute ^ PrgTimer[TempGrp][TempCnt].OffHour ^ PrgTimer[TempGrp][TempCnt].OffMinute;
				AllPrgCheckSum[TempGrp] ^= PrgTimer[TempGrp][TempCnt].CheckSum;
			}
		}
		Eprom_Timer_Init();
	}
	
	else
	{
		for (_Uint8 TempGrp = 0; TempGrp < 5; TempGrp++)
		{
			for (_Uchar TempCnt = 0; TempCnt < 10; TempCnt++)
			{
				PrgTimer[TempGrp][TempCnt].OnHour			= Eprom_Read_Timer(TempGrp, TempCnt, EPROM_TIMER_ON, EPROM_TIMER_HOUR);
				PrgTimer[TempGrp][TempCnt].OnMinute		= Eprom_Read_Timer(TempGrp, TempCnt, EPROM_TIMER_ON, EPROM_TIMER_MINUTE);
				PrgTimer[TempGrp][TempCnt].OffHour		= Eprom_Read_Timer(TempGrp, TempCnt, EPROM_TIMER_OFF, EPROM_TIMER_HOUR);
				PrgTimer[TempGrp][TempCnt].OffMinute	= Eprom_Read_Timer(TempGrp, TempCnt, EPROM_TIMER_OFF, EPROM_TIMER_MINUTE);
				
				PrgTimer[TempGrp][TempCnt].CheckSum	= PrgTimer[TempGrp][TempCnt].OnHour ^ PrgTimer[TempGrp][TempCnt].OnMinute ^ PrgTimer[TempGrp][TempCnt].OffHour ^ PrgTimer[TempGrp][TempCnt].OffMinute;
				AllPrgCheckSum[TempGrp] ^= PrgTimer[TempGrp][TempCnt].CheckSum;;
			}
		}
	}
}

/****************************************************************
* FunctionName: APP_Data_Process
*/
void Data_Process(void)
{
	static _Flag       	BtInitFlag;        		//蓝牙初始化标志位
  _Uchar							GroupNum 	= 0;
	_Uchar							ClassNum	= 0;
	//接收到数据
   if (RcvStatus)
   {
      RcvStatus = FALSE;  //clear recieved flag
     
	  	
		/*  # 蓝牙初始化判断 # */
    if (FALSE == BtInitFlag)
    {
       if (RcvData.Header == 0xF0) //接收到初始化指令
       {
          
          BtInitFlag = TRUE;    //     
					
          // 上电指令回复
			  	TypeReply							= FALSE; 
          ReplyData.ReplyNum		= 0x01;
			  	ReplyData.ReplyCmd 		= 0x01;
					ReplyData.ReplyOpt[0] = 0x00;
					ReplyData.ReplyOpt[1] = ID[0];
					ReplyData.ReplyOpt[2] = ID[1];
					ReplyData.ReplyOpt[3] = ID[2];
					ReplyData.ReplyOpt[4] = ID[3];
					ReplyData.ReplyOpt[5] = 0x00;
					ReplyData.ReplyOpt[6] = 0x00;
					DEF_REPLY_REPEAT();
					
					// 退出数据处理
					return;
       }
		}  /* # 蓝牙初始化判断 # */
				

		
		
		/* ## 指令字判断 ## */
		switch (RcvData.Header & 0x0F)
		{	
			
			
			//APP回复x1时，MCU停止信息回复
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
							ID[0] = RcvData.RcvOpt[0];
							ID[1] = RcvData.RcvOpt[1];
							ID[2] = RcvData.RcvOpt[2];
							ID[3] = RcvData.RcvOpt[3];
							
							/* 将ID写入EPROM */
							Eprom_Write(EPROM_ID1, ID[0]);
							Eprom_Write(EPROM_ID2, ID[1]);
							Eprom_Write(EPROM_ID3, ID[2]);
							Eprom_Write(EPROM_ID4, ID[3]);
							
							/* 设置回复指令 */
							ReplyData.ReplyNum	= 0x01;
							DEF_REPLY_REPEAT();
							ReplyData.ReplyCmd		= RcvData.Header;
							ReplyData.ReplyOpt[0]	= RcvData.GroupClass;
							ReplyData.ReplyOpt[1]	= ID[0];
							ReplyData.ReplyOpt[2]	= ID[1];
							ReplyData.ReplyOpt[3]	= ID[2];
							ReplyData.ReplyOpt[4]	= ID[3];
							ReplyData.ReplyOpt[5]	= 0;
							ReplyData.ReplyOpt[6]	= 0;
						} break;
						
						case 0x2:
						{
							/* 设置回复指令 */
							ReplyData.ReplyNum	= 0x01;
							DEF_REPLY_REPEAT();
							ReplyData.ReplyCmd		= RcvData.Header;
							ReplyData.ReplyOpt[0]	= RcvData.GroupClass;
							ReplyData.ReplyOpt[1]	= ID[0];
							ReplyData.ReplyOpt[2]	= ID[1];
							ReplyData.ReplyOpt[3]	= ID[2];
							ReplyData.ReplyOpt[4]	= ID[3];
							ReplyData.ReplyOpt[5]	= 0;
							ReplyData.ReplyOpt[6]	= 0;
						} break;
					}
				}break;
			
			
				
				
				
			//APP发送整体查询指令
			case 0x02:
			  {
						ReplyData.ReplyNum			= 0x02;
						ReplyData.ReplyCmd 			= RcvData.Header;			// 回复数据指令字	
						ReplyData.ReplyOpt[0]		= AllStatus;					// 开关状态
						ReplyData.ReplyOpt[1]		= 0x00;
						ReplyData.ReplyOpt[2]		= AllPrgCheckSum[0];
						ReplyData.ReplyOpt[3]		= AllPrgCheckSum[1];
						ReplyData.ReplyOpt[4]		= AllPrgCheckSum[2];
						ReplyData.ReplyOpt[5]		= AllPrgCheckSum[3];
						ReplyData.ReplyOpt[6]		= AllPrgCheckSum[4];
						DEF_REPLY_REPEAT();
			  } break;
			
				
				
				
				
			// APP发送详细查询指令
		  case 0x03:
				{
						ReplyData.ReplyNum		= 0x03;
						ReplyData.ReplyCmd 		= RcvData.Header;
						ReplyData.ReplyOpt[0] = RcvData.GroupClass;
						ReplyData.ReplyOpt[1] = RcvData.RcvOpt[0];	
						//取得Group的数值
						GroupNum	= RcvData.GroupClass >> 4;			
						ClassNum	= RcvData.GroupClass & 0x0F;
						
						switch (RcvData.RcvOpt[0])
						{
							//状态查询
							case 0x01:
								{
									OneStatus								= (AllStatus >> GroupNum) & 0x01;
									ReplyData.ReplyOpt[2]		= OneStatus;			//开关状态
									ReplyData.ReplyOpt[3]		= 0x00;
									ReplyData.ReplyOpt[4]		= 0x00;
									ReplyData.ReplyOpt[5]		= 0x00;
									ReplyData.ReplyOpt[6]		= 0x00;
								} break;
								
								
							//定时开查询
							case 0x03:
								{	
									ReplyData.ReplyOpt[2]		= PrgTimer[GroupNum][ClassNum].OnHour;
									ReplyData.ReplyOpt[3]		= PrgTimer[GroupNum][ClassNum].OnMinute;
									ReplyData.ReplyOpt[4]		= 0x00;
									ReplyData.ReplyOpt[5]		= 0x00;
									ReplyData.ReplyOpt[6]		= 0x00;
								} break;
							
							//定时关查询
							case 0x04:
								{
									ReplyData.ReplyOpt[2]		= PrgTimer[GroupNum][ClassNum].OffHour;
									ReplyData.ReplyOpt[3]		= PrgTimer[GroupNum][ClassNum].OffMinute;
									ReplyData.ReplyOpt[4]		= 0x00;
									ReplyData.ReplyOpt[5]		= 0x00;
									ReplyData.ReplyOpt[6]		= 0x00;
								} break;
								
							//其他情况
							default:
								{
									ReplyData.ReplyNum			= 0x00;				//无效情况，不回复
								} break;
						}
						
				} break;
		  
				
				
				
				
			// APP设置指令
			case 0x04:
				{
						//取得Group的数值
						GroupNum	= RcvData.GroupClass >> 4;			
						ClassNum	= RcvData.GroupClass & 0x0F;
						
						if (GroupNum > 4)	break;
						if (ClassNum > 9) break;
						
						
						
						//读取设置指令
						switch (RcvData.RcvOpt[0] & 0x0F)
						{
							//设置开关
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
								
							//设置开机时间
							case 0x03:
								{
									AllPrgCheckSum[GroupNum]									^= PrgTimer[GroupNum][ClassNum].CheckSum;	//去除此定时计划的校验值
									PrgTimer[GroupNum][ClassNum].CheckSum			^= PrgTimer[GroupNum][ClassNum].OnHour;		//此定时计划除掉开机项后的校验值
									PrgTimer[GroupNum][ClassNum].CheckSum			^= PrgTimer[GroupNum][ClassNum].OnMinute;	//此定时计划计算除掉开机项后的校验值
									PrgTimer[GroupNum][ClassNum].OnHour				 = RcvData.RcvOpt[1];
									PrgTimer[GroupNum][ClassNum].OnMinute			 = RcvData.RcvOpt[2];
									PrgTimer[GroupNum][ClassNum].CheckSum 		^= PrgTimer[GroupNum][ClassNum].OnHour; 
									PrgTimer[GroupNum][ClassNum].CheckSum 		^= PrgTimer[GroupNum][ClassNum].OnMinute;
									AllPrgCheckSum[GroupNum]									^= PrgTimer[GroupNum][ClassNum].CheckSum;	//重加载校验值
									
									Eprom_Write_Timer(GroupNum, ClassNum, EPROM_TIMER_ON, PrgTimer[GroupNum][ClassNum].OnHour, PrgTimer[GroupNum][ClassNum].OnMinute);
									
								} break;
								
							//设置关机时间
							case 0x04:
								{
									AllPrgCheckSum[GroupNum]									^= PrgTimer[GroupNum][ClassNum].CheckSum;	//去除此定时计划的校验值
									PrgTimer[GroupNum][ClassNum].CheckSum			^= PrgTimer[GroupNum][ClassNum].OffHour;		//此定时计划除掉开机项后的校验值
									PrgTimer[GroupNum][ClassNum].CheckSum			^= PrgTimer[GroupNum][ClassNum].OffMinute;	//此定时计划计算除掉开机项后的校验值
									PrgTimer[GroupNum][ClassNum].OffHour			 = RcvData.RcvOpt[1];
									PrgTimer[GroupNum][ClassNum].OffMinute		 = RcvData.RcvOpt[2];
									PrgTimer[GroupNum][ClassNum].CheckSum 		^= PrgTimer[GroupNum][ClassNum].OffHour; 
									PrgTimer[GroupNum][ClassNum].CheckSum 		^= PrgTimer[GroupNum][ClassNum].OffMinute;
									AllPrgCheckSum[GroupNum]									^= PrgTimer[GroupNum][ClassNum].CheckSum;	//重加载校验值
									
									Eprom_Write_Timer(GroupNum, ClassNum, EPROM_TIMER_OFF, PrgTimer[GroupNum][ClassNum].OffHour, PrgTimer[GroupNum][ClassNum].OffMinute);
								} break;
								
							//设置实时时钟
							case 0x05:
								{
									RealTime.Hour		=	RcvData.RcvOpt[1];
									RealTime.Minute	= RcvData.RcvOpt[2];
									RealTime.Second	= RcvData.RcvOpt[3];
								} break;
								
							
								//Clear the timer
							case 0x06:
								{
									if (RcvData.RcvOpt[1] == 0x1)
									{
										AllPrgCheckSum[GroupNum]						 			^= PrgTimer[GroupNum][ClassNum].CheckSum;	//去除此定时计划的校验值
										PrgTimer[GroupNum][ClassNum].CheckSum			^= PrgTimer[GroupNum][ClassNum].OnHour;		//此定时计划除掉开机项后的校验值
										PrgTimer[GroupNum][ClassNum].CheckSum			^= PrgTimer[GroupNum][ClassNum].OnMinute;	//此定时计划计算除掉开机项后的校验值
										PrgTimer[GroupNum][ClassNum].OnHour				 = 0xFF;
										PrgTimer[GroupNum][ClassNum].OnMinute			 = 0xFF;
										PrgTimer[GroupNum][ClassNum].CheckSum 		^= PrgTimer[GroupNum][ClassNum].OnHour; 
										PrgTimer[GroupNum][ClassNum].CheckSum 		^= PrgTimer[GroupNum][ClassNum].OnMinute;
										AllPrgCheckSum[GroupNum]						 			^= PrgTimer[GroupNum][ClassNum].CheckSum;	//重加载校验值
										
										Eprom_Write_Timer(GroupNum, ClassNum, EPROM_TIMER_ON, 0xFF, 0xFF);
									}
									else if (RcvData.RcvOpt[1] == 0x0)
									{
										AllPrgCheckSum[GroupNum]						 			^= PrgTimer[GroupNum][ClassNum].CheckSum;		//去除此定时计划的校验值
										PrgTimer[GroupNum][ClassNum].CheckSum			^= PrgTimer[GroupNum][ClassNum].OffHour;		//此定时计划计算除掉开机项后的校验值
										PrgTimer[GroupNum][ClassNum].CheckSum			^= PrgTimer[GroupNum][ClassNum].OffMinute;	//此定时计划计算除掉开机项后的校验值
										PrgTimer[GroupNum][ClassNum].OffHour			 = 0xFF;
										PrgTimer[GroupNum][ClassNum].OffMinute		 = 0xFF;
										PrgTimer[GroupNum][ClassNum].CheckSum 		^= PrgTimer[GroupNum][ClassNum].OffHour; 
										PrgTimer[GroupNum][ClassNum].CheckSum 		^= PrgTimer[GroupNum][ClassNum].OffMinute;
										AllPrgCheckSum[GroupNum]						 			^= PrgTimer[GroupNum][ClassNum].CheckSum;		//重加载校验值
										
										Eprom_Write_Timer(GroupNum, ClassNum, EPROM_TIMER_OFF, 0xFF, 0xFF);
									}
								} break;
								
							//其他指令视为无效	
							default:
								{
									ReplyData.ReplyNum	= 0;			//此时不回复任何数据
								} break;		
						}//读取设置指令
		
				} break;
				
				
				
				
				
			// APP发送的其他指令不作任何处理
			default:
				{
					asm("nop");
				} break;
				
				
		}/* ## 指令字判断 ## */		               
  } //接收到数据
}
