/**************************************
 * FileName: mcu_initialize.h
 * Describe: initialize the GPIO timer
 *************************************/

#include "system.h"

/*-------------------------------------
 * FunctionName: GpioInit()
 */
void GpioInit(void)
{
	FP22M = 0;
	FP54M = 0;

	FP00M = 0;
	FP10M = 1;
	P1OC  = 1;
	
	FP10 = 1;
}

/*------------------------------------
 * FunctionName: TimerInit/interrupt initialize
 */
void TimerInit(void)
{
	TC0M = 0x64;	//f = 1/64
	TC0C = 16;		//T = 20 * 64 = 1ms
	TC0R = 16;

	FGIE = 0;
	FP00IRQ = 0;
	FP00G1 = 0;
	FP00G0 = 1;
	FP00IEN = 1;
	FGIE = 1;
}