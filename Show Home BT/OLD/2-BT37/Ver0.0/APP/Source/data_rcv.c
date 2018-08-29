/********************************************
 * FileName: data_rcv.c
 * Date: 2016.01.16
 * Author: DS.Chin
********************************************/
#include "stm8s003f3p.h"
#include "stm8s_bitsdefine.h"
#include "system.h"
#include "string.h"
#include "data_rcv.h"

/************************************************************************************/
                               /* Defines */
volatile _Bool  UART_RCV_FLAG           	@UART1_SR:5;
volatile _Bool  UART_SEND_FLAG          	@UART1_SR:7;
#define         UART_REGISTER            		UART1_DR
#define         CHARACTER_START          	0xFD
#define         CHARACTER_END            	0xFE
#define         RCV_DATA_MAX             		10      //Received data buffer' size

/************************************************************************************/
                              /* Global variables */ 
_Uchar      RcvDataBuf[RCV_DATA_MAX];         //Received data buffer
//_Uchar      RcvData[5];                       //Received data 0: ID 1: Mode 2: Color
_RcvDataType	RcvData;

_Flag       RcvStatus;                        //Received status DISABLE | ENABLE

_Flag      RcvSttFlag;         //Receive start flag
_Uchar     RcvByteCnt;	        //Receive data count 

enum    _Enum_ERR
{
    ERR_DEFAULT = 0,
    ERR_COMMAND = 1,
    ERR_SUCCESS  =2
}RcvErr = 0;             //Received status 0:default 1:command err 2:command OK

/**************************************************************************************
 * FunctionName: Uart_Rcv_Interrupt
 */
@far @interrupt void Uart_Rcv_Interrupt(void)
{  
    /* Clear the receive flag */
    UART_RCV_FLAG = FALSE;    
    
    /* Start to receive */
	if (FALSE == RcvSttFlag)
	{
		RcvDataBuf[0] = UART_REGISTER;

		if (RcvDataBuf[0] == CHARACTER_START)   //start character
		{
			RcvSttFlag = TRUE;
      RcvByteCnt = 0;
		}
		else
		{
			RcvDataBuf[0] = 0;
      RcvErr        = ERR_COMMAND;
		}
	}
	else
	{
		RcvByteCnt++;
		
		RcvDataBuf[RcvByteCnt] = UART_REGISTER;
		if(RcvDataBuf[RcvByteCnt] == CHARACTER_START)
		{
		  RcvDataBuf[0] = CHARACTER_START;
		  RcvByteCnt = 0;
		}
    
    else
    {
      if (RcvDataBuf[RcvByteCnt] == CHARACTER_END)  // end character
      {
        RcvSttFlag  = FALSE;
        RcvErr      = ERR_SUCCESS;
      }
          
      else if (RcvByteCnt > (RCV_DATA_MAX -1))
      {
        RcvSttFlag    = FALSE;
        RcvDataBuf[0] = 0;
        RcvErr        = ERR_COMMAND;
      }
    }
	}
}

/*********************************************************************************
 * FunctionName: Rcv_Data_From_App
 */
void Rcv_Data_From_App(void)
{
    _Uchar          TempCnt = 0;
     
     switch (RcvErr)
     {
         /* There is no action */
         case ERR_DEFAULT:
                    RcvStatus = FALSE;
         
         break;
         
         /* Recieved Err characters */
         case ERR_COMMAND:
                    RcvStatus = FALSE;
            
         break;
         
         /* recieved Correct string */
         case ERR_SUCCESS:
                    /* Save the data */
                    RcvData.Header 		= RcvDataBuf[1];
					RcvData.TypeH			= RcvDataBuf[2];
					RcvData.TypeL			= RcvDataBuf[3];
					RcvData.GroupClass  = RcvDataBuf[4];
					RcvData.FirstCmd		= RcvDataBuf[5];
					RcvData.SecondCmd  = RcvDataBuf[6];
                            
                    /* Clear the buffer and Err status */
                    for (TempCnt = 0; TempCnt < RCV_DATA_MAX; TempCnt++)
                    {
                        RcvDataBuf[TempCnt] = 0;
                    }
                    
                    RcvStatus = TRUE;
         break;
         
         /* other case */
         default:
                    RcvStatus = FALSE;
         break;
     }
     
     /* clear RcvErr */
     RcvErr = ERR_DEFAULT;
}
