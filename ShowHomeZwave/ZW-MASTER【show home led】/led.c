/*************************
*作者:chenyk
*日期:2014.10.30
*************************/
#include "mc96f6508a.h"
#include "led.h"
uchar send_data_1;
uchar send_data_2;
uchar led_duty;
idata uchar r_duty[17];
idata uchar g_duty[17];
idata uchar b_duty[17];

void red_control(void);
void green_control(void);
void blue_control(void);
void send_led_data(void);
/************************
*名称:led_control
*功能:控制led
*输入:无
*输出:无
*修改记录:
************************/
void led_control(void)
{
  led_duty+=1;
  if(led_duty>29) led_duty=0;
  
  red_control();
  green_control();
  blue_control();
  send_led_data();
}
/*********************
*名称:red_control
*功能:控制red
*输入:无
*输出:无
*修改记录:
***********************/
void red_control(void)
{
  if(r_duty[0]>led_duty) red_1=1;
  else red_1=0;
  if(r_duty[1]>led_duty) red_2=1;
  else red_2=0;
  if(r_duty[2]>led_duty) red_3=1;
  else red_3=0;
  if(r_duty[3]>led_duty) red_4=1;
  else red_4=0;
  if(r_duty[4]>led_duty) red_5=1;
  else red_5=0;
  if(r_duty[5]>led_duty) red_6=1;
  else red_6=0;
  if(r_duty[6]>led_duty) red_7=1;
  else red_7=0;
  if(r_duty[7]>led_duty) red_8=1;
  else red_8=0;
  if(r_duty[8]>led_duty) red_9=1;
  else red_9=0;
  if(r_duty[9]>led_duty) red_10=1;
  else red_10=0;
  if(r_duty[10]>led_duty) red_11=1;
  else red_11=0;
  if(r_duty[11]>led_duty) red_12=1;
  else red_12=0;
  if(r_duty[12]>led_duty) red_13=1;
  else red_13=0;
  
  if(r_duty[13]>led_duty)send_data_1|=0x01;
  else send_data_1&=0xfe;
  if(r_duty[14]>led_duty)send_data_1|=0x02;
  else send_data_1&=0xfd;
  if(r_duty[15]>led_duty)send_data_1|=0x04;
  else send_data_1&=0xfb;
  if(r_duty[16]>led_duty)send_data_1|=0x08;
  else send_data_1&=0xf7;
}
/***************************
*名称:green_control
*功能:控制green led
*输入:无
*输出:无
*修改记录:
***************************/
void green_control(void)
{
  

  if(g_duty[0]>led_duty)green_1=1;
  else green_1=0;
  if(g_duty[1]>led_duty)green_2=1;
  else green_2=0;
  if(g_duty[2]>led_duty)green_3=1;
  else green_3=0;
  if(g_duty[3]>led_duty)green_4=1;
  else green_4=0;
  if(g_duty[4]>led_duty)green_5=1;
  else green_5=0;
  if(g_duty[5]>led_duty)green_6=1;
  else green_6=0;
  if(g_duty[6]>led_duty)green_7=1;
  else green_7=0;
  if(g_duty[7]>led_duty)green_8=1;
  else green_8=0;
  if(g_duty[8]>led_duty)green_9=1;
  else green_9=0;
  if(g_duty[9]>led_duty)green_10=1;
  else green_10=0;
  if(g_duty[10]>led_duty)green_11=1;
  else green_11=0;
  if(g_duty[11]>led_duty)green_12=1;
  else green_12=0;
  if(g_duty[12]>led_duty)green_13=1;
  else green_13=0;
  if(g_duty[13]>led_duty)green_14=1;
  else green_14=0;
  if(g_duty[14]>led_duty)send_data_1|=0x10;
  else send_data_1&=0xef;
  if(g_duty[15]>led_duty)send_data_1|=0x20;
  else send_data_1&=0xdf;
  if(g_duty[16]>led_duty)send_data_1|=0x40;
  else send_data_1&=0xbf;  
}
/***************************
*名称:blue_control
*功能:控制blue led
*输入:无
*输出:无
*修改记录:
***************************/
void blue_control(void)
{
  if(b_duty[0]>led_duty)blue_1=1;
  else blue_1=0;
  if(b_duty[1]>led_duty)blue_2=1;
  else blue_2=0;
  if(b_duty[2]>led_duty)blue_3=1;
  else blue_3=0;
  if(b_duty[3]>led_duty)blue_4=1;
  else blue_4=0;
  if(b_duty[4]>led_duty)blue_5=1;
  else blue_5=0;
  if(b_duty[5]>led_duty)blue_6=1;
  else blue_6=0;
  if(b_duty[6]>led_duty)blue_7=1;
  else blue_7=0;
  if(b_duty[7]>led_duty)blue_8=1;
  else blue_8=0;
  if(b_duty[8]>led_duty)blue_9=1;
  else blue_9=0;
  if(b_duty[9]>led_duty)blue_10=1;
  else blue_10=0;
  if(b_duty[10]>led_duty)blue_11=1;
  else blue_11=0;
  if(b_duty[11]>led_duty)blue_12=1;
  else blue_12=0;
  if(b_duty[12]>led_duty)blue_13=1;
  else blue_13=0;
  if(b_duty[13]>led_duty)blue_14=1;
  else blue_14=0;
  if(b_duty[14]>led_duty)send_data_1|=0x80;
  else send_data_1&=0x7f;
  if(b_duty[15]>led_duty)send_data_2|=0x01;
  else send_data_2&=0xfe;
  if(b_duty[16]>led_duty)send_data_2|=0x02;
  else send_data_2&=0xfd;  
}
/**************************
*名称:send_led_data
*功能:发送led数据 
*输入:无
*输出:无
*修改记录:
***************************/
void send_led_data(void)
{
  uchar i,j;
  //send_data_1=0x50;
  //send_data_2=0x00;
   
  for(i=10;i>0;i--)
  {
    sda=0;
	if((send_data_2&0x02)==0x02)
	  sda=1;
	send_data_2<<=1;
	if((send_data_1&0x80)==0x80)
	 send_data_2|=0x01;
	send_data_1<<=1;
	sck=0;
	for(j=0;j<10;j++);
	sck=1;
	for(j=0;j<10;j++); 
  }
}
