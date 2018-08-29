#line 1 ".\Src\mcu_config.c"
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













#line 1 ".\Src\mcu_config.c"

#line 7 ".\Src\mcu_config.c"
#line 1 ".\Include\mcu_config.h"



#line 1 ".\Include\system.h"



#line 1 "C:\Sonix\SN8_C_~1.119\C\include\sn8p2711b.h"



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
sfr	P4CON = 0xae;
sfr	VREFH = 0xaf;
sbit	FVHS0 = 0xaf:0;
sbit	FVHS1 = 0xaf:1;
sbit	FEVHENB = 0xaf:7;
sfr	ADM = 0xB1;
sbit	FADENB = 0xB1:7;
sbit	FADS = 0xB1:6;
sbit	FEOC = 0xB1:5;
sbit	FGCHS = 0xB1:4;
sbit	FCHS2 = 0xB1:2;
sbit	FCHS1 = 0xB1:1;
sbit	FCHS0 = 0xB1:0;
sfr	ADB = 0xb2;
sfr	ADR = 0xb3;
sbit	FADCKS1 = 0xb3:6;
sbit	FADCKS0 = 0xb3:4;
sbit	FADB3 = 0xb3:3;
sbit	FADB2 = 0xb3:2;
sbit	FADB1 = 0xb3:1;
sbit	FADB0 = 0xb3:0;
sfr	ADT = 0xb4;
sbit	FADTS1 = 0xb4:7;
sbit	FADTS0 = 0xb4:6;
sbit	FADT4 = 0xb4:4;
sbit	FADT3 = 0xb4:3;
sbit	FADT2 = 0xb4:2;
sbit	FADT1 = 0xb4:1;
sbit	FADT0 = 0xb4:0;
sfr	P0M = 0xb8;
sbit	FP00M = 0xb8:0;
sbit	FP01M = 0xb8:1;
sbit	FP02M = 0xb8:2;
sbit	FP03M = 0xb8:3;
sfr	PEDGE = 0xbf;
sbit	FP00G1 = 0xbf:4;
sbit	FP00G0 = 0xbf:3;
sfr	P4M = 0xc4;
sbit	FP40M = 0xc4:0;
sbit	FP41M = 0xc4:1;
sbit	FP42M = 0xc4:2;
sbit	FP43M = 0xc4:3;
sbit	FP44M = 0xc4:4;
sfr	P5M = 0xc5;
sbit	FP53M = 0xc5:3;
sbit	FP54M = 0xc5:4;
sfr	INTRQ = 0xc8;
sbit	FP00IRQ = 0xc8:0;
sbit	FP01IRQ = 0xc8:1;
sbit	FTC0IRQ = 0xc8:5;
sbit	FTC1IRQ = 0xc8:6;
sbit	FADCIRQ = 0xc8:7;
sfr	INTEN = 0xc9;
sbit	FP00IEN = 0xc9:0;
sbit	FP01IEN = 0xc9:1;
sbit	FTC0IEN = 0xc9:5;
sbit	FTC1IEN = 0xc9:6;
sbit	FADCIEN = 0xc9:7;
sfr	OSCM = 0xca;
sbit	FCPUM1 = 0xca:4;
sbit	FCPUM0 = 0xca:3;
sbit	FCLKMD = 0xca:2;
sbit	FSTPHX = 0xca:1;
sfr	WDTR = 0xcc;
sfr	PCL = 0xce;
sfr	PCH = 0xcf;
sfr	P0 = 0xd0;
sbit	FP00 = 0xd0:0;
sbit	FP01 = 0xd0:1;
sbit	FP02 = 0xd0:2;
sbit	FP03 = 0xd0:3;
sbit	FP04 = 0xd0:4;
sfr	P4 = 0xd4;
sbit	FP40 = 0xd4:0;
sbit	FP41 = 0xd4:1;
sbit	FP42 = 0xd4:2;
sbit	FP43 = 0xd4:3;
sbit	FP44 = 0xd4:4;
sfr	P5 = 0xd5;
sbit	FP53 = 0xd5:3;
sbit	FP54 = 0xd5:4;
sfr	T0M = 0xd8;
sbit	FTC0GN = 0xd8:1;
sbit	FTC0X8 = 0xd8:2;
sbit	FTC1X8 = 0xd8:3;
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
sfr	TC0R = 0xcd;
sfr	TC1M = 0xdc;
sbit	FTC1ENB = 0xdc:7;
sbit	FTC1RATE2 = 0xdc:6;
sbit	FTC1RATE1 = 0xdc:5;
sbit	FTC1RATE0 = 0xdc:4;
sbit	FTC1CKS = 0xdc:3;
sbit	FALOAD1 = 0xdc:2;
sbit	FTC1OUT = 0xdc:1;
sbit	FPWM1OUT = 0xdc:0;
sfr	TC1C = 0xdd;
sfr	TC1R = 0xde;
sfr	STKP = 0xdf;
sbit	FGIE = 0xdf:7;
sbit	FSTKPB2 = 0xdf:2;
sbit	FSTKPB1 = 0xdf:1;
sbit	FSTKPB0 = 0xdf:0;
sfr	P0UR = 0xe0;
sfr	P4UR = 0xe4;
sfr	P5UR = 0xe5;
sfr	_YZ = 0xe7;
sfr	STK3L = 0xf8;
sfr	STK3H = 0xf9;
sfr	STK2L = 0xfa;
sfr	STK2H = 0xfb;
sfr	STK1L = 0xfc;
sfr	STK1H = 0xfd;
sfr	STK0L = 0xfe;
sfr	STK0H = 0xff;





#line 5 ".\Include\system.h"

typedef	unsigned char uchar;
typedef unsigned long  uint;
typedef bit		  BitStatus;

extern uchar	sysForbidTime;

extern BitStatus sysKeyStatusFlag;
extern BitStatus sysPirStatusFlag;
extern BitStatus sysTriacInit;
extern BitStatus sysTriacFlag;
extern BitStatus forbidFlag;


#line 5 ".\Include\mcu_config.h"

void McuConfig(void);


#line 8 ".\Src\mcu_config.c"


#line 12 ".\Src\mcu_config.c"
static void GpioInit(void)
{
	P0M  = 0xeb;
	P0UR = 0X00;

	P4M   = 0xef;
	P4UR  = 0x00;
	P4CON = 0x10;
	ADM  |= 0x14;
	ADR  |= 0x50;
	FP40  = 1;
	VREFH &= 0x7f;
	VREFH |= 0x03;

	P5M  = 0xff;
	P5UR = 0x00;
	FP53 = 0;
}


#line 34 ".\Src\mcu_config.c"
static void TimerInit(void)
{
	TC0M  = 0x64;
	T0M   = 0x00;
	TC0C  = 6;
	TC0R  = 6;
	TC0M |= 0x80;
}


#line 46 ".\Src\mcu_config.c"
void McuConfig(void)
{
	GpioInit();
	TimerInit();
}
