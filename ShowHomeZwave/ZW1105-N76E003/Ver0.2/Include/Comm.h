/***************************************************************
	*
	* @FileName		Comm.h
	* @Date				2017.03.03
	* @Author			DS.Chin
	*
***************************************************************/
#ifndef __COMM_H__
#define __COMM_H__

/* @Include File ---------------------------------------------*/
#include "System.h"
#include "MCU_Config.h"


/***
	* @Brief Exported Function
	*/
void Comm_Process(void);


/***
	* @Brief Exported Variables
	*/
extern _Uint8	WakeUpMode;
extern _Uint8	TriggerMode;
extern _Flag	WakeUpInit;


#endif
