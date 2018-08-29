#include "beep.h"

uchar beepCnt1;
uchar beepCnt2;
uchar beepCnt3;
uchar beepCnt4;
uchar pulseCnt1;
uchar pulseCnt2;
uchar pulseCnt3;
uchar timeDelay1;
uchar timeDelay2;
uchar timeDelay3;

bit beepInitFlag;
bit delayInitFlag;
bit beepActiveFlag;
bit pulseActiveFlag;
bit timeDelayFlag;

/*----------------------------------------------------------
 * FunctionName: PulseOutput
 */
static bit PulseOutput(void)
{
	if (pulsePort == 0)
		out_enable = 1;

	pulsePort = 1;
	pulseCnt1++;
	
	if (pulseCnt1 > 189)//25ms
	{
		pulseCnt1 = 0;
		pulseCnt2++;
		if (pulseCnt2 > 39) //1s
		{
			pulseCnt2 = 0;
			pulseCnt3++;
			if (pulseCnt3 > 9)//10s
			{
				pulseCnt3 = 0;
				pulsePort = 0;
				out_enable = 1;
				return 1;
			}
		}
	}

	return 0;
}

/*---------------------------------------------------------
 * FunctionName: TimeDelay10s
 */
static bit TimeDelay10s(void)
{
	if (delayInitFlag)
	{
		delayInitFlag = 0;
		timeDelayFlag = 0;
		timeDelay1 = 0;
		timeDelay2 = 0;
		timeDelay3 = 0;
	}
	timeDelay1++;
	if (timeDelay1 > 189)
	{
		timeDelay1 = 0;
		timeDelay2++;
		if (timeDelay2 > 39)
		{
			timeDelay2 = 0;
			timeDelay3++;
			if (timeDelay3 > 9)
			{
				timeDelay3 = 0;
				return 1;
			}
		}
	}

	return 0;
}
/*----------------------------------------------------------
 * FunctionName: BeepSound
 * Parameters: soundCnt---> buzzer on times
 			   soundLastTime---> buzzer on time
 */
static bit BeepSound(uchar soundCnt, uchar soundLastTime)
{
	if (beepInitFlag)
	{
		beepInitFlag = 0;
		beepCnt1 = 0;
		beepCnt2 = 0;
		beepCnt3 = 0;
		beepCnt4 = 0;
		beepActiveFlag = 0;
	}
	beepCnt1++;

	//beep sound control
	if (beepCnt3 < soundLastTime )
			beepPort ^= 1;
	else
			beepPort = 0;


	if (beepCnt1 > 151) //20ms
	{
		beepCnt1 = 0;
		beepCnt2++;		
		if (beepCnt2 > 2) //60ms
		{
			beepCnt2 = 0;
			beepCnt3++;
			if (beepCnt3 > (soundLastTime * 2))
			{
				beepCnt3 = 0;
				beepCnt4++;
				if (beepCnt4 == soundCnt )
				{
					beepCnt4 = 0;

					return 1;
				}
			}
		}
	}

	return 0;
}

/*----------------------------------------------------------
 * FunctionName: BeepPulseControl
 * Describe: when press the key, beep louder & pulse high for 10s
 */
void BeepPulseControl(void)
{
	if (flagWarningInit)
	{
		flagWarningInit = 0;
		pulseActiveFlag = 0;
		pulseCnt1 = 0;
		pulseCnt2 = 0;
		pulseCnt3 = 0;
	}

	if (flagProtect)
	{
		if (flagProtectOn)
		{
			power_save_enable = 1 ;
			pulsePort = 0;
			if (!beepActiveFlag)
				beepActiveFlag = BeepSound(1, 12);
			else
			{
				flagProtectOn  = 0;
				beepActiveFlag = 0;
			}
		}
		else if (flagKeyTrigger)
		{
			power_save_enable = 1 ;
			if (!beepActiveFlag)
				beepActiveFlag = BeepSound(5, 7);
			else
			{
				if (!timeDelayFlag)
					timeDelayFlag = TimeDelay10s();
				else
				{
					timeDelayFlag  = 0;
					beepActiveFlag = 0;
				}
			}

			if (!pulseActiveFlag)
				pulseActiveFlag = PulseOutput();
			else
			{
				if (beepActiveFlag)
				{
					beepActiveFlag  = 0;
					pulseActiveFlag = 0;
					flagKeyTrigger  = 0;
					timeDelay1 = 0;
					timeDelay2 = 0;
					timeDelay3 = 0;
				}
			}
		}

	}
	else
	{
		if (flagProtectOff)
		{
			power_save_enable = 1 ;
			pulsePort = 0;
			if (!beepActiveFlag)
				beepActiveFlag = BeepSound(2, 10);
			else
			{
				if (!timeDelayFlag)
					timeDelayFlag = TimeDelay10s();
				else
				{
					timeDelayFlag  = 0;
					beepActiveFlag = 0;
				}
			}
		}
	}
}