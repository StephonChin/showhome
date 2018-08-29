
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
.stabs "F:\PROJECT\ShowHome\ZW-1104\ZW1104(Flood Sensor)&ZW1105 - 8½Å¿ØÖÆIC--2501D/",0x64,0,3,Ltext0
.stabs ".\Src\beep.c",0x64,0,3,Ltext0
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

PUBLIC _BeepPulseControl
PUBLIC _warningCnt3
_warningCnt3@segment SEGMENT DATA INBANK
	_warningCnt3 DS 1
PUBLIC _warningCnt2
_warningCnt2@segment SEGMENT DATA INBANK
	_warningCnt2 DS 1
PUBLIC _warningCnt1
_warningCnt1@segment SEGMENT DATA INBANK
	_warningCnt1 DS 1
EXTERN DATA_BIT _flagWarningInit
EXTERN DATA_BIT _flagKeyTrigger
EXTERN DATA_BIT _out_enable
EXTERN DATA_BIT _power_save_enable

_sdata2@segment SEGMENT DATA INBANK
	_sdata2 DS 1
_Function_BeepPulseControl_data SEGMENT DATA INBANK

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
.stabs "BeepPulseControl:F13",36,0,0,_BeepPulseControl
_Function_BeepPulseControl_code SEGMENT CODE INBANK USING _Function_BeepPulseControl_data
_BeepPulseControl:
.stabn 0xC0,0,0,L17-_BeepPulseControl
L17:
.stabn 0x44,0,12,L18-_BeepPulseControl
L18:
;Line#12 {

 .stabn 0x44,0,14,L19-_BeepPulseControl
L19:
;Line#14 	if (flagKeyTrigger)

 	;EQ L3 ,_flagKeyTrigger ,#0
	__SelectBANK _flagKeyTrigger
	BTS1 _flagKeyTrigger
	JMP L3
.stabn 0xC0,0,1,L20-_BeepPulseControl
L20:
.stabn 0x44,0,15,L21-_BeepPulseControl
L21:
;Line#15 	{

 .stabn 0x44,0,16,L22-_BeepPulseControl
L22:
;Line#16 		power_save_enable = 1;

 	;MOVX1 _power_save_enable ,#1
	__SelectBANK _power_save_enable
	BSET _power_save_enable
.stabn 0x44,0,18,L23-_BeepPulseControl
L23:
;Line#18 		if (flagWarningInit)

 	;EQ L5 ,_flagWarningInit ,#0
	__SelectBANK _flagWarningInit
	BTS1 _flagWarningInit
	JMP L5
.stabn 0xC0,0,2,L24-_BeepPulseControl
L24:
.stabn 0x44,0,19,L25-_BeepPulseControl
L25:
;Line#19 		{

 .stabn 0x44,0,20,L26-_BeepPulseControl
L26:
;Line#20 			flagWarningInit = 0;

 	;MOVX1 _flagWarningInit ,#0
	BCLR _flagWarningInit
.stabn 0x44,0,21,L27-_BeepPulseControl
L27:
;Line#21 			pulsePort = 1;

 	;MOVX1 0xD1.2 ,#1
	B0BSET 0xD1.2
.stabn 0x44,0,22,L28-_BeepPulseControl
L28:
;Line#22 			warningCnt1    = 0;

 	;MOVU1 _warningCnt1 ,#0
	__SelectBANK _warningCnt1
	CLR _warningCnt1
.stabn 0x44,0,23,L29-_BeepPulseControl
L29:
;Line#23 			warningCnt2    = 0;

 	;MOVU1 _warningCnt2 ,#0
	__SelectBANK _warningCnt2
	CLR _warningCnt2
.stabn 0x44,0,24,L30-_BeepPulseControl
L30:
;Line#24 			warningCnt3    = 0;

 	;MOVU1 _warningCnt3 ,#0
	__SelectBANK _warningCnt3
	CLR _warningCnt3
.stabn 0xE0,0,2,L31-_BeepPulseControl
L31:
.stabn 0x44,0,25,L32-_BeepPulseControl
L32:
;Line#25 		}

