
#include "main.h"

void main(void)
{
  static uchar main_step;
  gpio_init();
  time_init();

  while(1)
  {
    if(FTC0IRQ)    //132us
	{
	  FTC0IRQ=0;
	  BeepPulseControl();
	  switch(main_step)
	  {
	    case 0:
		  key_scan();
		  main_step=1;
		break;

		case 1:
		  led_control();
		  main_step=2;
		break;

		case 2:
		  power_save();
		  main_step=0;
		break;


		default:
		main_step=0;
		break;
	  }
	}
  }
}

void __interrupt[0x08] ISR(void)
{

  INTRQ=0;
}