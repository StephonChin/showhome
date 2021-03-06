#line 1 ".\Src\main.c"
#line 1 "C:\Sonix\SN8_C_~1.119\C\include\SonixDef.h"



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













#line 1 ".\Src\main.c"

#line 6 ".\Src\main.c"
#line 1 ".\Include\system.h"



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





#line 5 ".\Include\system.h"


typedef  unsigned char u8t;
typedef  unsigned int u16t;
typedef enum{FALSE = 0, TRUE = !FALSE}  FlagStatus;







void GpioInit(void);
void TimerInit(void);
void Delay5s(void);
FlagStatus SingleJudge(void);
void rfOnPulse(void);
void rfOffPulse(void);
void waveOffPulse(void);


#line 7 ".\Src\main.c"

void main(void)
{
	FlagStatus flagSingle = 0;
	GpioInit();
	TimerInit();

	while(1)
	{
		while (!flagSingle)
		{
			flagSingle = SingleJudge();
		}

		rfOnPulse();

		Delay5s();

		rfOffPulse();

		waveOffPulse();

		flagSingle = 0;
	}
}


#line 36 ".\Src\main.c"
void Delay5s(void)
{
	u8t catNum1 = 0;
	u8t catNum2 = 0;

	FTC0ENB = 1;
	while (catNum2 < 200)
	{
		if (FTC0IRQ == 1)
		{
			FTC0IRQ = 0;
			catNum1++;
			if (catNum1 > 30)
			{
				catNum1 = 0;
				catNum2++;
			}
		}
	}
	FTC0ENB = 0;
}

#line 60 ".\Src\main.c"
FlagStatus SingleJudge(void)
{
	u8t catNum = 0;

	while (FP24);
	FTC0ENB = 1;
	while (catNum < 30)
	{
		if (FTC0IRQ)
		{
			catNum++;
			FTC0IRQ = 0;
		}
	}
	FTC0ENB = 0;

	if (FP24)
		 return 1;
	else
		 return 0;
}


#line 85 ".\Src\main.c"
void rfOnPulse(void)
{
	u8t catNum = 0;
	FP22 = 1;
	FTC0ENB = 1;
	while (catNum < 200)
	{
		if (FTC0IRQ)
		{
			catNum++;
			FTC0IRQ = 0;
		}
	}
	FP22 = 0;
	FTC0ENB = 0;
}


#line 105 ".\Src\main.c"
void rfOffPulse(void)
{
	u8t catNum = 0;
	FP54 = 1;
	FTC0ENB = 1;
	while (catNum < 200)
	{
		if (FTC0IRQ)
		{
			catNum++;
			FTC0IRQ = 0;
		}
	}
	FP54 = 0;
	FTC0ENB = 0;
}


#line 125 ".\Src\main.c"
void waveOffPulse(void)
{
	u8t catNum = 0;
	FP23 = 0;
	FTC0ENB = 1;
	while (catNum < 100)
	{
		if (FTC0IRQ)
		{
			catNum++;
			FTC0IRQ = 0;
		}
	}
	FP23 = 1;
	FTC0ENB = 0;
}
