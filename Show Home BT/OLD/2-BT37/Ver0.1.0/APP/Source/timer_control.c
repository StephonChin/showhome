/**********************************************
* File Name: timer_control.c
* Date: 2016.08.09
* Description:定时计划
***********************************************/
#include "iostm8s003f3.h"
#include "system.h"
#include "timer_control.h"




/***********************************************/
		/* define */
#define			PORT_SWITCH_0							PD_ODR_ODR2
#define			PORT_SWITCH_1							PD_ODR_ODR3
#define     NULL              				0
#define			DEF_REPLY_REPEAT()				RepeatFlag = TRUE;\
																			RepeatDelayTime = 0;\
																			RepeatCnt = 0

																				
																				
/*************************************************/
		/* Global variables */
_TypeAlarm				PrgTimer[2][10];
_TypeRealTime			RealTime;
_Uchar						AllPrgCheckSum[2];




/*************************************************/
		/* File variables */
_Flag				SecondFlag;





/**************************************************/
/* * * *
* Function:计时1秒
* * * */
#pragma	vector=TIM4_OVR_UIF_vector 
__interrupt void Tim4_Update_Interrupt(void)
{
	static	_Uchar	MicroSecond[2];
	
  TIM4_SR &= (~0x01);
  
  MicroSecond[0]++;
  if (MicroSecond[0] > 99) //100ms
  {
    MicroSecond[0] 		= 0;
    MicroSecond[1]++;
    if (MicroSecond[1] > 9)
    {
      MicroSecond[1] 	= 0;
      SecondFlag 			= TRUE;     // set SecondFlag every second
    }
  }
}






/************************************************/
/* * * *
* @ FunctionName:Timer_Control
* @ Date: 2016.08.09
* @ Author: DS.Chin
* * * */
void Timer_Control(void)
{
		static 	_Flag		TimerInit;
		static _Flag		StatusReplyFlag;
		
		/* 定时器初始化 */
		if (TimerInit == FALSE)
		{
			TimerInit	= TRUE;
			for (_Uchar GroupCnt = 0; GroupCnt < 2; GroupCnt++)
			for (_Uchar TempCnt = 0; TempCnt < 10; TempCnt++)
			{
				PrgTimer[GroupCnt][TempCnt].OnHour		= 0xFF;
				PrgTimer[GroupCnt][TempCnt].OnMinute	= 0xFF;
				PrgTimer[GroupCnt][TempCnt].OffHour		= 0xFF;
				PrgTimer[GroupCnt][TempCnt].OffMinute	= 0xFF;
			}
			
			AllPrgCheckSum[0] = 0x00;
			AllPrgCheckSum[1] = 0x00;
		}
		
		
		
		/* 定时计划 */
		else
		{
			if (SecondFlag)				//1秒
			{
				SecondFlag = FALSE;
				
				//秒计数
				RealTime.Second++;
				if (RealTime.Second > 59)
				{
					RealTime.Second		= 0;
					
					//分钟计数
					RealTime.Minute++;
					if (RealTime.Minute > 59)
					{
						RealTime.Minute = 0;
						
						//小时计数
						RealTime.Hour++;
						if (RealTime.Hour > 23)
						{
							RealTime.Hour = 0;
						}//小时计数
					}//分钟计数
				} //秒计数
				
				
				//switch0定时开
				for (_Uchar TempCnt = 0; TempCnt < 10; TempCnt++)
				{
					if ( (PrgTimer[0][TempCnt].OnHour == RealTime.Hour) && (PrgTimer[0][TempCnt].OnMinute == RealTime.Minute) )
					{
						if (PORT_SWITCH_0 == 0)
						{
							PORT_SWITCH_0 	= 1;
							AllStatus_One		= 1;
							StatusReplyFlag	= TRUE;
						}
					}
				} //switch0定时开
				
				//switch0定时关
				for (_Uchar TempCnt = 0; TempCnt < 10; TempCnt++)
				{
					if ( (PrgTimer[0][TempCnt].OffHour == RealTime.Hour) && (PrgTimer[0][TempCnt].OffMinute == RealTime.Minute) )
					{
						if (PORT_SWITCH_0 == 1)
						{
							PORT_SWITCH_0 	= 0;
							AllStatus_One		= 0;
							
							StatusReplyFlag	= TRUE;
						}
					}
				} //switch0定时关
				
				
				//switch1定时开
				for (_Uchar TempCnt = 0; TempCnt < 10; TempCnt++)
				{
					if ( (PrgTimer[1][TempCnt].OnHour == RealTime.Hour) && (PrgTimer[1][TempCnt].OnMinute == RealTime.Minute) )
					{
						if (PORT_SWITCH_1 == 0)
						{
							PORT_SWITCH_1 	= 1;
							AllStatus_Two		= 1;
							
							StatusReplyFlag = TRUE;
						}
					}
				} //switch1定时开
				
				//switch1定时关
				for (_Uchar TempCnt = 0; TempCnt < 10; TempCnt++)
				{
					if ( (PrgTimer[1][TempCnt].OffHour == RealTime.Hour) && (PrgTimer[1][TempCnt].OffMinute == RealTime.Minute) )
					{
						if (PORT_SWITCH_1 == 1)
						{
							PORT_SWITCH_1 	= 0;
							AllStatus_Two		= 0;
							
							StatusReplyFlag = TRUE;
						}
					}
				} //switch1定时关
				
				
				/* 回复 */
				if (StatusReplyFlag)
				{
					StatusReplyFlag = FALSE;
					
					DEF_REPLY_REPEAT();
					ReplyData.ReplyNum			= 0x02;
					ReplyData.ReplyCmd 			= 0x02;
					ReplyData.ReplyOpt[0] 	= AllStatus;	//开关状态
					ReplyData.ReplyOpt[1]		= 0x00;			
					ReplyData.ReplyOpt[2]		= AllPrgCheckSum[0];
					ReplyData.ReplyOpt[3]		= AllPrgCheckSum[1];
					ReplyData.ReplyOpt[4]		= 0x00;
					ReplyData.ReplyOpt[5]		= 0x00;
					ReplyData.ReplyOpt[6]		= 0x00;
				}
				
			}
		}
}