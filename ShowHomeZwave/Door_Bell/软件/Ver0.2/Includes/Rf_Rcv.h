/*******************************************************************************
	*
	* @File Name		Rf_Rcv.h
	* @Date					2016.12.26
	* @Author				DS.Chin
	*
*******************************************************************************/
#ifndef __RF_RCV_H__
#define __RF_RCV_H__

/*Include---------------------------------------------------------------------*/
#include "Type_Def.h"
#include "MCU_Config.h"

/**
	* @Data Type
	*/
typedef struct
{
	enum
	{
		RF_IDLE,
		RF_STT,
		RF_DONE,
		RF_ERR
	}Status;
	_Flag		RcvFlag;
	_Uint8	FlagBuf;
	union RCV_DATA_BUF
	{
		_Uint32	Buffer;
		_Uint8	Opt[4];
	}RcvData;
}_TypeStructRf;



/**
	* @Exported Functions
	*/
void Rf_Scan(void);
void Rf_Rcv(void);


/**
	* @Exported Parameters
	*/
extern _TypeStructRf	RfData;


#endif
