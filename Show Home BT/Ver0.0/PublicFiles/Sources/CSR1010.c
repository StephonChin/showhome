/*******************************************************************************
	*
	* FILE NAME
	* 					CSR1010.c
	* BRIEF
	*						Communicate with BT CSR1010
	*
*******************************************************************************/
#include "CSR1010.h"

/*<-- Global Variables -----------------------------------------------------> */
_TypeRcvData			RcvData;
_TypeSndData			SndData;
_Flag       			RcvFlag;

/*<-- File Variables--------------------------------------------------------> */
_Uint8      			RcvDataBuf[RCV_DATA_MAX];
_Flag							ErrFlag;

/**
 	* FunctionName		Uart_Rcv_Interrupt
 	*/
#pragma vector = UART1_R_RXNE_vector
__interrupt void Uart_Rcv_Interrupt(void)
{ 
	static _Flag      		RcvSttFlag;         //Receive start flag
	static _Uint8     		RcvByteCnt;	        //Receive data count
		
	/* Clear the receive flag */
	UART_RCV_FLAG = FALSE;    
				
	/* start to receive */
	if (FALSE == RcvSttFlag)
	{
		RcvDataBuf[0] = UART_REGISTER;
				
		/* start character received successfully */
		if (RcvDataBuf[0] == CHARACTER_START)
		{
			RcvSttFlag		 	= TRUE;
			RcvByteCnt 			= 0;
		} 
				
		/* start character received failly */
		else
		{
			RcvDataBuf[0] 	= 0;
			ErrFlag         = FALSE;
		}
	}
			
			
	else
	{
		RcvByteCnt++;
		RcvDataBuf[RcvByteCnt] = UART_REGISTER;
				
		/* start character received again */
		if(RcvDataBuf[RcvByteCnt] == CHARACTER_START)
		{
			RcvDataBuf[0] 	= CHARACTER_START;
			RcvByteCnt 			= 0;
		} 
				
		/* working normally	*/
		else
		{
			/* received end character	*/
			if (RcvDataBuf[RcvByteCnt] == CHARACTER_END)
			{
				RcvSttFlag  	= FALSE;
				ErrFlag      	= TRUE;
			}

			/* received overflow */
			else if (RcvByteCnt > (RCV_DATA_MAX -1))
			{
				RcvSttFlag    	= FALSE;
				RcvDataBuf[0] 	= 0;
				ErrFlag        	= FALSE;
			}
		}
	}
}

/**
 	* FunctionName: Rcv_Data_From_App
 	*/
void Rcv_Data_From_App(void)
{   
	/* Exit when data received failed */
	if (ErrFlag == FALSE)		return;
	
	/* Copy the data to RcvData from RcvDataBuf when received successfully */
	ErrFlag = FALSE;		//Clear the flag
	
	RcvData.Command				= RcvDataBuf[1];
	RcvData.GroupClass		= RcvDataBuf[2];
	for (_Uint8 TempCnt = 0; TempCnt < 4; TempCnt++)									RcvData.Content[TempCnt]	= RcvDataBuf[TempCnt + 3];
	for (_Uint8 TempCnt = 0; TempCnt < RCV_DATA_MAX; TempCnt++)       RcvDataBuf[TempCnt] 			= 0;  	
	
	RcvFlag = TRUE;			//Set the received flag
}

/**
 	* FunctionName    Respond_Byte
 	*/
static void Respond_Byte(_Uint8 RspdByte)
{
    UART_REGISTER = RspdByte;
    while (!UART_SEND_FLAG);
}


/**
 	* FunctionName: Respond_To_App
 	*/
void Respond_To_App(void)
{
	static _Uint8			SndRepeatCnt;
	static _Uint8			SndRepeatTime;
	static _Flag			SndRepeatFlag = TRUE;
	
	/* Exit when there's no data to send */
	if (SndData.SndNum == SEND_IDLE)			return;
	
	/* Send Data */
	switch (SndData.SndNum)
	{
		case SEND_TYPE:
		{
			Respond_Byte(0xFC);  
      Respond_Byte(DEVICE_NAME_ONE);
			Respond_Byte(DEVICE_NAME_TWO);
      Respond_Byte(DEVICE_NAME_THREE);
			Respond_Byte(0xFE);
			
			SndData.SndNum = SEND_POWER_ON;
		} break;
		
		
		case SEND_POWER_ON:
		{
			if (SndRepeatFlag == TRUE)
			{
				SndRepeatFlag	= FALSE;
				Respond_Byte(PACKAGE_HEAD);  
				Respond_Byte(0x01);
				for (_Uint8 TempCnt = 0; TempCnt < 7; TempCnt++)			Respond_Byte(0x0); 
				Respond_Byte(PACKAGE_TAIL);
			}
			else
			{
				SndRepeatTime++;
				if (SndRepeatTime > 5)
				{
					SndRepeatTime = 0;
					SndRepeatFlag = TRUE;
					SndRepeatCnt++;
					if (SndRepeatCnt >= REPEAT_CNT)
					{
						SndRepeatCnt 		= 0;
						SndData.SndNum	= SEND_IDLE;
					}
				}
			}
		} break;
		
		
		case SEND_OTHER:
		{
			Respond_Byte(PACKAGE_HEAD);  
			for (_Uint8 TempCnt = 0; TempCnt < 8; TempCnt++)			Respond_Byte(SndData.SndBuffer[TempCnt]); 
			Respond_Byte(PACKAGE_TAIL);
			
			SndData.SndNum	= SEND_IDLE;
		} break;
	}
}






