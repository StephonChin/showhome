#include "power_save.h"

 /*
 * ��������power_save
 * ����  ���͹���
 * ����  ����
 * ���  ����
 * ����  ���ⲿ����
 */
void power_save(void)
{
  static uchar sleep_delay_1;
  static uchar sleep_delay_2;

  if(power_save_enable)
  {
    power_save_enable=0;
	sleep_delay_1=0;
	sleep_delay_2=0;
  }
  else
  {
    sleep_delay_1+=1;
    if(sleep_delay_1>249)
    {
	  sleep_delay_1=0;
	  sleep_delay_2+=1;
	  if(sleep_delay_2>9)
	  {
	    sleep_delay_2=0;
	    FCPUM1=0;
	    FCPUM0=1;         //����˯��ģʽ
	  }
	}  
  }
}