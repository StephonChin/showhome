/*******************************************************************
	*
	* @FileName		MCU_Config.h
	* @Date				2017.03.03
	* @Author			DS.Chin
	*
*********************************************************************/
#ifndef __MCU_CONFIG_H__
#define __MCU_CONFIG_H__


/* @Include files ---------------------------------------------------*/
#include "System.h"



/* @Bits define -----------------------------------------------------*/
#define		BIT0		(0x1 << 0)
#define 	BIT1		(0x1 << 1)
#define 	BIT2		(0x1 << 2)
#define		BIT3		(0x1 << 3)
#define 	BIT4		(0x1 << 4)
#define 	BIT5		(0x1 << 5)
#define 	BIT6		(0x1 << 6)
#define		BIT7		(0x1 << 7)




/* @Port define ------------------------------------------------------*/
#define			PORT_SENSOR				P14
#define			PORT_TAMPER				P17
#define 		PORT_TRIGGER			P06
#define 		PORT_WAKE_UP			P07
#define 		PORT_DEV_ADD			P15
#define 		PORT_BLUE_3				P05
#define			PORT_GREEN_3			P04
#define			PORT_RED_3				P03
#define 		PORT_BLUE_2				P02
#define 		PORT_GREEN_2			P01
#define			PORT_RED_2				P00
#define			PORT_BLUE_1				P10
#define			PORT_GREEN_1			P11
#define			PORT_RED_1				P12



/***
	* @Brief Exported Functions
	*/
void MCU_Config(void);



/***
	* @Brief File Functions
	*/
static void CLK_Init(void);
static void GPIO_Init(void);
static void TIM_Init(void);
static void INT_Init(void);
static void WKT_Init(void);


#endif
