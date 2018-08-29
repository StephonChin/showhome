
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
.stabs "F:\RF°´¼ü×éºÏ\RF-Zwave/",0x64,0,3,Ltext0
.stabs ".\Src\mcu_initialize.c",0x64,0,3,Ltext0
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

PUBLIC _GpioInit
PUBLIC _TimerInit

_Function_GpioInit_data SEGMENT DATA INBANK

_Function_TimerInit_data SEGMENT DATA INBANK

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
.stabs "GpioInit:F13",36,0,0,_GpioInit
_Function_GpioInit_code SEGMENT CODE INBANK USING _Function_GpioInit_data
_GpioInit:
.stabn 0xC0,0,0,L3-_GpioInit
L3:
.stabn 0x44,0,12,L4-_GpioInit
L4:
;Line#12 {

 .stabn 0x44,0,13,L5-_GpioInit
L5:
;Line#13 	FP22M = 1;

 	;MOVX1 0xC2.2 ,#1
	B0BSET 0xC2.2
.stabn 0x44,0,14,L6-_GpioInit
L6:
;Line#14 	FP23M = 1;

 	;MOVX1 0xC2.3 ,#1
	B0BSET 0xC2.3
.stabn 0x44,0,15,L7-_GpioInit
L7:
;Line#15 	FP54M = 1;

 	;MOVX1 0xC5.4 ,#1
	B0BSET 0xC5.4
.stabn 0x44,0,16,L8-_GpioInit
L8:
;Line#16 	FP24M = 0;

 	;MOVX1 0xC2.4 ,#0
	B0BCLR 0xC2.4
.stabn 0x44,0,19,L9-_GpioInit
L9:
;Line#19 	P2UR = 0x10;

 	;MOVU1 0xE2 ,#16
	MOV A, #0x10
	B0MOV 0xE2, A
.stabn 0x44,0,20,L10-_GpioInit
L10:
;Line#20 	FP22 = 0;

 	;MOVX1 0xD2.2 ,#0
	B0BCLR 0xD2.2
.stabn 0x44,0,21,L11-_GpioInit
L11:
;Line#21 	FP23 = 1;	

 	;MOVX1 0xD2.3 ,#1
	B0BSET 0xD2.3
.stabn 0x44,0,22,L12-_GpioInit
L12:
;Line#22 	FP54 = 0;

 	;MOVX1 0xD5.4 ,#0
	B0BCLR 0xD5.4
.stabn 0xE0,0,0,L13-_GpioInit
L13:
.stabn 0x44,0,23,L14-_GpioInit
L14:
;Line#23 }

L2:
	RET
.stabs "TimerInit:F13",36,0,0,_TimerInit
_Function_TimerInit_code SEGMENT CODE INBANK USING _Function_TimerInit_data
_TimerInit:
.stabn 0xC0,0,0,L16-_TimerInit
L16:
.stabn 0x44,0,29,L17-_TimerInit
L17:
;Line#29 {

 .stabn 0x44,0,30,L18-_TimerInit
L18:
;Line#30 	TC0M = 0x64;	//f = 1/64

 	;MOVU1 0xDA ,#100
	MOV A, #0x64
	B0MOV 0xDA, A
.stabn 0x44,0,31,L19-_TimerInit
L19:
;Line#31 	TC0C = 15;		//T = 15 * 64 = 1ms

 	;MOVU1 0xDB ,#15
	MOV A, #0x0f
	B0MOV 0xDB, A
.stabn 0x44,0,32,L20-_TimerInit
L20:
;Line#32 	TC0R = 15;

 	;MOVU1 0xCD ,#15
	B0MOV 0xCD, A
.stabn 0xE0,0,0,L21-_TimerInit
L21:
.stabn 0x44,0,33,L22-_TimerInit
L22:
;Line#33 }
L15:
	RET
.stabs " :T15=eFALSE:0,TRUE:1,;",128,0,0,0
.stabs "_intrinsicbitfield:T16=s1bit0:12,0,1;bit1:12,1,1;bit2:12,2,1;\\",128,0,0,0
.stabs "bit3:12,3,1;bit4:12,4,1;bit5:12,5,1;bit6:12,6,1;bit7:12,7,1;;",128,0,0,0
.stabs "FlagStatus:t15",128,0,0,0
.stabs "u16t:t12",128,0,0,0
.stabs "u8t:t9",128,0,0,0
.stabs "", 100, 0, 0,Letext
Letext:
