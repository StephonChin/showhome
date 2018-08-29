#ifndef __eeprom_h
#define __eeprom_h
#define uchar unsigned char 
#define u8    unsigned char
#define u16   unsigned short
#define u32   unsigned long

extern uchar bkwhh;
extern uchar bkwhl;
extern uchar report_time_h;
extern uchar report_time_l;

void eeprom_init(void);
#endif