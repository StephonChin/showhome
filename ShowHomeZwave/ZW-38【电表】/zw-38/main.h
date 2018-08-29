#ifndef __main__h
#define __main_h
#define uchar unsigned char 
#define u8    unsigned char
#define u16   unsigned short
#define u32   unsigned long


extern void clk_config(void);
extern void eeprom_init(void);
//extern void spi_config(void);
extern void uart_Config(void);
extern void gpio_config(void);
extern void ade7753_config(void);
extern void uart_tx(void);
extern void meter_get(void);
extern void timr4_config(void);
extern void meter_rate_get(void);
//extern void timr2_config(void);
//extern void vrms_get (void);
#endif