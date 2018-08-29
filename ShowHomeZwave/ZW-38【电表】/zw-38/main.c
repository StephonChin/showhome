/* MAIN.C file
 * 
 * Copyright (c) 2002-2005 STMicroelectronics
 */
#include "stm8s003f3.h"
#include "main.h"
#include "type.h"
extern u8 bstate;
extern u8 rate_choice;
main()
{
	uchar s,j;
	
	clk_config();
	gpio_config();
	eeprom_init();
	uart_Config();
	timr4_config();
	rate_choice=1;

	//timr2_config();
	//spi_config();
	ade7753_config();
	
	for(s=0;s<250;s++)
	 for(j=0;j<250;j++);
	
	while(1)
	{
		 meter_get();
		 //meter_rate_get();
		
		uart_tx();
	  //vrms_get ();
		//for(Rrms=0;Rrms<666;Rrms++);
	}
}