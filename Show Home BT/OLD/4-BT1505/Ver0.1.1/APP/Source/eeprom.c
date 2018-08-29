/****************************************************************
	* 	
	* eprom.c
 	* 2016.10.28
 	* DS.Chin
	*
************/
/****************************************************************
 * Includes
 */
#include "Eprom.h"


/*****************************************************************
 * Global variables
 */
_Uint8 		const *EPROM_START = (_Uint8 *)0x4000;			//DATA EEPROM head pointer


/**
 	* FunctionName: Eprom_Read
 	*/
_Uint8 Eprom_Read(_TypeEpromSave EpromVal)
{
	_Uint8 			*EpromAdd = 0;
    
	EpromAdd = (_Uint8 *)EPROM_START;
	
  /* unlock */
	do
	{
		FLASH_DUKR = 0xAE;
		FLASH_DUKR = 0x56;
	}while (!(FLASH_IAPSR & 0x08));
    
	EpromAdd += EpromVal;
	
	return ((_Uint8)*EpromAdd);
}

/**
 	* FunctionName: EpromWrite
 	*/
void Eprom_Write(_TypeEpromSave EpromVal, _Uint8 WriteDataBuf)
{
	_Uint8 *EpromAdd = 0;
		
	EpromAdd = (_Uint8 *)EPROM_START;
			
	/* unlock */
	do
	{
		FLASH_DUKR = 0xAE;
		FLASH_DUKR = 0x56;
	}while (!(FLASH_IAPSR & 0x08));
			
	EpromAdd += EpromVal;
	
	*EpromAdd = WriteDataBuf;
	while (!(FLASH_IAPSR & 0x04));
}


/**
	* FunctionName Eprom_Write_Timer
	*/
void Eprom_Write_Timer(_Uint8 GrpVal, 
											 _Uint8 ClsVal, 
											 _TypeEpromOnOffOffset OnOffVal, 
											 _Uint8 WriteHour,
											 _Uint8 WriteMinute)
{
	/* Eprom contains 10 pages(64Bytes each page),check the valid Grpval */
	if (GrpVal > 8)		return;
	
	/* Group Offset */
	_Uint8	*EpromAdd = (_Uint8 *)(EPROM_START + (GrpVal + 1) * 64);
	
	/* Class Offset */
	EpromAdd += ClsVal * 4;
	
	/* On or Off Offset */
	EpromAdd += OnOffVal * 2;
	
	/* unlock */
	do
	{
		FLASH_DUKR = 0xAE;
		FLASH_DUKR = 0x56;
	}while (!(FLASH_IAPSR & 0x08));
	
	*EpromAdd = WriteHour;
	while (!(FLASH_IAPSR & 0x04));
	
	EpromAdd++;
	*EpromAdd = WriteMinute;
	while (!(FLASH_IAPSR & 0x04));
}


/**
	* FunctionName Eprom_Read_Timer
	*/
_Uint8 Eprom_Read_Timer(_Uint8 GrpVal, 
											 	_Uint8 ClsVal, 
												_TypeEpromOnOffOffset OnOffVal, 
											 	_TypeEpromHrMtOffset 	HrMtVal)
{
	/* Eprom contains 10 pages(64Bytes each page),check the valid Grpval */
	if (GrpVal > 8)		return(0xFF);
	
	/* Group Offset */
	_Uint8	*EpromAdd = (_Uint8 *)(EPROM_START + (GrpVal + 1) * 64);
	
	/* Class Offset */
	EpromAdd += ClsVal * 4;
	
	/* On or Off Offset */
	EpromAdd += OnOffVal * 2;
	
	/* Hour or minute offset */
	EpromAdd += HrMtVal;
	
	/* unlock */
	do
	{
		FLASH_DUKR = 0xAE;
		FLASH_DUKR = 0x56;
	}while (!(FLASH_IAPSR & 0x08));
	
	return ((_Uint8)*EpromAdd);
}

/**
	* FunctionName		Eprom_Timer_Init
	*/
void Eprom_Timer_Init(void)
{
	_Uint16 TempCnt = 0;
	_Uint8 *EpromAdd = (_Uint8 *)(EPROM_START + 64);
	
	/* unlock */
	do
	{
		FLASH_DUKR = 0xAE;
		FLASH_DUKR = 0x56;
	}while (!(FLASH_IAPSR & 0x08));
	
	/* Fill as 0xFF */
	do
	{
		*EpromAdd	= 0xFF;
		EpromAdd++;
		TempCnt++;
	} while (TempCnt < 320);
}
