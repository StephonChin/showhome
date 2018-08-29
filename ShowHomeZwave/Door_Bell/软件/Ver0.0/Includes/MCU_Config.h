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
#include "Port_Def.h"


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

