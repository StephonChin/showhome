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
#include "MCU_Config.h"


/**
	* @Data Type
	*/
typedef struct
{
	_Uint8	Mode;
	_Uint8	ColorR;
	_Uint8	ColorG;
	_Uint8	ColorB;
	_Uint8	ColorToR;
	_Uint8	ColorToG;
	_Uint8	ColorToB;
	_Uint8	NightR;
	_Uint8	NightG;
	_Uint8	NightB;
	_Uint8	Duty;
	_Uint8	ColorDuty;
	_Uint8	NightDuty;
	_Uint8	RollStep;
	union
	{
		_Uint16	FreqT;
		_Uint8	Freq[2];
	}Dimmer;
}_TypeStructLed;


/**
	* @Def
	*/
#define		RedDuty			TIM2_CCR2L
#define		GreenDuty		TIM2_CCR1L
#define		BlueDuty		TIM2_CCR3L

/**
	* @Exported Function
	*/
void Led_Display(void);


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
