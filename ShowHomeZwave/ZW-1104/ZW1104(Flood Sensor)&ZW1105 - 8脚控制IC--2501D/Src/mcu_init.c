#include "mcu_init.h"

 /*
 * 函数名：gpio_init
 * 描述  ：初始化gpio
 * 输入  ：无
 * 输出  ：无
 * 调用  ：外部调用
 */
void gpio_init(void)
{
  FP00M = 0;
  P0UR = 0;

  P1M=0xfc;
  P1UR=0x02;
  P1=0x00;
  P1W=0x01;

  FP12M = 1;
  FP13M = 1;
  FP12 = 0;
  FP13 = 0;

  P2M=0xff;
  P2=0x00;

  P5M=0xff;
  P5=0x10;
}

/*
 * 函数名：time_init
 * 描述  ：初始化time
 * 输入  ：无
 * 输出  ：无
 * 调用  ：外部调用
 */
void time_init(void)
{
  T0C=0x00;
  T0M=0x01;     //RTC功能
  
  TC0R=206;     //(256-206)*2us=100us
  TC0C=206;
  TC0M=0xf4; 

  FT0IEN=1;     //使能t0中断
  FT0IRQ=0;
  FGIE=1;       //开放全局中断
}