/*******************************************************************************
	*
	* FILE NAME
	* 					CSR1010.h
	* BRIEF
	* 					The header file of CSR1010.c
	*
*******************************************************************************/
#ifndef _CSR1010_H_
#define _CSR1010_H_

/*<-- Include Files -------------------------------------------------------> */
#include "TypeDefine.h"

/*<-- Type Define ---------------------------------------------------------> */
typedef struct RCV_DATA_TYPE
{
	_Uint8	Command;
	_Uint8	GroupClass;
	_Uint8	Content[4];
}_TypeRcvData;

typedef struct SND_DATA_TYPE
{
	enum
	{
		SEND_IDLE,
		SEND_TYPE,
		SEND_POWER_ON,
		SEND_OTHER
	} SndNum;
	_Uint8	SndBuffer[8];
	
}_TypeSndData;

/*<-- Contant Define -------------------------------------------------------> */
#define		UART_RCV_FLAG           UART1_SR_RXNE
#define		UART_SEND_FLAG          UART1_SR_TXE
#define		UART_REGISTER           UART1_DR
#define		CHARACTER_START         0xFD
#define		CHARACTER_END           0xFE
#define   PACKAGE_HEAD            CHARACTER_START
#define   PACKAGE_TAIL            CHARACTER_END
#define		RCV_DATA_MAX            8      			//Received data buffer' size

#define 	REPEAT_CNT							5


/*<-- Exported Parameters --------------------------------------------------> */
extern _TypeRcvData			RcvData;
extern _TypeSndData			SndData;
extern _Flag						RcvFlag;



#endif /* _CSR1010_H_ */
