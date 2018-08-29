
;----------------------------------------------------
;  Copyright (c) 2003-2013 SONiX Technology Co., Ltd.
;  Sonix SN8 C Compiler - V2.01
;----------------------------------------------------

CHIP SN8P2711B

INCLUDE <sncc_macros.h>
EXTERN DATA T
EXTERN DATA I
.CODE
.stabs "lcc4_compiled.",0x3C,0,0,0
.stabs "F:\PROJECT\ShowHome\ZW-112-时间可调\ZW-112/",0x64,0,3,Ltext0
.stabs ".\Src\main.c",0x64,0,3,Ltext0
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

PUBLIC _main
EXTERN DATA_BIT _forbidFlag
EXTERN DATA_BIT _sysTriacFlag
EXTERN DATA_BIT _sysPirStatusFlag
EXTERN DATA_BIT _sysKeyStatusFlag

_sdata2@segment SEGMENT DATA INBANK
	_sdata2 DS 1
_Function_main_data SEGMENT DATA INBANK

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
.stabs "P4CON:G12",32,0,0,0xAE
.stabs "VREFH:G12",32,0,0,0xAF
.stabs "FVHS0:G300",32,0,0,0xAF
.stabs "FVHS1:G301",32,0,0,0xAF
.stabs "FEVHENB:G307",32,0,0,0xAF
.stabs "ADM:G12",32,0,0,0xB1
.stabs "FADENB:G307",32,0,0,0xB1
.stabs "FADS:G306",32,0,0,0xB1
.stabs "FEOC:G305",32,0,0,0xB1
.stabs "FGCHS:G304",32,0,0,0xB1
.stabs "FCHS2:G302",32,0,0,0xB1
.stabs "FCHS1:G301",32,0,0,0xB1
.stabs "FCHS0:G300",32,0,0,0xB1
.stabs "ADB:G12",32,0,0,0xB2
.stabs "ADR:G12",32,0,0,0xB3
.stabs "FADCKS1:G306",32,0,0,0xB3
.stabs "FADCKS0:G304",32,0,0,0xB3
.stabs "FADB3:G303",32,0,0,0xB3
.stabs "FADB2:G302",32,0,0,0xB3
.stabs "FADB1:G301",32,0,0,0xB3
.stabs "FADB0:G300",32,0,0,0xB3
.stabs "ADT:G12",32,0,0,0xB4
.stabs "FADTS1:G307",32,0,0,0xB4
.stabs "FADTS0:G306",32,0,0,0xB4
.stabs "FADT4:G304",32,0,0,0xB4
.stabs "FADT3:G303",32,0,0,0xB4
.stabs "FADT2:G302",32,0,0,0xB4
.stabs "FADT1:G301",32,0,0,0xB4
.stabs "FADT0:G300",32,0,0,0xB4
.stabs "P0M:G12",32,0,0,0xB8
.stabs "FP00M:G300",32,0,0,0xB8
.stabs "FP01M:G301",32,0,0,0xB8
.stabs "FP02M:G302",32,0,0,0xB8
.stabs "FP03M:G303",32,0,0,0xB8
.stabs "PEDGE:G12",32,0,0,0xBF
.stabs "FP00G1:G304",32,0,0,0xBF
.stabs "FP00G0:G303",32,0,0,0xBF
.stabs "P4M:G12",32,0,0,0xC4
.stabs "FP40M:G300",32,0,0,0xC4
.stabs "FP41M:G301",32,0,0,0xC4
.stabs "FP42M:G302",32,0,0,0xC4
.stabs "FP43M:G303",32,0,0,0xC4
.stabs "FP44M:G304",32,0,0,0xC4
.stabs "P5M:G12",32,0,0,0xC5
.stabs "FP53M:G303",32,0,0,0xC5
.stabs "FP54M:G304",32,0,0,0xC5
.stabs "INTRQ:G12",32,0,0,0xC8
.stabs "FP00IRQ:G300",32,0,0,0xC8
.stabs "FP01IRQ:G301",32,0,0,0xC8
.stabs "FTC0IRQ:G305",32,0,0,0xC8
.stabs "FTC1IRQ:G306",32,0,0,0xC8
.stabs "FADCIRQ:G307",32,0,0,0xC8
.stabs "INTEN:G12",32,0,0,0xC9
.stabs "FP00IEN:G300",32,0,0,0xC9
.stabs "FP01IEN:G301",32,0,0,0xC9
.stabs "FTC0IEN:G305",32,0,0,0xC9
.stabs "FTC1IEN:G306",32,0,0,0xC9
.stabs "FADCIEN:G307",32,0,0,0xC9
.stabs "OSCM:G12",32,0,0,0xCA
.stabs "FCPUM1:G304",32,0,0,0xCA
.stabs "FCPUM0:G303",32,0,0,0xCA
.stabs "FCLKMD:G302",32,0,0,0xCA
.stabs "FSTPHX:G301",32,0,0,0xCA
.stabs "WDTR:G12",32,0,0,0xCC
.stabs "PCL:G12",32,0,0,0xCE
.stabs "PCH:G12",32,0,0,0xCF
.stabs "P0:G12",32,0,0,0xD0
.stabs "FP00:G300",32,0,0,0xD0
.stabs "FP01:G301",32,0,0,0xD0
.stabs "FP02:G302",32,0,0,0xD0
.stabs "FP03:G303",32,0,0,0xD0
.stabs "FP04:G304",32,0,0,0xD0
.stabs "P4:G12",32,0,0,0xD4
.stabs "FP40:G300",32,0,0,0xD4
.stabs "FP41:G301",32,0,0,0xD4
.stabs "FP42:G302",32,0,0,0xD4
.stabs "FP43:G303",32,0,0,0xD4
.stabs "FP44:G304",32,0,0,0xD4
.stabs "P5:G12",32,0,0,0xD5
.stabs "FP53:G303",32,0,0,0xD5
.stabs "FP54:G304",32,0,0,0xD5
.stabs "T0M:G12",32,0,0,0xD8
.stabs "FTC0GN:G301",32,0,0,0xD8
.stabs "FTC0X8:G302",32,0,0,0xD8
.stabs "FTC1X8:G303",32,0,0,0xD8
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
.stabs "TC0R:G12",32,0,0,0xCD
.stabs "TC1M:G12",32,0,0,0xDC
.stabs "FTC1ENB:G307",32,0,0,0xDC
.stabs "FTC1RATE2:G306",32,0,0,0xDC
.stabs "FTC1RATE1:G305",32,0,0,0xDC
.stabs "FTC1RATE0:G304",32,0,0,0xDC
.stabs "FTC1CKS:G303",32,0,0,0xDC
.stabs "FALOAD1:G302",32,0,0,0xDC
.stabs "FTC1OUT:G301",32,0,0,0xDC
.stabs "FPWM1OUT:G300",32,0,0,0xDC
.stabs "TC1C:G12",32,0,0,0xDD
.stabs "TC1R:G12",32,0,0,0xDE
.stabs "STKP:G12",32,0,0,0xDF
.stabs "FGIE:G307",32,0,0,0xDF
.stabs "FSTKPB2:G302",32,0,0,0xDF
.stabs "FSTKPB1:G301",32,0,0,0xDF
.stabs "FSTKPB0:G300",32,0,0,0xDF
.stabs "P0UR:G12",32,0,0,0xE0
.stabs "P4UR:G12",32,0,0,0xE4
.stabs "P5UR:G12",32,0,0,0xE5
.stabs "_YZ:G12",32,0,0,0xE7
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
.stabs "main:F13",36,0,0,_main
_Function_main_code SEGMENT CODE INBANK USING _Function_main_data
_main:
.stabn 0xC0,0,0,L19-_main
L19:
.stabn 0x44,0,16,L20-_main
L20:
;Line#16 {

 .stabn 0x44,0,20,L21-_main
