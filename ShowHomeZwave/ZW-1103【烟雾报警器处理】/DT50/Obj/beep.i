#line 1 ".\Src\beep.c"
#line 1 "C:\Sonix\SN8_C_~1.209\C\include\SonixDef.h"



unsigned long GetRollingCode(unsigned int offset);








struct _intrinsicbitfield
{
	unsigned bit0:1;
	unsigned bit1:1;
	unsigned bit2:1;
	unsigned bit3:1;
	unsigned bit4:1;
	unsigned bit5:1;
	unsigned bit6:1;
	unsigned bit7:1;
};













#line 1 ".\Src\beep.c"
#line 1 ".\Include\beep.h"



#line 1 ".\Include\sn8p2511.h"



void _ClearWatchDogTimer(void);
void _ClrRAM(void);



sfr	R = 0x82;
sfr	Z = 0x83;
sfr	Y = 0x84;
sfr	PFLAG = 0x86;
sbit	FZ = 0x86:0;
sbit	FDC = 0x86:1;
sbit	FC = 0x86:2;
sbit	FLVD24 = 0x86:4;
sbit	FLVD36 = 0x86:5;
sbit	FNPD = 0x86:6;
sbit	FNT0 = 0x86:7;
sfr	P0M = 0xb8;
sbit	FP00M = 0xb8:0;
sfr	PEDGE = 0xbf;
sbit	FP00G1 = 0xbf:4;
sbit	FP00G0 = 0xbf:3;
sfr	P1W = 0xc0;
sfr	P1M = 0xc1;
sbit	FP10M = 0xc1:0;
sbit	FP12M = 0xc1:2;
sbit	FP13M = 0xc1:3;
sfr	P2M = 0xc2;
sbit	FP20M = 0xc2:0;
sbit	FP21M = 0xc2:1;
sbit	FP22M = 0xc2:2;
sbit	FP23M = 0xc2:3;
sbit	FP24M = 0xc2:4;
sbit	FP25M = 0xc2:5;
sfr	P5M = 0xc5;
sbit	FP54M = 0xc5:4;
sfr	INTRQ = 0xc8;
sbit	FP00IRQ = 0xc8:0;
sbit	FT0IRQ = 0xc8:4;
sbit	FTC0IRQ = 0xc8:5;
sfr	INTEN = 0xc9;
sbit	FP00IEN = 0xc9:0;
sbit	FT0IEN = 0xc9:4;
sbit	FTC0IEN = 0xc9:5;
sfr	OSCM = 0xca;
sbit	FCPUM1 = 0xca:4;
sbit	FCPUM0 = 0xca:3;
sbit	FCLKMD = 0xca:2;
sbit	FSTPHX = 0xca:1;
sfr	WDTR = 0xcc;
sfr	TC0R = 0xcd;
sfr	PCL = 0xce;
sfr	PCH = 0xcf;
sfr	P0 = 0xd0;
sbit	FP00 = 0xd0:0;
sfr	P1 = 0xd1;
sbit	FP10 = 0xd1:0;
sbit	FP11 = 0xd1:1;
sbit	FP12 = 0xd1:2;
sbit	FP13 = 0xd1:3;
sfr	P2 = 0xd2;
sbit	FP20 = 0xd2:0;
sbit	FP21 = 0xd2:1;
sbit	FP22 = 0xd2:2;
sbit	FP23 = 0xd2:3;
sbit	FP24 = 0xd2:4;
sbit	FP25 = 0xd2:5;
sfr	P5 = 0xd5;
sbit	FP54 = 0xd5:4;
sfr	T0M = 0xd8;
sbit	FT0TB = 0xd8:0;
sbit	FT0RATE0 = 0xd8:4;
sbit	FT0RATE1 = 0xd8:5;
sbit	FT0RATE2 = 0xd8:6;
sbit	FT0ENB = 0xd8:7;
sfr	T0C = 0xd9;
sfr	TC0M = 0xda;
sbit	FTC0ENB = 0xda:7;
sbit	FTC0RATE2 = 0xda:6;
sbit	FTC0RATE1 = 0xda:5;
sbit	FTC0RATE0 = 0xda:4;
sbit	FTC0CKS = 0xda:3;
sbit	FALOAD0 = 0xda:2;
sbit	FTC0OUT = 0xda:1;
sbit	FPWM0OUT = 0xda:0;
sfr	TC0C = 0xdb;
sfr	STKP = 0xdf;
sbit	FGIE = 0xdf:7;
sbit	FSTKPB1 = 0xdf:1;
sbit	FSTKPB0 = 0xdf:0;
sfr	P0UR = 0xe0;
sbit	FP00R = 0xe0:0;
sfr	P1UR = 0xe1;
sbit	FP10R = 0xe1:0;
sbit	FP12R = 0xe1:2;
sbit	FP13R = 0xe1:3;
sfr	P2UR = 0xe2;
sbit	FP20R = 0xe2:0;
sbit	FP21R = 0xe2:1;
sbit	FP22R = 0xe2:2;
sbit	FP23R = 0xe2:3;
sbit	FP24R = 0xe2:4;
sbit	FP25R = 0xe2:5;
sfr	P5UR = 0xe5;
sbit	FP54R = 0xe5:4;
sfr	_YZ = 0xe7;
sfr	P1OC = 0xe9;
sfr	STK3L = 0xf8;
sfr	STK3H = 0xf9;
sfr	STK2L = 0xfa;
sfr	STK2H = 0xfb;
sfr	STK1L = 0xfc;
sfr	STK1H = 0xfd;
sfr	STK0L = 0xfe;
sfr	STK0H = 0xff;





