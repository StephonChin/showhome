/*******************************************************************************
	*
	* @File Name		Speaker.h
	* @Date					2016.12.23
	*
*******************************************************************************/
#ifndef __SPEAKER_H__
#define __SPEAKER_H__

/*Include---------------------------------------------------------------------*/
#include "Type_Def.h"
#include "MCU_Config.h"


/**
	* @Data Type
	*/
typedef struct
{
	_Flag		VoiceFlag;
	_Flag		VoiceInitFlag;
	_Uint8	VoiceLevelBuf;
	_Uint8	VoiceLevel;
	_Flag		PlayFlag;
	_Flag		ItemFlag;
}_TypeStructSpeaker;



/**
	* @Define
	*/
#define	TQ1015_PULSE_TIME			20



/**
	* @Exported Function
	*/
void Speaker_Control(void);



/**
	* @Exported Parameters
	*/
extern _TypeStructSpeaker	SpkData;


#endif
