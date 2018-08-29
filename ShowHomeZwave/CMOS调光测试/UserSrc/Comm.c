/*******************************************************************************
	*
	* @FileName		  Comm.c
	* @Date					2018.03.29
	* @Author				DS.Chin
	* @CopyRight		(C) CopyRight  @2016 ~ 2026 Willis Ltd. Co.
	* @Description	This file contains all the function prototyped for the config
	*								fimer library
	*
*******************************************************************************/
#include "Comm.h"

//----------< File Paramters >------------------------
xdata _Flag     SndByteDoneFlag;
xdata _Uint8		ByteCnt;

/*******************************************************
  *
  * FunctionName    Uart_Interrupt
  *
*********************************************************/
void Uart_Interrupt(void) interrupt 15
{
	/* When receive interrupt flag been set */
	if (RI_1)
	{
		RI_1 = RESET;
    USART_Rcv_Byte();
	}
	
	/* When send interrput flag been set */
	if (TI_1)
	{
		TI_1 = RESET;
		SndByteDoneFlag = FALSE;
	}
	
	return;
}


/***********************************************************
	*
	* FunctionName	USART_Rcv_Byte
	*
************************************************************/

static void USART_Rcv_Byte(void)
{
	xdata _Uint8		RcvBufferTemp = 0;
	
	
	// move receive data to RcvBuffer
	RcvBufferTemp = SBUF_1;
}







/************************************************************
	*
	* FunctionName	USART_Rcv_Data
	*
*************************************************************/
void USART_Rcv_Data(void)
{
	
}










/***********************************************************
	*
	* FunctionName	USART_Snd_Data
	*
************************************************************/
void USART_Snd_Data(void)
{
	USART_Snd_Byte(0x0);
}



/******************************************************
	*
	* FunctionName	USART_Snd_Byte
	*
*******************************************************/
static void USART_Snd_Byte(_Uint8 SndBuf)
{
	while (SndByteDoneFlag);
	SBUF_1 = SndBuf;
	SndByteDoneFlag = TRUE;
}
