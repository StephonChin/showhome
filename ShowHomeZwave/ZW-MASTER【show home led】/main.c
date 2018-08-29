 /*****************************
 *����:chenyk
 *����:2014.10.28
 *mcu:mc96f6508a
 *����:����led��˸
 *�޸ļ�¼:
 ******************************/
#include"main.h"
#include "mc96f6508a.h"
uchar main_loop=0;

uchar  uart_data[14];
uchar  uart_step;
bit uart_updata=0;
bit uart_start;
void main(void)
{
  sys_clock_init();  //��ʼ��ϵͳʱ�ӣ�8mhz
  gpio_init();       //��ʼ��gpio
  uart_init();		  //��ʼ��uart
  t0_init();		  //��ʼ��t0
  power_on_flag=1;
  while(1)
  {	
   if(TIFR&0x01==0x01) //200us
    {
      TIFR&=0xfe;
	  //WDTCR|=0x20;     //�忴�Ź�
      
      //P56=~P56;

	  led_control();	 
	  uart_receive();
	  switch(main_loop) //800us
	  {
	    case 0:
		main_loop+=1;
		//green_9=1;
		//red_9=1;
		//blue_9=1;
		mode_play();
		break;

		case 1:
		main_loop+=1;
		//led_control();
		break;

		case 2:
		main_loop+=1;
		//uart_receive();
		break;

		case 3:
		main_loop=0;
		break;

		default:
		main_loop=0;
		break;
	  }
    }
  }
}

 /**********************
 *����:uart_rx_Int()
 *����:uart �����վ�
 *����:��
 *���:��
 *�޸ļ�¼:
 **********************/
 
void uart_rx_Int(void) interrupt 9      
{
	uchar i;
	
	if(uart_start)
	{
		uart_data[uart_step]=UARTDR;
		if(uart_data[uart_step]=='#')
		{
			uart_updata=1;
			uart_start=0;
		}
		
		uart_step++;
		if(uart_step>13)
		{
			uart_start=0;
		}
	}
	else
	{
		uart_data[0]=UARTDR;
		if(uart_data[0]=='$')
		{
			uart_start=1;
			uart_step=1;
			for(i=0;i<13;i++) uart_data[i]=0;
		}
	}
} 