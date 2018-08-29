#ifndef __key_h
#define __key_h
#include "sn8p2511.h"
#define uchar unsigned char

extern bit power_save_enable;
extern bit beepInitFlag;
extern bit delayInitFlag;
extern bit beepActiveFlag;
extern bit timeDelayFlag;

#define sw1  FP00
#define sw2  FP10

void key_scan(void);
#endif