L5:
.stabn 0x44,0,27,L33-_BeepPulseControl
L33:
;Line#27 		if (keyOnCnt == 0)

 	;NEI1 L7 ,_sdata2 ,#0
	__SelectBANK _sdata2
	MOV A, _sdata2
	CMPRS A, #0x00
	JMP L7
.stabn 0x44,0,28,L34-_BeepPulseControl
L34:
;Line#28 			out_enable = 1;

 	;MOVX1 _out_enable ,#1
	__SelectBANK _out_enable
	BSET _out_enable
L7:
.stabn 0x44,0,30,L35-_BeepPulseControl
L35:
;Line#30 		keyOnCnt++;

 	;ADDU1 _sdata2 ,_sdata2 ,#1
	__SelectBANK _sdata2
	INCMS _sdata2
	NOP
.stabn 0x44,0,31,L36-_BeepPulseControl
L36:
;Line#31 		if (keyOnCnt > 250) keyOnCnt = 1;

 	;LE L9 ,_sdata2 ,#250
	MOV A, _sdata2
	CMPRS A, #0xfa
	JLT L9
.stabn 0x44,0,31,L37-_BeepPulseControl
L37:
;Line#31 		if (keyOnCnt > 250) keyOnCnt = 1;

 	;MOVU1 _sdata2 ,#1
	MOV A, #0x01
	MOV _sdata2, A
L9:
.stabn 0x44,0,32,L38-_BeepPulseControl
L38:
;Line#32 		warningCnt1++;		

 	;ADDU1 _warningCnt1 ,_warningCnt1 ,#1
	__SelectBANK _warningCnt1
	INCMS _warningCnt1
	NOP
.stabn 0x44,0,34,L39-_BeepPulseControl
L39:
;Line#34 		if (warningCnt1 > 199) //20ms

 	;LE L4 ,_warningCnt1 ,#199
	MOV A, _warningCnt1
	CMPRS A, #0xc7
	JLT L4
.stabn 0xC0,0,2,L40-_BeepPulseControl
L40:
.stabn 0x44,0,35,L41-_BeepPulseControl
L41:
;Line#35 		{

 .stabn 0x44,0,36,L42-_BeepPulseControl
L42:
;Line#36 			warningCnt1 = 0;

 	;MOVU1 _warningCnt1 ,#0
	CLR _warningCnt1
.stabn 0x44,0,37,L43-_BeepPulseControl
L43:
;Line#37 			warningCnt2++;

 	;ADDU1 _warningCnt2 ,_warningCnt2 ,#1
	__SelectBANK _warningCnt2
	INCMS _warningCnt2
	NOP
.stabn 0x44,0,39,L44-_BeepPulseControl
L44:
;Line#39 			if (warningCnt2 > 49) //1s

 	;LE L4 ,_warningCnt2 ,#49
	MOV A, _warningCnt2
	CMPRS A, #0x31
	JLT L4
.stabn 0xC0,0,3,L45-_BeepPulseControl
L45:
.stabn 0x44,0,40,L46-_BeepPulseControl
L46:
;Line#40 			{

 .stabn 0x44,0,41,L47-_BeepPulseControl
L47:
;Line#41 				warningCnt2 = 0;

 	;MOVU1 _warningCnt2 ,#0
	CLR _warningCnt2
.stabn 0x44,0,42,L48-_BeepPulseControl
L48:
;Line#42 				warningCnt3++;

 	;ADDU1 _warningCnt3 ,_warningCnt3 ,#1
	__SelectBANK _warningCnt3
	INCMS _warningCnt3
	NOP
.stabn 0x44,0,44,L49-_BeepPulseControl
L49:
;Line#44 				if (warningCnt3 > 9) //10s

 	;LE L4 ,_warningCnt3 ,#9
	MOV A, _warningCnt3
	CMPRS A, #0x09
	JLT L4
.stabn 0xC0,0,4,L50-_BeepPulseControl
L50:
.stabn 0x44,0,45,L51-_BeepPulseControl
L51:
;Line#45 				{

 .stabn 0x44,0,46,L52-_BeepPulseControl
L52:
;Line#46 					warningCnt3 = 0;

 	;MOVU1 _warningCnt3 ,#0
	CLR _warningCnt3
