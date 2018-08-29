#ifndef OLED_H
#define OLED_H

#include "system_config.h"
#include "uart.h"



//------------------defines---------------------------------
#define LED_DC    PC_ODR_4
#define LED_SDA   PC_ODR_6
#define LED_SCL   PC_ODR_7
#define LED_RST   PC_ODR_5
#define LED_IMAGE_WHITE 1

//-----------------functions-----------------------
void LED_Init(void);
void LedDisplayChs(void);
void LedDisplay(u8t dataPostion);
void LED_P6x8Char(u8t ucIdxX, u8t ucIdxY, u8t ucData);
void LED_WrDat(u8t ucData);
void LED_WrCmd(u8t ucCmd);
void LED_SetPos(u8t ucIdxX, u8t ucIdxY);
void SetStartColumn(u8t ucData);
void SetAddressingMode(u8t ucData);
void SetColumnAddress(u8t a, u8t b);
void SetPageAddress(u8t a, u8t b);
void SetStartLine(u8t d);
void SetContrastControl(u8t d);
void SetChargePump(u8t d);
void SetSegmentRemap(u8t d);
void SetEntireDisplay(u8t d);
void SetInverseDisplay(u8t d);
void SetMultiplexRatio(u8t d);
void SetDisplayOnOff(u8t d);
void SetStartPage(u8t d);
void SetCommonRemap(u8t d);
void SetDisplayOffset(u8t d);
void SetDisplayClock(u8t d);
void SetPrechargePeriod(u8t d);
void SetCommonConfig(u8t d);
void SetVCOMH(u8t d);
void SetNop(void);


#define MCU_ACK_YES   (I2C_CR2 &= 0xFB) //ack = 1
#define MCU_ACK_NO    (I2C_CR2 |= 0x04)
#define I2C_START (I2C_CR2 |= 0x01)
#define I2C_STOP  (I2C_CR2 |= 0x02)

#define DATA_SEND    I2C_DR
#define DATA_RECEIVE I2C_DR
#define I2C_ACK      I2C_DR //i2c data registor

//-----------------Flag: action completed-------------------
#define FLAG_BUSY  				 		(I2C_SR3 & 0x02)
#define FLAG_START_FINISH			(I2C_SR1 & 0x01)
#define FLAG_ADD_FINISH       (I2C_SR1 & 0x02)
#define FLAG_SEND_FINISH			(I2C_SR1 & 0x84)
#define FLAG_RECEIVE_FINISH		(I2C_SR1 & 0x42)

#endif