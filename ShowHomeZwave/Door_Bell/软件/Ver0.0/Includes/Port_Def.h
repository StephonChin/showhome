/*******************************************************************************
	*
	* @File Name		Port_Def
	* @Date					2016.12.23
	* @Description	¶Ë¿Ú¶¨Òå
	*
*******************************************************************************/

#ifndef __PORT_DEF_H__
#define __PORT_DEF_H__


/*Include---------------------------------------------------------------------*/
#include "Type_Def.h"


/*Bit define------------------------------------------------------------------*/
#define		BIT0	(0x1<<0)
#define		BIT1	(0x1<<1)
#define		BIT2	(0x1<<2)
#define		BIT3	(0x1<<3)
#define		BIT4	(0x1<<4)
#define		BIT5	(0x1<<5)
#define		BIT6	(0x1<<6)
#define		BIT7	(0x1<<7)


/*Port define-----------------------------------------------------------------*/
#define		PORT_KEY			PD_IDR_IDR2
#define		PORT_DIAL_A		PD_IDR_IDR4
#define		PORT_DIAL_B		PD_IDR_IDR5
#define		PORT_RED			PD_ODR_ODR3
#define		PORT_GREEN		PC_ODR_ODR4
#define		PORT_BLUE			PC_ODR_ODR3
#define		PORT_VOICE		PC_ODR_ODR7
#define		PORT_ITEM			PC_ODR_ODR6
#define		PORT_PLAY			PC_ODR_ODR5


#endif