.stabn 0x44,0,47,L53-_BeepPulseControl
L53:
;Line#47 					pulsePort  = 0;

 	;MOVX1 0xD1.2 ,#0
	B0BCLR 0xD1.2
.stabn 0x44,0,48,L54-_BeepPulseControl
L54:
;Line#48 					flagKeyTrigger = 0;

 	;MOVX1 _flagKeyTrigger ,#0
	__SelectBANK _flagKeyTrigger
	BCLR _flagKeyTrigger
.stabn 0x44,0,49,L55-_BeepPulseControl
L55:
;Line#49 					keyOnCnt = 0;

 	;MOVU1 _sdata2 ,#0
	__SelectBANK _sdata2
	CLR _sdata2
.stabn 0x44,0,50,L56-_BeepPulseControl
L56:
;Line#50 					out_enable = 1;

 	;MOVX1 _out_enable ,#1
	__SelectBANK _out_enable
	BSET _out_enable
.stabn 0xE0,0,4,L57-_BeepPulseControl
L57:
.stabn 0x44,0,51,L58-_BeepPulseControl
L58:
;Line#51 				}

 .stabn 0xE0,0,3,L59-_BeepPulseControl
L59:
.stabn 0x44,0,52,L60-_BeepPulseControl
L60:
;Line#52 			}	

 .stabn 0xE0,0,2,L61-_BeepPulseControl
L61:
.stabn 0x44,0,53,L62-_BeepPulseControl
L62:
;Line#53 		}

 .stabn 0xE0,0,1,L63-_BeepPulseControl
L63:
.stabn 0x44,0,54,L64-_BeepPulseControl
L64:
;Line#54 	}

	JMP L4
L3:
.stabn 0xC0,0,1,L65-_BeepPulseControl
L65:
.stabn 0x44,0,56,L66-_BeepPulseControl
L66:
;Line#56 	{

 .stabn 0x44,0,57,L67-_BeepPulseControl
L67:
;Line#57 		pulsePort = 0;

 	;MOVX1 0xD1.2 ,#0
	B0BCLR 0xD1.2
.stabn 0x44,0,59,L68-_BeepPulseControl
L68:
;Line#59 		warningCnt1    = 0;

 	;MOVU1 _warningCnt1 ,#0
	__SelectBANK _warningCnt1
	CLR _warningCnt1
.stabn 0x44,0,60,L69-_BeepPulseControl
L69:
;Line#60 		warningCnt2    = 0;

 	;MOVU1 _warningCnt2 ,#0
	__SelectBANK _warningCnt2
	CLR _warningCnt2
.stabn 0x44,0,61,L70-_BeepPulseControl
L70:
;Line#61 		warningCnt3    = 0;

 	;MOVU1 _warningCnt3 ,#0
	__SelectBANK _warningCnt3
	CLR _warningCnt3
.stabn 0x44,0,62,L71-_BeepPulseControl
L71:
;Line#62 		flagKeyTrigger = 0;

 	;MOVX1 _flagKeyTrigger ,#0
	__SelectBANK _flagKeyTrigger
	BCLR _flagKeyTrigger
.stabn 0xE0,0,1,L72-_BeepPulseControl
L72:
.stabn 0x44,0,63,L73-_BeepPulseControl
L73:
;Line#63 	}

L4:
.stabs "keyOnCnt:V9",38,0,0,_sdata2
.stabn 0xE0,0,0,L74-_BeepPulseControl
L74:
.stabn 0x44,0,64,L75-_BeepPulseControl
L75:
;Line#64 }
L1:
	RET
.stabs "_intrinsicbitfield:T15=s1bit0:12,0,1;bit1:12,1,1;bit2:12,2,1;\\",128,0,0,0
.stabs "bit3:12,3,1;bit4:12,4,1;bit5:12,5,1;bit6:12,6,1;bit7:12,7,1;;",128,0,0,0
.stabs "", 100, 0, 0,Letext
Letext:
.stabs "warningCnt3:G9",32,0,0,_warningCnt3
.stabs "warningCnt2:G9",32,0,0,_warningCnt2
.stabs "warningCnt1:G9",32,0,0,_warningCnt1
