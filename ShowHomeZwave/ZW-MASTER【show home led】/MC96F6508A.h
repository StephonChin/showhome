//========================================================== 
//	
//	MC96F6508A  Special Function Register assignment
//	
//========================================================== 

//////////////////////////////////////////////////////////////////////////
// ==================================================================== //
// PORT Control Register:                                               //
// ==================================================================== //
//////////////////////////////////////////////////////////////////////////
// PORT0

sfr     P0       = 0x80;       // P0 Data Register

	sbit    P00 	=       0x80;
	sbit    P01	  	=       0x81;
	sbit    P02	  	=       0x82;
	sbit    P03 	=       0x83;


sfr     SP  	= 0x81;
sfr		DPL		= 0x82;
sfr		DPH		= 0x83;
sfr     DPL1    = 0x84;
sfr		DPH1	= 0x85;
sfr		RSTFR	= 0x86;
sfr		PCON 	= 0x87;
//----------------------------------------------------  //0x88

sfr     P1       = 0x88;       // P1 Data Register

	sbit    P10 	=       0x88;
	sbit    P11	  	=       0x89;
	sbit    P12	  	=       0x8A;
	sbit    P13 	=       0x8B;
	sbit    P14	  	=       0x8C;
	sbit    P15	  	=       0x8D;
	sbit    P16	  	=       0x8E;
	sbit    P17	  	=       0x8F;
sfr     P0IO  	= 0x89;
sfr		SCCR	= 0x8A;
sfr		BITCR	= 0x8B;
sfr     BITCNT  = 0x8C;
sfr		WDTCR	= 0x8D;
sfr		WDTDR	= 0x8E;
sfr		WDTCNT	= 0x8E;
sfr		BUZDR	= 0x8F;

//-----------------------------------------------------//0x90

sfr     P2       = 0x90;       // P2 Data Register

	sbit    P20 	=       0x90;
	sbit    P21	  	=       0x91;
	sbit    P22	  	=       0x92;
	sbit    P23 	=       0x93;
	sbit    P24	  	=       0x94;
	sbit    P25	  	=       0x95;
	sbit    P26	  	=       0x96;
	sbit    P27	  	=       0x97;
sfr     P1IO  	= 0x91;
sfr		P0OD	= 0x92;
sfr		P1OD	= 0x93;
sfr     P2OD  	= 0x94;
sfr		P3OD	= 0x95;
sfr		P4OD	= 0x96;
sfr		BUZCR	= 0x97;

//---------------------------------------------------//0x98

sfr     P3       = 0x98;       // P3 Data Register

	sbit    P30 	=       0x98;
	sbit    P31	  	=       0x99;
	sbit    P32	  	=       0x9A;
	sbit    P33 	=       0x9B;
	sbit    P34	  	=       0x9C;
	sbit    P35	  	=       0x9D;
	sbit    P36	  	=       0x9E;
	sbit    P37	  	=       0x9F;
sfr     P2IO  	= 0x99;
sfr		P5OD	= 0x9A;
sfr		P6OD	= 0x9B;
sfr     WTCR  	= 0x9E;
sfr		WTDR	= 0x9F;
sfr		WTCNT	= 0x9F;

//------------------------------------------------//0xA0
sfr     P4       = 0xA0;       // P4 Data Register

	sbit    P40 	=       0xA0;
	sbit    P41	  	=       0xA1;
	sbit    P42	  	=       0xA2;
	sbit    P43 	=       0xA3;
	sbit    P44	  	=       0xA4;
	sbit    P45	  	=       0xA5;
	sbit    P46	  	=       0xA6;
	sbit    P47	  	=       0xA7;
sfr     P3IO  	= 0xA1;
sfr		EO		= 0xA2;
sfr		EIFLAG	= 0xA4;
sfr     EIPOL	= 0xA5;

//------------------------------------------------//0xA8
sfr     IE  	= 0xA8;
sfr		IE1		= 0xA9;
sfr		IE2	= 0xAA;
sfr     IE3	= 0xAB;	
sfr		KPOL0	= 0xAE;
sfr     KPOL1	= 0xAF;
//------------------------------------------------//0xB0
sfr     P5       = 0xB0;       // P5 Data Register

	sbit    P50 	=       0xB0;
	sbit    P51	  	=       0xB1;
	sbit    P52	  	=       0xB2;
	sbit    P53 	=       0xB3;
	sbit    P54	  	=       0xB4;
	sbit    P55	  	=       0xB5;
	sbit    P56	  	=       0xB6;
	sbit    P57	  	=       0xB7;
sfr     P4IO  	= 0xB1;
sfr		T0CR	= 0xB2;
sfr		T0CNT	= 0xB3;
sfr     T0DR	= 0xB4;	
sfr		T0CDR	= 0xB4;
sfr		SIOCR	= 0xB5;
sfr     SIODR	= 0xB6;	
sfr     SIOPS	= 0xB7;

//-------------------------------------------------//0xB8
sfr     IP	= 0xB8;

sfr     P5IO  	= 0xB9;
sfr		T2CR	= 0xBA;
sfr		T2CNT	= 0xBC;
sfr     T2DR	= 0xBE;	
sfr		T2CDR	= 0xBE;
//------------------------------------------------//0xC0
sfr     P6       = 0xC0;       // P6 Data Register

	sbit    P60 	=       0xC0;
	sbit    P61	  	=       0xC1;
	sbit    P62	  	=       0xC2;
	sbit    P63 	=       0xC3;
	sbit    P64	  	=       0xC4;
	
sfr     P6IO  	= 0xC1;
sfr		T3CR	= 0xC2;
sfr		TIFR	= 0xC3;
sfr		T3CNT	= 0xC4;
sfr     T3DR	= 0xC6;	
sfr		T3CDR	= 0xC6;

//------------------------------------------------//0xC8
sfr		T1CR	= 0xCA;
sfr		T1CNT	= 0xCB;
sfr     T1DRL	= 0xCC;	
sfr		T1DRH	= 0xCD;
sfr		T1CDR	= 0xCD;
sfr		CARCR	= 0xCE;

//----------------------------------------------//0xD0
sfr		PSW		= 0xD0;
sfr		P0PU	= 0xD4;
sfr     P1PU	= 0xD5;	
sfr		P2PU	= 0xD6;
sfr		P3PU	= 0xD7;

//-----------------------------------------------//0xD8
sfr		LVRCR	= 0xD8;
sfr		OSCCR	= 0xD9;
sfr		P4PU	= 0xDA;
sfr     P5PU	= 0xDB;	
sfr		P6PU	= 0xDC;
//----------------------------------------------//0xE0
sfr     ACC		= 0xE0;	
sfr		LVICR	= 0xE1;
sfr		UARTCR1	= 0xE2;
sfr		UARTCR2	= 0xE3;
sfr		UARTCR3	= 0xE4;
sfr     UARTST	= 0xE5;	
sfr		UARTBD	= 0xE6;
sfr		UARTDR	= 0xE7;
//----------------------------------------------//0xE8
sfr		KFLAG	= 0xE8;

sbit 		KFLAG0	= 0xE8;
sbit 		KFLAG1	= 0xE9;
sbit 		KFLAG2	= 0xEA;
sbit 		KFLAG3	= 0xEB;
sbit 		KFLAG4	= 0xEC;
sbit 		KFLAG5	= 0xED;
sbit 		KFLAG6	= 0xEE;
sbit 		KFLAG7	= 0xEF;

//------------------------------------------------//0xE9
sfr     P0DB	= 0xE9;	
sfr		P1DB	= 0xEA;
sfr		LCDCRL	= 0xEB;
sfr		LCDCRH	= 0xEC;
sfr		P0FSR	= 0xED;
sfr     P2FSR	= 0xEE;	
sfr     P3FSR	= 0xEF;

//------------------------------------------------//0xF0
sfr		B	= 0xF0;
sfr		P4FSR	= 0xF1;
sfr		P5FSRL	= 0xF2;
sfr		P5FSRH	= 0xF3;
sfr		P6FSR	= 0xF4;
sfr		LCDCCR	= 0xF5;
//-----------------------------------------------//0xF8
sfr		IP1	= 0xF8;

sfr		FSADRH	= 0xFA;
sfr		FSADRM	= 0xFB;
sfr		FSADRL	= 0xFC;
sfr		FIDR	= 0xFD;
sfr		FMCR	= 0xFE;
sfr		PLLCR	= 0xFF;
//-----------------------------------------------
//   end of MC96F6508A.h 
