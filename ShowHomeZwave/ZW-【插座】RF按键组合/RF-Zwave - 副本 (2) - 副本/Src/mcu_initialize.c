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
	FP22M = 1;
	FP23M = 1;
	FP54M = 1;
	FP24M = 0;
	

	P2UR = 0x10;
	FP22 = 0;
	FP23 = 1;	
	FP54 = 0;
}

/*------------------------------------
 * FunctionName: TimerInit
 */
void TimerInit(void)
{
	TC0M = 0x64;	//f = 1/64
	TC0C = 15;		//T = 15 * 64 = 1ms
	TC0R = 15;
}