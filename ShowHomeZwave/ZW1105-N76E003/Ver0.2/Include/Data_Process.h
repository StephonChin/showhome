/*******************************************************************
	*
	* @FileName		Data_Process.h
	* @Date				2017.03.03
	* @Author			DS.Chin
	*
*********************************************************************/
#ifndef __DATA_PROCESS_H__
#define	__DATA_PROCESS_H__


/* @Include -------------------------------------------------------*/
#include "System.h"
#include "Comm.h"
#include "Led_Display.h"
#include "MCU_Config.h"
#include "Key_Scan.h"



/***
	* @Brief Exported Functions
	*/
void Power_On_Init(void);
void Data_Process(void);


/***
	* @Brief Exported Variables
	*/
extern _Flag		NetChgFlag;
extern _Flag		TrigForbidFlag;
extern _Flag		TrigInitFlag;



#endif
