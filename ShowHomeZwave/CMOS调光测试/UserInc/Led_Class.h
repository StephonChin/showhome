/*******************************************************************************
	*
	* @FileName		  Led_Class.h
	* @Date					2018.03.29
	* @Author				DS.Chin
	* @CopyRight		(C) CopyRight  @2016 ~ 2026 Willis Ltd. Co.
	* @Description	This file contains all the function prototyped for the config
	*								fimer library
	*
*******************************************************************************/
#ifndef __LED_CLASS_H__
#define __LED_CLASS_H__

/* Include Files */
#include "TypeDef.h"
#include "MCU_Config.h"
#include "RGB_Display.h"



/* Const Value Define */
#define   LED_TOTAL         21
#define   COLOR_TOTAL       63


typedef union _LED_DATA_TYPE
{
  _Uint8	SendByte[COLOR_TOTAL];
  struct _COLOR_TYPE
  {
    _Uint8	DutyG;
    _Uint8	DutyR;
    _Uint8	DutyB;
  }Buffer[LED_TOTAL];
} _TypeRGBLed;


/* Exported Functions */
void RGB_Data_Update(void);


extern xdata _TypeRGBLed       RGBData;
extern xdata _Flag             UpdateFlag;
static void Data_Get(void);



#endif
