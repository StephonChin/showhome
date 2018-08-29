#ifndef __eeprom_h
#define __eeprom_h
#include "sn8p2511.h"
#define uchar unsigned char

#define in  0;
#define out 1;
#define sda_in  P5M&=0xef
#define sda_out P5M|=0x10
						    
#define scl FP23
#define sda FP54
void i2c_write(uchar addr,uchar send_data);
uchar i2c_read(uchar addr);
#endif
