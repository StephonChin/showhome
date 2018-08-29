
#include "main.h"

void main(void)
{
  static uchar main_step;
  gpio_init();
  time_init();

  while(1)
  {
    if(FTC0IRQ)    //100us
	{
	  FTC0IRQ=0;
	  switch(main_step)
	  {
	    case 0:
		  key_scan();
		  BeepPulseControl();
		  main_step=1;
		break;

		case 1:
		  led_control();
		  BeepPulseControl();
		  main_step=2;
		break;

		case 2:
	      BeepPulseControl();
		  main_step=3;
		break;

		case 3:
		  power_save();
		  BeepPulseControl();	
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