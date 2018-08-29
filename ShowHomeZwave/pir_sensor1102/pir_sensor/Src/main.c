/***********************
*作者:chenyk
*日期:2015/4/21
*版本:Ver1
***********************/
#include "sn8p2511.h"

#define uchar unsigned char 

uchar sleep_delay_1;
uchar sleep_delay_2;
uchar sleep_delay_3;

uchar out_delay;
//uchar wave_step;

bit int_wave_up;
bit open_trigger;
bit on_trigger;
bit out_finish;
bit int_trigger;
bit out_enable;

#define out FP54
#define out_led FP12

#define key1 FP00
#define key2 FP10

void gpio_init(void)
{
  P0M=0x00;
  //P0UR=0x01;
  INTRQ=0x00;
  INTEN=0x01;
  PEDGE=0x08;
  FGIE=1;

  P1M=0xfe;
  P1UR=0x01;
  P1=0x00;
  P1W=0x01;

  P2M=0xff;
  P2=0x00;

  P5M=0xff;
  P5=0x10;
}


void time_init(void)
{
  TC0C=156;
  TC0R=156;
  TC0M=0xf4;
}


void main(void)
{
  OSCM=0x06;
  gpio_init();
  time_init();

  while(1)
  {
    if(FTC0IRQ)
	{
	  FTC0IRQ=0;

	  //FP22=~FP22;

      if(key2)
	  {
	    if((open_trigger==0)&&(out_finish==0))
		{
		  open_trigger=1;
		  on_trigger=0;
		  out_finish=1;
		  out_enable=1;
		  out=0;
		  out_led=0;
		  out_delay=0;
		}
	  }
	  else
      {
	    if((on_trigger==0)&&(out_finish==0))
		{
		  on_trigger=1;
		  open_trigger=0;
		  out_finish=1;
		  out=0;
		  out_delay=0;
		  int_wave_up=0;
		  out_led=0;
		  out_enable=1;
		  sleep_delay_3=0;
		}
		else
		{
		  if(out_finish==0)
		  {
		    if(int_wave_up)
			{
			  int_trigger=1;
			}
		  }
		}
      }
	  
	  if(out_enable)
	  {
	    out_delay+=1;
		if(out_delay>2)
		{
		  out_delay=0;
		  out=1;
		  out_finish=0;
		  out_enable=0;

		   FCPUM1=0;
	       FCPUM0=1;
		   FCLKMD=1;
		   FSTPHX=1;
		}
	  }
	  else if(int_trigger==1)
	  {
		sleep_delay_1+=1;
		if(sleep_delay_1>4)
		{
		  sleep_delay_1=0;
		  sleep_delay_2+=1;
		  if(sleep_delay_2>24)
		  {
		    out_led=0;
		    sleep_delay_2=0;
			sleep_delay_3=6;
		  }
		}

		sleep_delay_3+=1;
		if(sleep_delay_3>6)
		{
		  if(sleep_delay_3==8)
		  {
		   FGIE=0;
		   out=0;
		   out_finish=1;
		  }

		  if(sleep_delay_3==9)
		  {
		    out=1;
			out_finish=0;
           }
		   if(sleep_delay_3>113)
		   { 
			  int_wave_up=0;
			  int_trigger=0;
			  sleep_delay_3=0;
			  FP00IRQ=0;
			  FGIE=1;
		      FCPUM1=0;
	      	  FCPUM0=1;
		   	  FCLKMD=1;
		      FSTPHX=1;
		  }
		}
		else
		{
		  if(sleep_delay_3>4) sleep_delay_3=4;
		  else
		  {
            if(sleep_delay_3>3)
			{
			  out=1;
		      out_finish=0;
			}
			else
			{
			  if(sleep_delay_3>1)
		      {
		       out=0;
		       out_finish=1;
		      }
		    }
          }
		}
	  }	    
    }
  }
}

/****************************
*
*****************************/
void __interrupt[0x08] interrupt_isr(void)
{
  if(FP00IRQ)
  {
    int_wave_up=1;
	out_led=1;
	sleep_delay_1=0;
	sleep_delay_2=0;
  }
  FP00IRQ=0;
}