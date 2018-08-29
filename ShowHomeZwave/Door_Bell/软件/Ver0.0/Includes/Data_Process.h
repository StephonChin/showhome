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



/**
	* @Exported Function
	*/
void Data_Process(void);


/**
	* @File Function
	*/
static void Key_Process(void);
static void Dial_Process(void);


#endif
