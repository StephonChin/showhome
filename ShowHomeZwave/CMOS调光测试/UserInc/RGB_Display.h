/*******************************************************************************
	*
	* @FileName		  RGB_Display.h
	* @Date					2018.03.29
	* @Author				DS.Chin
	* @CopyRight		(C) CopyRight  @2016 ~ 2026 Willis Ltd. Co.
	* @Description	This file contains all the function prototyped for the config
	*								fimer library
	*
*******************************************************************************/
#ifndef __RGB_DISPLAY_H__
#define __RGB_DISPLAY_H__

/* Include Files */
#include "TypeDef.h"
#include "MCU_Config.h"
#include "stdlib.h"
#include "Led_Class.h"



/* Const Value Define */
#define   R                 0
#define   G                 1
#define   B                 2
#define   FADE_LEVEL        50
#define   COLOR_MAX         0xD
#define   MODE_MAX          12

#define   RAND()            srand(RndSeed);RndSeed += 199;

#define   TEST_MODE          11


/* Type Redefine */
typedef struct TYPE_DISPLAY
{
  _Uint8    Mode;
  _Uint8    ModeBuf;
  _Flag     InitFlag;
  _Uint8    ColorVal;
}_TypeDisplay;



/* Exported Functions */
void RGB_Display(void);


/* Exported Paramters */
extern xdata _TypeDisplay      RGBDisplayData;


/* File Functions */
static void RGB_Off(void);
static void RGB_Steady(void);
static void RGB_Polar_1(void);
static void RGB_Polar_2(void);
static void RGB_Fade(void);
static void RGB_Candle(void);
static void RGB_ColorShow(void);
static void RGB_Roll(void);
static void RGB_Run(void);
static void RGB_RainBown(void);



#endif
