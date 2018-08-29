/**************************
*
**************************/
#include "main.h"
void main(void)
{ 
  OSCM=0x06;             //低速模式
  gpio_init();
  tc0_init();
  while(1)
  {
    //_ClearWatchDogTimer();      //清看门狗

	mode_selection();
	led_control();
      
    FCPUM1=1;
	FCPUM0=0;
  }
}

/*-------------------------

--------------------------*/
void __interrupt[0x08] ISR(void)
{
  if(FT0IRQ)
  {
    T0C=173; 
    mode_delay_1+=1;
	led_delay_3+=1;
  }
  INTRQ=0;
}