/*--------------------------------
*author:chenyk
*data:2015.5.4
*ver:ver1
--------------------------------*/
#include "stm8s003f3.h"
#include "type.h"
#include "uart.h"

//extern u16 frequency;
extern u8 report_state;
extern u32 vrms;
extern u32 irms;
extern u32 laenergy;
extern u32 lvaenergy;
extern u32 kwh;
extern u16 delta_time;

extern u16 delta_time_count1;
extern u16 delta_time_count2;

extern u16 rate;

extern u8 rate_choice;
/*const u16 rate_table[]={
714,704,694,684,675,666,657,649,641,632,
625,617,609,602,595,588,581,574,568,561,
555,549,543,537,531,526,520,515,510,505,
500,495,490,485,480,476,471,467,462,458,
454
};*/                  
/********************************
*函数名:uart_config
*功能:
*输入参数:
*输出参数:
*********************************/
void uart_Config(void)
{
	UART1_BRR2=0x00;
	UART1_BRR1=0x1a;    //4mhz 9600
	
	UART1_CR2=0x2c;
	UART1_CR3=0x00;
	UART1_CR1=0x00;
	_asm("rim");     //rim是使能中断_asm("sim"); //sim是禁止中断

	
	/*UART1_DeInit();
  UART1_Init((u32)9600, UART1_WORDLENGTH_8D, UART1_STOPBITS_1, UART1_PARITY_NO, UART1_SYNCMODE_CLOCK_DISABLE, UART1_MODE_TXRX_ENABLE);
	UART1_ITConfig(UART1_IT_RXNE_OR, ENABLE);
  UART1_Cmd(ENABLE);*/
}

/********************************
*函数名:uart_tx
*功能:
*输入参数:
*输出参数:
*********************************/
void uart_tx(void)
{
	static u32 temp=0;
	u8 i;
	
	//report_state=report_state;
	//laenergy=0xfd4d;
	switch (report_state)
	{
		case report_w:
		 temp=(laenergy*100);
		 if(rate_choice)
		   temp=(temp/38);
		 else
		  temp=(temp/38); 
			//while((UART1_SR&0x80)==0x00);
			//UART1_DR='$';
		  while((UART1_SR&0x80)==0x00);
		  UART1_DR=(u8)(temp>>16);
		  while((UART1_SR&0x80)==0x00);
		  UART1_DR=(u8)(temp>>8);
		  while((UART1_SR&0x80)==0x00);
		  UART1_DR=(u8)temp;
		  report_state=0;
		break;
		
		case report_va:
		  temp=(lvaenergy*100);
			if(rate_choice)
		    temp=(temp/32);
			else
			  temp=(temp/31);
				
			//while((UART1_SR&0x80)==0x00);
			//UART1_DR='$';	
		  while((UART1_SR&0x80)==0x00);
		  UART1_DR=(u8)(temp>>16);
		  while((UART1_SR&0x80)==0x00);
		  UART1_DR=(u8)(temp>>8);
		  while((UART1_SR&0x80)==0x00);
		  UART1_DR=(u8)temp;
		  report_state=0;
		break;
		
		case report_v:
		  temp=vrms;
			if(rate_choice)
		    temp=(temp/521);
			else
			  temp=(temp/510);
				
			//while((UART1_SR&0x80)==0x00);
			//UART1_DR='$';
		  //510
		  while((UART1_SR&0x80)==0x00);
		  UART1_DR=(u8)(temp>>16);
		  while((UART1_SR&0x80)==0x00);
		  UART1_DR=(u8)(temp>>8);
		  while((UART1_SR&0x80)==0x00);
		  UART1_DR=(u8)temp;
		  report_state=0;
		break;
		
		case report_a:
		  temp=irms;
			if(rate_choice)
		    temp=(temp/966);
			else 
			  temp=(temp/960);
				
			//while((UART1_SR&0x80)==0x00);
			//UART1_DR='$';
		  while((UART1_SR&0x80)==0x00);
			UART1_DR=(u8)(temp>>16);
		  while((UART1_SR&0x80)==0x00);
		  UART1_DR=(u8)(temp>>8);
		  while((UART1_SR&0x80)==0x00);
		  UART1_DR=(u8)temp;
		  report_state=0;
		break;
		
		case report_k:
		  temp=kwh;
			
			//while((UART1_SR&0x80)==0x00);
			//UART1_DR='$';
		  while((UART1_SR&0x80)==0x00);
		  UART1_DR=(u8)(temp>>16);
		  while((UART1_SR&0x80)==0x00);
		  UART1_DR=(u8)(temp>>8);
		  while((UART1_SR&0x80)==0x00);
		  UART1_DR=(u8)temp;
		  report_state=0;
			
		break;
		
		
		case report_rate:
		  //temp=(u32)frequency;
		  temp=(u32)rate;
			temp=(500000/temp-4);
			
			//while((UART1_SR&0x80)==0x00);
			//UART1_DR='$';
			while((UART1_SR&0x80)==0x00);
		  UART1_DR=(u8)(temp>>16);
		  while((UART1_SR&0x80)==0x00);
		  UART1_DR=(u8)(temp>>8);
		  while((UART1_SR&0x80)==0x00);
		  UART1_DR=(u8)temp;
		  report_state=0;
			
		break;
		
		case report_d:
		  TIM4_CNTR=0;
			delta_time_count1=0;
			delta_time_count2=0;
			
			//while((UART1_SR&0x80)==0x00);
			//UART1_DR='$';
		  while((UART1_SR&0x80)==0x00);
		  UART1_DR=0x00;
		  while((UART1_SR&0x80)==0x00);
		  UART1_DR=(u8)(delta_time>>8);
		  while((UART1_SR&0x80)==0x00);
		  UART1_DR=(u8)delta_time;
			
			delta_time=0;
		  report_state=0;
		break;
		
		case report_r:
		  while((FLASH_IAPSR&0x04)==0x04);
		  eeprom_write(0x01,0x00);
		
		  while((FLASH_IAPSR&0x04)==0x04);
		  eeprom_write(0x02,0x00);
		break;
		
		default:
		break;
	}
}


