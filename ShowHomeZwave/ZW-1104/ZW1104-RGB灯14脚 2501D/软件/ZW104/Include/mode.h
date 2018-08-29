#ifndef __mode_h
#define __mode_h
#include "sn8p2511.h"
#define uchar unsigned char
uchar check_port3_change_count;
uchar mode_delay_1;
uchar mode_delay_2;
uchar mode_delay_3;
uchar mode_delay_4;
uchar mode_delay_5;
uchar mode_delay_6;
bit  power_up;
bit  mode_one;
bit  mode_two;
bit  mode_three;
bit  check_port3_buf;
bit  have_get_node;
bit  power_up;

extern bit led_mode_init;
extern uchar led_mode;
#define check_port3  FP11
#define check_port2  FP13
#define check_port1  FP12
void mode_selection(void);
void power_start(void);
void mode_check(void);
#endif