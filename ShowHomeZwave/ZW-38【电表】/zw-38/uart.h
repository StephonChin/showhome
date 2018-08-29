#ifndef __uart_h
#define __uart_h
#define uchar unsigned char 
#define u8    unsigned char
#define u16   unsigned short
#define u32   unsigned long

void uart_Config(void);
void uart_tx(void);

extern void eeprom_write(u8 addr,u8 data);
#endif