
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
PUBLIC _interrupt_isr_isr
PUBLIC _Delay1s
PUBLIC _Delay1s_arg@0
PUBLIC _rfOnPulse
PUBLIC _waveOffPulse
PUBLIC _flagPowerOn
_flagPowerOn@segment SEGMENT DATA INBANK
	_flagPowerOn DS 1
PUBLIC _flagSingle
_flagSingle@segment SEGMENT DATA INBANK
	_flagSingle DS 1

_Function_main_data SEGMENT DATA INBANK

_DEFINE_ISRBACKUP_DATA 2
_Function_interrupt_isr_isr_data SEGMENT DATA INBANK

_Function_Delay1s_data SEGMENT DATA INBANK
	_Delay1s_arg@0 DS 1
	_Delay1s_data@0	DS	1
	_Delay1s_data@1	DS	1

_Function_rfOnPulse_data SEGMENT DATA INBANK
	_rfOnPulse_data@0	DS	1
	_rfOnPulse_data@1	DS	1

_Function_waveOffPulse_data SEGMENT DATA INBANK
	_waveOffPulse_data@0	DS	1


_VirtualReg SEGMENT DATA BANK 0 INBANK COMMON
	W0 DS 1

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
.stabs "main:F13",36,0,0,_main
_Function_main_code SEGMENT CODE INBANK USING _Function_main_data
_main:
.stabn 0xC0,0,0,L10-_main
L10:
.stabn 0x44,0,11,L11-_main
L11:
;Line#11 {

 .stabn 0x44,0,12,L12-_main
L12:
;Line#12 	GpioInit();

 	;CALLV _GpioInit
	CALL _GpioInit
.stabn 0x44,0,13,L13-_main
L13:
;Line#13 	TimerInit();

 	;CALLV _TimerInit
	CALL _TimerInit
L3:
.stabn 0xC0,0,1,L14-_main
L14:
.stabn 0x44,0,16,L15-_main
L15:
;Line#16 	{

 .stabn 0x44,0,17,L16-_main
L16:
;Line#17 		if(flagSingle)

 	;EQ L6 ,_flagSingle ,#0
	__SelectBANK _flagSingle
	MOV A, _flagSingle
	JEQ L6
.stabn 0xC0,0,2,L17-_main
L17:
.stabn 0x44,0,18,L18-_main
L18:
;Line#18 		{

 .stabn 0x44,0,19,L19-_main
L19:
;Line#19 			flagSingle = 0;

 	;MOVI1 _flagSingle ,#0
	CLR _flagSingle
.stabn 0x44,0,22,L20-_main
L20:
;Line#22 			rfOnPulse();

 	;CALLV _rfOnPulse
	CALL _rfOnPulse
.stabn 0x44,0,24,L21-_main
L21:
;Line#24 			Delay1s(20);			

 	;PUSH _Delay1s_arg@0 ,#20
	MOV A, #0x14
	__SelectBANK _Delay1s_arg@0
	MOV _Delay1s_arg@0, A
	;CALLV _Delay1s
	CALL _Delay1s
.stabn 0x44,0,25,L22-_main
L22:
;Line#25 			if (flagPowerOn)

 	;EQ L8 ,_flagPowerOn ,#0
	__SelectBANK _flagPowerOn
	MOV A, _flagPowerOn
	JEQ L8
.stabn 0x44,0,26,L23-_main
L23:
;Line#26 				waveOffPulse();

 	;CALLV _waveOffPulse
	CALL _waveOffPulse
L8:
.stabn 0xE0,0,2,L24-_main
L24:
.stabn 0x44,0,27,L25-_main
L25:
;Line#27 		}

L6:
.stabn 0xE0,0,1,L26-_main
L26:
.stabn 0x44,0,28,L27-_main
L27:
;Line#28 	}

L4:
.stabn 0x44,0,15,L28-_main
L28:
;Line#15 	while(1)

	JMP L3
.stabn 0xE0,0,0,L29-_main
L29:
.stabn 0x44,0,29,L30-_main
L30:
;Line#29 }

L2:
_main_end:
	CALL __ClearWatchDogTimer
	JMP _main_end

CALLTREE _main invoke _GpioInit,_TimerInit,_rfOnPulse,_Delay1s,_waveOffPulse

.stabs "interrupt_isr:F13",36,0,0,_interrupt_isr_isr

_interrupt@_interrupt_isr_isr SEGMENT CODE AT 0x8 INBANK
_vector_for_interrupt_isr_isr:
	JMP _interrupt_isr_isr

_Function_interrupt_isr_isr_code SEGMENT CODE INBANK USING _Function_interrupt_isr_isr_data
_interrupt_isr_isr:
	__PUSH_REG 2
.stabn 0xC0,0,0,L32-_interrupt_isr_isr
L32:
.stabn 0x44,0,32,L33-_interrupt_isr_isr
L33:
;Line#32 {

 .stabn 0x44,0,33,L34-_interrupt_isr_isr
L34:
;Line#33 	FP00IRQ = 0;

 	;MOVX1 0xC8.0 ,#0
	B0BCLR 0xC8.0
.stabn 0x44,0,34,L35-_interrupt_isr_isr
L35:
;Line#34 	flagPowerOn = 1;

 	;MOVI1 _flagPowerOn ,#1
	MOV A, #0x01
	__SelectBANK _flagPowerOn
	MOV _flagPowerOn, A
.stabn 0x44,0,35,L36-_interrupt_isr_isr
L36:
;Line#35 	flagSingle = 1;

 	;MOVI1 _flagSingle ,#1
	__SelectBANK _flagSingle
	MOV _flagSingle, A
.stabn 0xE0,0,0,L37-_interrupt_isr_isr
L37:
.stabn 0x44,0,36,L38-_interrupt_isr_isr
L38:
;Line#36 }

L31:
	__POP_REG 2
	RETI
.stabs "Delay1s:F13",36,0,0,_Delay1s
_Function_Delay1s_code SEGMENT CODE INBANK USING _Function_Delay1s_data
_Delay1s:
.stabs "secNum:p9",160,0,0,_Delay1s_arg@0
.stabs "catNum1:9",128,0,0,_Delay1s_data@0
.stabs "catNum2:9",128,0,0,_Delay1s_data@1
.stabn 0xC0,0,0,L49-_Delay1s
L49:
.stabn 0x44,0,42,L50-_Delay1s
L50:
;Line#42 {

 .stabn 0x44,0,43,L51-_Delay1s
L51:
;Line#43 	u8t catNum1 = 0;

 	;MOVU1 _Delay1s_data@0 ,#0
	__SelectBANK _Delay1s_data@0
	CLR _Delay1s_data@0
.stabn 0x44,0,44,L52-_Delay1s
L52:
;Line#44 	u8t catNum2 = 0;

 	;MOVU1 _Delay1s_data@1 ,#0
	__SelectBANK _Delay1s_data@1
	CLR _Delay1s_data@1
.stabn 0x44,0,46,L53-_Delay1s
L53:
;Line#46 	FTC0ENB = 1;

 	;MOVX1 0xDA.7 ,#1
	B0BSET 0xDA.7
	JMP L41
L40:
.stabn 0xC0,0,1,L54-_Delay1s
L54:
.stabn 0x44,0,48,L55-_Delay1s
L55:
;Line#48 	{

 .stabn 0x44,0,49,L56-_Delay1s
L56:
;Line#49 		if (!zWaveSingle)

 	;NEX1 L43 ,0xD0.0 ,#0
	B0BTS0 0xD0.0
	JMP L43
.stabn 0xC0,0,2,L57-_Delay1s
L57:
.stabn 0x44,0,50,L58-_Delay1s
L58:
;Line#50 		{

 .stabn 0x44,0,51,L59-_Delay1s
L59:
;Line#51 			flagPowerOn = 0;

 	;MOVI1 _flagPowerOn ,#0
	__SelectBANK _flagPowerOn
	CLR _flagPowerOn
.stabn 0x44,0,52,L60-_Delay1s
L60:
;Line#52 			break;

	JMP L42
.stabn 0xE0,0,2,L61-_Delay1s
L61:
.stabn 0x44,0,53,L62-_Delay1s
L62:
;Line#53 		}

L43:
.stabn 0xC0,0,2,L63-_Delay1s
L63:
.stabn 0x44,0,55,L64-_Delay1s
L64:
;Line#55 		{

 .stabn 0x44,0,56,L65-_Delay1s
L65:
;Line#56 			if (FTC0IRQ == 1)

 	;NEX1 L45 ,0xC8.5 ,#1
	B0BTS1 0xC8.5
	JMP L45
.stabn 0xC0,0,3,L66-_Delay1s
L66:
.stabn 0x44,0,57,L67-_Delay1s
L67:
;Line#57 			{

 .stabn 0x44,0,58,L68-_Delay1s
L68:
;Line#58 				FTC0IRQ = 0;

 	;MOVX1 0xC8.5 ,#0
	B0BCLR 0xC8.5
.stabn 0x44,0,59,L69-_Delay1s
L69:
;Line#59 				catNum1++;

 	;ADDU1 _Delay1s_data@0 ,_Delay1s_data@0 ,#1
	__SelectBANK _Delay1s_data@0
	INCMS _Delay1s_data@0
	NOP
.stabn 0x44,0,60,L70-_Delay1s
L70:
;Line#60 				if (catNum1 > 124) 

 	;LE L47 ,_Delay1s_data@0 ,#124
	MOV A, _Delay1s_data@0
	CMPRS A, #0x7c
	JLT L47
.stabn 0xC0,0,4,L71-_Delay1s
L71:
.stabn 0x44,0,61,L72-_Delay1s
L72:
;Line#61 				{

 .stabn 0x44,0,62,L73-_Delay1s
L73:
;Line#62 					catNum1 = 0;

 	;MOVU1 _Delay1s_data@0 ,#0
	CLR _Delay1s_data@0
.stabn 0x44,0,63,L74-_Delay1s
L74:
;Line#63 					catNum2++;

 	;ADDU1 _Delay1s_data@1 ,_Delay1s_data@1 ,#1
	__SelectBANK _Delay1s_data@1
	INCMS _Delay1s_data@1
	NOP
.stabn 0xE0,0,4,L75-_Delay1s
L75:
.stabn 0x44,0,64,L76-_Delay1s
L76:
;Line#64 				}

L47:
.stabn 0xE0,0,3,L77-_Delay1s
L77:
.stabn 0x44,0,65,L78-_Delay1s
L78:
;Line#65 			}

L45:
.stabn 0xE0,0,2,L79-_Delay1s
L79:
.stabn 0x44,0,66,L80-_Delay1s
L80:
;Line#66 		}

 .stabn 0xE0,0,1,L81-_Delay1s
L81:
.stabn 0x44,0,67,L82-_Delay1s
L82:
;Line#67 	}

L41:
.stabn 0x44,0,47,L83-_Delay1s
L83:
;Line#47 	while (catNum2 < (2 * secNum))

 	;LSH W0 ,_Delay1s_arg@0 ,#1
	__SelectBANK _Delay1s_arg@0
	MOV A, _Delay1s_arg@0
	B0MOV W0, A
	B0BCLR FC
	__SelectBANKCNST 0
	RLCM W0
	;LT L40 ,_Delay1s_data@1 ,W0
	__SelectBANK _Delay1s_data@1
	MOV A, _Delay1s_data@1
	__SelectBANKCNST 0
	SUB A, W0
	JLT L40
L42:
.stabn 0x44,0,68,L84-_Delay1s
L84:
;Line#68 	FTC0ENB = 0;

 	;MOVX1 0xDA.7 ,#0
	B0BCLR 0xDA.7
.stabn 0xE0,0,0,L85-_Delay1s
L85:
.stabn 0x44,0,69,L86-_Delay1s
L86:
;Line#69 }

L39:
	RET
.stabs "rfOnPulse:F13",36,0,0,_rfOnPulse
_Function_rfOnPulse_code SEGMENT CODE INBANK USING _Function_rfOnPulse_data
_rfOnPulse:
.stabs "catNum:9",128,0,0,_rfOnPulse_data@0
.stabs "catNum2:9",128,0,0,_rfOnPulse_data@1
.stabn 0xC0,0,0,L95-_rfOnPulse
L95:
.stabn 0x44,0,75,L96-_rfOnPulse
L96:
;Line#75 {

 .stabn 0x44,0,76,L97-_rfOnPulse
L97:
;Line#76 	u8t catNum = 0;

 	;MOVU1 _rfOnPulse_data@0 ,#0
	__SelectBANK _rfOnPulse_data@0
	CLR _rfOnPulse_data@0
.stabn 0x44,0,77,L98-_rfOnPulse
L98:
;Line#77 	u8t catNum2 = 0;

 	;MOVU1 _rfOnPulse_data@1 ,#0
	__SelectBANK _rfOnPulse_data@1
	CLR _rfOnPulse_data@1
