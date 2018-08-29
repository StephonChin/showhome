/*********************************************************************************
	*
	*¡¡@FileName			Key_Scan.h
	*  @Date					21-April-2017
	*  @Author				DS.Chin
	*
**********************************************************************************/
#ifndef __KEY_SCAN_H__
#define __KEY_SCAN_H__


/* <Include Files----------------------------------------------------> */
#include "System.h"
#include "MCU_Config.h"


/* <-- Type define ---------------------------------------------------> */
typedef enum
{
	SENSOR_IDLE,
	SENSOR_CLOSE,
	SENSOR_OPEN
}_TypeSensor_E;


/* <Exported Functions ----------------------------------------------> */
void Key_Scan(void);


/* <--Exported Variables --------------------------------------------> */
extern _TypeSensor_E		SensorStatus;
extern _Flag						TrigForbidFlag;
extern _Flag						KeySleepFlag;
extern _Uint8						BattCheckNum;


#endif
