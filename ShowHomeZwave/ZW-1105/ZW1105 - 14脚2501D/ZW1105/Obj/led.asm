
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
.stabs "F:\PROJECT\ShowHome\ZW-1105\ZW1105\ZW1105/",0x64,0,3,Ltext0
.stabs ".\Src\led.c",0x64,0,3,Ltext0
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

PUBLIC _led_control
PUBLIC _led_control_one
PUBLIC _led_control_two
PUBLIC _led_control_three
PUBLIC _led_control_four
PUBLIC _led_mode
_led_mode@segment SEGMENT DATA INBANK
	_led_mode DS 1
PUBLIC _led_delay_3
_led_delay_3@segment SEGMENT DATA INBANK
	_led_delay_3 DS 1
PUBLIC _led_delay_2
_led_delay_2@segment SEGMENT DATA INBANK
	_led_delay_2 DS 1
PUBLIC _led_delay_1
_led_delay_1@segment SEGMENT DATA INBANK
	_led_delay_1 DS 1
PUBLIC _led_mode_init

_led_c_GlobalBitDataPool0 BITSEGMENT DATA BANK 0 INBANK
	_led_mode_init DSBIT 1

_Function_led_control_data SEGMENT DATA INBANK

_Function_led_control_one_data SEGMENT DATA INBANK

_Function_led_control_two_data SEGMENT DATA INBANK

_Function_led_control_three_data SEGMENT DATA INBANK

_Function_led_control_four_data SEGMENT DATA INBANK

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
.stabs "led_control:F13",36,0,0,_led_control
_Function_led_control_code SEGMENT CODE INBANK USING _Function_led_control_data
_led_control:
.stabn 0xC0,0,0,L8-_led_control
L8:
.stabn 0x44,0,15,L9-_led_control
L9:
;Line#15 {

 .stabn 0x44,0,17,L10-_led_control
L10:
	__SelectBANK _led_mode
	MOV A, _led_mode
	ADD A, #0x80
	CMPRS A, #0x84
	B0BTS0 FC
	JMP L271
	SUB A, #0x80
	B0BTS1 FC
	JMP L271
	B0ADD PCL, A
	JMP L4
	JMP L5
	JMP L6
	JMP L7
L271:
;Line#17   switch(led_mode)

	JMP L3
.stabn 0xC0,0,1,L11-_led_control
L11:
.stabn 0x44,0,18,L12-_led_control
L12:
;Line#18   {

L4:
.stabn 0x44,0,20,L13-_led_control
L13:
;Line#20 	  led_control_one();

 	;CALLV _led_control_one
	CALL _led_control_one
.stabn 0x44,0,21,L14-_led_control
L14:
;Line#21 	  break;

	JMP L3
L5:
.stabn 0x44,0,24,L15-_led_control
L15:
;Line#24 	  led_control_two();

 	;CALLV _led_control_two
	CALL _led_control_two
.stabn 0x44,0,25,L16-_led_control
L16:
;Line#25 	  break;

	JMP L3
L6:
.stabn 0x44,0,28,L17-_led_control
L17:
;Line#28 	  led_control_three();

 	;CALLV _led_control_three
	CALL _led_control_three
.stabn 0x44,0,29,L18-_led_control
L18:
;Line#29 	  break;

	JMP L3
L7:
.stabn 0x44,0,32,L19-_led_control
L19:
;Line#32 	  led_control_four();

 	;CALLV _led_control_four
	CALL _led_control_four
.stabn 0x44,0,33,L20-_led_control
L20:
;Line#33 	  break;

 .stabn 0x44,0,36,L21-_led_control
L21:
;Line#36 	  break;

 .stabn 0xE0,0,1,L22-_led_control
L22:
.stabn 0x44,0,37,L23-_led_control
L23:
;Line#37   }

L3:
.stabn 0xE0,0,0,L24-_led_control
L24:
.stabn 0x44,0,38,L25-_led_control
L25:
;Line#38 }

L1:
	RET

CALLTREE _led_control invoke _led_control_one,_led_control_two,_led_control_three,_led_control_four

.stabs "led_control_one:F13",36,0,0,_led_control_one
_Function_led_control_one_code SEGMENT CODE INBANK USING _Function_led_control_one_data
_led_control_one:
.stabn 0xC0,0,0,L37-_led_control_one
L37:
.stabn 0x44,0,48,L38-_led_control_one
L38:
;Line#48 {

 .stabn 0x44,0,49,L39-_led_control_one
L39:
;Line#49   if(led_mode_init==0)

 	;NEX1 L27 ,_led_mode_init ,#0
	__SelectBANK _led_mode_init
	BTS0 _led_mode_init
	JMP L27
