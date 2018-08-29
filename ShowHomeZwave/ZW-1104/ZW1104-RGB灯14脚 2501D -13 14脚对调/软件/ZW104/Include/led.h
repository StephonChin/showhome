#ifndef __led_h
#define __led_h
#include "sn8p2511.h"
#define uchar unsigned char
bit led_mode_init;
uchar led_delay_1;
uchar led_delay_2;
uchar led_delay_3;
uchar led_mode;
extern bit led_mode_init;
#define r3 FP22 
#define g3 FP21
#define b3 FP20
#define r2 FP24
#define g2 FP23
#define b2 FP25
#define r1 FP00
#define g1 FP10
#define b1 FP54
void led_control(void);
void led_control_one(void);
void led_control_two(void);
void led_control_three(void);
void led_control_four(void);
#endif