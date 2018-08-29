
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
.stabs ".\Src\mcu_config.c",0x64,0,3,Ltext0
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

PUBLIC _McuConfig

_Function_GpioInit_data SEGMENT DATA INBANK

_Function_TimerInit_data SEGMENT DATA INBANK

_Function_McuConfig_data SEGMENT DATA INBANK

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
.stabs "GpioInit:f13",36,0,0,_GpioInit
_Function_GpioInit_code SEGMENT CODE INBANK USING _Function_GpioInit_data
_GpioInit:
.stabn 0xC0,0,0,L2-_GpioInit
L2:
.stabn 0x44,0,13,L3-_GpioInit
L3:
;Line#13 {

 .stabn 0x44,0,14,L4-_GpioInit
L4:
;Line#14 	P0M  = 0xeb;	//P04 P02 input

 	;MOVU1 0xB8 ,#235
	MOV A, #0xeb
	B0MOV 0xB8, A
.stabn 0x44,0,15,L5-_GpioInit
L5:
;Line#15 	P0UR = 0X00;

 	;MOVU1 0xE0 ,#0
	__SelectBANKCNST 0
	CLR (0xE0 & 0xFF)
.stabn 0x44,0,17,L6-_GpioInit
L6:
;Line#17 	P4M   = 0xef;	//P40 output P44 input

 	;MOVU1 0xC4 ,#239
	MOV A, #0xef
	B0MOV 0xC4, A
.stabn 0x44,0,18,L7-_GpioInit
L7:
;Line#18 	P4UR  = 0x00;

 	;MOVU1 0xE4 ,#0
	__SelectBANKCNST 0
	CLR (0xE4 & 0xFF)
.stabn 0x44,0,19,L8-_GpioInit
L8:
;Line#19 	P4CON = 0x10;	//P44 selected as AD input only

 	;MOVU1 0xAE ,#16
	MOV A, #0x10
	B0MOV 0xAE, A
.stabn 0x44,0,20,L9-_GpioInit
L9:
;Line#20 	ADM  |= 0x14;	//open A/D in channel, AIN4 ,ADENB = 1

 	;ORU1 0xB1 ,0xB1 ,#20
	MOV A, #0x14
	__SelectBANKCNST 0
	OR (0xB1 & 0xFF), A
.stabn 0x44,0,21,L10-_GpioInit
L10:
;Line#21 	ADR  |= 0x50;

 	;ORU1 0xB3 ,0xB3 ,#80
	MOV A, #0x50
	__SelectBANKCNST 0
	OR (0xB3 & 0xFF), A
.stabn 0x44,0,22,L11-_GpioInit
L11:
;Line#22 	FP40  = 1;

 	;MOVX1 0xD4.0 ,#1
	B0BSET 0xD4.0
.stabn 0x44,0,23,L12-_GpioInit
L12:
;Line#23 	VREFH &= 0x7f;	//vref = VDD;

 	;ANDU1 0xAF ,0xAF ,#127
	MOV A, #0x7f
	__SelectBANKCNST 0
	AND (0xAF & 0xFF), A
.stabn 0x44,0,24,L13-_GpioInit
L13:
;Line#24 	VREFH |= 0x03;

 	;ORU1 0xAF ,0xAF ,#3
	MOV A, #0x03
	OR (0xAF & 0xFF), A
.stabn 0x44,0,26,L14-_GpioInit
L14:
;Line#26 	P5M  = 0xff;	//P53 output

 	;MOVU1 0xC5 ,#255
	MOV A, #0xff
	B0MOV 0xC5, A
.stabn 0x44,0,27,L15-_GpioInit
L15:
;Line#27 	P5UR = 0x00;

 	;MOVU1 0xE5 ,#0
	__SelectBANKCNST 0
	CLR (0xE5 & 0xFF)
.stabn 0x44,0,28,L16-_GpioInit
L16:
;Line#28 	FP53 = 0;

 	;MOVX1 0xD5.3 ,#0
	B0BCLR 0xD5.3
.stabn 0xE0,0,0,L17-_GpioInit
L17:
.stabn 0x44,0,29,L18-_GpioInit
L18:
;Line#29 }

L1:
	RET
.stabs "TimerInit:f13",36,0,0,_TimerInit
_Function_TimerInit_code SEGMENT CODE INBANK USING _Function_TimerInit_data
_TimerInit:
.stabn 0xC0,0,0,L20-_TimerInit
L20:
.stabn 0x44,0,35,L21-_TimerInit
L21:
;Line#35 {

 .stabn 0x44,0,36,L22-_TimerInit
L22:
;Line#36 	TC0M  = 0x64;	//CPU/4 = 4us

 	;MOVU1 0xDA ,#100
	MOV A, #0x64
	B0MOV 0xDA, A
.stabn 0x44,0,37,L23-_TimerInit
L23:
;Line#37 	T0M   = 0x00;

 	;MOVU1 0xD8 ,#0
	__SelectBANKCNST 0
	CLR (0xD8 & 0xFF)
.stabn 0x44,0,38,L24-_TimerInit
L24:
;Line#38 	TC0C  = 6;		//1ms

 	;MOVU1 0xDB ,#6
	MOV A, #0x06
	B0MOV 0xDB, A
.stabn 0x44,0,39,L25-_TimerInit
L25:
;Line#39 	TC0R  = 6;

 	;MOVU1 0xCD ,#6
	B0MOV 0xCD, A
.stabn 0x44,0,40,L26-_TimerInit
L26:
;Line#40 	TC0M |= 0x80;

 	;ORU1 0xDA ,0xDA ,#128
	MOV A, #0x80
	__SelectBANKCNST 0
	OR (0xDA & 0xFF), A
.stabn 0xE0,0,0,L27-_TimerInit
L27:
.stabn 0x44,0,41,L28-_TimerInit
L28:
;Line#41 }

L19:
	RET
.stabs "McuConfig:F13",36,0,0,_McuConfig
_Function_McuConfig_code SEGMENT CODE INBANK USING _Function_McuConfig_data
_McuConfig:
.stabn 0xC0,0,0,L30-_McuConfig
L30:
.stabn 0x44,0,47,L31-_McuConfig
L31:
;Line#47 {

 .stabn 0x44,0,48,L32-_McuConfig
L32:
;Line#48 	GpioInit();

 	;CALLV _GpioInit
	CALL _GpioInit
.stabn 0x44,0,49,L33-_McuConfig
L33:
;Line#49 	TimerInit();

 	;CALLV _TimerInit
	CALL _TimerInit
.stabn 0xE0,0,0,L34-_McuConfig
L34:
.stabn 0x44,0,50,L35-_McuConfig
L35:
;Line#50 }

L29:
	RET

CALLTREE _McuConfig invoke _GpioInit,_TimerInit

.stabs "_intrinsicbitfield:T15=s1bit0:12,0,1;bit1:12,1,1;bit2:12,2,1;\\",128,0,0,0
.stabs "bit3:12,3,1;bit4:12,4,1;bit5:12,5,1;bit6:12,6,1;bit7:12,7,1;;",128,0,0,0
.stabs "BitStatus:t14",128,0,0,0
.stabs "uint:t10",128,0,0,0
.stabs "uchar:t9",128,0,0,0
.stabs "", 100, 0, 0,Letext
Letext:
