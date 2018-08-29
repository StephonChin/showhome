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


/*****************************************************************
 * FunctionName: Eprom_Read
 * Caller:  data_process.c
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

/***********************************************************
 * FunctionName: EpromWrite
 * Caller: Main.c
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