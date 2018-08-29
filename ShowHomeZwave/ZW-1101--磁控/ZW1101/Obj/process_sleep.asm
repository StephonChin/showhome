
;----------------------------------------------------
;  Copyright (c) 2003-2013 SONiX Technology Co., Ltd.
;  Sonix SN8 C Compiler - V2.01
;----------------------------------------------------

CHIP SN8P2501D

INCLUDE <sncc_macros.h>
EXTERN DATA T
EXTERN DATA I
.CODE
.stabs "lcc4_compiled.",0x3C,0,0,0
.stabs "F:\¹Ì°îÏîÄ¿\project\ZW-1101--´Å¿Ø\ZW1101/",0x64,0,3,Ltext0
.stabs ".\Src\process_sleep.c",0x64,0,3,Ltext0
Ltext0:
.stabs "int:t1=r1;-128;127;",128,0,0,0
.stabs "char:t2=r2;-128;127;",128,0,0,0
.stabs "double:t3=r1;4;0;",128,0,0,0
.stabs "float:t4=r1;4;0;",128,0,0,0
.stabs "long double:t5=r1;4;0;",128,0,0,0
.stabs "long int:t6=r1;-32768;32767;",128,0,0,0
.stabs "long long int:t7=r1;-2147483648;2147483647;",128,0,0,0
.stabs "signed char:t8=r1;-128;127;",128,0,0,0
.stabs "unsigned char:t9=r1;0;255;",128,0,0,0
.stabs "unsigned long:t10=r1;0;65535;",128,0,0,0
.stabs "unsigned long long:t11=r1;0;4294967295;",128,0,0,0
.stabs "unsigned int:t12=r1;0;255;",128,0,0,0
.stabs "void:t13=13",128,0,0,0
.stabs "bit:t14",128,0,0,0
.stabs ":t300=L16:0",128,0,0,0
.stabs ":t301=L16:1",128,0,0,0
.stabs ":t302=L16:2",128,0,0,0
.stabs ":t303=L16:3",128,0,0,0
.stabs ":t304=L16:4",128,0,0,0
.stabs ":t305=L16:5",128,0,0,0
.stabs ":t306=L16:6",128,0,0,0
.stabs ":t307=L16:7",128,0,0,0
.stabs ":t308=ar1;0;9;1",128,0,0,0

;---------------Begin emit user code-----------------

PUBLIC _SleepMode
EXTERN DATA _sleepFlag

_Function_SleepMode_data SEGMENT DATA INBANK

