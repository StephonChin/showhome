#include "mode.h"


/*
 * 函数名：time_change_mode
 * 描述  ：显示定时开关动作
 * 输入  ：无
 * 输出  ：无
 * 调用  ：内部调用
 */
 static void time_change_mode(void)
 {
   if(mode_init==0)
   {
     mode_init=1;
	 white_duty=0;
	 red_duty=0;
	 mode_delay_1=0;
	 mode_delay_2=0;
   }

   if(time_on)
   {
     mode_delay_1+=1;
	 if(mode_delay_1>249)
	 {
	   mode_delay_1=0;
	   mode_delay_2+=1;
	   if(mode_delay_2==1) white_duty=30;
	   if(mode_delay_2==2) white_duty=0;
	   if(mode_delay_2==3) white_duty=30;
	   if(mode_delay_2==4) white_duty=0;
	   if(mode_delay_2==5) {mode_init=0;time_change=0;}
	 }
   }
   else
   {
     mode_delay_1+=1;
	 if(mode_delay_1>249)
	 {
	   mode_delay_1=0;
	   mode_delay_2+=1;
	   if(mode_delay_2>4)
	   {
	     mode_delay_2=0;
		 time_change=0;
		 mode_init=0;
	   }
	 }
   }
 }

 /*
 * 函数名：work_mode
 * 描述  ：工作模式
 * 输入  ：无
 * 输出  ：无
 * 调用  ：内部调用
 */