L21:
;Line#20 	McuConfig();

 	;CALLV _McuConfig
	CALL _McuConfig
L4:
.stabn 0xC0,0,1,L22-_main
L22:
.stabn 0x44,0,23,L23-_main
L23:
;Line#23 	{

 .stabn 0x44,0,24,L24-_main
L24:
;Line#24 		if (FTC0IRQ == 1)//	1ms

 	;NEX1 L7 ,0xC8.5 ,#1
	B0BTS1 0xC8.5
	JMP L7
.stabn 0xC0,0,2,L25-_main
L25:
.stabn 0x44,0,25,L26-_main
L26:
;Line#25 		{

 .stabn 0x44,0,26,L27-_main
L27:
;Line#26 			FTC0IRQ =0;

 	;MOVX1 0xC8.5 ,#0
	B0BCLR 0xC8.5
.stabn 0x44,0,29,L28-_main
L28:
;Line#29 			if (!sysKeyStatusFlag && !sysPirStatusFlag && !sysTriacFlag && !forbidFlag)

 	;NEX1 L9 ,_sysKeyStatusFlag ,#0
	__SelectBANK _sysKeyStatusFlag
	BTS0 _sysKeyStatusFlag
	JMP L9
	;NEX1 L9 ,_sysPirStatusFlag ,#0
	__SelectBANK _sysPirStatusFlag
	BTS0 _sysPirStatusFlag
	JMP L9
	;NEX1 L9 ,_sysTriacFlag ,#0
	__SelectBANK _sysTriacFlag
	BTS0 _sysTriacFlag
	JMP L9
	;NEX1 L9 ,_forbidFlag ,#0
	__SelectBANK _forbidFlag
	BTS0 _forbidFlag
	JMP L9