.stabn 0xC0,0,1,L40-_led_control_one
L40:
.stabn 0x44,0,50,L41-_led_control_one
L41:
;Line#50   {

 .stabn 0x44,0,51,L42-_led_control_one
L42:
;Line#51     led_mode_init=1;

 	;MOVX1 _led_mode_init ,#1
	BSET _led_mode_init
.stabn 0x44,0,52,L43-_led_control_one
L43:
;Line#52 	led_delay_3=0;

 	;MOVU1 _led_delay_3 ,#0
	__SelectBANK _led_delay_3
	CLR _led_delay_3
.stabn 0x44,0,53,L44-_led_control_one
L44:
;Line#53 	r1=1;

 	;MOVX1 0xD0.0 ,#1
	B0BSET 0xD0.0
.stabn 0x44,0,54,L45-_led_control_one
L45:
;Line#54 	r2=1;

 	;MOVX1 0xD2.3 ,#1
	B0BSET 0xD2.3
.stabn 0x44,0,55,L46-_led_control_one
L46:
;Line#55 	r3=1;

 	;MOVX1 0xD2.2 ,#1
	B0BSET 0xD2.2
.stabn 0x44,0,56,L47-_led_control_one
L47:
;Line#56 	g1=1;

 	;MOVX1 0xD1.0 ,#1
	B0BSET 0xD1.0
.stabn 0x44,0,57,L48-_led_control_one
L48:
;Line#57 	g2=1;

 	;MOVX1 0xD2.4 ,#1
	B0BSET 0xD2.4
.stabn 0x44,0,58,L49-_led_control_one
L49:
;Line#58 	g3=1;

 	;MOVX1 0xD2.1 ,#1
	B0BSET 0xD2.1
.stabn 0x44,0,59,L50-_led_control_one
L50:
;Line#59 	b1=1;

 	;MOVX1 0xD5.4 ,#1
	B0BSET 0xD5.4
.stabn 0x44,0,60,L51-_led_control_one
L51:
;Line#60 	b2=1;

 	;MOVX1 0xD2.5 ,#1
	B0BSET 0xD2.5
.stabn 0x44,0,61,L52-_led_control_one
L52:
;Line#61 	b3=1;

 	;MOVX1 0xD2.0 ,#1
	B0BSET 0xD2.0
.stabn 0xE0,0,1,L53-_led_control_one
L53:
.stabn 0x44,0,62,L54-_led_control_one
L54:
;Line#62   }

L27:
.stabn 0x44,0,64,L55-_led_control_one
L55:
;Line#64   if(led_delay_3==6)

 	;NEI1 L29 ,_led_delay_3 ,#6
	__SelectBANK _led_delay_3
	MOV A, _led_delay_3
	CMPRS A, #0x06
	JMP L29
.stabn 0xC0,0,1,L56-_led_control_one
L56:
.stabn 0x44,0,65,L57-_led_control_one
L57:
;Line#65   {

 .stabn 0x44,0,66,L58-_led_control_one
L58:
;Line#66 	led_delay_3=0;

 	;MOVU1 _led_delay_3 ,#0
	CLR _led_delay_3
.stabn 0xE0,0,1,L59-_led_control_one
L59:
.stabn 0x44,0,67,L60-_led_control_one
L60:
;Line#67   }  

L29:
.stabn 0x44,0,69,L61-_led_control_one
L61:
;Line#69   if (led_delay_3==0)

 	;NEI1 L31 ,_led_delay_3 ,#0
	__SelectBANK _led_delay_3
	MOV A, _led_delay_3
	CMPRS A, #0x00
	JMP L31
.stabn 0xC0,0,1,L62-_led_control_one
L62:
.stabn 0x44,0,70,L63-_led_control_one
L63:
;Line#70   {

 .stabn 0x44,0,71,L64-_led_control_one
L64:
;Line#71 	r1=0;

 	;MOVX1 0xD0.0 ,#0
	B0BCLR 0xD0.0
.stabn 0x44,0,72,L65-_led_control_one
L65:
;Line#72 	r2=0;

 	;MOVX1 0xD2.3 ,#0
	B0BCLR 0xD2.3
.stabn 0x44,0,73,L66-_led_control_one
L66:
;Line#73 	r3=0;

 	;MOVX1 0xD2.2 ,#0
	B0BCLR 0xD2.2
.stabn 0x44,0,74,L67-_led_control_one
L67:
;Line#74 	g1=1;

 	;MOVX1 0xD1.0 ,#1
	B0BSET 0xD1.0
.stabn 0x44,0,75,L68-_led_control_one
L68:
;Line#75 	g2=1;

 	;MOVX1 0xD2.4 ,#1
	B0BSET 0xD2.4
.stabn 0x44,0,76,L69-_led_control_one
L69:
;Line#76 	g3=1;

 	;MOVX1 0xD2.1 ,#1
	B0BSET 0xD2.1
.stabn 0x44,0,77,L70-_led_control_one
L70:
;Line#77 	b1 = 1;

 	;MOVX1 0xD5.4 ,#1
	B0BSET 0xD5.4
.stabn 0x44,0,78,L71-_led_control_one
L71:
;Line#78 	b2 = 1;

 	;MOVX1 0xD2.5 ,#1
	B0BSET 0xD2.5
.stabn 0x44,0,79,L72-_led_control_one
L72:
;Line#79 	b3 = 1;

 	;MOVX1 0xD2.0 ,#1
	B0BSET 0xD2.0
.stabn 0xE0,0,1,L73-_led_control_one
L73:
.stabn 0x44,0,80,L74-_led_control_one
L74:
;Line#80   }

L31:
.stabn 0x44,0,82,L75-_led_control_one
L75:
;Line#82   if(led_delay_3==2)

 	;NEI1 L33 ,_led_delay_3 ,#2
	__SelectBANK _led_delay_3
	MOV A, _led_delay_3
	CMPRS A, #0x02
	JMP L33
.stabn 0xC0,0,1,L76-_led_control_one
L76:
.stabn 0x44,0,83,L77-_led_control_one
L77:
;Line#83   {

 .stabn 0x44,0,84,L78-_led_control_one
L78:
;Line#84 	r1=1;

 	;MOVX1 0xD0.0 ,#1
	B0BSET 0xD0.0
.stabn 0x44,0,85,L79-_led_control_one
L79:
;Line#85     r2=1;

 	;MOVX1 0xD2.3 ,#1
	B0BSET 0xD2.3
.stabn 0x44,0,86,L80-_led_control_one
L80:
;Line#86 	r3=1;

 	;MOVX1 0xD2.2 ,#1
	B0BSET 0xD2.2
.stabn 0x44,0,87,L81-_led_control_one
L81:
;Line#87 	g1=0;

 	;MOVX1 0xD1.0 ,#0
	B0BCLR 0xD1.0
.stabn 0x44,0,88,L82-_led_control_one
L82:
;Line#88 	g2=0;

 	;MOVX1 0xD2.4 ,#0
	B0BCLR 0xD2.4
.stabn 0x44,0,89,L83-_led_control_one
L83:
;Line#89 	g3=0;

 	;MOVX1 0xD2.1 ,#0
	B0BCLR 0xD2.1
.stabn 0x44,0,90,L84-_led_control_one
L84:
;Line#90 	b1=1;

 	;MOVX1 0xD5.4 ,#1
	B0BSET 0xD5.4
.stabn 0x44,0,91,L85-_led_control_one
L85:
;Line#91 	b2=1;

 	;MOVX1 0xD2.5 ,#1
	B0BSET 0xD2.5
.stabn 0x44,0,92,L86-_led_control_one
L86:
;Line#92 	b3=1;

 	;MOVX1 0xD2.0 ,#1
	B0BSET 0xD2.0
.stabn 0xE0,0,1,L87-_led_control_one
L87:
.stabn 0x44,0,93,L88-_led_control_one
L88:
;Line#93   }

L33:
.stabn 0x44,0,95,L89-_led_control_one
L89:
;Line#95   if(led_delay_3==4)

 	;NEI1 L35 ,_led_delay_3 ,#4
	__SelectBANK _led_delay_3
	MOV A, _led_delay_3
	CMPRS A, #0x04
	JMP L35
.stabn 0xC0,0,1,L90-_led_control_one
L90:
.stabn 0x44,0,96,L91-_led_control_one
L91:
;Line#96   {

 .stabn 0x44,0,97,L92-_led_control_one
L92:
;Line#97   	r1=1;

 	;MOVX1 0xD0.0 ,#1
	B0BSET 0xD0.0
.stabn 0x44,0,98,L93-_led_control_one
L93:
;Line#98 	r2=1;

 	;MOVX1 0xD2.3 ,#1
	B0BSET 0xD2.3
.stabn 0x44,0,99,L94-_led_control_one
L94:
;Line#99 	r3=1;

 	;MOVX1 0xD2.2 ,#1
	B0BSET 0xD2.2
.stabn 0x44,0,100,L95-_led_control_one
L95:
;Line#100 	g1=1;

 	;MOVX1 0xD1.0 ,#1
	B0BSET 0xD1.0
.stabn 0x44,0,101,L96-_led_control_one
L96:
;Line#101     g2=1;

 	;MOVX1 0xD2.4 ,#1
	B0BSET 0xD2.4
.stabn 0x44,0,102,L97-_led_control_one
L97:
;Line#102 	g3=1;

 	;MOVX1 0xD2.1 ,#1
	B0BSET 0xD2.1
.stabn 0x44,0,103,L98-_led_control_one
L98:
;Line#103 	b1=0;

 	;MOVX1 0xD5.4 ,#0
	B0BCLR 0xD5.4
.stabn 0x44,0,104,L99-_led_control_one
L99:
;Line#104 	b2=0;

 	;MOVX1 0xD2.5 ,#0
	B0BCLR 0xD2.5
.stabn 0x44,0,105,L100-_led_control_one
L100:
;Line#105 	b3=0;

 	;MOVX1 0xD2.0 ,#0
	B0BCLR 0xD2.0
.stabn 0xE0,0,1,L101-_led_control_one
L101:
.stabn 0x44,0,106,L102-_led_control_one
L102:
;Line#106   }

L35:
.stabn 0xE0,0,0,L103-_led_control_one
L103:
.stabn 0x44,0,107,L104-_led_control_one
L104:
;Line#107 }

L26:
	RET
.stabs "led_control_two:F13",36,0,0,_led_control_two
_Function_led_control_two_code SEGMENT CODE INBANK USING _Function_led_control_two_data
_led_control_two:
.stabn 0xC0,0,0,L118-_led_control_two
L118:
.stabn 0x44,0,117,L119-_led_control_two
L119:
;Line#117 {

 .stabn 0x44,0,118,L120-_led_control_two
L120:
;Line#118   if(led_mode_init==0)

 	;NEX1 L106 ,_led_mode_init ,#0
	__SelectBANK _led_mode_init
	BTS0 _led_mode_init
	JMP L106
.stabn 0xC0,0,1,L121-_led_control_two
L121:
.stabn 0x44,0,119,L122-_led_control_two
L122:
;Line#119   {

 .stabn 0x44,0,120,L123-_led_control_two
L123:
;Line#120     led_mode_init=1;

 	;MOVX1 _led_mode_init ,#1
	BSET _led_mode_init
.stabn 0x44,0,121,L124-_led_control_two
L124:
;Line#121 	led_delay_3=0;

 	;MOVU1 _led_delay_3 ,#0
	__SelectBANK _led_delay_3
	CLR _led_delay_3
.stabn 0x44,0,122,L125-_led_control_two
L125:
;Line#122 	g1=1;

 	;MOVX1 0xD1.0 ,#1
	B0BSET 0xD1.0
.stabn 0x44,0,123,L126-_led_control_two
L126:
;Line#123 	r1=1;

 	;MOVX1 0xD0.0 ,#1
	B0BSET 0xD0.0
.stabn 0x44,0,124,L127-_led_control_two
L127:
;Line#124 	r2=1;

 	;MOVX1 0xD2.3 ,#1
	B0BSET 0xD2.3
.stabn 0x44,0,125,L128-_led_control_two
L128:
;Line#125 	r3=1;

 	;MOVX1 0xD2.2 ,#1
	B0BSET 0xD2.2
.stabn 0x44,0,126,L129-_led_control_two
L129:
;Line#126 	g2=1;

 	;MOVX1 0xD2.4 ,#1
	B0BSET 0xD2.4
.stabn 0x44,0,127,L130-_led_control_two
L130:
;Line#127 	g3=1;

 	;MOVX1 0xD2.1 ,#1
	B0BSET 0xD2.1
.stabn 0x44,0,128,L131-_led_control_two
L131:
;Line#128 	b1=1;

 	;MOVX1 0xD5.4 ,#1
	B0BSET 0xD5.4
.stabn 0x44,0,129,L132-_led_control_two
L132:
;Line#129 	b2=1;

 	;MOVX1 0xD2.5 ,#1
	B0BSET 0xD2.5
.stabn 0x44,0,130,L133-_led_control_two
L133:
;Line#130 	b3=1;

 	;MOVX1 0xD2.0 ,#1
	B0BSET 0xD2.0
.stabn 0xE0,0,1,L134-_led_control_two
L134:
.stabn 0x44,0,131,L135-_led_control_two
L135:
;Line#131   }

L106:
.stabn 0x44,0,133,L136-_led_control_two
L136:
;Line#133   if(led_delay_3 > 149)

 	;LE L108 ,_led_delay_3 ,#149
	__SelectBANK _led_delay_3
	MOV A, _led_delay_3
	CMPRS A, #0x95
	JLT L108
.stabn 0xC0,0,1,L137-_led_control_two
L137:
.stabn 0x44,0,134,L138-_led_control_two
L138:
;Line#134   {

 .stabn 0x44,0,135,L139-_led_control_two
L139:
;Line#135 	led_delay_3=0;

 	;MOVU1 _led_delay_3 ,#0
	CLR _led_delay_3
.stabn 0xE0,0,1,L140-_led_control_two
L140:
.stabn 0x44,0,136,L141-_led_control_two
L141:
;Line#136   }

L108:
.stabn 0x44,0,138,L142-_led_control_two
L142:
;Line#138   if(led_delay_3==0 || led_delay_3==4 || led_delay_3==8)

 	;EQ L113 ,_led_delay_3 ,#0
	__SelectBANK _led_delay_3
	MOV A, _led_delay_3
	JEQ L113
	;EQ L113 ,_led_delay_3 ,#4
	SUB A, #0x04
	JEQ L113
	;NEI1 L110 ,_led_delay_3 ,#8
	MOV A, _led_delay_3
	CMPRS A, #0x08
	JMP L110
L113:
.stabn 0xC0,0,1,L143-_led_control_two
L143:
.stabn 0x44,0,139,L144-_led_control_two
L144:
;Line#139   {

 .stabn 0x44,0,140,L145-_led_control_two
L145:
;Line#140 	b1 = 0;

 	;MOVX1 0xD5.4 ,#0
	B0BCLR 0xD5.4
.stabn 0x44,0,141,L146-_led_control_two
L146:
;Line#141     b2 = 0;

 	;MOVX1 0xD2.5 ,#0
	B0BCLR 0xD2.5
.stabn 0x44,0,142,L147-_led_control_two
L147:
;Line#142 	b3 = 0;

 	;MOVX1 0xD2.0 ,#0
	B0BCLR 0xD2.0
.stabn 0xE0,0,1,L148-_led_control_two
L148:
.stabn 0x44,0,143,L149-_led_control_two
L149:
;Line#143   }

L110:
.stabn 0x44,0,144,L150-_led_control_two
L150:
;Line#144   if(led_delay_3==2 ||led_delay_3==6|| led_delay_3==10)

 	;EQ L117 ,_led_delay_3 ,#2
	__SelectBANK _led_delay_3
	MOV A, _led_delay_3
	SUB A, #0x02
	JEQ L117
	;EQ L117 ,_led_delay_3 ,#6
	MOV A, _led_delay_3
	SUB A, #0x06
	JEQ L117
	;NEI1 L114 ,_led_delay_3 ,#10
	MOV A, _led_delay_3
	CMPRS A, #0x0a
	JMP L114
L117:
.stabn 0xC0,0,1,L151-_led_control_two
L151:
.stabn 0x44,0,145,L152-_led_control_two
L152:
;Line#145   {

 .stabn 0x44,0,146,L153-_led_control_two
L153:
;Line#146 	b1 = 1;

 	;MOVX1 0xD5.4 ,#1
	B0BSET 0xD5.4
.stabn 0x44,0,147,L154-_led_control_two
L154:
;Line#147     b2 = 1;

 	;MOVX1 0xD2.5 ,#1
	B0BSET 0xD2.5
.stabn 0x44,0,148,L155-_led_control_two
L155:
;Line#148 	b3 = 1;

 	;MOVX1 0xD2.0 ,#1
	B0BSET 0xD2.0
.stabn 0xE0,0,1,L156-_led_control_two
L156:
.stabn 0x44,0,149,L157-_led_control_two
L157:
;Line#149   }

L114:
.stabn 0xE0,0,0,L158-_led_control_two
L158:
.stabn 0x44,0,151,L159-_led_control_two
L159:
;Line#151 }

L105:
	RET
.stabs "led_control_three:F13",36,0,0,_led_control_three
_Function_led_control_three_code SEGMENT CODE INBANK USING _Function_led_control_three_data
_led_control_three:
.stabn 0xC0,0,0,L173-_led_control_three
L173:
.stabn 0x44,0,161,L174-_led_control_three
L174:
;Line#161 {

 .stabn 0x44,0,162,L175-_led_control_three
L175:
;Line#162   if(led_mode_init==0)

 	;NEX1 L161 ,_led_mode_init ,#0
	__SelectBANK _led_mode_init
	BTS0 _led_mode_init
	JMP L161
.stabn 0xC0,0,1,L176-_led_control_three
L176:
.stabn 0x44,0,163,L177-_led_control_three
L177:
;Line#163   {

 .stabn 0x44,0,164,L178-_led_control_three
L178:
;Line#164     led_mode_init=1;

 	;MOVX1 _led_mode_init ,#1
	BSET _led_mode_init
.stabn 0x44,0,165,L179-_led_control_three
L179:
;Line#165 	led_delay_3=0;

 	;MOVU1 _led_delay_3 ,#0
	__SelectBANK _led_delay_3
	CLR _led_delay_3
.stabn 0x44,0,166,L180-_led_control_three
L180:
;Line#166 	r1=1;

 	;MOVX1 0xD0.0 ,#1
	B0BSET 0xD0.0
.stabn 0x44,0,167,L181-_led_control_three
L181:
;Line#167 	r2=1;

 	;MOVX1 0xD2.3 ,#1
	B0BSET 0xD2.3
.stabn 0x44,0,168,L182-_led_control_three
L182:
;Line#168 	r3=1;

 	;MOVX1 0xD2.2 ,#1
	B0BSET 0xD2.2
.stabn 0x44,0,169,L183-_led_control_three
L183:
;Line#169 	g1=1;

 	;MOVX1 0xD1.0 ,#1
	B0BSET 0xD1.0
.stabn 0x44,0,170,L184-_led_control_three
L184:
;Line#170 	g2=1;

 	;MOVX1 0xD2.4 ,#1
	B0BSET 0xD2.4
.stabn 0x44,0,171,L185-_led_control_three
L185:
;Line#171 	g3=1;

 	;MOVX1 0xD2.1 ,#1
	B0BSET 0xD2.1
.stabn 0x44,0,172,L186-_led_control_three
L186:
;Line#172 	b1=1;

 	;MOVX1 0xD5.4 ,#1
	B0BSET 0xD5.4
.stabn 0x44,0,173,L187-_led_control_three
L187:
;Line#173 	b2=1;

 	;MOVX1 0xD2.5 ,#1
	B0BSET 0xD2.5
.stabn 0x44,0,174,L188-_led_control_three
L188:
;Line#174 	b3=1;

 	;MOVX1 0xD2.0 ,#1
	B0BSET 0xD2.0
.stabn 0xE0,0,1,L189-_led_control_three
L189:
.stabn 0x44,0,175,L190-_led_control_three
L190:
;Line#175   } 

L161:
.stabn 0x44,0,177,L191-_led_control_three
L191:
;Line#177   if(led_delay_3 > 150)

 	;LE L163 ,_led_delay_3 ,#150
	__SelectBANK _led_delay_3
	MOV A, _led_delay_3
	CMPRS A, #0x96
	JLT L163
.stabn 0xC0,0,1,L192-_led_control_three
L192:
.stabn 0x44,0,178,L193-_led_control_three
L193:
;Line#178   {

 .stabn 0x44,0,179,L194-_led_control_three
L194:
;Line#179 	led_delay_3=0;

 	;MOVU1 _led_delay_3 ,#0
	CLR _led_delay_3
.stabn 0xE0,0,1,L195-_led_control_three
L195:
.stabn 0x44,0,180,L196-_led_control_three
L196:
;Line#180   }

L163:
.stabn 0x44,0,182,L197-_led_control_three
L197:
;Line#182   if(led_delay_3==0 || led_delay_3==4 || led_delay_3==8)

 	;EQ L168 ,_led_delay_3 ,#0
	__SelectBANK _led_delay_3
	MOV A, _led_delay_3
	JEQ L168
	;EQ L168 ,_led_delay_3 ,#4
	SUB A, #0x04
	JEQ L168
	;NEI1 L165 ,_led_delay_3 ,#8
	MOV A, _led_delay_3
	CMPRS A, #0x08
	JMP L165
L168:
.stabn 0xC0,0,1,L198-_led_control_three
L198:
.stabn 0x44,0,183,L199-_led_control_three
L199:
;Line#183   {

 .stabn 0x44,0,184,L200-_led_control_three
L200:
;Line#184 	r1=0;

 	;MOVX1 0xD0.0 ,#0
	B0BCLR 0xD0.0
.stabn 0x44,0,185,L201-_led_control_three
L201:
;Line#185     r2=0;

 	;MOVX1 0xD2.3 ,#0
	B0BCLR 0xD2.3
.stabn 0x44,0,186,L202-_led_control_three
L202:
;Line#186 	r3=0;

 	;MOVX1 0xD2.2 ,#0
	B0BCLR 0xD2.2
.stabn 0xE0,0,1,L203-_led_control_three
L203:
.stabn 0x44,0,187,L204-_led_control_three
L204:
;Line#187   }

L165:
.stabn 0x44,0,188,L205-_led_control_three
L205:
;Line#188   if(led_delay_3==2 ||led_delay_3==6 || led_delay_3==10)

 	;EQ L172 ,_led_delay_3 ,#2
	__SelectBANK _led_delay_3
	MOV A, _led_delay_3
	SUB A, #0x02
	JEQ L172
	;EQ L172 ,_led_delay_3 ,#6
	MOV A, _led_delay_3
	SUB A, #0x06
	JEQ L172
	;NEI1 L169 ,_led_delay_3 ,#10
	MOV A, _led_delay_3
	CMPRS A, #0x0a
	JMP L169
L172:
.stabn 0xC0,0,1,L206-_led_control_three
L206:
.stabn 0x44,0,189,L207-_led_control_three
L207:
;Line#189   {

 .stabn 0x44,0,190,L208-_led_control_three
L208:
;Line#190   	r1=1;

 	;MOVX1 0xD0.0 ,#1
	B0BSET 0xD0.0
.stabn 0x44,0,191,L209-_led_control_three
L209:
;Line#191 	r2=1;

 	;MOVX1 0xD2.3 ,#1
	B0BSET 0xD2.3
.stabn 0x44,0,192,L210-_led_control_three
L210:
;Line#192 	r3=1;

 	;MOVX1 0xD2.2 ,#1
	B0BSET 0xD2.2
.stabn 0xE0,0,1,L211-_led_control_three
L211:
.stabn 0x44,0,193,L212-_led_control_three
L212:
;Line#193   }

L169:
.stabn 0xE0,0,0,L213-_led_control_three
L213:
.stabn 0x44,0,195,L214-_led_control_three
L214:
;Line#195 }

L160:
	RET
.stabs "led_control_four:F13",36,0,0,_led_control_four
_Function_led_control_four_code SEGMENT CODE INBANK USING _Function_led_control_four_data
_led_control_four:
.stabn 0xC0,0,0,L228-_led_control_four
L228:
.stabn 0x44,0,205,L229-_led_control_four
L229:
;Line#205 {

 .stabn 0x44,0,206,L230-_led_control_four
L230:
;Line#206   if(led_mode_init==0)

 	;NEX1 L216 ,_led_mode_init ,#0
	__SelectBANK _led_mode_init
	BTS0 _led_mode_init
	JMP L216
.stabn 0xC0,0,1,L231-_led_control_four
L231:
.stabn 0x44,0,207,L232-_led_control_four
L232:
;Line#207   {

 .stabn 0x44,0,208,L233-_led_control_four
L233:
;Line#208     led_mode_init=1;

 	;MOVX1 _led_mode_init ,#1
	BSET _led_mode_init
.stabn 0x44,0,209,L234-_led_control_four
L234:
;Line#209 	led_delay_3=0;

 	;MOVU1 _led_delay_3 ,#0
	__SelectBANK _led_delay_3
	CLR _led_delay_3
.stabn 0x44,0,210,L235-_led_control_four
L235:
;Line#210 	r1=1;

 	;MOVX1 0xD0.0 ,#1
	B0BSET 0xD0.0
.stabn 0x44,0,211,L236-_led_control_four
L236:
;Line#211 	g1=1;

 	;MOVX1 0xD1.0 ,#1
	B0BSET 0xD1.0
.stabn 0x44,0,212,L237-_led_control_four
L237:
;Line#212 	r2=1;

 	;MOVX1 0xD2.3 ,#1
	B0BSET 0xD2.3
.stabn 0x44,0,213,L238-_led_control_four
L238:
;Line#213 	r3=1;

 	;MOVX1 0xD2.2 ,#1
	B0BSET 0xD2.2
.stabn 0x44,0,214,L239-_led_control_four
L239:
;Line#214 	g2=1;

 	;MOVX1 0xD2.4 ,#1
	B0BSET 0xD2.4
.stabn 0x44,0,215,L240-_led_control_four
L240:
;Line#215 	g3=1;

 	;MOVX1 0xD2.1 ,#1
	B0BSET 0xD2.1
.stabn 0x44,0,216,L241-_led_control_four
L241:
;Line#216 	b1=1;

 	;MOVX1 0xD5.4 ,#1
	B0BSET 0xD5.4
.stabn 0x44,0,217,L242-_led_control_four
L242:
;Line#217 	b2=1;

 	;MOVX1 0xD2.5 ,#1
	B0BSET 0xD2.5
.stabn 0x44,0,218,L243-_led_control_four
L243:
;Line#218 	b3=1;

 	;MOVX1 0xD2.0 ,#1
	B0BSET 0xD2.0
.stabn 0xE0,0,1,L244-_led_control_four
L244:
.stabn 0x44,0,219,L245-_led_control_four
L245:
;Line#219   }

L216:
.stabn 0x44,0,221,L246-_led_control_four
L246:
;Line#221   if(led_delay_3 > 149)

 	;LE L218 ,_led_delay_3 ,#149
	__SelectBANK _led_delay_3
	MOV A, _led_delay_3
	CMPRS A, #0x95
	JLT L218
.stabn 0xC0,0,1,L247-_led_control_four
L247:
.stabn 0x44,0,222,L248-_led_control_four
L248:
;Line#222   {

 .stabn 0x44,0,223,L249-_led_control_four
L249:
;Line#223 	led_delay_3=0;

 	;MOVU1 _led_delay_3 ,#0
	CLR _led_delay_3
.stabn 0xE0,0,1,L250-_led_control_four
L250:
.stabn 0x44,0,224,L251-_led_control_four
L251:
;Line#224   }

L218:
.stabn 0x44,0,226,L252-_led_control_four
L252:
;Line#226   if(led_delay_3==0 || led_delay_3==4 || led_delay_3==8)

 	;EQ L223 ,_led_delay_3 ,#0
	__SelectBANK _led_delay_3
	MOV A, _led_delay_3
	JEQ L223
	;EQ L223 ,_led_delay_3 ,#4
	SUB A, #0x04
	JEQ L223
	;NEI1 L220 ,_led_delay_3 ,#8
	MOV A, _led_delay_3
	CMPRS A, #0x08
	JMP L220
L223:
.stabn 0xC0,0,1,L253-_led_control_four
L253:
.stabn 0x44,0,227,L254-_led_control_four
L254:
;Line#227   {

 .stabn 0x44,0,228,L255-_led_control_four
L255:
;Line#228 	g1 = 0;

 	;MOVX1 0xD1.0 ,#0
	B0BCLR 0xD1.0
.stabn 0x44,0,229,L256-_led_control_four
L256:
;Line#229     g2 = 0;

 	;MOVX1 0xD2.4 ,#0
	B0BCLR 0xD2.4
.stabn 0x44,0,230,L257-_led_control_four
L257:
;Line#230 	g3 = 0;

 	;MOVX1 0xD2.1 ,#0
	B0BCLR 0xD2.1
.stabn 0xE0,0,1,L258-_led_control_four
L258:
.stabn 0x44,0,231,L259-_led_control_four
L259:
;Line#231   }

L220:
.stabn 0x44,0,232,L260-_led_control_four
L260:
;Line#232   if(led_delay_3==2 ||led_delay_3==6 || led_delay_3==10)

 	;EQ L227 ,_led_delay_3 ,#2
	__SelectBANK _led_delay_3
	MOV A, _led_delay_3
	SUB A, #0x02
	JEQ L227
	;EQ L227 ,_led_delay_3 ,#6
	MOV A, _led_delay_3
	SUB A, #0x06
	JEQ L227
	;NEI1 L224 ,_led_delay_3 ,#10
	MOV A, _led_delay_3
	CMPRS A, #0x0a
	JMP L224
L227:
.stabn 0xC0,0,1,L261-_led_control_four
L261:
.stabn 0x44,0,233,L262-_led_control_four
L262:
;Line#233   {

 .stabn 0x44,0,234,L263-_led_control_four
L263:
;Line#234 	g1 = 1;

 	;MOVX1 0xD1.0 ,#1
	B0BSET 0xD1.0
.stabn 0x44,0,235,L264-_led_control_four
L264:
;Line#235     g2 = 1;

 	;MOVX1 0xD2.4 ,#1
	B0BSET 0xD2.4
.stabn 0x44,0,236,L265-_led_control_four
L265:
;Line#236 	g3 = 1;

 	;MOVX1 0xD2.1 ,#1
	B0BSET 0xD2.1
.stabn 0xE0,0,1,L266-_led_control_four
L266:
.stabn 0x44,0,237,L267-_led_control_four
L267:
;Line#237   }

L224:
.stabn 0xE0,0,0,L268-_led_control_four
L268:
.stabn 0x44,0,238,L269-_led_control_four
L269:
;Line#238 }
L215:
	RET
.stabs "_intrinsicbitfield:T15=s1bit0:12,0,1;bit1:12,1,1;bit2:12,2,1;\\",128,0,0,0
.stabs "bit3:12,3,1;bit4:12,4,1;bit5:12,5,1;bit6:12,6,1;bit7:12,7,1;;",128,0,0,0
.stabs "", 100, 0, 0,Letext
Letext:
.stabs "led_mode:G9",32,0,0,_led_mode
.stabs "led_delay_3:G9",32,0,0,_led_delay_3
.stabs "led_delay_2:G9",32,0,0,_led_delay_2
.stabs "led_delay_1:G9",32,0,0,_led_delay_1
.stabs "led_mode_init:G300",32,0,0,_led_mode_init
