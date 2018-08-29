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

_Uchar						DimmerDuty;
_Uchar						DimmerDutyBuf;



/*************************************************/
		/* File variables */
_Flag			SecondFlag;
_Flag			ZeroDetectFlag;
_Flag			StatusReplyFlag;


/* * * * 
 * 过零检测
* * * */
#pragma vector=0x08
 __interrupt void Zero_Check(void)
 {
	 ZeroDetectFlag	= TRUE;
	 return;
 }



/**************************************************/
/* * * *
* Function:计时1秒
* * * */
#pragma	vector=TIM4_OVR_UIF_vector 
__interrupt void Tim4_Update_Interrupt(void)
{
	static	_Uchar	MicroSecond[2];
	static	_Uchar	DimmerDutyCnt;
	
  TIM4_SR &= (~0x01);
	
	/* 占空比控制 */
	DimmerDutyCnt++;
	if (ZeroDetectFlag == TRUE)
	{
		ZeroDetectFlag = FALSE;
		DimmerDutyCnt = 0;
	}
	
	if ( (DimmerDutyCnt == (115 - DimmerDuty)) && (DimmerDuty > 0) )
	{
		PORT_SWITCH = 1;
	}
	
	if (DimmerDutyCnt > 114 )
	{
		PORT_SWITCH = 0;
	}
	
	
  /* prg计时1秒 */
  MicroSecond[0]++;
  if (MicroSecond[0] > 124) //8ms
  {
    MicroSecond[0] 		= 0;
    MicroSecond[1]++;
    if (MicroSecond[1] > 124) //1s
    {
      MicroSecond[1] 	= 0;
      SecondFlag 			= TRUE;     // set SecondFlag every second
    }
  }
	
	return;
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
		
		/* 定时器初始化 */
		if (TimerInit == FALSE)
		{
			TimerInit	= TRUE;
			for (_Uchar TempCnt = 0; TempCnt < 10; TempCnt++)
			{
				PrgTimer[TempCnt].OnHour		= 0xFF;
				PrgTimer[TempCnt].OnMinute	= 0xFF;
				PrgTimer[TempCnt].OffHour		= 0xFF;
				PrgTimer[TempCnt].OffMinute	= 0xFF;
			}
			
			AllPrgCheckSum = 0x00;
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
				
				
				//定时开
				for (_Uchar TempCnt = 0; TempCnt < 10; TempCnt++)
				{
					if ( (PrgTimer[TempCnt].OnHour == RealTime.Hour) && (PrgTimer[TempCnt].OnMinute == RealTime.Minute) )
					{
						if (DimmerDuty == 0)		//仅当在开关关闭时改变状态，并回复数据
						{
							DimmerDuty		= DimmerDutyBuf;
							AllStatus_One	= 1;
							
							StatusReplyFlag		= TRUE;					//允许回复
						}
					}
				} //定时开
				
				//定时关
				for (_Uchar TempCnt = 0; TempCnt < 10; TempCnt++)
				{
					if ( (PrgTimer[TempCnt].OffHour == RealTime.Hour) && (PrgTimer[TempCnt].OffMinute == RealTime.Minute) )
					{
						if (DimmerDuty > 0)		//仅当在开关打开时改变状态，并回复数据
						{
							DimmerDutyBuf	= DimmerDuty;			//存储占空比
							DimmerDuty		= 0;							//更改占有空比为0
							AllStatus_One	= 0;
							
							StatusReplyFlag		= TRUE;				//允许回复
						}
					}
				} //定时关
				
				
				//回复
				if (StatusReplyFlag)
				{
					StatusReplyFlag = FALSE;
					
					DEF_REPLY_REPEAT();
					ReplyData.ReplyNum			= 0x03;
					ReplyData.ReplyCmd 			= 0x03;
					ReplyData.ReplyOpt[0] 	= 0x00;	
					ReplyData.ReplyOpt[1]		= 0x02;						//占空比回复
					ReplyData.ReplyOpt[2]		= DimmerDuty;			//开关状态
					ReplyData.ReplyOpt[3]		= 0x00;	
					ReplyData.ReplyOpt[4]		= 0x00;
					ReplyData.ReplyOpt[5]		= 0x00;
					ReplyData.ReplyOpt[6]		= 0x00;
				}
			}
		}
}