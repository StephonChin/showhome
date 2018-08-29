#ifndef __main_h
#define __main_h
#include "sn8p2511.h"
#define uchar unsigned char

extern uchar mode_delay_1;
extern uchar led_delay_3;

extern void gpio_init(void);
extern void tc0_init(void);
extern void mode_selection(void);
extern void led_control(void);
#endif
