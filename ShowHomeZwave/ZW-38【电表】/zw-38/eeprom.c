/*--------------------------------
*author:chenyk
*data:2015.5.4
*ver:ver1
--------------------------------*/
//#include "stm8s003f3.h"
#include "stm8s003f3.h"
#include "eeprom.h"
extern u32 kwh;
u8 *p=(u8 *)0x4000;
/********************************
*函数名:eeprom_config
*输入参数:
*输出参数:
*功能:
*********************************/
void eeprom_config(void)
{
	FLASH_CR1|=0x01; //标准编程时间
	FLASH_DUKR = 0xae; //解锁data memory
	FLASH_DUKR = 0x56; 
}
/********************************
*函数名:eeprom_read
*输入参数:
*输出参数:
*功能:
*********************************/
u8 eeprom_read(u8 addr)
{
  return *(p+(u16)addr);
}
/********************************
*函数名:eeprom_write
*输入参数:
*输出参数:
*功能:
*********************************/
void eeprom_write(u8 addr,u8 data)
{
	*(p+(u16)addr)=data;
}

/********************************
*函数名:eeprom_init
*功能:
*输入参数:
*输出参数:
*********************************/
void eeprom_init(void)
{
	eeprom_config();
	
  if(eeprom_read(0x00)==0xaa)
	{
	  kwh=(u32)eeprom_read(0x01);
		kwh+=(u32)(eeprom_read(0x02)<<8);
		kwh+=(u32)(eeprom_read(0x02)<<16);
	}
	else
	{
		while((FLASH_IAPSR&0x04)==0x04);
		eeprom_write(0x00,0xaa);
		while((FLASH_IAPSR&0x04)==0x04);
		eeprom_write(0x01,0x00);
		while((FLASH_IAPSR&0x04)==0x04);
		eeprom_write(0x02,0x00);
		while((FLASH_IAPSR&0x04)==0x04);
		eeprom_write(0x03,0x00);
	}
		

}