#line 5 ".\Include\beep.h"
#line 1 ".\Include\key.h"


#line 1 ".\Include\sn8p2511.h"


























































































































#line 4 ".\Include\key.h"


extern bit power_save_enable;
extern bit beepInitFlag;
extern bit delayInitFlag;
extern bit beepActiveFlag;
extern bit timeDelayFlag;




void key_scan(void);

#line 6 ".\Include\beep.h"

void BeepPulseControl(void);

extern bit out_enable;
extern bit power_save_enable;
extern bit flagKeyTrigger;
extern bit flagProtect;
extern bit flagProtectOn;
extern bit flagProtectOff;
extern bit flagWarningInit;




#line 2 ".\Src\beep.c"

 unsigned char beepCnt1;
 unsigned char beepCnt2;
 unsigned char beepCnt3;
 unsigned char beepCnt4;
 unsigned char pulseCnt1;
 unsigned char pulseCnt2;
 unsigned char pulseCnt3;
 unsigned char timeDelay1;
 unsigned char timeDelay2;
 unsigned char timeDelay3;

bit beepInitFlag;
bit delayInitFlag;
bit beepActiveFlag;
bit pulseActiveFlag;
bit timeDelayFlag;


#line 23 ".\Src\beep.c"
static bit PulseOutput(void)
{
	if (FP12 == 0)
		out_enable = 1;

 FP12 = 1;
	pulseCnt1++;

	if (pulseCnt1 > 189)
	{
		pulseCnt1 = 0;
		pulseCnt2++;
		if (pulseCnt2 > 39)
		{
			pulseCnt2 = 0;
			pulseCnt3++;
			if (pulseCnt3 > 9)
			{
				pulseCnt3 = 0;
 FP12 = 0;
				out_enable = 1;
				return 1;
			}
		}
	}

	return 0;
}


#line 55 ".\Src\beep.c"
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

#line 89 ".\Src\beep.c"
static bit BeepSound(unsigned char soundCnt,unsigned char soundLastTime)
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


	if (beepCnt3 < soundLastTime )
 FP13 ^= 1;
	else
 FP13 = 0;


	if (beepCnt1 > 151)
	{
		beepCnt1 = 0;
		beepCnt2++;
		if (beepCnt2 > 2)
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


#line 138 ".\Src\beep.c"
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
 FP12 = 0;
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
 FP12 = 0;
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
