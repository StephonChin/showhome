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
bit flagProtect;
bit flagProtectOn;
bit flagProtectOff;

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
		  flagProtect = 0;
		  beepInitFlag = 1;
		  beepActiveFlag = 0;
		  flagProtectOff = 1;
		  flagProtectOn  = 0;
		  flagKeyTrigger = 0;
		  sw2_have_done_1=1;
		  power_save_enable=1;
		  out_enable=1; 
		  sw2_buf=1;             
		}
	  } 
    }
    else
    {
		if (!flagProtect)
		{
			sw2_count_1=0;
		  	sw2_count_2+=1;
		  	if(sw2_count_2>99)
		  	{  
		   		sw2_count_2=0;
				sw2_have_done_1=0;
				if(!sw2_have_done_2)
				{
			  		flagProtect = 1;
			  		if (flagProtectOff)
			  		{
			  			flagProtectOff = 0;
			  			flagProtectOn = 1;
						beepInitFlag = 1;
						beepActiveFlag = 0;
						timeDelayFlag = 0;
						delayInitFlag = 1;
			  		}
			  		sw2_have_done_2=1;
			  		power_save_enable=1;
			  		out_enable=1;
			  		sw2_buf=0;              
				}
		  	} 
		}
		else
		{
			if(sw1)
			{	
				sw1_count_1+=1;
				sw1_count_2=0;
				if(sw1_count_1>99)
				{ 
					sw1_count_1=0;
					sw1_have_done_2=0;
					//--------------DS.Chin-------2015.5.6---
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
		}
	   
    }


/*	if (!sw2_buf)
	{
		if(sw1)
		{	
			sw1_count_1+=1;
			sw1_count_2=0;
			if(sw1_count_1>99)
			{ 
				sw1_count_1=0;
				sw1_have_done_2=0;
				//--------------DS.Chin-------2015.5.6---
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
	}*/

  
}