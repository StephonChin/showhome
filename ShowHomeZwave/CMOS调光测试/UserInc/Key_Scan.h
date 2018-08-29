/*******************************************************************************
	*
	* @FileName		  Key_Scan.h
	* @Date					2018.03.29
	* @Author				DS.Chin
	* @CopyRight		(C) CopyRight  @2016 ~ 2026 Willis Ltd. Co.
	* @Description	This file contains all the function prototyped for the config
	*								fimer library
	*
*******************************************************************************/
#ifndef __KEY_SCAN_H__
#define __KEY_SCAN_H__

//--------------<Include Files>-----------------------------------------
#include "TypeDef.h"
#include "MCU_Config.h"
#include "Sleep.h"
#include "Led_Display.h"


//--------------<Type Redefine>-----------------------------------------
typedef enum TYPE_KEY
{
  KEY_MODE_IDLE,
  KEY_SHORT,
  KEY_LONG
}_TypeKey;




//-------------<Exported Functions>-------------------------------------
void Key_Scan(void);


//-------------<Exported Parameters>------------------------------------
extern xdata _TypeKey   ModeKeyStatus1;
extern xdata _TypeKey   ModeKeyStatus2;





#endif
