#ifndef __led_h
#define __led_h
#include "sn8p2511.h"
#define uchar unsigned char


extern bit out_enable;

#define out FP54

void led_control(void);
#endif