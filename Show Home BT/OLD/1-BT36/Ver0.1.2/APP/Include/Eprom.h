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
#include "iostm8s003f3.h"
#include "system.h"
		
		
/* <-- Contant Define -------------------------------------------------> */
#define TIMER_START_ADD				10


/**
	* @Brief	Eprom Save Data Type Redefine
	*/
typedef enum
{
	EPROM_ID1,
	EPROM_ID2,
	EPROM_ID3,
	EPROM_ID4,
	EPROM_TIMER_ENABLE,
}_TypeEpromSave;


typedef enum
{
	EPROM_TIMER_HOUR,
	EPROM_TIMER_MINUTE
}_TypeEpromHrMtOffset;

typedef enum
{
	EPROM_TIMER_ON,
	EPROM_TIMER_OFF
}_TypeEpromOnOffOffset;



/**
	* @Brief	Function prototyped for Eprom
	*/
_Uint8 Eprom_Read(_TypeEpromSave EpromVal);
void Eprom_Write(_TypeEpromSave EpromVal, _Uint8 WriteDataBuf);
void Eprom_Write_Timer(_Uint8 GrpVal, 
											 _Uint8 ClsVal, 
											 _TypeEpromOnOffOffset OnOffVal, 
											 _Uint8 WriteHour,
											 _Uint8 WriteMinute);
_Uint8 Eprom_Read_Timer(_Uint8 GrpVal, 
											 	_Uint8 ClsVal, 
												_TypeEpromOnOffOffset OnOffVal, 
											 	_TypeEpromHrMtOffset 	HrMtVal);
void Eprom_Timer_Init(void);


#endif

