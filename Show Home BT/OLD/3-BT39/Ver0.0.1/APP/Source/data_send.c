/****************************************************
 * power_on_init.c
 */
 
/**************************************************************
 *Include
 */
#include "stm8s003f3p.h"
#include "stm8s_bitsdefine.h"
#include "system.h"
#include "data_send.h"

/*************************************************************
 * defines
 */
volatile _Bool  UART_SEND_FLAG          @UART1_SR:7;
#define         UART_REGISTER            UART1_DR

#define         PACKAGE_HEAD            (_Uchar)0xFD
#define         PACKAGE_TAIL            (_Uchar)0xFE

/*************************************************************
 * global variables
 */
_Flag       ReplyRepeatFlag;        //flag about send repeat
_Flag       PowerReplyFlag;         //replay flag when power on
_Flag       StatusReplyFlag;         //flag about equipment is ready to send the status information
_Flag       NormalReplyFlag;        //respond 's flag

_Uchar      StatusReplyCommand;      // ReplyCommand
_Uchar      NormalReplyCommand;

_Uchar   RepeatCnt;
_Uchar   RepeatDelayTime;

_Uchar		ReplyStatus;
_Uchar		ReplyGroup;
/**************************************************************
 * FunctionName: Respond_APP
 */
void Respond_App(void)
{
    if (PowerReplyFlag)// power on
    {
      if (ReplyRepeatFlag)  //send repeat
        {
          /* clear repeat flag */
          ReplyRepeatFlag = FALSE;
            
          /* send power on command */
          Respond_Byte(PACKAGE_HEAD);   // 0xFD
          Respond_Byte(0x01);  // 0x01
          Respond_Byte(0x00); 
          Respond_Byte(0x00);
          Respond_Byte(0x00);
          Respond_Byte(PACKAGE_TAIL);   // 0xFE
        } //send repeat
        
        else //delay 500ms
        {
          RepeatDelayTime++;
          if (RepeatDelayTime > 49) // 50 * 10ms = 500ms
          {
            RepeatDelayTime = 0;
            ReplyRepeatFlag =TRUE;
                
            RepeatCnt++;
            if (RepeatCnt > 6)  //send 10 times
            {
              RepeatCnt = 0;
              PowerReplyFlag = FALSE;
            }
          } // 50 * 10ms = 500ms
      } //delay 500ms
    }// power on
    
    
    else
    if (StatusReplyFlag) 
    {
        if (ReplyRepeatFlag)  //send repeat
        {
          /* clear repeat flag */
          ReplyRepeatFlag = FALSE;
            
          //* send power on command */
          Respond_Byte(PACKAGE_HEAD);   // 0xFD
          Respond_Byte(StatusReplyCommand);  // 0x02 | (flag | 0x02)
          Respond_Byte(0x00); 
          Respond_Byte(ReplyStatus);
          Respond_Byte(DimmerDuty);
          Respond_Byte(PACKAGE_TAIL);   // 0xFE
        } //send repeat
        
        else //delay 800ms
        {
          RepeatDelayTime++;
          if (RepeatDelayTime > 4) // 80 * 10ms = 800ms
          {
            RepeatDelayTime = 0;
            ReplyRepeatFlag =TRUE;
                
            RepeatCnt++;
            if (RepeatCnt > 2)  //send 3 times
            {
              RepeatCnt = 0;
              StatusReplyFlag = FALSE;
            }
          } // 80 * 10ms = 800ms
      } //delay 800ms
    }
    
    /*else
    if (NormalReplyFlag)  //working normally
    {
      if (ReplyRepeatFlag)  //send repeat
        {
          // clear repeat flag
          ReplyRepeatFlag = FALSE;
            
          // send data 
          Respond_Byte(PACKAGE_HEAD);
          Respond_Byte(NormalReplyCommand);
          Respond_Byte(0x00);
          Respond_Byte(0x00);
          Respond_Byte(0x00);
          Respond_Byte(PACKAGE_TAIL);
        } //send repeat
        
        else //delay 800ms
        {
          RepeatDelayTime++;
          if (RepeatDelayTime > 79) // 80 * 10ms = 800ms
          {
            RepeatDelayTime = 0;
            ReplyRepeatFlag =TRUE;
                
            RepeatCnt++;
            if (RepeatCnt > 6)  //send 10 times
            {
              RepeatCnt = 0;
              NormalReplyFlag = FALSE;
            }
          } // 80 * 10ms = 800ms
      } //delay 800ms
    }//working normally*/
    
    /* clear */
    else
    {
      RepeatDelayTime = 0;
      RepeatCnt = 0;
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

