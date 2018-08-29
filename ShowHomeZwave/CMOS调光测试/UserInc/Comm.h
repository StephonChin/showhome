/*******************************************************************************
	*
	* @FileName		  Comm.h
	* @Date					2018.03.29
	* @Author				DS.Chin
	* @CopyRight		(C) CopyRight  @2016 ~ 2026 Willis Ltd. Co.
	* @Description	This file contains all the function prototyped for the config
	*								fimer library
	*
*******************************************************************************/
#ifndef __COMM_H__
#define __COMM_H__

//------------< Include Files >---------------
#include "TypeDef.h"


//----------< Exported Functions >---------
void USART_Rcv_Data(void);
void USART_Snd_Data(void);


//----------< File Functions >---------
static void USART_Rcv_Byte(void);
static void USART_Snd_Byte(_Uint8 SndBuf);


#endif
