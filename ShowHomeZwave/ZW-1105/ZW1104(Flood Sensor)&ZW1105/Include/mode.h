#ifndef __mode_h
#define __mode_h
#include "sn8p2511.h"
#define uchar unsigned char 

uchar mode_delay_1;
uchar mode_delay_2;
uchar mode_delay_3;
uchar mode_delay_4;
uchar white_duty;
uchar red_duty;
extern bit time_off;
extern bit time_change;
extern bit time_on;
extern bit work_on;
extern bit mode_init;
extern uchar workfunction;

void mode_play(void);
#endif