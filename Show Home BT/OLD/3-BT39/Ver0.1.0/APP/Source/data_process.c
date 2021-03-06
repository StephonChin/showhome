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
	/* 处理接收APP数据 */
	APP_Data_Process();
}


/****************************************************************
* FunctionName: APP_Data_Process
*/
void APP_Data_Process(void)
{
	static _Flag       	BtInitFlag;        		//蓝牙初始化标志位
	_Uchar							GroupNum = 0;					//组号
	_Uchar							ClassNum = 0;					//类号
  
	//接收到数据
   if (RcvStatus)
   {
      RcvStatus = FALSE;  //clear recieved flag
     
	  	
		/*  # 蓝牙初始化判断 # */
    if (FALSE == BtInitFlag)
    {
       if (RcvData.Header == 0xF0) //接收到初始化指令
       {
          
          BtInitFlag = TRUE;    // 蓝牙初始化标志位置位
					
              		  
          // 上电指令回复
			  	TypeReply						= FALSE;
          ReplyData.ReplyNum	= 0x01;
			  	ReplyData.ReplyCmd 	= 0x01;
					for (_Uchar TempCnt = 0; TempCnt < 7; TempCnt++)
					{
						ReplyData.ReplyOpt[TempCnt]	= 0x00;
					}
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
			  	ReplyData.ReplyNum	 = 0x00;
				}break;
			
			
				
				
				
			//APP发送整体查询指令
			case 0x02:
			  {
						ReplyData.ReplyNum			= 0x02;
						ReplyData.ReplyCmd 			= RcvData.Header;		// 回复数据指令字	
						ReplyData.ReplyOpt[0]		= AllStatus;				// 开关状态
						ReplyData.ReplyOpt[1]		= DimmerDuty;				// 占空比
						ReplyData.ReplyOpt[2]		= AllPrgCheckSum;
						ReplyData.ReplyOpt[3]		= 0x00;
						ReplyData.ReplyOpt[4]		= 0x00;
						ReplyData.ReplyOpt[5]		= 0x00;
						ReplyData.ReplyOpt[6]		= 0x00;
						DEF_REPLY_REPEAT();
			  } break;
			
				
				
				
				
			// APP发送详细查询指令
		  case 0x03:
				{
						ReplyData.ReplyNum		= 0x03;
						ReplyData.ReplyCmd 		= RcvData.Header;
						
						//取得组号和类号
						GroupNum								= (RcvData.GroupClass & 0xF0) >> 4;
						ClassNum								= RcvData.GroupClass & 0x0F;
						
						switch (RcvData.RcvOpt[0])
						{
							//状态查询
							case 0x01:
								{
									OneStatus								= (AllStatus >> GroupNum) & 0x01;
									ReplyData.ReplyOpt[0] 	= RcvData.GroupClass;	
									ReplyData.ReplyOpt[1]		= 0x01;
									ReplyData.ReplyOpt[2]		= OneStatus;			//开关状态
									ReplyData.ReplyOpt[3]		= 0x00;
									ReplyData.ReplyOpt[4]		= 0x00;
									ReplyData.ReplyOpt[5]		= 0x00;
									ReplyData.ReplyOpt[6]		= 0x00;
								} break;
								
							
							//占空比查询
							case 0x02:
							{
								ReplyData.ReplyOpt[0]		= RcvData.GroupClass;
								ReplyData.ReplyOpt[1]		=	0x02;
								ReplyData.ReplyOpt[2]		= DimmerDuty;
								for (_Uchar TempCnt = 3; TempCnt < 7; TempCnt++)
								{
									ReplyData.ReplyOpt[TempCnt]	= 0x00;
								}
							} break;
								
								
							//定时开查询
							case 0x03:
								{
									ReplyData.ReplyOpt[0]		=	RcvData.GroupClass;
									ReplyData.ReplyOpt[1]		= 0x03;
									ReplyData.ReplyOpt[2]		= PrgTimer[ClassNum].OnHour;
									ReplyData.ReplyOpt[3]		= PrgTimer[ClassNum].OnMinute;
									ReplyData.ReplyOpt[4]		= 0x00;
									ReplyData.ReplyOpt[5]		= 0x00;
									ReplyData.ReplyOpt[6]		= 0x00;
								} break;
							
							//定时关查询
							case 0x04:
								{
									ReplyData.ReplyOpt[0]		=	RcvData.GroupClass;		//取得class的数值
									ReplyData.ReplyOpt[1]		= 0x04;
									ReplyData.ReplyOpt[2]		= PrgTimer[ClassNum].OffHour;
									ReplyData.ReplyOpt[3]		= PrgTimer[ClassNum].OffMinute;
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
						//取得组号和类号
						GroupNum							= (RcvData.GroupClass & 0xF0) >> 4;
						ClassNum							= RcvData.GroupClass & 0x0F;
					
						//收到APP指令后，回复
						ReplyData.ReplyNum		= 0x04;
						ReplyData.ReplyCmd 		= RcvData.Header;
						ReplyData.ReplyOpt[0]	= RcvData.GroupClass;;
						ReplyData.ReplyOpt[1]	= RcvData.RcvOpt[0];
						for (_Uchar TempCnt = 2; TempCnt < 7; TempCnt++)
						{
							ReplyData.ReplyOpt[TempCnt]	= 0x00;
						}
						
						
						//读取设置指令
						switch (RcvData.RcvOpt[0] & 0x0F)
						{
							//设置开关
							case 0x01:
								{
									if (RcvData.RcvOpt[1] == 0x00)
									{
										DimmerDutyBuf		= DimmerDuty;
										DimmerDuty			= 0;
										AllStatus_One		= 0;
									}
									
									/* 打开开关 */
									else
									{
										DimmerDuty			= DimmerDutyBuf;
										
										/* 当原先Duty = 0时，打开时为100 */
										if (DimmerDuty == 0)
										{
											DimmerDuty		= 100;
											DimmerDutyBuf	= DimmerDuty;
										}
										
										AllStatus_One	= 1;
									}
								} break;
								
								
							/* 设置占空比  */
							case 0x02:
							{
								DimmerDuty		= RcvData.RcvOpt[1];
								DimmerDutyBuf	= DimmerDuty;
								if (DimmerDuty == 0)
								{
									AllStatus_One = 0;
								}
								else
								{
									AllStatus_One = 1;
								}
							} break;
								
							//设置开机时间
							case 0x03:
								{
									AllPrgCheckSum						 			^= PrgTimer[ClassNum].CheckSum;	//去除此定时计划的校验值
									PrgTimer[ClassNum].CheckSum			^= PrgTimer[ClassNum].OnHour;		//此定时计划除掉开机项后的校验值
									PrgTimer[ClassNum].CheckSum			^= PrgTimer[ClassNum].OnMinute;	//此定时计划计算除掉开机项后的校验值
									PrgTimer[ClassNum].OnHour				 = RcvData.RcvOpt[1];
									PrgTimer[ClassNum].OnMinute			 = RcvData.RcvOpt[2];
									PrgTimer[ClassNum].CheckSum 		^= PrgTimer[ClassNum].OnHour; 
									PrgTimer[ClassNum].CheckSum 		^= PrgTimer[ClassNum].OnMinute;
									AllPrgCheckSum						 			^= PrgTimer[ClassNum].CheckSum;	//重加载校验值
								} break;
								
							//设置关机时间
							case 0x04:
								{
									AllPrgCheckSum						 			^= PrgTimer[ClassNum].CheckSum;		//去除此定时计划的校验值
									PrgTimer[ClassNum].CheckSum			^= PrgTimer[ClassNum].OffHour;		//此定时计划计算除掉开机项后的校验值
									PrgTimer[ClassNum].CheckSum			^= PrgTimer[ClassNum].OffMinute;	//此定时计划计算除掉开机项后的校验值
									PrgTimer[ClassNum].OffHour			 = RcvData.RcvOpt[1];
									PrgTimer[ClassNum].OffMinute		 = RcvData.RcvOpt[2];
									PrgTimer[ClassNum].CheckSum 		^= PrgTimer[ClassNum].OffHour; 
									PrgTimer[ClassNum].CheckSum 		^= PrgTimer[ClassNum].OffMinute;
									AllPrgCheckSum						 			^= PrgTimer[ClassNum].CheckSum;		//重加载校验值
								} break;
								
							//设置实时时钟
							case 0x05:
								{
									RealTime.Hour		=	RcvData.RcvOpt[1];
									RealTime.Minute	= RcvData.RcvOpt[2];
									RealTime.Hour		= RcvData.RcvOpt[3];
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
