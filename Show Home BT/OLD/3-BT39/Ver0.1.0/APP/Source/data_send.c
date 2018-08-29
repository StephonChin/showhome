/****************************************************
 * power_on_init.c
 */
 
/**************************************************************
 *Include
 */
#include "iostm8s003f3.h"
#include "system.h"
#include "data_send.h"

/*************************************************************
 * defines
 */
#define	  		UART_SEND_FLAG           UART1_SR_TXE
#define         UART_REGISTER            UART1_DR

#define         PACKAGE_HEAD            (_Uchar)0xFD
#define         PACKAGE_TAIL            (_Uchar)0xFE

#define 		REPEAT_CNT 				3		//设备类型回复次数
#define 		REPEAT_TIME 			3		//50ms间隔回复

/*************************************************************
 * global variables
 */
_TypeReply	ReplyData;
_Flag				TypeReply;

_Flag				RepeatFlag;						//重复发送标志位
_Uchar   		RepeatCnt;						//回复次数计数参数
_Uchar   		RepeatDelayTime;			//回复次数延迟参数

/**************************************************************
* Function Name: Respond_App_Init
*/
void Respond_App_Init(void)
{
  TypeReply 			= TRUE;
	RepeatFlag 			= TRUE;
	RepeatCnt 			= 0;
	RepeatDelayTime = 0;
}

/**************************************************************
 * FunctionName: Respond_APP
 */
void Respond_App(void)
{
  	/* 设备类型回复 */
  	if (TypeReply == TRUE)
	{
	  	/* 重复回复允许时 */
	  	if (RepeatFlag == TRUE)
		{
		  	/* 清重复标志位 */
		  	RepeatFlag		= FALSE;
			
			/* 回复内容 */
			Respond_Byte(0xFC);  
          	Respond_Byte(DEVICE_NAME_ONE);
			Respond_Byte(DEVICE_NAME_TWO);
          	Respond_Byte(DEVICE_TYPE);
			Respond_Byte(0xFE);
		}
		
		/* 重复回复延时 */
		RepeatDelayTime++;
        if (RepeatDelayTime > 49)	//500ms
		{
           	RepeatDelayTime = 0;
            RepeatFlag 		=TRUE;
                
            RepeatCnt++;
            if (RepeatCnt > 4)  //5次
            {
              	RepeatCnt = 0;
              	
				/* 清回复编号 */
				TypeReply = FALSE;
            }
        } // 50 * 10ms = 500ms
	}
	
	else
	{
		/* 回复编号不为0时回复数据 */
		if (ReplyData.ReplyNum != 0)
		{
			/* 重复回复允许时 */
			if (RepeatFlag == TRUE)
			{
				/* 清重复标志位 */
				RepeatFlag		= FALSE;
				
				/* 回复内容 */
				Respond_Byte(PACKAGE_HEAD);  
				Respond_Byte(ReplyData.ReplyCmd);
				
				for (_Uchar TempCnt = 0; TempCnt < 7; TempCnt++)
				{
					Respond_Byte(ReplyData.ReplyOpt[TempCnt]); 
				}
				Respond_Byte(PACKAGE_TAIL);
			}
			
			/* 重复回复延时 */
			RepeatDelayTime++;
			if (RepeatDelayTime > (REPEAT_TIME - 1) )	//间隔REPEAT_TIME * 10ms
			{
				RepeatDelayTime = 0;
				RepeatFlag 		=TRUE;
					
				RepeatCnt++;
				if (RepeatCnt > (REPEAT_CNT - 1) )  //REPEAT_CNT times
				{
					RepeatCnt = 0;
					
					/* 清回复编号 */
					ReplyData.ReplyNum	= 0;
				}
			} // 50 * 10ms = 500ms
		}
		
		
		else
		{
		  RepeatDelayTime = 0;
		  RepeatCnt = 0;
		}
	}

}

/**********************************************************************************
 * FunctionName: Respond_Str
 * Describe: when receive a  command , respond
 */
void Respond_Str(_Uchar *RspdStr)
{
    _Uchar  ErrCnt = 0;
    
    while (*RspdStr != '\0')
    {
        ErrCnt = 200;
        while (!UART_SEND_FLAG && ErrCnt)		
        {
            ErrCnt--;
        }
        UART_REGISTER = *RspdStr++;
    }
}   

/*********************************************************************************
 * FunctionName:Respond_Byte
 */
void Respond_Byte(_Uchar RspdByte)
{
    UART_REGISTER = RspdByte;
    while (!UART_SEND_FLAG);
}

