/*******************************************************************************
	*
	* @File Name		Eprom.h
	* @Date					2016.12.19
	* @Author				DS.Chin
	* @CopyRight		(C) CopyRight  @2016 ~ 2026 Willis Ltd. Co.
	* @Description	This file contains all the function prototyped for the Eprom
	*								fimer library
	*
*******************************************************************************/

/* Define to prevent recursive inclusion -------------------------------------*/
#ifndef __EPROM_H
#define __EPROM_H


/* Include files--------------------------------------------------------------*/
#include "Type_Def.h"


/**
	* @ Define
	*/
#define		EPROM_VAL  1


/**
	* @Brief	Eprom Save Data Type Redefine
	*/
typedef enum
{
	EPROM_COLOR_R,
	EPROM_COLOR_G,
	EPROM_COLOR_B,
	EPROM_MODE,
	EPROM_DUTY,
	EPROM_COLOR_DUTY,
	EPROM_NIGHT_DUTY,
	EPROM_VOICE
}_TypeEpromSave;



/**
	* @Brief	Function prototyped for Eprom
	*/
_Uint8 Eprom_Read(_TypeEpromSave EpromVal);
void Eprom_Write(_TypeEpromSave EpromVal, _Uint8 WriteDataBuf);



#endif

