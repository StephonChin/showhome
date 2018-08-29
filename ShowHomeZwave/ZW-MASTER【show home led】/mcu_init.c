#include "mcu_init.h"
#include "mc96f6508a.h"
/*********************
*����:gpio_init
*����:��ʼ��gpio
*����:��
*���:��
*�޸ļ�¼:
**********************/
void gpio_init(void)
{
  P0IO=0xff;     
  P0PU=0x00;	  
  P0OD=0x00;     
  P0=0x00;       
  P0DB=0x00;	 

  P1IO=0xff;     
  P1PU=0x00;	 
  P1OD=0x00;    
  P1=0x00;       
  P1DB=0x00;

  P2IO=0xff;     
  P2PU=0x00;	  
  P2OD=0x00;     
  P2=0x00;       
  P2FSR=0x00;   

  P3IO=0xff;     
  P3PU=0x00;	  
  P3OD=0x00;    
  P3=0x00;       
  P3FSR=0x00;    

  P4IO=0xff;     
  P4PU=0x00;	  
  P4OD=0x00;     
  P4=0x00;       
  P4FSR=0x00;    

  P5IO=0x7f;     
  P5PU=0x00;	 
  P5OD=0x00;     
  P5=0x40;       
  P5FSRH=0x18;   
  P5FSRL=0x00;   

  P6IO=0xff;     
  P6PU=0x00;	  
  P6OD=0x00;     
  P6=0x18;       
  P6FSR=0x00;    
}

/**************************
*����:sys_clock_init
*����:����ϵͳʱ��
*����:��
*���:��
*�޸ļ�¼:
**************************/
void sys_clock_init(void)
{
  OSCCR=0x20;   //8Mhz
  SCCR=0x00;
	 
  PLLCR=0x00;    
   
  LVICR=0x00;
  LVRCR=0x00;    

//  BITCR=0x01;    
//  WDTDR=9;
//  WDTCR=0x00;    //�����Ź���λʱ�䣩
}

/**************************
*����:t0_init
*����:��ʼ��t0
*����:��
*���:��
*�޸ļ�¼:
****************************/
void t0_init(void)
{ 
  TIFR=0x00;  
  T0DR=199;
  T0CR=0x8b;     //1us*(199+1)=200us
}

/*************************
*����:uart_init
*����:��ʼ��uart 8bit+1stop ��9600��
*����:��
*���:��
*�޸ļ�¼:
***************************/
void uart_init(void)
{
  UARTBD=51;	   //9600
  UARTCR1=0x06;
  UARTCR2=0x2c;	    //uart driver
  UARTCR3=0x00;
  UARTST=0x00;

  IE1=0x08;
  IE=0x80;
  UARTCR2|=0x02;
}