.stabn 0x44,0,79,L99-_rfOnPulse
L99:
;Line#79 	FP22M = 1;

 	;MOVX1 0xC2.2 ,#1
	B0BSET 0xC2.2
.stabn 0x44,0,80,L100-_rfOnPulse
L100:
;Line#80 	FP22 = 0;

 	;MOVX1 0xD2.2 ,#0
	B0BCLR 0xD2.2
.stabn 0x44,0,81,L101-_rfOnPulse
L101:
;Line#81 	FTC0ENB = 1;

 	;MOVX1 0xDA.7 ,#1
	B0BSET 0xDA.7
	JMP L89
L88:
.stabn 0xC0,0,1,L102-_rfOnPulse
L102:
.stabn 0x44,0,83,L103-_rfOnPulse
L103:
;Line#83 	{

 .stabn 0x44,0,84,L104-_rfOnPulse
L104:
;Line#84 		if (FTC0IRQ)

 	;EQ L91 ,0xC8.5 ,#0
	B0BTS1 0xC8.5
	JMP L91
.stabn 0xC0,0,2,L105-_rfOnPulse
L105:
.stabn 0x44,0,85,L106-_rfOnPulse
L106:
;Line#85 		{

 .stabn 0x44,0,86,L107-_rfOnPulse
L107:
;Line#86 			FTC0IRQ = 0;

 	;MOVX1 0xC8.5 ,#0
	B0BCLR 0xC8.5
.stabn 0x44,0,87,L108-_rfOnPulse
L108:
;Line#87 			catNum++;

 	;ADDU1 _rfOnPulse_data@0 ,_rfOnPulse_data@0 ,#1
	__SelectBANK _rfOnPulse_data@0
	INCMS _rfOnPulse_data@0
	NOP
.stabn 0x44,0,88,L109-_rfOnPulse
L109:
;Line#88 			if (catNum > 7)

 	;LE L93 ,_rfOnPulse_data@0 ,#7
	MOV A, _rfOnPulse_data@0
	CMPRS A, #0x07
	JLT L93
.stabn 0xC0,0,3,L110-_rfOnPulse
L110:
.stabn 0x44,0,89,L111-_rfOnPulse
L111:
;Line#89 			{

 .stabn 0x44,0,90,L112-_rfOnPulse
L112:
;Line#90 				catNum = 0;

 	;MOVU1 _rfOnPulse_data@0 ,#0
	CLR _rfOnPulse_data@0
.stabn 0x44,0,91,L113-_rfOnPulse
L113:
;Line#91 				catNum2++;

 	;ADDU1 _rfOnPulse_data@1 ,_rfOnPulse_data@1 ,#1
	__SelectBANK _rfOnPulse_data@1
	INCMS _rfOnPulse_data@1
	NOP
.stabn 0xE0,0,3,L114-_rfOnPulse
L114:
.stabn 0x44,0,92,L115-_rfOnPulse
L115:
;Line#92 			}

L93:
.stabn 0xE0,0,2,L116-_rfOnPulse
L116:
.stabn 0x44,0,93,L117-_rfOnPulse
L117:
;Line#93 		}

L91:
.stabn 0xE0,0,1,L118-_rfOnPulse
L118:
.stabn 0x44,0,94,L119-_rfOnPulse
L119:
;Line#94 	}

L89:
.stabn 0x44,0,82,L120-_rfOnPulse
L120:
;Line#82 	while (catNum2 < 50)

 	;LT L88 ,_rfOnPulse_data@1 ,#50
	__SelectBANK _rfOnPulse_data@1
	MOV A, _rfOnPulse_data@1
	SUB A, #0x32
	JLT L88
.stabn 0x44,0,95,L121-_rfOnPulse
L121:
;Line#95 	FP22M = 0;

 	;MOVX1 0xC2.2 ,#0
	B0BCLR 0xC2.2
.stabn 0x44,0,96,L122-_rfOnPulse
L122:
;Line#96 	FTC0ENB = 0;

 	;MOVX1 0xDA.7 ,#0
	B0BCLR 0xDA.7
.stabn 0xE0,0,0,L123-_rfOnPulse
L123:
.stabn 0x44,0,97,L124-_rfOnPulse
L124:
;Line#97 }

L87:
	RET