.stabn 0xC0,0,3,L29-_main
L29:
.stabn 0x44,0,30,L30-_main
L30:
;Line#30 			{

 .stabn 0x44,0,31,L31-_main
L31:
;Line#31 				sleepCnt++;

 	;ADDU1 _sdata3 ,_sdata3 ,#1
	__SelectBANK _sdata3
	INCMS _sdata3
	NOP
.stabn 0x44,0,32,L32-_main
L32:
;Line#32 				if (sleepCnt > 200)	//200ms

 	;LE L10 ,_sdata3 ,#200
	MOV A, _sdata3
	CMPRS A, #0xc8
	JLT L10
.stabn 0xC0,0,4,L33-_main
L33:
.stabn 0x44,0,33,L34-_main
L34:
;Line#33 				{

 .stabn 0x44,0,34,L35-_main
L35:
;Line#34 					sleepCnt = 0;

 	;MOVU1 _sdata3 ,#0
	CLR _sdata3
.stabn 0x44,0,36,L36-_main
L36:
;Line#36 					FADENB = 0;

 	;MOVX1 0xB1.7 ,#0
	B0BCLR 0xB1.7
.stabn 0x44,0,37,L37-_main
L37:
;Line#37 					FCPUM0 = 1;

 	;MOVX1 0xCA.3 ,#1
	B0BSET 0xCA.3
.stabn 0x44,0,38,L38-_main
L38:
;Line#38 					FCPUM1 = 0;

 	;MOVX1 0xCA.4 ,#0
	B0BCLR 0xCA.4
.stabn 0xE0,0,4,L39-_main
L39:
.stabn 0x44,0,39,L40-_main
L40:
;Line#39 				}

 .stabn 0xE0,0,3,L41-_main
L41:
.stabn 0x44,0,40,L42-_main
L42:
;Line#40 			}

	JMP L10
L9:
.stabn 0xC0,0,3,L43-_main
L43:
.stabn 0x44,0,42,L44-_main
L44:
;Line#42 			{

 .stabn 0x44,0,43,L45-_main
L45:
;Line#43 				sleepCnt = 0;

 	;MOVU1 _sdata3 ,#0
	__SelectBANK _sdata3
	CLR _sdata3
.stabn 0xE0,0,3,L46-_main
L46:
.stabn 0x44,0,44,L47-_main
L47:
;Line#44 			}

L10:
.stabn 0x44,0,47,L48-_main
L48:
	__SelectBANK _sdata2
	MOV A, _sdata2
	ADD A, #0x80
	CMPRS A, #0x84
	B0BTS0 FC
	JMP L75
	SUB A, #0x80
	B0BTS1 FC
	JMP L75
	B0ADD PCL, A
	JMP L15
	JMP L16
	JMP L17
	JMP L18
L75:
;Line#47 			switch(programmStep)//4ms

	JMP L13
