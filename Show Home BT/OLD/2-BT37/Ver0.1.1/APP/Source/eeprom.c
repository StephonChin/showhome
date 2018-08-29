/*************************************
 * FileName: eeprom.c
 * Date: 2016.04.06
 * Author: DS.Chin
 * Output: SaveFlag
 */
/*****************************************************************
 * Include files
 */
#include "iostm8s003f3.h"
#include "system.h"

/*****************************************************************
 * defines
 */
 
/*****************************************************************
 * Global variables
 */
_TypeID		IDValue;
_Uchar 		const *		EPROM_START = (_Uchar *)0x4000;			//DATA EEPROMÊ×µØÖ·

/*+++++++++++++++++++++++++++++++++++
 + FunctionName: Eprom_Read
++++++++++++++++++++++++++++++++++++*/
void Eprom_Read(void)
{
	_Uchar *EpromAdd = 0;
    
	EpromAdd = (_Uchar *)EPROM_START;
	
    /* unlock */
	do
	{
		FLASH_DUKR = 0xAE;
		FLASH_DUKR = 0x56;
	}while (!(FLASH_IAPSR & 0x08));
	
    /* get the ID */
		IDValue.ID1 = *EpromAdd++;
		IDValue.ID2 = *EpromAdd++;
		IDValue.ID3 = *EpromAdd++;
		IDValue.ID4 = *EpromAdd;
}

/*+++++++++++++++++++++++++++++++++++
 + FunctionName: EpromWrite
++++++++++++++++++++++++++++++++++++*/
void Eprom_Write(void)
{
    _Uchar *EpromAdd = 0;
          
		EpromAdd = (_Uchar *)EPROM_START;
        
    /* unlock */
		do
		{
				FLASH_DUKR = 0xAE;
				FLASH_DUKR = 0x56;
		}while (!(FLASH_IAPSR & 0x08));
		
    /* save the ID */
		*EpromAdd++ = IDValue.ID1;
		while (!(FLASH_IAPSR & 0x04));
		
		*EpromAdd++ = IDValue.ID2;	
		while (!(FLASH_IAPSR & 0x04));	
		
		*EpromAdd++ = IDValue.ID3;
		while (!(FLASH_IAPSR & 0x04));	
		
		*EpromAdd = IDValue.ID4;
		while (!(FLASH_IAPSR & 0x04));
}
