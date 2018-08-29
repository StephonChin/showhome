/****************************************************
 * AD_Init
 */
#include "iostm8s003f3.h"
#include "system.h"
#include "ad_scan.h"

/****************************************************
 * defines
 */
#define				ZERO_DETECT 				PD_IDR_IDR4
#define				BT_CONTROL					PB_ODR_ODR4
 
/****************************************************
 * variables
 */



/****************************************************
 * FunctionName: BT_Control
 * Date: 2016.04.36
 */
void BT_Control(void)
{
  static _Flag			ControlInitFlag;
	static _Uchar			InitTime;
	static _Uchar			LowPulseTime;
	static _Uchar			PowerOffFlag;
  
	/* ÉÏµçÑÓ³Ù */
  if (ControlInitFlag)
	{
		BT_CONTROL	= 1;
		InitTime++;
		if (InitTime > 100)
		{
			InitTime 				= 0;
			ControlInitFlag = FALSE;
		}
	}
	
	
	else
	{
		LowPulseTime++;
		if (ZERO_DETECT == 1)
		{
			LowPulseTime = 0;
			PowerOffFlag = FALSE;
		}
		
		if (LowPulseTime > 2)
		{
			PowerOffFlag = TRUE;
		}
		
		if (PowerOffFlag)
		{
			BT_CONTROL ^= 1;
		}
	}
}