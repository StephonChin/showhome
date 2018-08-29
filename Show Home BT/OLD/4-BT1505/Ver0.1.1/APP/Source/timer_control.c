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
#define			PORT_SWITCH_0							PA_ODR_ODR3
#define			PORT_SWITCH_1							PB_ODR_ODR5
#define			PORT_SWITCH_2							PC_ODR_ODR3
#define			PORT_SWITCH_3							PC_ODR_ODR4
#define			PORT_SWITCH_4							PC_ODR_ODR5

#define     NULL              				0
#define			DEF_REPLY_REPEAT()				RepeatFlag = TRUE;\
																			RepeatDelayTime = 0;\
																			RepeatCnt = 0

																				
																				
/*************************************************/
		/* Global variables */
_TypeAlarm				PrgTimer[5][10];
_TypeRealTime			RealTime;
_Uchar						AllPrgCheckSum[5];




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
	static _Flag		TrigFlag = TRUE;
	static 	_Flag		StatusReplyFlag;
	static	_Uchar	GroupCnt;

		
		
/* 定时计划 */
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
		
		//switch0定时开
		for (GroupCnt = 0; GroupCnt < 5; GroupCnt++)
		{
			for (_Uchar TempCnt = 0; TempCnt < 10; TempCnt++)
			{
				if ( (PrgTimer[GroupCnt][TempCnt].OnHour == RealTime.Hour) && (PrgTimer[GroupCnt][TempCnt].OnMinute == RealTime.Minute) )
				{
					switch (GroupCnt)
					{
						case 0:
							if (PORT_SWITCH_0 == 0)
							{
								PORT_SWITCH_0 	= 1;
								AllStatus_One	= 1;
								StatusReplyFlag	= TRUE;
							}
						break;

						case 1:
							if (PORT_SWITCH_1 == 0)
							{
								PORT_SWITCH_1 	= 1;
								AllStatus_Two	= 1;
								StatusReplyFlag	= TRUE;
							}
						break;

						case 2:
							if (PORT_SWITCH_2 == 0)
							{
								PORT_SWITCH_2 	= 1;
								AllStatus_Three	= 1;
								StatusReplyFlag	= TRUE;
							}
						break;

						case 3:
							if (PORT_SWITCH_3 == 0)
							{
								PORT_SWITCH_3 	= 1;
								AllStatus_Four	= 1;
								StatusReplyFlag	= TRUE;
							}
						break;

						case 4:
							if (PORT_SWITCH_4 == 0)
							{
								PORT_SWITCH_4 	= 1;
								AllStatus_Five	= 1;
								StatusReplyFlag	= TRUE;
							}
						break;
					}
				}
			}
		} //switch0定时开
		
		//switch0定时关
		for (GroupCnt = 0; GroupCnt < 5; GroupCnt++)
		{
			for (_Uchar TempCnt = 0; TempCnt < 10; TempCnt++)
			{
				if ( (PrgTimer[GroupCnt][TempCnt].OffHour == RealTime.Hour) && (PrgTimer[GroupCnt][TempCnt].OffMinute == RealTime.Minute) )
				{
					switch (GroupCnt)
						{
							case 0:
								if (PORT_SWITCH_0 == 1)
								{
									PORT_SWITCH_0 	= 0;
									AllStatus_One	= 0;
									StatusReplyFlag	= TRUE;
								}
							break;

							case 1:
								if (PORT_SWITCH_1 == 1)
								{
									PORT_SWITCH_1 	= 0;
									AllStatus_Two	= 0;
									StatusReplyFlag	= TRUE;
								}
							break;

							case 2:
								if (PORT_SWITCH_2 == 1)
								{
									PORT_SWITCH_2 	= 0;
									AllStatus_Three	= 0;
									StatusReplyFlag	= TRUE;
								}
							break;

							case 3:
								if (PORT_SWITCH_3 == 1)
								{
									PORT_SWITCH_3 	= 0;
									AllStatus_Four	= 0;
									StatusReplyFlag	= TRUE;
								}
							break;

							case 4:
								if (PORT_SWITCH_4 == 1)
								{
									PORT_SWITCH_4 	= 0;
									AllStatus_Five	= 0;
									StatusReplyFlag	= TRUE;
								}
							break;
						}
				}
			} 
		}//switch0定时关
		
		
		//判断是否允许回复状态
		if (StatusReplyFlag)
		{
			//清标志位
			StatusReplyFlag = FALSE;

			DEF_REPLY_REPEAT();
			ReplyData.ReplyNum			= 0x02;
			ReplyData.ReplyCmd 			= 0x02;
			ReplyData.ReplyOpt[0] 		= AllStatus;	//开关状态
			ReplyData.ReplyOpt[1]		= 0x00;			
			ReplyData.ReplyOpt[2]		= AllPrgCheckSum[0];
			ReplyData.ReplyOpt[3]		= AllPrgCheckSum[1];
			ReplyData.ReplyOpt[4]		= AllPrgCheckSum[2];
			ReplyData.ReplyOpt[5]		= AllPrgCheckSum[3];
			ReplyData.ReplyOpt[6]		= AllPrgCheckSum[4];
		}
	}
}