static void work_mode(void)
{
//workfunction=5;
  switch(workfunction)
  {
    case 0:
	  white_duty=0;     //关模式
	  red_duty=0;
	break;

	case 1:
	  white_duty=30;
	  red_duty=0;      //白光亮
	break;

	case 2:
	  white_duty=0;
	  red_duty=30;       //彩光亮
	break;

	case 3:
	  if(mode_init==0)
	  {
	    mode_init=1;
		white_duty=0;
		red_duty=30;
		mode_delay_1=0;
		mode_delay_2=0;
		mode_delay_3=0;
	  }

	  if(mode_delay_3==0)
	  {
	    mode_delay_1+=1;
		if(mode_delay_1>84)    //400us*84*29=0.9744s
		{
		  mode_delay_1=0;
		  white_duty+=1;       //red→white 
		  red_duty-=1;
		  if(red_duty<1)
		    mode_delay_3=1;
		} 
	  }
	  if(mode_delay_3==1)
	  {
	    mode_delay_1+=1;
		if(mode_delay_1>249)
		{
		  mode_delay_1=0;
		  mode_delay_2+=1;
		  if(mode_delay_2>49)   //400us*250*50=5s
		  {
		    mode_delay_2=0;
			mode_delay_3=2;
		  }
		}
	  }

	  if(mode_delay_3==2)
	  {
	    mode_delay_1+=1;
		if(mode_delay_1>84)    //400us*84*29=0.9744s
		{
		  mode_delay_1=0;
		  white_duty-=1;       //white→red 
		  red_duty+=1;
		  if(white_duty<1)
		    mode_delay_3=3;
		} 
	  }

	  if(mode_delay_3==3)
	  {
	    mode_delay_1+=1;
		if(mode_delay_1>249)
		{
		  mode_delay_1=0;
		  mode_delay_2+=1;
		  if(mode_delay_2>49)   //400us*250*50=5s
		  {
		    mode_delay_2=0;
			mode_delay_3=0;
		  }
		}
	  }
	break;

	case 4:
	  /*if(mode_init==0)
	  {
	    mode_init=1;
		white_duty=30;
		red_duty=0;
		mode_delay_1=0;
		mode_delay_2=0;
		mode_delay_3=0;
		mode_delay_4=0;
	  }

	  if(mode_delay_3==0)
	  {
	    mode_delay_1+=1;
		if(mode_delay_1>124)
		{
		  mode_delay_1=0;
		  mode_delay_2+=1;
		  if(mode_delay_2>9)
		  {
		    mode_delay_2=0;
			if(white_duty==30){white_duty=0;red_duty=30;}
			else{white_duty=30;red_duty=0;}
			mode_delay_4+=1;
			if(mode_delay_4>9)
			{
			  mode_delay_4=0;
			  mode_delay_3=1;
			}

		  }
		}
	  }

	  if(mode_delay_3==1)
	  {
	    mode_delay_1+=1;
		if(mode_delay_1>124)
		{
		  mode_delay_1=0;
		  mode_delay_2+=1;
		  if(mode_delay_2>4)
		  {
		    mode_delay_2=0;
			if(white_duty==30){white_duty=0;red_duty=30;}
			else{white_duty=30;red_duty=0;}
			mode_delay_4+=1;
			if(mode_delay_4>19)
			{
			  mode_delay_4=0;
			  mode_delay_3=2;
			}

		  }
		}
	  }

	  if(mode_delay_3==2)
	  {
	    mode_delay_1+=1;
		if(mode_delay_1>77)
		{
		  mode_delay_1=0;
		  mode_delay_2+=1;
		  if(mode_delay_2>3)
		  {
		    mode_delay_2=0;
			if(white_duty==30){white_duty=0;red_duty=30;}
			else{white_duty=30;red_duty=0;}
			mode_delay_4+=1;
			if(mode_delay_4>39)
			{
			  mode_delay_4=0;
			  mode_delay_3=0;
			}

		  }
		}
	  }
	  /*if(mode_delay_3==3)
	  {
	    mode_delay_1+=1;
		if(mode_delay_1>155)
		{
		  mode_delay_1=0;
	      if(white_duty==30){white_duty=0;red_duty=30;}
		  else{white_duty=30;red_duty=0;}
		  mode_delay_4+=1;
		  if(mode_delay_4>79)
		  {
			mode_delay_4=0;
		    mode_delay_3=0;
		  }
		}
	  }*/
    break;

	case 5:
	  /*if(mode_init==0)
	  {
	    mode_init=1;
		white_duty=30;
		red_duty=0;
		mode_delay_1=0;
		mode_delay_2=0;
		mode_delay_3=0;
		mode_delay_4=0;
	  }

      if(mode_delay_3==0)
	  {
	    mode_delay_1+=1;
		if(mode_delay_1>124)
		{
		  mode_delay_1=0;
		  mode_delay_2+=1;
		  if(mode_delay_2>0)
		  {
		    mode_delay_2=0;
			if(white_duty==30) white_duty=0;
			else white_duty=30;

			mode_delay_4+=1;
			if(mode_delay_4>4)
			{
			  mode_delay_4=0;
			  mode_delay_3=1;
			}
		  }
		}
	  }

	  if(mode_delay_3==1)
	  {
	    mode_delay_1+=1;
		if(mode_delay_1>124)
		{
		  mode_delay_1=0;
		  mode_delay_2+=1;
		  if(mode_delay_2>2)
		  {
		    mode_delay_2=0;
		    mode_delay_3=2;
		    red_duty=30;
		  }
		}
	  }

	  if(mode_delay_3==2)
	  {
	    mode_delay_1+=1;
		if(mode_delay_1>124)
		{
		  mode_delay_1=0;
		  mode_delay_2+=1;
		  if(mode_delay_2>0)
		  {
		    mode_delay_2=0;
			if(red_duty==30) red_duty=0;
			else red_duty=30;

			mode_delay_4+=1;
			if(mode_delay_4>4)
			{
			  mode_delay_4=0;
			  mode_delay_3=3;
			}
		  }
		}
	  }
	  if(mode_delay_3==3)
	  {
	    mode_delay_1+=1;
		if(mode_delay_1>124)
		{
		  mode_delay_1=0;
		  mode_delay_2+=1;
		  if(mode_delay_2>2)
		  {
		    mode_delay_2=0;
		    mode_delay_3=0;
		    white_duty=30;
		  }
		}
	  }*/
	break;

	case 6:
	  /*if(mode_init==0)
	  {
	    mode_init=1;
		white_duty=30;
		red_duty=0;
		mode_delay_1=0;
		mode_delay_2=0;
		mode_delay_3=0;
		mode_delay_4=0;
	  }

	  if(mode_delay_3==0)
	  {
	    mode_delay_1+=1;
		if(mode_delay_1>124)
		{
		  mode_delay_1=0;
		  mode_delay_2+=1;
		  if(mode_delay_2>0)
		  {
		    mode_delay_2=0;
		    if(white_duty==30)
			  white_duty=0;
		    else 
			  white_duty=30;
		    mode_delay_4+=1;
		    if(mode_delay_4>8)
		    {
		      mode_delay_4=0;
			  mode_delay_3=1;
		    }
		  }
		}
	  }
	  if(mode_delay_3==1)
	  {
	    mode_delay_1+=1;
		if(mode_delay_1>249)
		{
		  mode_delay_1=0;
		  mode_delay_2+=1;
		  if(mode_delay_2>1)
		  {
		    mode_delay_2=0;
		    if(white_duty==30){white_duty=0;red_duty=30;}
		    else{white_duty=30;red_duty=0;}
		    mode_delay_4+=1;
		    if(mode_delay_4>9)
		    {
		      mode_delay_4=0;
			  mode_delay_3=2;
		    }
		  }
		}
	  }

	  if(mode_delay_3==2)
	  {
	    mode_delay_1+=1;
		if(mode_delay_1>124)
		{
		  mode_delay_1=0;
		  mode_delay_2+=1;
		  if(mode_delay_2>0)
		  {
		    mode_delay_2=0;
		    if(red_duty==30)red_duty=0;
		    else red_duty=30;
		    mode_delay_4+=1;
		    if(mode_delay_4>8)
		    {
		      mode_delay_4=0;
			  mode_delay_3=3;
		    }
		  }
		}
	  }
	  if(mode_delay_3==3)
	  {
	    mode_delay_1+=1;
		if(mode_delay_1>249)
		{
		  mode_delay_1=0;
		  mode_delay_2+=1;
		  if(mode_delay_2>1)
		  {
		    mode_delay_2=0;
		    if(red_duty==30){white_duty=30;red_duty=0;}
		    else{white_duty=0;red_duty=30;}
		    mode_delay_4+=1;
		    if(mode_delay_4>9)
		    {
		      mode_delay_4=0;
			  mode_delay_3=0;
		    }
		  }
		}
	  }*/
	break;


	default:
	 workfunction=0;
	break;
  }
}

 /*
 * 函数名：time_off_mode
 * 描述  ：定时关模式
 * 输入  ：无
 * 输出  ：无
 * 调用  ：内部调用
 */
static void time_off_mode(void)
{
  white_duty=0;
  red_duty=0;
}
 /*
 * 函数名：mode_play
 * 描述  ：实现各种模式
 * 输入  ：无
 * 输出  ：无
 * 调用  ：外部调用
 */

void mode_play(void)
{
  if(time_change) 
    time_change_mode();
  else if(time_off) 
    time_off_mode();
  else 
    work_mode();
}