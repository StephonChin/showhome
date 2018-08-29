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
#define			PORT_SWITCH								PD_ODR_ODR2
#define     NULL              				0
#define			DEF_REPLY_REPEAT()				RepeatFlag = TRUE;\
																			RepeatDelayTime = 0;\
																			RepeatCnt = 0

																				
																				
/*************************************************/
		/* Global variables */
_TypeAlarm				PrgTimer[10];
_TypeRealTime			RealTime;
_Uchar						AllPrgCheckSum;




/*************************************************/
		/* File variables */
_Flag				SecondFlag;
_Flag				StatusReplyFlag;





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
	static _Flag		TrigFlag = TRUE;
	
	if (SecondFlag)				//1秒
	{
		SecondFlag = FALSE;
		
		//秒计数
		RealTime.Second++;
		if (RealTime.Second > 59)
		{
			RealTime.Second		= 0;
			
			TrigFlag = TRUE;
			
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
		
		
		if (TrigFlag == FALSE)	return;
		TrigFlag = FALSE;
		
		//定时开
		for (_Uchar TempCnt = 0; TempCnt < 10; TempCnt++)
		{
			if ( (PrgTimer[TempCnt].OnHour == RealTime.Hour) && (PrgTimer[TempCnt].OnMinute == RealTime.Minute))
			{
				if (PORT_SWITCH == 0)
				{
					PORT_SWITCH 	= 1;
					AllStatus_One	= 1;
					StatusReplyFlag	= TRUE;
				}
			}
		} //定时开
		
		//定时关
		for (_Uchar TempCnt = 0; TempCnt < 10; TempCnt++)
		{
			if ( (PrgTimer[TempCnt].OffHour == RealTime.Hour) && (PrgTimer[TempCnt].OffMinute == RealTime.Minute) )
			{
				if (PORT_SWITCH == 1)
				{
					PORT_SWITCH 	= 0;
					AllStatus_One	= 0;
					
					StatusReplyFlag	= TRUE;
				}
			}
		} //定时关
		
		
		/* 回复 */
		if (StatusReplyFlag)
		{
			StatusReplyFlag = FALSE;
			
			DEF_REPLY_REPEAT();
			OneStatus								= AllStatus;
			ReplyData.ReplyNum			= 0x03;
			ReplyData.ReplyCmd 			= 0x03;
			ReplyData.ReplyOpt[0] 	= 0x00;	
			ReplyData.ReplyOpt[1]		= 0x01;
			ReplyData.ReplyOpt[2]		= OneStatus;			//开关状态
			ReplyData.ReplyOpt[3]		= 0x00;
			ReplyData.ReplyOpt[4]		= 0x00;
			ReplyData.ReplyOpt[5]		= 0x00;
			ReplyData.ReplyOpt[6]		= 0x00;
		}
		
	}
}