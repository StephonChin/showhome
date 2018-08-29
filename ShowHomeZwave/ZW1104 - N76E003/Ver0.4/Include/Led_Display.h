/***************************************************************
	*
	* @FileName		Led_Display.h
	* @Date				2017.03.03
	* @Author			DS.Chin
	*
***************************************************************/
#ifndef __LED_DISPLAY_H__
#define	__LED_DISPLAY_H__


/* @Include File ---------------------------------------*/
#include "System.h"
#include "MCU_Config.h"
#include "Data_Process.h"


/* @Type define ---------------------------------------*/
typedef struct LED_TYPE_DEF
{
	enum 
	{
		LED_RGB_OFF, 
		LED_RGB_SLOW, 
		LED_G_FAST, 
		LED_B_SLOW, 
		LED_R_SLOW,
		LED_G_STEADY
	}Mode,ModeBuf;
	_Flag	InitFlag;
}_TypeStLed;


/* @defines ------------------------------------------------*/
#define		LED_ON			0
#define		LED_OFF			1
#define		R1OFF				PORT_RED_1 = LED_OFF
#define		R1ON				PORT_RED_1 = LED_ON
#define		R2OFF				PORT_RED_2 = LED_OFF
#define		R2ON				PORT_RED_2 = LED_ON
#define		R3OFF				PORT_RED_3 = LED_OFF
#define		R3ON				PORT_RED_3 = LED_ON
#define		G1OFF				PORT_GREEN_1 = LED_OFF
#define		G1ON				PORT_GREEN_1 = LED_ON
#define		G2OFF				PORT_GREEN_2 = LED_OFF
#define		G2ON				PORT_GREEN_2 = LED_ON
#define		G3OFF				PORT_GREEN_3 = LED_OFF
#define		G3ON				PORT_GREEN_3 = LED_ON
#define		B1OFF				PORT_BLUE_1 = LED_OFF
#define		B1ON				PORT_BLUE_1 = LED_ON
#define		B2OFF				PORT_BLUE_2 = LED_OFF
#define		B2ON				PORT_BLUE_2 = LED_ON
#define		B3OFF				PORT_BLUE_3 = LED_OFF
#define		B3ON				PORT_BLUE_3 = LED_ON

#define		SLOW_SPEED	60
#define		FAST_SPEED	30


/***
	* @Brief Exported Function
	*/
void Led_Display(void);



/***
	* @Brief File Function
	*/
static void Led_RGB_Off(void);
static void Led_RGB_Slow(void);
static void Led_G_Fast(void);
static void Led_B_Slow(void);
static void Led_R_Slow(void);
static void Led_G_Steady(void);



/***
	* @Brief Exported Variable
	*/
extern _TypeStLed LedData;




#endif
