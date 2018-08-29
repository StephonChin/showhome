/********************************************
 * FileName: data_rcv.c
 * Date: 2016.08.08
 * Author: DS.Chin
********************************************/
#include "iostm8s003f3.h"
#include "system.h"
#include "string.h"
#include "data_rcv.h"

/************************************************************************************/
                          /* Defines */
#define		  	UART_RCV_FLAG           UART1_SR_RXNE
#define 	  	UART_SEND_FLAG          UART1_SR_TXE
#define         UART_REGISTER           UART1_DR
#define         CHARACTER_START         0xFD
#define         CHARACTER_END           0xFE
#define         RCV_DATA_MAX            10      //Received data buffer' size

/************************************************************************************/
/* Global Variables */
_TypeRcvData	RcvData;
_Flag       	RcvStatus;                        //Received status DISABLE | ENABLE

/**********************************************************************************/
/* File Variables */
_Uchar      	RcvDataBuf[RCV_DATA_MAX];         //Received data buffer
enum    _Enum_ERR
{
    ERR_DEFAULT    	= 0,
    ERR_COMMAND 		= 1,
    ERR_SUCCESS    	= 2
}RcvErr;             //Received status 0:default 1:command err 2:command OK

/**************************************************************************************
 * FunctionName: Uart_Rcv_Interrupt
 */
#pragma vector = UART1_R_RXNE_vector
__interrupt void Uart_Rcv_Interrupt(void)
{ 
  	static _Flag      		RcvSttFlag;         //Receive start flag
	static _Uchar     		RcvByteCnt;	        //Receive data count
		
	/* Clear the receive flag */
	UART_RCV_FLAG = FALSE;    
				
	/*
	* @ start to receive 
	*/
	if (FALSE == RcvSttFlag)
	{
		RcvDataBuf[0] = UART_REGISTER;
				
		/*
		* # start character received successfully
		*/
		if (RcvDataBuf[0] == CHARACTER_START)
		{
			RcvSttFlag = TRUE;
			RcvByteCnt = 0;
		} // # start character received successfully
				
				
				
		/*
		 * # start character received failly
		 */
		else
		{
			RcvDataBuf[0] = 0;
			RcvErr              = ERR_COMMAND;
		} // # start character received failly
				
	} // @ start to receive
			
			
	else
	{
		RcvByteCnt++;
				
		RcvDataBuf[RcvByteCnt] = UART_REGISTER;
				
		/* 
		* @ start character received again 
		*/
		if(RcvDataBuf[RcvByteCnt] == CHARACTER_START)
		{
			RcvDataBuf[0] 	= CHARACTER_START;
			RcvByteCnt 		= 0;
		} // @start character recievd again
				
				
				
		/*
		* @ working normally
		*/
		else
		{
			/* 
			* # received end character
			*/
			if (RcvDataBuf[RcvByteCnt] == CHARACTER_END)
			{
				RcvSttFlag  = FALSE;
				RcvErr      = ERR_SUCCESS;
			} // # received end character
							
					
					
			/*
			* # received overflow
			*/
			else if (RcvByteCnt > (RCV_DATA_MAX -1))
			{
				RcvSttFlag    	= FALSE;
				RcvDataBuf[0] 	= 0;
				RcvErr        	= ERR_COMMAND;
			} // # received overflow
		} // @ working normally
	}
}

/*********************************************************************************
 * FunctionName: Rcv_Data_From_App
 */
void Rcv_Data_From_App(void)
{   
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
				 {
						RcvData.Header			= RcvDataBuf[1];
						RcvData.GroupClass  	= RcvDataBuf[2];
					
						for (_Uint8 TempCnt = 0; TempCnt < 4; TempCnt++)
						{
								RcvData.RcvOpt[TempCnt]	= RcvDataBuf[TempCnt + 3];
						}
																
						/* Clear the buffer and Err status */
						for (_Uchar TempCnt = 0; TempCnt < RCV_DATA_MAX; TempCnt++)
						{
							RcvDataBuf[TempCnt] = 0;
						}
												
						RcvStatus = TRUE;
				 } break;
         
         /* other case */
         default:
            RcvStatus = FALSE;
         break;
     }
     
     /* clear RcvErr */
     RcvErr = ERR_DEFAULT;
}