.stabn 0xC0,0,3,L49-_main
L49:
.stabn 0x44,0,48,L50-_main
L50:
;Line#48 			{

L15:
.stabn 0x44,0,50,L51-_main
L51:
;Line#50 					KeyScan();

 	;CALLV _KeyScan
	CALL _KeyScan
.stabn 0x44,0,51,L52-_main
L52:
;Line#51 					programmStep++;

 	;ADDU1 _sdata2 ,_sdata2 ,#1
	__SelectBANK _sdata2
	INCMS _sdata2
	NOP
.stabn 0x44,0,52,L53-_main
L53:
;Line#52 					break;

	JMP L14
L16:
.stabn 0x44,0,54,L54-_main
L54:
;Line#54 					PirChk();

 	;CALLV _PirChk
	CALL _PirChk
.stabn 0x44,0,55,L55-_main
L55:
;Line#55 					programmStep++;

 	;ADDU1 _sdata2 ,_sdata2 ,#1
	__SelectBANK _sdata2
	INCMS _sdata2
	NOP
.stabn 0x44,0,56,L56-_main
L56:
;Line#56 					break;

	JMP L14
L17:
.stabn 0x44,0,58,L57-_main
L57:
;Line#58 					AdScan();

 	;CALLV _AdScan
	CALL _AdScan
.stabn 0x44,0,59,L58-_main
L58:
;Line#59 					programmStep++;

 	;ADDU1 _sdata2 ,_sdata2 ,#1
	__SelectBANK _sdata2
	INCMS _sdata2
	NOP
.stabn 0x44,0,60,L59-_main
L59:
;Line#60 					break;

	JMP L14
L18:
.stabn 0x44,0,62,L60-_main
L60:
;Line#62 					SingleOutput();

 	;CALLV _SingleOutput
	CALL _SingleOutput
.stabn 0x44,0,63,L61-_main
L61:
;Line#63 					programmStep = 0;

 	;MOVU1 _sdata2 ,#0
	__SelectBANK _sdata2
	CLR _sdata2
.stabn 0x44,0,64,L62-_main
L62:
;Line#64 					break;

	JMP L14
L13:
.stabn 0x44,0,66,L63-_main
L63:
;Line#66 					programmStep = 0;

 	;MOVU1 _sdata2 ,#0
	__SelectBANK _sdata2
	CLR _sdata2
.stabn 0x44,0,67,L64-_main
L64:
;Line#67 					break;

 .stabn 0xE0,0,3,L65-_main
L65:
.stabn 0x44,0,68,L66-_main
L66:
;Line#68 			}

L14:
.stabn 0xE0,0,2,L67-_main
L67:
.stabn 0x44,0,69,L68-_main
L68:
;Line#69 		}

L7:
.stabn 0xE0,0,1,L69-_main
L69:
.stabn 0x44,0,70,L70-_main
L70:
;Line#70 	}

L5:
.stabn 0x44,0,22,L71-_main
L71:
;Line#22 	while(1)

	JMP L4
.stabs "sleepCnt:V9",40,0,0,_sdata3
.stabs "programmStep:V9",38,0,0,_sdata2
.stabn 0xE0,0,0,L72-_main
L72:
.stabn 0x44,0,72,L73-_main
L73:
;Line#72 }
L1:
_main_end:
	CALL __ClearWatchDogTimer
	JMP _main_end

CALLTREE _main invoke _McuConfig,_KeyScan,_PirChk,_AdScan,_SingleOutput

.stabs "_intrinsicbitfield:T15=s1bit0:12,0,1;bit1:12,1,1;bit2:12,2,1;\\",128,0,0,0
.stabs "bit3:12,3,1;bit4:12,4,1;bit5:12,5,1;bit6:12,6,1;bit7:12,7,1;;",128,0,0,0
.stabs "BitStatus:t14",128,0,0,0
.stabs "uint:t10",128,0,0,0
.stabs "uchar:t9",128,0,0,0
.stabs "", 100, 0, 0,Letext
Letext:
EXTERN CODE _PirChk
EXTERN CODE _KeyScan
EXTERN CODE _McuConfig
EXTERN CODE _SingleOutput
EXTERN CODE _AdScan
EXTERN CODE __ClearWatchDogTimer
