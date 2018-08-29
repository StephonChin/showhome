/*******************************************************************************
	*
	* @File Name		Dial_Switch.h
	* @Date					2016.12.24
	* @Author				DS.Chin
	*
*******************************************************************************/
#ifndef __DIAL_SWITCH_H__
#define __DIAL_SWITCH_H__


/*Include---------------------------------------------------------------------*/
#include "Type_Def.h"
#include "MCU_Config.h"


/**
	* @Data Type
	*/
typedef struct
{
	enum
	{
		DIAL_IDLE,
		DIAL_CLKWISE,
		DIAL_ANTICLKWISE
	}Status;
	_Uint8	TrigNum;
}_TypeStructDial;


/**
	* @Exported Functions
	*/
void Dial_Switch_Scan(void);


/**
	* @Exported Parameters
	*/
extern _TypeStructDial DialData;


#endif
