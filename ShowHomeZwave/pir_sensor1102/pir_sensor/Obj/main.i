#line 1 ".\Src\main.c"
#line 1 "D:\ËÉº²·Â~1\C\include\SonixDef.h"



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
#line 1 "D:\ËÉº²·Â~1\C\include\sn8p2511.h"



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





#line 7 ".\Src\main.c"



 unsigned char sleep_delay_1;
 unsigned char sleep_delay_2;
 unsigned char sleep_delay_3;

 unsigned char out_delay;


bit int_wave_up;
bit open_trigger;
bit on_trigger;
bit out_finish;
bit int_trigger;
bit out_enable;







void gpio_init(void)
{
  P0M=0x00;

  INTRQ=0x00;
  INTEN=0x01;
  PEDGE=0x08;
  FGIE=1;

  P1M=0xfe;
  P1UR=0x01;
  P1=0x00;
  P1W=0x01;

  P2M=0xff;
  P2=0x00;

  P5M=0xff;
  P5=0x10;
}


void time_init(void)
{
  TC0C=156;
  TC0R=156;
  TC0M=0xf4;
}


void main(void)
{
  OSCM=0x06;
  gpio_init();
  time_init();

  while(1)
  {
    if(FTC0IRQ)
	{
	  FTC0IRQ=0;



      if(FP10)
	  {
	    if((open_trigger==0)&&(out_finish==0))
		{
		  open_trigger=1;
		  on_trigger=0;
		  out_finish=1;
		  out_enable=1;
 FP54 =0;
 FP12 =0;
		  out_delay=0;
		}
	  }
	  else
      {
	    if((on_trigger==0)&&(out_finish==0))
		{
		  on_trigger=1;
		  open_trigger=0;
		  out_finish=1;
 FP54 =0;
		  out_delay=0;
		  int_wave_up=0;
 FP12 =0;
		  out_enable=1;
		  sleep_delay_3=0;
		}
		else
		{
		  if(out_finish==0)
		  {
		    if(int_wave_up)
			{
			  int_trigger=1;
			}
		  }
		}
      }

	  if(out_enable)
	  {
	    out_delay+=1;
		if(out_delay>2)
		{
		  out_delay=0;
 FP54 =1;
		  out_finish=0;
		  out_enable=0;

		   FCPUM1=0;
	       FCPUM0=1;
		   FCLKMD=1;
		   FSTPHX=1;
		}
	  }
	  else if(int_trigger==1)
	  {
		sleep_delay_1+=1;
		if(sleep_delay_1>4)
		{
		  sleep_delay_1=0;
		  sleep_delay_2+=1;
		  if(sleep_delay_2>24)
		  {
 FP12 =0;
		    sleep_delay_2=0;
			sleep_delay_3=6;
		  }
		}

		sleep_delay_3+=1;
		if(sleep_delay_3>6)
		{
		  if(sleep_delay_3==8)
		  {
		   FGIE=0;
 FP54 =0;
		   out_finish=1;
		  }

		  if(sleep_delay_3==9)
		  {
 FP54 =1;
			out_finish=0;
           }
		   if(sleep_delay_3>113)
		   {
			  int_wave_up=0;
			  int_trigger=0;
			  sleep_delay_3=0;
			  FP00IRQ=0;
			  FGIE=1;
		      FCPUM1=0;
	      	  FCPUM0=1;
		   	  FCLKMD=1;
		      FSTPHX=1;
		  }
		}
		else
		{
		  if(sleep_delay_3>4) sleep_delay_3=4;
		  else
		  {
            if(sleep_delay_3>3)
			{
 FP54 =1;
		      out_finish=0;
			}
			else
			{
			  if(sleep_delay_3>1)
		      {
 FP54 =0;
		       out_finish=1;
		      }
		    }
          }
		}
	  }
    }
  }
}


#line 200 ".\Src\main.c"
void __interrupt[0x08] interrupt_isr(void)
{
  if(FP00IRQ)
  {
    int_wave_up=1;
 FP12 =1;
	sleep_delay_1=0;
	sleep_delay_2=0;
  }
  FP00IRQ=0;
}
