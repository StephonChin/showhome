#include "led.h"

 /*
 * ��������led_control
 * ����  ������led����
 * ����  ����
 * ���  ����
 * ����  ���ⲿ����
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