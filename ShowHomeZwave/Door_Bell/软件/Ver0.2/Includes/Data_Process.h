/******************************************************************************
	*
	* @File Name		Data_Process.h
	*
*******************************************************************************/
#ifndef __DATA_PROCESS_H__
#define __DATA_PROCESS_H__

/*Includes--------------------------------------------------------------------*/
#include "Type_Def.h"
#include "Key_Scan.h"
#include "Speaker.h"
#include "Dial_Switch.h"
#include "Led_Display.h"
#include "Rf_Rcv.h"
#include "Eprom.h"


/**
	* @define
	*/
#define		COLOR_LEVEL			20
#define		COLOR_MAX				215
#define		COLOR_MIN				40
#define		HOLD_TIME				2



/**
	* @Exported Function
	*/
void Data_Process(void);
void User_Data_Init(void);


/**
	* @File Function
	*/
static void Key_Process(void);
static void Dial_Process(void);
static void Rf_Process(void);
static void Color_To_Duty(void);
static void Dimmer_Control(_Uint8);

#endif
