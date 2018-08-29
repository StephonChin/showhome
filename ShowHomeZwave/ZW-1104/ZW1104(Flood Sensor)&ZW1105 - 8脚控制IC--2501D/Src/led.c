#include "led.h"

 /*
 * 函数名：led_control
 * 描述  ：控制led亮灭
 * 输入  ：无
 * 输出  ：无
 * 调用  ：外部调用
 */

void led_control(void)
{
  static uchar out_delay;

  if(out_enable)
  {
    out=0;
	out_delay+=1;
	if(out_delay>249)
	{
	  out_delay=0;
	  out=1;
	  out_enable=0;
	}
  }
}