/***********************
*author:chenyk
*data:2014.11.24
***********************/
#include "mode.h"

/**********************
*name:void mode_selection(void)
*function: select mode
*input:no
*output:no
*modification:
***********************/
void mode_selection(void)
{
  if(check_port3)
  {
    if(!check_port3_buf){check_port3_buf=1;check_port3_change_count+=1;}
  }
  else
  {
    if(check_port3_buf){check_port3_buf=0;check_port3_change_count+=1;}
  }


  if(mode_delay_1>7)
  {
    mode_delay_1=0;
	if(check_port3_change_count>1)
	{
	  check_port3_change_count=0;
	  if(led_mode !=0 ||power_up==0)
	  {
		power_up=1;
		led_mode=0;
		led_mode_init=0;
		have_get_node=0;
		mode_one=0;
	    mode_two=0;
	    mode_three=0;
	  }
    }
	else
	{
	  have_get_node=1;
	  check_port3_change_count=0;
	}
  }


  if(check_port2)
  {
    if(mode_three==0 && have_get_node==1)
	{
	  mode_one=0;
	  mode_two=0;
	  mode_three=1;
      led_mode=3;              //ÂÌ
	  led_mode_init=0;          
	}
  }
  else if(check_port1)
  {
    if(mode_two==0 && have_get_node==1)
	{
	  mode_one=0;
	  mode_two=1;
	  mode_three=0;
	  led_mode=2;               //ºì
	  led_mode_init=0;
	}
  }
  else
  {
    if(mode_one==0 && have_get_node==1)
	{
	  mode_one=1;
	  mode_two=0;
	  mode_three=0;
	  led_mode=1;              //À¶
	  led_mode_init=0;
	}
  }
}

/***************************
*name:void power_start(void)
*function:
*input:
*output:
*modification:
****************************/
void power_start(void)
{
  
}

/**************************
*name:void mode_check(void)
*function:
*input:
*output:
*modification:
***************************/
void mode_check(void)
{
  
}