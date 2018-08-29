/******************
*author:chenyk
*data:2014.11.24
*******************/

#include "gpio.h"


/**********************
*name:void gpio_init(void)
*function:initialization gpio
*input:no
*output:no
*modification:
***********************/
void gpio_init(void)
{
  P0M=0x01;
  FP00=0;

  P1M=0x01;
  P1UR=0xf2;
  P1=0x00;

  P2M=0xff;
  P2=0x00;

  FP54M=1;
  FP54=0;
  P1W=0x0e;
}