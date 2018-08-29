/*******************************************************************************
	*
	* @File Name		MCU_Config.h
	* @Date					2016.12.23
	* @Author				DS.Chin
	* @Description	单片机配置文件头文件
	*
*******************************************************************************/

#ifndef __MCU_CONFIG_H
#define __MCU_CONFIG_H


/*Includes--------------------------------------------------------------------*/
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
#define		PORT_RF				PD_IDR_IDR6
#define		PORT_DIAL_A		PC_IDR_IDR3
#define		PORT_DIAL_B		PC_IDR_IDR4
#define		PORT_VOICE		PC_ODR_ODR5
#define		PORT_ITEM			PC_ODR_ODR6
#define		PORT_PLAY			PC_ODR_ODR7


/**
	* @MCU_Config exported functions
	*/
void MCU_Config(void);


/**
	* @MCU_Config file functions
	*/
static void CLK_Init(void);
static void GPIO_Init(void);
static void TIM_Init(void);


#endif

