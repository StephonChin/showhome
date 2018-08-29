#include "beep.h"

uchar warningCnt1;
uchar warningCnt2;
uchar warningCnt3;

/*----------------------------------------------------------
 * FunctionName: BeepPulseControl
 * Describe: when press the key, beep louder & pulse high for 10s
 */
void BeepPulseControl(void)
{
	static uchar keyOnCnt = 0;
	if (flagKeyTrigger)
	{
		power_save_enable = 1;

		if (flagWarningInit)
		{
			flagWarningInit = 0;
			pulsePort = 1;
			warningCnt1    = 0;
			warningCnt2    = 0;
			warningCnt3    = 0;
		}
		
		if (keyOnCnt == 0)
			out_enable = 1;

		keyOnCnt++;
		if (keyOnCnt > 250) keyOnCnt = 1;
		warningCnt1++;		

		if (warningCnt1 > 199) //20ms
		{
			warningCnt1 = 0;
			warningCnt2++;
			
			if (warningCnt2 > 49) //1s
			{
				warningCnt2 = 0;
				warningCnt3++;

				if (warningCnt3 > 9) //10s
				{
					warningCnt3 = 0;
					pulsePort  = 0;
					flagKeyTrigger = 0;
					keyOnCnt = 0;
					out_enable = 1;
				}
			}	
		}
	}
	else
	{
		pulsePort = 0;

		warningCnt1    = 0;
		warningCnt2    = 0;
		warningCnt3    = 0;
		flagKeyTrigger = 0;
	}
}