.stabs "R:G12",32,0,0,0x82
.stabs "Z:G12",32,0,0,0x83
.stabs "Y:G12",32,0,0,0x84
.stabs "PFLAG:G12",32,0,0,0x86
.stabs "FZ:G300",32,0,0,0x86
.stabs "FDC:G301",32,0,0,0x86
.stabs "FC:G302",32,0,0,0x86
.stabs "FLVD24:G304",32,0,0,0x86
.stabs "FLVD36:G305",32,0,0,0x86
.stabs "FNPD:G306",32,0,0,0x86
.stabs "FNT0:G307",32,0,0,0x86
.stabs "P0M:G12",32,0,0,0xB8
.stabs "FP00M:G300",32,0,0,0xB8
.stabs "PEDGE:G12",32,0,0,0xBF
.stabs "FP00G1:G304",32,0,0,0xBF
.stabs "FP00G0:G303",32,0,0,0xBF
.stabs "P1W:G12",32,0,0,0xC0
.stabs "P1M:G12",32,0,0,0xC1
.stabs "FP10M:G300",32,0,0,0xC1
.stabs "FP12M:G302",32,0,0,0xC1
.stabs "FP13M:G303",32,0,0,0xC1
.stabs "P2M:G12",32,0,0,0xC2
.stabs "FP20M:G300",32,0,0,0xC2
.stabs "FP21M:G301",32,0,0,0xC2
.stabs "FP22M:G302",32,0,0,0xC2
.stabs "FP23M:G303",32,0,0,0xC2
.stabs "FP24M:G304",32,0,0,0xC2
.stabs "FP25M:G305",32,0,0,0xC2
.stabs "P5M:G12",32,0,0,0xC5
.stabs "FP54M:G304",32,0,0,0xC5
.stabs "INTRQ:G12",32,0,0,0xC8
.stabs "FP00IRQ:G300",32,0,0,0xC8
.stabs "FT0IRQ:G304",32,0,0,0xC8
.stabs "FTC0IRQ:G305",32,0,0,0xC8
.stabs "INTEN:G12",32,0,0,0xC9
.stabs "FP00IEN:G300",32,0,0,0xC9
.stabs "FT0IEN:G304",32,0,0,0xC9
.stabs "FTC0IEN:G305",32,0,0,0xC9
.stabs "OSCM:G12",32,0,0,0xCA
.stabs "FCPUM1:G304",32,0,0,0xCA
.stabs "FCPUM0:G303",32,0,0,0xCA
.stabs "FCLKMD:G302",32,0,0,0xCA
.stabs "FSTPHX:G301",32,0,0,0xCA
.stabs "WDTR:G12",32,0,0,0xCC
.stabs "TC0R:G12",32,0,0,0xCD
.stabs "PCL:G12",32,0,0,0xCE
.stabs "PCH:G12",32,0,0,0xCF
.stabs "P0:G12",32,0,0,0xD0
.stabs "FP00:G300",32,0,0,0xD0
.stabs "P1:G12",32,0,0,0xD1
.stabs "FP10:G300",32,0,0,0xD1
.stabs "FP11:G301",32,0,0,0xD1
.stabs "FP12:G302",32,0,0,0xD1
.stabs "FP13:G303",32,0,0,0xD1
.stabs "P2:G12",32,0,0,0xD2
.stabs "FP20:G300",32,0,0,0xD2
.stabs "FP21:G301",32,0,0,0xD2
.stabs "FP22:G302",32,0,0,0xD2
.stabs "FP23:G303",32,0,0,0xD2
.stabs "FP24:G304",32,0,0,0xD2
.stabs "FP25:G305",32,0,0,0xD2
.stabs "P5:G12",32,0,0,0xD5
.stabs "FP54:G304",32,0,0,0xD5
.stabs "T0M:G12",32,0,0,0xD8
.stabs "FT0TB:G300",32,0,0,0xD8
.stabs "FT0RATE0:G304",32,0,0,0xD8
.stabs "FT0RATE1:G305",32,0,0,0xD8
.stabs "FT0RATE2:G306",32,0,0,0xD8
.stabs "FT0ENB:G307",32,0,0,0xD8
.stabs "T0C:G12",32,0,0,0xD9
.stabs "TC0M:G12",32,0,0,0xDA
.stabs "FTC0ENB:G307",32,0,0,0xDA
.stabs "FTC0RATE2:G306",32,0,0,0xDA
.stabs "FTC0RATE1:G305",32,0,0,0xDA
.stabs "FTC0RATE0:G304",32,0,0,0xDA
.stabs "FTC0CKS:G303",32,0,0,0xDA
.stabs "FALOAD0:G302",32,0,0,0xDA
.stabs "FTC0OUT:G301",32,0,0,0xDA
.stabs "FPWM0OUT:G300",32,0,0,0xDA
.stabs "TC0C:G12",32,0,0,0xDB
.stabs "STKP:G12",32,0,0,0xDF
.stabs "FGIE:G307",32,0,0,0xDF
.stabs "FSTKPB1:G301",32,0,0,0xDF
.stabs "FSTKPB0:G300",32,0,0,0xDF
.stabs "P0UR:G12",32,0,0,0xE0
.stabs "FP00R:G300",32,0,0,0xE0
.stabs "P1UR:G12",32,0,0,0xE1
.stabs "FP10R:G300",32,0,0,0xE1
.stabs "FP12R:G302",32,0,0,0xE1
.stabs "FP13R:G303",32,0,0,0xE1
.stabs "P2UR:G12",32,0,0,0xE2
.stabs "FP20R:G300",32,0,0,0xE2
.stabs "FP21R:G301",32,0,0,0xE2
.stabs "FP22R:G302",32,0,0,0xE2
.stabs "FP23R:G303",32,0,0,0xE2
.stabs "FP24R:G304",32,0,0,0xE2
.stabs "FP25R:G305",32,0,0,0xE2
.stabs "P5UR:G12",32,0,0,0xE5
.stabs "FP54R:G304",32,0,0,0xE5
.stabs "_YZ:G12",32,0,0,0xE7
.stabs "P1OC:G12",32,0,0,0xE9
.stabs "STK3L:G12",32,0,0,0xF8
.stabs "STK3H:G12",32,0,0,0xF9
.stabs "STK2L:G12",32,0,0,0xFA
.stabs "STK2H:G12",32,0,0,0xFB
.stabs "STK1L:G12",32,0,0,0xFC
.stabs "STK1H:G12",32,0,0,0xFD
.stabs "STK0L:G12",32,0,0,0xFE
.stabs "STK0H:G12",32,0,0,0xFF
_sdata3@segment SEGMENT DATA INBANK
	_sdata3 DS 1
_sdata4@segment SEGMENT DATA INBANK
	_sdata4 DS 1
.stabs "SleepMode:F13",36,0,0,_SleepMode
_Function_SleepMode_code SEGMENT CODE INBANK USING _Function_SleepMode_data
_SleepMode:
.stabn 0xC0,0,0,L11-_SleepMode
L11:
.stabn 0x44,0,11,L12-_SleepMode
L12:
;Line#11 {

 .stabn 0x44,0,15,L13-_SleepMode
L13:
;Line#15 	if (!sleepFlag)

 	;NEI1 L5 ,_sleepFlag ,#0
	__SelectBANK _sleepFlag
	MOV A, _sleepFlag
	CMPRS A, #0x00
	JMP L5
