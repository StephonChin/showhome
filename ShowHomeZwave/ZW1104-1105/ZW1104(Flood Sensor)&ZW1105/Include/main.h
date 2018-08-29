#ifndef __main_h
#define __main_h
#include "sn8p2511.h"
#include "beep.h"
#define uchar unsigned char 



extern void gpio_init(void);
extern void time_init(void);
extern void key_scan(void);
extern void led_control(void);
extern void power_save(void);

#endif
