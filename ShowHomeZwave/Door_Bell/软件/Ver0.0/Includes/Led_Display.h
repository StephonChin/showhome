/*******************************************************************************
	*
	* @File Name		Led_Display.h
	* @Date					2016.12.24
	* @Author				DS.Chin
	*
*******************************************************************************/
#ifndef __LED_DISPLAY_H__
#define __LED_DISPLAY_H__


/*Include---------------------------------------------------------------------*/
#include "Type_Def.h"
#include "Port_Def.h"


/**
	* @Data Type
	*/
typedef struct
{
	_Uint8	Mode;
	_Uint8	ModeBuf;
	_Flag		InitFlag;
	_Uint8	RedDuty;
	_Uint8	GreenDuty;
	_Uint8	BlueDuty;
	_Uint8	ColorR;
	_Uint8	ColorG;
	_Uint8	ColorB;
	_Uint8	NightR;
	_Uint8	NightG;
	_Uint8	NightB;
	_Uint8	RollStep;
	_Uint8	ClkwiseStep;
	_Uint8	AntiClkwiseStep;
}_TypeStructLed;


/**
	* @Exported Function
	*/
void Led_Display(void);
void Duty_Control(void);

/**
	* @Exported Parameters
	*/
extern _TypeStructLed 	DisplayData;


/**
	* @File Functions
	*/
static void Led_Off(void);
static void Led_Night(void);
static void Led_Color(void);


#endif