.stabn 0xC0,0,1,L14-_SleepMode
L14:
.stabn 0x44,0,16,L15-_SleepMode
L15:
;Line#16 	{

 .stabn 0x44,0,17,L16-_SleepMode
L16:
;Line#17 		sleepFlag = 1;

 	;MOVI1 _sleepFlag ,#1
	MOV A, #0x01
	MOV _sleepFlag, A
.stabn 0x44,0,18,L17-_SleepMode
L17:
;Line#18 		sleepTime1 = 0;

 	;MOVU1 _sdata3 ,#0
	__SelectBANK _sdata3
	CLR _sdata3
.stabn 0x44,0,19,L18-_SleepMode
L18:
;Line#19 		sleepTime2 = 0;

 	;MOVU1 _sdata4 ,#0
	__SelectBANK _sdata4
	CLR _sdata4
.stabn 0xE0,0,1,L19-_SleepMode
L19:
.stabn 0x44,0,20,L20-_SleepMode
L20:
;Line#20 	}

	JMP L6
L5:
.stabn 0xC0,0,1,L21-_SleepMode
L21:
.stabn 0x44,0,22,L22-_SleepMode
L22:
;Line#22 	{

 .stabn 0x44,0,23,L23-_SleepMode
L23:
;Line#23 		sleepTime1++;

 	;ADDU1 _sdata3 ,_sdata3 ,#1
	__SelectBANK _sdata3
	INCMS _sdata3
	NOP
.stabn 0x44,0,25,L24-_SleepMode
L24:
;Line#25 		if (sleepTime1 > 99)	//10ms

 	;LE L7 ,_sdata3 ,#99
	MOV A, _sdata3
	CMPRS A, #0x63
	JLT L7
.stabn 0xC0,0,2,L25-_SleepMode
L25:
.stabn 0x44,0,26,L26-_SleepMode
L26:
;Line#26 		{

 .stabn 0x44,0,27,L27-_SleepMode
L27:
;Line#27 			sleepTime1 = 0;

 	;MOVU1 _sdata3 ,#0
	CLR _sdata3
.stabn 0x44,0,28,L28-_SleepMode
L28:
;Line#28 			sleepTime2++;

 	;ADDU1 _sdata4 ,_sdata4 ,#1
	__SelectBANK _sdata4
	INCMS _sdata4
	NOP
.stabn 0x44,0,29,L29-_SleepMode
L29:
;Line#29 			if (sleepTime2 > 199) //2s

 	;LE L9 ,_sdata4 ,#199
	MOV A, _sdata4
	CMPRS A, #0xc7
	JLT L9
.stabn 0xC0,0,3,L30-_SleepMode
L30:
.stabn 0x44,0,30,L31-_SleepMode
L31:
;Line#30 			{

 .stabn 0x44,0,31,L32-_SleepMode
L32:
;Line#31 				sleepTime2 = 0;

 	;MOVU1 _sdata4 ,#0
	CLR _sdata4
.stabn 0x44,0,32,L33-_SleepMode
L33:
;Line#32 				FCPUM1 = 0;

 	;MOVX1 0xCA.4 ,#0
	B0BCLR 0xCA.4
.stabn 0x44,0,33,L34-_SleepMode
L34:
;Line#33 				FCPUM0 = 1;

 	;MOVX1 0xCA.3 ,#1
	B0BSET 0xCA.3
.stabn 0xE0,0,3,L35-_SleepMode
L35:
.stabn 0x44,0,34,L36-_SleepMode
L36:
;Line#34 			}

L9:
.stabn 0xE0,0,2,L37-_SleepMode
L37:
.stabn 0x44,0,35,L38-_SleepMode
L38:
;Line#35 		}

L7:
.stabn 0xE0,0,1,L39-_SleepMode
L39:
.stabn 0x44,0,36,L40-_SleepMode
L40:
;Line#36 	}

L6:
.stabs "sleepTime2:V9",40,0,0,_sdata4
.stabs "sleepTime1:V9",40,0,0,_sdata3
.stabn 0xE0,0,0,L41-_SleepMode
L41:
.stabn 0x44,0,37,L42-_SleepMode
L42:
;Line#37 }
L2:
	RET
.stabs " :T15=eFALSE:0,TRUE:1,;",128,0,0,0
.stabs "_intrinsicbitfield:T16=s1bit0:12,0,1;bit1:12,1,1;bit2:12,2,1;\\",128,0,0,0
.stabs "bit3:12,3,1;bit4:12,4,1;bit5:12,5,1;bit6:12,6,1;bit7:12,7,1;;",128,0,0,0
.stabs "FlagStatus:t15",128,0,0,0
.stabs "u16t:t12",128,0,0,0
.stabs "u8t:t9",128,0,0,0
.stabs "", 100, 0, 0,Letext
Letext:
