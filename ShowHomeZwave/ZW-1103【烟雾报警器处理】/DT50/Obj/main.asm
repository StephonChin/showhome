
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
.stabs "H:\¹Ì°î\ShowHome\ShowHomeZwave\ZW-1103¡¾ÑÌÎí±¨¾¯Æ÷´¦Àí¡¿\DT50/",0x64,0,3,Ltext0
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
PUBLIC _ISR_isr

_Function_main_data SEGMENT DATA INBANK

_DEFINE_ISRBACKUP_DATA 2
_Function_ISR_isr_data SEGMENT DATA INBANK

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
_sdata2@segment SEGMENT DATA INBANK
	_sdata2 DS 1
.stabs "main:F13",36,0,0,_main
_Function_main_code SEGMENT CODE INBANK USING _Function_main_data
_main:
.stabn 0xC0,0,0,L13-_main
L13:
.stabn 0x44,0,5,L14-_main
L14:
;Line#5 {

 .stabn 0x44,0,7,L15-_main
L15:
;Line#7   gpio_init();

 	;CALLV _gpio_init
	CALL _gpio_init
.stabn 0x44,0,8,L16-_main
L16:
;Line#8   time_init();

 	;CALLV _time_init
	CALL _time_init
L3:
.stabn 0xC0,0,1,L17-_main
L17:
.stabn 0x44,0,11,L18-_main
L18:
;Line#11   {

 .stabn 0x44,0,12,L19-_main
L19:
;Line#12     if(FTC0IRQ)    //132us

 	;EQ L6 ,0xC8.5 ,#0
	B0BTS1 0xC8.5
	JMP L6
.stabn 0xC0,0,2,L20-_main
L20:
.stabn 0x44,0,13,L21-_main
L21:
;Line#13 	{

 .stabn 0x44,0,14,L22-_main
L22:
;Line#14 	  FTC0IRQ=0;

 	;MOVX1 0xC8.5 ,#0
	B0BCLR 0xC8.5
.stabn 0x44,0,15,L23-_main
L23:
;Line#15 	  BeepPulseControl();

 	;CALLV _BeepPulseControl
	CALL _BeepPulseControl
.stabn 0x44,0,16,L24-_main
L24:
;Line#16 	  switch(main_step)

 	;EQ L10 ,_sdata2 ,#0
	__SelectBANK _sdata2
	MOV A, _sdata2
	JEQ L10
	;EQ L11 ,_sdata2 ,#1
	SUB A, #0x01
	JEQ L11
	;EQ L12 ,_sdata2 ,#2
	MOV A, _sdata2
	SUB A, #0x02
	JEQ L12
	JMP L8
.stabn 0xC0,0,3,L25-_main
L25:
.stabn 0x44,0,17,L26-_main
L26:
;Line#17 	  {

L10:
.stabn 0x44,0,19,L27-_main
L27:
;Line#19 		  key_scan();

 	;CALLV _key_scan
	CALL _key_scan
.stabn 0x44,0,20,L28-_main
L28:
;Line#20 		  main_step=1;

 	;MOVU1 _sdata2 ,#1
	MOV A, #0x01
	__SelectBANK _sdata2
	MOV _sdata2, A
.stabn 0x44,0,21,L29-_main
L29:
;Line#21 		break;

	JMP L9
L11:
.stabn 0x44,0,24,L30-_main
L30:
;Line#24 		  led_control();

 	;CALLV _led_control
	CALL _led_control
.stabn 0x44,0,25,L31-_main
L31:
;Line#25 		  main_step=2;

 	;MOVU1 _sdata2 ,#2
	MOV A, #0x02
	__SelectBANK _sdata2
	MOV _sdata2, A
.stabn 0x44,0,26,L32-_main
L32:
;Line#26 		break;

	JMP L9
L12:
.stabn 0x44,0,29,L33-_main
L33:
;Line#29 		  power_save();

 	;CALLV _power_save
	CALL _power_save
.stabn 0x44,0,30,L34-_main
L34:
;Line#30 		  main_step=0;

 	;MOVU1 _sdata2 ,#0
	__SelectBANK _sdata2
	CLR _sdata2
.stabn 0x44,0,31,L35-_main
L35:
;Line#31 		break;

	JMP L9
L8:
.stabn 0x44,0,35,L36-_main
L36:
;Line#35 		main_step=0;

 	;MOVU1 _sdata2 ,#0
	__SelectBANK _sdata2
	CLR _sdata2
.stabn 0x44,0,36,L37-_main
L37:
;Line#36 		break;

 .stabn 0xE0,0,3,L38-_main
L38:
.stabn 0x44,0,37,L39-_main
L39:
;Line#37 	  }

L9:
.stabn 0xE0,0,2,L40-_main
L40:
.stabn 0x44,0,38,L41-_main
L41:
;Line#38 	}

L6:
.stabn 0xE0,0,1,L42-_main
L42:
.stabn 0x44,0,39,L43-_main
L43:
;Line#39   }

L4:
.stabn 0x44,0,10,L44-_main
L44:
;Line#10   while(1)

	JMP L3
.stabs "main_step:V9",40,0,0,_sdata2
.stabn 0xE0,0,0,L45-_main
L45:
.stabn 0x44,0,40,L46-_main
L46:
;Line#40 }

L1:
_main_end:
	CALL __ClearWatchDogTimer
	JMP _main_end

CALLTREE _main invoke _gpio_init,_time_init,_BeepPulseControl,_key_scan,_led_control,_power_save

.stabs "ISR:F13",36,0,0,_ISR_isr

_interrupt@_ISR_isr SEGMENT CODE AT 0x8 INBANK
_vector_for_ISR_isr:
	JMP _ISR_isr

_Function_ISR_isr_code SEGMENT CODE INBANK USING _Function_ISR_isr_data
_ISR_isr:
	__PUSH_REG 2
.stabn 0xC0,0,0,L48-_ISR_isr
L48:
.stabn 0x44,0,43,L49-_ISR_isr
L49:
;Line#43 {

 .stabn 0x44,0,45,L50-_ISR_isr
L50:
;Line#45   INTRQ=0;

 	;MOVU1 0xC8 ,#0
	__SelectBANKCNST 0
	CLR (0xC8 & 0xFF)
.stabn 0xE0,0,0,L51-_ISR_isr
L51:
.stabn 0x44,0,46,L52-_ISR_isr
L52:
;Line#46 }
L47:
	__POP_REG 2
	RETI
.stabs "_intrinsicbitfield:T15=s1bit0:12,0,1;bit1:12,1,1;bit2:12,2,1;\\",128,0,0,0
.stabs "bit3:12,3,1;bit4:12,4,1;bit5:12,5,1;bit6:12,6,1;bit7:12,7,1;;",128,0,0,0
.stabs "", 100, 0, 0,Letext
Letext:
EXTERN CODE _key_scan
EXTERN CODE _BeepPulseControl
EXTERN CODE _gpio_init
EXTERN CODE _time_init
EXTERN CODE _led_control
EXTERN CODE _power_save
EXTERN CODE __ClearWatchDogTimer
