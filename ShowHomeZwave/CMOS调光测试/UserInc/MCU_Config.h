/*******************************************************************************
	*
	* @FileName		  MCU_Config.h
	* @Date					2018.03.29
	* @Author				DS.Chin
	* @CopyRight		(C) CopyRight  @2016 ~ 2026 Willis Ltd. Co.
	* @Description	This file contains all the function prototyped for the config
	*								fimer library
	*
*******************************************************************************/
#ifndef __MCU_CONFIG_H__
#define __MCU_CONFIG_H__


/*-----------------------< Include files >----------------------*/
#include "Typedef.h"



/*----------------< I/O define & Bits define >------------------*/
#define				BIT0					(0x1 << 0)
#define				BIT1					(0x1 << 1)
#define				BIT2					(0x1 << 2)
#define				BIT3					(0x1 << 3)
#define				BIT4					(0x1 << 4)
#define				BIT5					(0x1 << 5)
#define				BIT6					(0x1 << 6)
#define				BIT7					(0x1 << 7)


#define       PORT_OUT_1       P00
#define       PORT_OUT_2       P01
#define       PORT_KEY_1       P07
#define       PORT_KEY_2       P06


/*----------------< File Function >------------------*/
static void CLK_Init(void);
static void GPIO_Init(void);
static void TIM_Init(void);
static void WDT_Init(void);


/*----------------< Exported Function >------------------*/
void MCU_Config(void);



#endif