.stabs "waveOffPulse:F13",36,0,0,_waveOffPulse
_Function_waveOffPulse_code SEGMENT CODE INBANK USING _Function_waveOffPulse_data
_waveOffPulse:
.stabs "catNum:9",128,0,0,_waveOffPulse_data@0
.stabn 0xC0,0,0,L131-_waveOffPulse
L131:
.stabn 0x44,0,104,L132-_waveOffPulse
L132:
;Line#104 {

 .stabn 0x44,0,105,L133-_waveOffPulse
L133:
;Line#105 	u8t catNum = 0;

 	;MOVU1 _waveOffPulse_data@0 ,#0
	__SelectBANK _waveOffPulse_data@0
	CLR _waveOffPulse_data@0
.stabn 0x44,0,106,L134-_waveOffPulse
L134:
;Line#106 	zWavePower = 0;

 	;MOVX1 0xD1.0 ,#0
	B0BCLR 0xD1.0
.stabn 0x44,0,107,L135-_waveOffPulse
L135:
;Line#107 	FTC0ENB = 1;

 	;MOVX1 0xDA.7 ,#1
	B0BSET 0xDA.7
	JMP L127
L126:
.stabn 0xC0,0,1,L136-_waveOffPulse
L136:
.stabn 0x44,0,109,L137-_waveOffPulse
L137:
;Line#109 	{

 .stabn 0x44,0,110,L138-_waveOffPulse
L138:
;Line#110 		if (FTC0IRQ)

 	;EQ L129 ,0xC8.5 ,#0
	B0BTS1 0xC8.5
	JMP L129
.stabn 0xC0,0,2,L139-_waveOffPulse
L139:
.stabn 0x44,0,111,L140-_waveOffPulse
L140:
;Line#111 		{

 .stabn 0x44,0,112,L141-_waveOffPulse
L141:
;Line#112 			catNum++;

 	;ADDU1 _waveOffPulse_data@0 ,_waveOffPulse_data@0 ,#1
	__SelectBANK _waveOffPulse_data@0
	INCMS _waveOffPulse_data@0
	NOP
.stabn 0x44,0,113,L142-_waveOffPulse
L142:
;Line#113 			FTC0IRQ = 0;

 	;MOVX1 0xC8.5 ,#0
	B0BCLR 0xC8.5
.stabn 0xE0,0,2,L143-_waveOffPulse
L143:
.stabn 0x44,0,114,L144-_waveOffPulse
L144:
;Line#114 		}

L129:
.stabn 0xE0,0,1,L145-_waveOffPulse
L145:
.stabn 0x44,0,115,L146-_waveOffPulse
L146:
;Line#115 	}

L127:
.stabn 0x44,0,108,L147-_waveOffPulse
L147:
;Line#108 	while (catNum < 200)

 	;LT L126 ,_waveOffPulse_data@0 ,#200
	__SelectBANK _waveOffPulse_data@0
	MOV A, _waveOffPulse_data@0
	SUB A, #0xc8
	JLT L126
.stabn 0x44,0,116,L148-_waveOffPulse
L148:
;Line#116 	zWavePower = 1;

 	;MOVX1 0xD1.0 ,#1
	B0BSET 0xD1.0
.stabn 0x44,0,117,L149-_waveOffPulse
L149:
;Line#117 	FTC0ENB = 0;

 	;MOVX1 0xDA.7 ,#0
	B0BCLR 0xDA.7
.stabn 0xE0,0,0,L150-_waveOffPulse
L150:
.stabn 0x44,0,118,L151-_waveOffPulse
L151:
;Line#118 }

L125:
	RET
.stabs " :T15=eFALSE:0,TRUE:1,;",128,0,0,0
.stabs "_intrinsicbitfield:T16=s1bit0:12,0,1;bit1:12,1,1;bit2:12,2,1;\\",128,0,0,0
.stabs "bit3:12,3,1;bit4:12,4,1;bit5:12,5,1;bit6:12,6,1;bit7:12,7,1;;",128,0,0,0
.stabs "FlagStatus:t15",128,0,0,0
.stabs "u16t:t12",128,0,0,0
.stabs "u8t:t9",128,0,0,0
.stabs "", 100, 0, 0,Letext
Letext:
.stabs "flagPowerOn:G15",32,0,0,_flagPowerOn
.stabs "flagSingle:G15",32,0,0,_flagSingle
EXTERN CODE _GpioInit
EXTERN CODE _TimerInit
EXTERN CODE __ClearWatchDogTimer
