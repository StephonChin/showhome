/***********************
*author:chenyk
*data:2014.11.24
***********************/
#include "led.h"

/**********************
*name:void led_control(void)
*function:control led
*input:no
*output:no
*modification:
***********************/
void led_control(void)
{
  //led_mode=1;
  switch(led_mode)
  {
    case 0:
	  led_control_one();
	  break;

    case 1:
	  led_control_two();
	  break;

    case 2:
	  led_control_three();
	  break;

    case 3:
	  led_control_four();
	  break;

	default:
	  break;
  }
}


/***************************
*name:void led_control_one(void)
*function:
*input:
*output:
*modification:
****************************/
void led_control_one(void)
{
  if(led_mode_init==0)
  {
    led_mode_init=1;
	led_delay_3=0;
	r1=0;
	r2=0;
	r3=0;
	g1=1;
	g2=1;
	g3=1;
	b1=1;
	b2=1;
	b3=1;
  }
  
  if(led_delay_3==1)
  {
	r1=1;
    r2=1;
	r3=1;
	g1=0;
	g2=0;
	g3=0;
  }
	  
  if(led_delay_3==3)
  {
	g1=1;
    g2=1;
	g3=1;
	b1=0;
	b2=0;
	b3=0;
  }
  if(led_delay_3==5)
  {
	b1=1;
    b2=1;
	b3=1;
	r1=0;
	r2=0;
	r3=0;
	led_delay_3=0;
  }
  if(led_delay_3==6)
  {
	led_delay_3=0;
  }
}

/***************************
*name:void led_control_two(void)
*function:
*input:
*output:
*modification:
****************************/
void led_control_two(void)
{
  if(led_mode_init==0)
  {
    led_mode_init=1;
	led_delay_3=0;
	g1=1;
	r1=1;
	r2=1;
	r3=1;
	g2=1;
	g3=1;
	b1=0;
	b2=0;
	b3=0;
  }
  
  if(led_delay_3==1)
  {
	b1=1;
	b2=1;
	b3=1;
  }
  if(led_delay_3==2)
  {
    b1=0;
	b2=0;
	b3=0;
  }
  if(led_delay_3==3)
  {
	b1=1;
	b2=1;
	b3=1;
  }

  if(led_delay_3==4)
  {
	b1=0;
    b2=0;
	b3=0;
  }
  
  if(led_delay_3==5)
  {
	b1=1;
	b2=1;
	b3=1;
  }
  if(led_delay_3==110)
  {
	 led_delay_3=0;
     b1=0;
	 b2=0;
	 b3=0;
   }
}

/***************************
*name:void led_control_three(void)
*function:
*input:
*output:
*modification:
****************************/
void led_control_three(void)
{
  if(led_mode_init==0)
  {
    led_mode_init=1;
	led_delay_3=0;
	r1=0;
	r2=0;
	r3=0;
	g1=1;
	g2=1;
	g3=1;
	b1=1;
	b2=1;
	b3=1;
  } 

  if(led_delay_3==1)
  {
	r1=1;
    r2=1;
	r3=1;
  }
  if(led_delay_3==2)
  {
    r1=0;
	r2=0;
	r3=0;
  }
  if(led_delay_3==3)
  {
	r1=1;
	r2=1;
	r3=1;
  }

  if(led_delay_3==4)
  {
	r1=0;
	r2=0;
    r3=0;
  }
  if(led_delay_3==5)
  {
    r1=1;
	r2=1;
	r3=1;
  }
  
  if(led_delay_3==110)
  {
	led_delay_3=0;
    //led_mode=1;
    led_mode_init=0;
   }
}

/***************************
*name:void led_control_four(void)
*function:
*input:
*output:
*modification:
****************************/
void led_control_four(void)
{
  if(led_mode_init==0)
  {
    led_mode_init=1;
	led_delay_3=0;
	r1=1;
	g1=0;
	r2=1;
	r3=1;
	g2=0;
	g3=0;
	b1=1;
	b2=1;
	b3=1;
  }

  if(led_delay_3==1)
  {
	g1=1;
	g2=1;
	g3=1;
  }
  if(led_delay_3==2)
  {
    g1=0;
	g2=0;
	g3=0;
  }
  if(led_delay_3==3)
  {
	g1=1;
	g2=1;
	g3=1;
  }

  if(led_delay_3==4)
  {
	g1=0;
    g2=0;
	g3=0;
  }
  if(led_delay_3==5)
  {
    g1=1;
	g2=1;
	g3=1;
  }
  
  if(led_delay_3==110)
  {
	led_delay_3=0;
	g1=0;
	g2=0;
	g3=0;
  }
}