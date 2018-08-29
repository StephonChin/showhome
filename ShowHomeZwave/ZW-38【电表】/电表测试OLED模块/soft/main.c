/* MAIN.C file
 * 
 * Copyright (c) 2002-2005 STMicroelectronics
 */
#include "main.h"

u8t timeCnt1;
u8t timeCnt2;
FlagStatus refreshFlag;
void main(void)
{
	ClkConfig();
	GpioConfig();
	UartConfig();
	TimerConfig();
	LedDisplayChs();
	
	while (1)
	{
		if (refreshFlag)
		{
			refreshFlag = 0;
			TIM4_CR1 &= 0xFE;
			RespondStr("$W");
			while(!flagCmdStart);
			DataGet();
			LedDisplay(1);
			
			RespondStr((u8t *)"$V");
			while(!flagCmdStart);
			DataGet();
			LedDisplay(2);
			
			RespondStr("$A");
			while(!flagCmdStart);
			DataGet();
			LedDisplay(3);
			
			RespondStr("$KW");
			while(!flagCmdStart);
			DataGet();
			LedDisplay(4);
			
			RespondStr("$KV");
			while(!flagCmdStart);
			DataGet();
			LedDisplay(5);
			
			RespondStr("$F");
			while(!flagCmdStart);
			DataGet();
			LedDisplay(6);
			
			RespondStr("$D");
			while(!flagCmdStart);
			DataGet();
			LedDisplay(7);
			
			TIM4_CR1 |= 0x01;
		}
	}
}


@far @interrupt void Timer4Interrupt(void)
{
	TIM4_SR &= 0xFE;
	
	timeCnt1++;
	if (timeCnt1 > 249) //200*250=50ms
	{
		timeCnt1 = 0;
		timeCnt2++;
		
		if (timeCnt2 > 149)
		{
			timeCnt2 = 0;
			refreshFlag = 1;
		}
	}
	
}