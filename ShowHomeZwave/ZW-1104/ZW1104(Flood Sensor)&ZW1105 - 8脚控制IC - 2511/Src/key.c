#include "key.h"

 /*
 * 函数名：key_scan
 * 描述  ：按键扫描
 * 输入  ：无
 * 输出  ：无
 * 调用  ：外部调用
 */
bit out_enable;
bit flagKeyTrigger;
bit flagWarningInit;
void key_scan(void)
{
  static uchar sw2_count_1;
  static uchar sw2_count_2;
  static uchar sw1_count_1;
  static uchar sw1_count_2;

  static bit sw2_have_done_1;
  static bit sw2_have_done_2;
  static bit sw1_have_done_1;
  static bit sw1_have_done_2;
  static bit sw2_buf;


  if(!out_enable)
  {
    if(sw1)
    {
	  sw1_count_1+=1;
 	  sw1_count_2=0;
	  if(sw1_count_1>99)
	  { 
	    sw1_count_1=0;
		sw1_have_done_2=0;
		//--------------DS.Chin-------2015.5.14---
		flagKeyTrigger = 1;
		flagWarningInit = 1;
		//----------------------------------------
		if(!sw1_have_done_1)
		{
		  sw1_have_done_1=1;
		  power_save_enable=1; 			           
		}
	  } 
    }
    else
    {
	  sw1_count_1=0;
	  sw1_count_2+=1;
	  if(sw1_count_2>99)
	  { 
	    sw1_count_2=0;
		sw1_have_done_1=0;
		if(!sw1_have_done_2)
		{
		  sw1_have_done_2=1;
		  power_save_enable=1;              
		}
	  }
    }

    if(sw2)
    {
      sw2_count_1+=1;
 	  sw2_count_2=0;
	  if(sw2_count_1>99)
	  { 
	    sw2_count_1=0;
		sw2_have_done_2=0;
		if(!sw2_have_done_1)
		{
		  sw2_have_done_1=1;
		  power_save_enable=1;
		  out_enable=1; 
		  sw2_buf=1;             
		}
	  } 
    }
    else
    {
	  sw2_count_1=0;
	  sw2_count_2+=1;
	  if(sw2_count_2>99)
	  {  
	    sw2_count_2=0;
		sw2_have_done_1=0;
		if(!sw2_have_done_2)
		{
		  sw2_have_done_2=1;
		  power_save_enable=1;
		  out_enable=1;
		  sw2_buf=0;              
		}
	  }  
    }
  } 
}