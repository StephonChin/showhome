#ifndef __user_h
#define __user_h
#include "sn8p2511.h"
#define uchar unsigned char

extern uchar workfunction;

extern void i2c_write(uchar addr,uchar send_data);
extern uchar i2c_read(uchar addr);

void user_init(void);
#endif
