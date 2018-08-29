
;----------------------------------------------------
;  Copyright (c) 2003-2013 SONiX Technology Co., Ltd.
;  Sonix SN8 C Compiler - V2.01
;----------------------------------------------------

CHIP SN8P2511

INCLUDE <sncc_macros.h>
EXTERN DATA T
EXTERN DATA I
.CODE
.stabs "lcc4_compiled.",0x3C,0,0,0
.stabs "E:\guomeng\2015ÄêÏîÄ¿\pir_sensor\pir_sensor/",0x64,0,3,Ltext0
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

PUBLIC _gpio_init
PUBLIC _time_init
PUBLIC _main
PUBLIC _interrupt_isr_isr
PUBLIC _out_enable
PUBLIC _int_trigger
PUBLIC _out_finish
PUBLIC _on_trigger
PUBLIC _open_trigger
PUBLIC _int_wave_up
PUBLIC _out_delay
_out_delay@segment SEGMENT DATA INBANK
	_out_delay DS 1
PUBLIC _sleep_delay_3
_sleep_delay_3@segment SEGMENT DATA INBANK
	_sleep_delay_3 DS 1
PUBLIC _sleep_delay_2
_sleep_delay_2@segment SEGMENT DATA INBANK
	_sleep_delay_2 DS 1
PUBLIC _sleep_delay_1
_sleep_delay_1@segment SEGMENT DATA INBANK
	_sleep_delay_1 DS 1

_main_c_GlobalBitDataPool0 BITSEGMENT DATA BANK 0 INBANK
	_out_enable DSBIT 1
	_int_trigger DSBIT 1
	_out_finish DSBIT 1
	_on_trigger DSBIT 1
	_open_trigger DSBIT 1
	_int_wave_up DSBIT 1

_Function_gpio_init_data SEGMENT DATA INBANK

_Function_time_init_data SEGMENT DATA INBANK

_Function_main_data SEGMENT DATA INBANK

_DEFINE_ISRBACKUP_DATA 2
_Function_interrupt_isr_isr_data SEGMENT DATA INBANK

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
.stabs "gpio_init:F13",36,0,0,_gpio_init
_Function_gpio_init_code SEGMENT CODE INBANK USING _Function_gpio_init_data
_gpio_init:
.stabn 0xC0,0,0,L2-_gpio_init
L2:
.stabn 0x44,0,31,L3-_gpio_init
L3:
;Line#31 {

 .stabn 0x44,0,32,L4-_gpio_init
L4:
;Line#32   P0M=0x00;

 	;MOVU1 0xB8 ,#0
	__SelectBANKCNST 0
	CLR (0xB8 & 0xFF)
.stabn 0x44,0,34,L5-_gpio_init
L5:
;Line#34   INTRQ=0x00;

 	;MOVU1 0xC8 ,#0
	__SelectBANKCNST 0
	CLR (0xC8 & 0xFF)
.stabn 0x44,0,35,L6-_gpio_init
L6:
;Line#35   INTEN=0x01;

 	;MOVU1 0xC9 ,#1
	MOV A, #0x01
	B0MOV 0xC9, A
.stabn 0x44,0,36,L7-_gpio_init
L7:
;Line#36   PEDGE=0x08;

 	;MOVU1 0xBF ,#8
	MOV A, #0x08
	B0MOV 0xBF, A
.stabn 0x44,0,37,L8-_gpio_init
L8:
;Line#37   FGIE=1;

 	;MOVX1 0xDF.7 ,#1
	B0BSET 0xDF.7
.stabn 0x44,0,39,L9-_gpio_init
L9:
;Line#39   P1M=0xfe;

 	;MOVU1 0xC1 ,#254
	MOV A, #0xfe
	B0MOV 0xC1, A
.stabn 0x44,0,40,L10-_gpio_init
L10:
;Line#40   P1UR=0x01;

 	;MOVU1 0xE1 ,#1
	MOV A, #0x01
	B0MOV 0xE1, A
.stabn 0x44,0,41,L11-_gpio_init
L11:
;Line#41   P1=0x00;

 	;MOVU1 0xD1 ,#0
	__SelectBANKCNST 0
	CLR (0xD1 & 0xFF)
.stabn 0x44,0,42,L12-_gpio_init
L12:
;Line#42   P1W=0x01;

 	;MOVU1 0xC0 ,#1
	B0MOV 0xC0, A
.stabn 0x44,0,44,L13-_gpio_init
L13:
;Line#44   P2M=0xff;

 	;MOVU1 0xC2 ,#255
	MOV A, #0xff
	B0MOV 0xC2, A
.stabn 0x44,0,45,L14-_gpio_init
L14:
;Line#45   P2=0x00;

 	;MOVU1 0xD2 ,#0
	__SelectBANKCNST 0
	CLR (0xD2 & 0xFF)
.stabn 0x44,0,47,L15-_gpio_init
L15:
;Line#47   P5M=0xff;

 	;MOVU1 0xC5 ,#255
	B0MOV 0xC5, A
.stabn 0x44,0,48,L16-_gpio_init
L16:
;Line#48   P5=0x10;

 	;MOVU1 0xD5 ,#16
	MOV A, #0x10
	B0MOV 0xD5, A
.stabn 0xE0,0,0,L17-_gpio_init
L17:
.stabn 0x44,0,49,L18-_gpio_init
L18:
;Line#49 }

L1:
	RET
.stabs "time_init:F13",36,0,0,_time_init
_Function_time_init_code SEGMENT CODE INBANK USING _Function_time_init_data
_time_init:
.stabn 0xC0,0,0,L20-_time_init
L20:
.stabn 0x44,0,53,L21-_time_init
L21:
;Line#53 {

 .stabn 0x44,0,54,L22-_time_init
L22:
;Line#54   TC0C=156;

 	;MOVU1 0xDB ,#156
	MOV A, #0x9c
	B0MOV 0xDB, A
.stabn 0x44,0,55,L23-_time_init
L23:
;Line#55   TC0R=156;

 	;MOVU1 0xCD ,#156
	B0MOV 0xCD, A
.stabn 0x44,0,56,L24-_time_init
L24:
;Line#56   TC0M=0xf4;

 	;MOVU1 0xDA ,#244
	MOV A, #0xf4
	B0MOV 0xDA, A
.stabn 0xE0,0,0,L25-_time_init
L25:
.stabn 0x44,0,57,L26-_time_init
L26:
;Line#57 }

L19:
	RET
.stabs "main:F13",36,0,0,_main
_Function_main_code SEGMENT CODE INBANK USING _Function_main_data
_main:
.stabn 0xC0,0,0,L67-_main
L67:
.stabn 0x44,0,61,L68-_main
L68:
;Line#61 {

 .stabn 0x44,0,62,L69-_main
L69:
;Line#62   OSCM=0x06;

 	;MOVU1 0xCA ,#6
	MOV A, #0x06
	B0MOV 0xCA, A
.stabn 0x44,0,63,L70-_main
L70:
;Line#63   gpio_init();

 	;CALLV _gpio_init
	CALL _gpio_init
.stabn 0x44,0,64,L71-_main
L71:
;Line#64   time_init();

 	;CALLV _time_init
	CALL _time_init
L28:
.stabn 0xC0,0,1,L72-_main
L72:
.stabn 0x44,0,67,L73-_main
L73:
;Line#67   {

 .stabn 0x44,0,68,L74-_main
L74:
;Line#68     if(FTC0IRQ)

 	;EQ L31 ,0xC8.5 ,#0
	B0BTS1 0xC8.5
	JMP L31
.stabn 0xC0,0,2,L75-_main
L75:
.stabn 0x44,0,69,L76-_main
L76:
;Line#69 	{

 .stabn 0x44,0,70,L77-_main
L77:
;Line#70 	  FTC0IRQ=0;

 	;MOVX1 0xC8.5 ,#0
	B0BCLR 0xC8.5
.stabn 0x44,0,74,L78-_main
L78:
;Line#74       if(key2)

 	;EQ L33 ,0xD1.0 ,#0
	B0BTS1 0xD1.0
	JMP L33
.stabn 0xC0,0,3,L79-_main
L79:
.stabn 0x44,0,75,L80-_main
L80:
;Line#75 	  {

 .stabn 0x44,0,76,L81-_main
L81:
;Line#76 	    if((open_trigger==0)&&(out_finish==0))

 	;NEX1 L34 ,_open_trigger ,#0
	__SelectBANK _open_trigger
	BTS0 _open_trigger
	JMP L34
	;NEX1 L34 ,_out_finish ,#0
	__SelectBANK _out_finish
	BTS0 _out_finish
	JMP L34
.stabn 0xC0,0,4,L82-_main
L82:
.stabn 0x44,0,77,L83-_main
L83:
;Line#77 		{

 .stabn 0x44,0,78,L84-_main
L84:
;Line#78 		  open_trigger=1;

 	;MOVX1 _open_trigger ,#1
	__SelectBANK _open_trigger
	BSET _open_trigger
.stabn 0x44,0,79,L85-_main
L85:
;Line#79 		  on_trigger=0;

 	;MOVX1 _on_trigger ,#0
	__SelectBANK _on_trigger
	BCLR _on_trigger
.stabn 0x44,0,80,L86-_main
L86:
;Line#80 		  out_finish=1;

 	;MOVX1 _out_finish ,#1
	__SelectBANK _out_finish
	BSET _out_finish
.stabn 0x44,0,81,L87-_main
L87:
;Line#81 		  out_enable=1;

 	;MOVX1 _out_enable ,#1
	__SelectBANK _out_enable
	BSET _out_enable
.stabn 0x44,0,82,L88-_main
L88:
;Line#82 		  out=0;

 	;MOVX1 0xD5.4 ,#0
	B0BCLR 0xD5.4
.stabn 0x44,0,83,L89-_main
L89:
;Line#83 		  out_led=0;

 	;MOVX1 0xD1.2 ,#0
	B0BCLR 0xD1.2
.stabn 0x44,0,84,L90-_main
L90:
;Line#84 		  out_delay=0;

 	;MOVU1 _out_delay ,#0
	__SelectBANK _out_delay
	CLR _out_delay
.stabn 0xE0,0,4,L91-_main
L91:
.stabn 0x44,0,85,L92-_main
L92:
;Line#85 		}

 .stabn 0xE0,0,3,L93-_main
L93:
.stabn 0x44,0,86,L94-_main
L94:
;Line#86 	  }

	JMP L34
L33:
.stabn 0xC0,0,3,L95-_main
L95:
.stabn 0x44,0,88,L96-_main
L96:
;Line#88       {

 .stabn 0x44,0,89,L97-_main
L97:
;Line#89 	    if((on_trigger==0)&&(out_finish==0))

 	;NEX1 L37 ,_on_trigger ,#0
	__SelectBANK _on_trigger
	BTS0 _on_trigger
	JMP L37
	;NEX1 L37 ,_out_finish ,#0
	__SelectBANK _out_finish
	BTS0 _out_finish
	JMP L37
.stabn 0xC0,0,4,L98-_main
L98:
.stabn 0x44,0,90,L99-_main
L99:
;Line#90 		{

 .stabn 0x44,0,91,L100-_main
L100:
;Line#91 		  on_trigger=1;

 	;MOVX1 _on_trigger ,#1
	__SelectBANK _on_trigger
	BSET _on_trigger
.stabn 0x44,0,92,L101-_main
L101:
;Line#92 		  open_trigger=0;

 	;MOVX1 _open_trigger ,#0
	__SelectBANK _open_trigger
	BCLR _open_trigger
.stabn 0x44,0,93,L102-_main
L102:
;Line#93 		  out_finish=1;

 	;MOVX1 _out_finish ,#1
	__SelectBANK _out_finish
	BSET _out_finish
.stabn 0x44,0,94,L103-_main
L103:
;Line#94 		  out=0;

 	;MOVX1 0xD5.4 ,#0
	B0BCLR 0xD5.4
.stabn 0x44,0,95,L104-_main
L104:
;Line#95 		  out_delay=0;

 	;MOVU1 _out_delay ,#0
	__SelectBANK _out_delay
	CLR _out_delay
.stabn 0x44,0,96,L105-_main
L105:
;Line#96 		  int_wave_up=0;

 	;MOVX1 _int_wave_up ,#0
	__SelectBANK _int_wave_up
	BCLR _int_wave_up
.stabn 0x44,0,97,L106-_main
L106:
;Line#97 		  out_led=0;

 	;MOVX1 0xD1.2 ,#0
	B0BCLR 0xD1.2
.stabn 0x44,0,98,L107-_main
L107:
;Line#98 		  out_enable=1;

 	;MOVX1 _out_enable ,#1
	__SelectBANK _out_enable
	BSET _out_enable
.stabn 0x44,0,99,L108-_main
L108:
;Line#99 		  sleep_delay_3=0;

 	;MOVU1 _sleep_delay_3 ,#0
	__SelectBANK _sleep_delay_3
	CLR _sleep_delay_3
.stabn 0xE0,0,4,L109-_main
L109:
.stabn 0x44,0,100,L110-_main
L110:
;Line#100 		}

	JMP L38
L37:
.stabn 0xC0,0,4,L111-_main
L111:
.stabn 0x44,0,102,L112-_main
L112:
;Line#102 		{

 .stabn 0x44,0,103,L113-_main
L113:
;Line#103 		  if(out_finish==0)

 	;NEX1 L39 ,_out_finish ,#0
	__SelectBANK _out_finish
	BTS0 _out_finish
	JMP L39
.stabn 0xC0,0,5,L114-_main
L114:
.stabn 0x44,0,104,L115-_main
L115:
;Line#104 		  {

 .stabn 0x44,0,105,L116-_main
L116:
;Line#105 		    if(int_wave_up)

 	;EQ L41 ,_int_wave_up ,#0
	__SelectBANK _int_wave_up
	BTS1 _int_wave_up
	JMP L41
.stabn 0xC0,0,6,L117-_main
L117:
.stabn 0x44,0,106,L118-_main
L118:
;Line#106 			{

 .stabn 0x44,0,107,L119-_main
L119:
;Line#107 			  int_trigger=1;

 	;MOVX1 _int_trigger ,#1
	__SelectBANK _int_trigger
	BSET _int_trigger
.stabn 0xE0,0,6,L120-_main
L120:
.stabn 0x44,0,108,L121-_main
L121:
;Line#108 			}

L41:
.stabn 0xE0,0,5,L122-_main
L122:
.stabn 0x44,0,109,L123-_main
L123:
;Line#109 		  }

L39:
.stabn 0xE0,0,4,L124-_main
L124:
.stabn 0x44,0,110,L125-_main
L125:
;Line#110 		}

L38:
.stabn 0xE0,0,3,L126-_main
L126:
.stabn 0x44,0,111,L127-_main
L127:
;Line#111       }

L34:
.stabn 0x44,0,113,L128-_main
L128:
;Line#113 	  if(out_enable)

 	;EQ L43 ,_out_enable ,#0
	__SelectBANK _out_enable
	BTS1 _out_enable
	JMP L43
.stabn 0xC0,0,3,L129-_main
L129:
.stabn 0x44,0,114,L130-_main
L130:
;Line#114 	  {

 .stabn 0x44,0,115,L131-_main
L131:
;Line#115 	    out_delay+=1;

 	;ADDU1 _out_delay ,_out_delay ,#1
	__SelectBANK _out_delay
	INCMS _out_delay
	NOP
.stabn 0x44,0,116,L132-_main
L132:
;Line#116 		if(out_delay>2)

 	;LE L44 ,_out_delay ,#2
	MOV A, _out_delay
	CMPRS A, #0x02
	JLT L44
.stabn 0xC0,0,4,L133-_main
L133:
.stabn 0x44,0,117,L134-_main
L134:
;Line#117 		{

 .stabn 0x44,0,118,L135-_main
L135:
;Line#118 		  out_delay=0;

 	;MOVU1 _out_delay ,#0
	CLR _out_delay
.stabn 0x44,0,119,L136-_main
L136:
;Line#119 		  out=1;

 	;MOVX1 0xD5.4 ,#1
	B0BSET 0xD5.4
.stabn 0x44,0,120,L137-_main
L137:
;Line#120 		  out_finish=0;

 	;MOVX1 _out_finish ,#0
	__SelectBANK _out_finish
	BCLR _out_finish
.stabn 0x44,0,121,L138-_main
L138:
;Line#121 		  out_enable=0;

 	;MOVX1 _out_enable ,#0
	__SelectBANK _out_enable
	BCLR _out_enable
.stabn 0x44,0,123,L139-_main
L139:
;Line#123 		   FCPUM1=0;

 	;MOVX1 0xCA.4 ,#0
	B0BCLR 0xCA.4
.stabn 0x44,0,124,L140-_main
L140:
;Line#124 	       FCPUM0=1;

 	;MOVX1 0xCA.3 ,#1
	B0BSET 0xCA.3
.stabn 0x44,0,125,L141-_main
L141:
;Line#125 		   FCLKMD=1;

 	;MOVX1 0xCA.2 ,#1
	B0BSET 0xCA.2
.stabn 0x44,0,126,L142-_main
L142:
;Line#126 		   FSTPHX=1;

 	;MOVX1 0xCA.1 ,#1
	B0BSET 0xCA.1
.stabn 0xE0,0,4,L143-_main
L143:
.stabn 0x44,0,127,L144-_main
L144:
;Line#127 		}

 .stabn 0xE0,0,3,L145-_main
L145:
.stabn 0x44,0,128,L146-_main
L146:
;Line#128 	  }

	JMP L44
L43:
.stabn 0x44,0,129,L147-_main
L147:
;Line#129 	  else if(int_trigger==1)

 	;NEX1 L47 ,_int_trigger ,#1
	__SelectBANK _int_trigger
	BTS1 _int_trigger
	JMP L47
.stabn 0xC0,0,3,L148-_main
L148:
.stabn 0x44,0,130,L149-_main
L149:
;Line#130 	  {

 .stabn 0x44,0,131,L150-_main
L150:
;Line#131 		sleep_delay_1+=1;

 	;ADDU1 _sleep_delay_1 ,_sleep_delay_1 ,#1
	__SelectBANK _sleep_delay_1
	INCMS _sleep_delay_1
	NOP
.stabn 0x44,0,132,L151-_main
L151:
;Line#132 		if(sleep_delay_1>4)

 	;LE L49 ,_sleep_delay_1 ,#4
	MOV A, _sleep_delay_1
	CMPRS A, #0x04
	JLT L49
.stabn 0xC0,0,4,L152-_main
L152:
.stabn 0x44,0,133,L153-_main
L153:
;Line#133 		{

 .stabn 0x44,0,134,L154-_main
L154:
;Line#134 		  sleep_delay_1=0;

 	;MOVU1 _sleep_delay_1 ,#0
	CLR _sleep_delay_1
.stabn 0x44,0,135,L155-_main
L155:
;Line#135 		  sleep_delay_2+=1;

 	;ADDU1 _sleep_delay_2 ,_sleep_delay_2 ,#1
	__SelectBANK _sleep_delay_2
	INCMS _sleep_delay_2
	NOP
.stabn 0x44,0,136,L156-_main
L156:
;Line#136 		  if(sleep_delay_2>124)

 	;LE L51 ,_sleep_delay_2 ,#124
	MOV A, _sleep_delay_2
	CMPRS A, #0x7c
	JLT L51
.stabn 0xC0,0,5,L157-_main
L157:
.stabn 0x44,0,137,L158-_main
L158:
;Line#137 		  {

 .stabn 0x44,0,138,L159-_main
L159:
;Line#138 		    out_led=0;

 	;MOVX1 0xD1.2 ,#0
	B0BCLR 0xD1.2
.stabn 0x44,0,139,L160-_main
L160:
;Line#139 		    sleep_delay_2=0;

 	;MOVU1 _sleep_delay_2 ,#0
	CLR _sleep_delay_2
.stabn 0x44,0,140,L161-_main
L161:
;Line#140 			sleep_delay_3=6;

 	;MOVU1 _sleep_delay_3 ,#6
	MOV A, #0x06
	__SelectBANK _sleep_delay_3
	MOV _sleep_delay_3, A
.stabn 0xE0,0,5,L162-_main
L162:
.stabn 0x44,0,141,L163-_main
L163:
;Line#141 		  }

L51:
.stabn 0xE0,0,4,L164-_main
L164:
.stabn 0x44,0,142,L165-_main
L165:
;Line#142 		}

L49:
.stabn 0x44,0,144,L166-_main
L166:
;Line#144 		sleep_delay_3+=1;

 	;ADDU1 _sleep_delay_3 ,_sleep_delay_3 ,#1
	__SelectBANK _sleep_delay_3
	INCMS _sleep_delay_3
	NOP
.stabn 0x44,0,145,L167-_main
L167:
;Line#145 		if(sleep_delay_3>6)

 	;LE L53 ,_sleep_delay_3 ,#6
	MOV A, _sleep_delay_3
	CMPRS A, #0x06
	JLT L53
.stabn 0xC0,0,4,L168-_main
L168:
.stabn 0x44,0,146,L169-_main
L169:
;Line#146 		{

 .stabn 0x44,0,147,L170-_main
L170:
;Line#147 		  if(sleep_delay_3==8)

 	;NEI1 L55 ,_sleep_delay_3 ,#8
	CMPRS A, #0x08
	JMP L55
.stabn 0xC0,0,5,L171-_main
L171:
.stabn 0x44,0,148,L172-_main
L172:
;Line#148 		  {

 .stabn 0x44,0,149,L173-_main
L173:
;Line#149 		   FGIE=0;

 	;MOVX1 0xDF.7 ,#0
	B0BCLR 0xDF.7
.stabn 0x44,0,150,L174-_main
L174:
;Line#150 		   out=0;

 	;MOVX1 0xD5.4 ,#0
	B0BCLR 0xD5.4
.stabn 0x44,0,151,L175-_main
L175:
;Line#151 		   out_finish=1;

 	;MOVX1 _out_finish ,#1
	__SelectBANK _out_finish
	BSET _out_finish
.stabn 0xE0,0,5,L176-_main
L176:
.stabn 0x44,0,152,L177-_main
L177:
;Line#152 		  }

L55:
.stabn 0x44,0,154,L178-_main
L178:
;Line#154 		  if(sleep_delay_3==9)

 	;NEI1 L57 ,_sleep_delay_3 ,#9
	__SelectBANK _sleep_delay_3
	MOV A, _sleep_delay_3
	CMPRS A, #0x09
	JMP L57
.stabn 0xC0,0,5,L179-_main
L179:
.stabn 0x44,0,155,L180-_main
L180:
;Line#155 		  {

 .stabn 0x44,0,156,L181-_main
L181:
;Line#156 		    out=1;

 	;MOVX1 0xD5.4 ,#1
	B0BSET 0xD5.4
.stabn 0x44,0,157,L182-_main
L182:
;Line#157 			out_finish=0;

 	;MOVX1 _out_finish ,#0
	__SelectBANK _out_finish
	BCLR _out_finish
.stabn 0xE0,0,5,L183-_main
L183:
.stabn 0x44,0,158,L184-_main
L184:
;Line#158            }

L57:
.stabn 0x44,0,159,L185-_main
L185:
;Line#159 		   if(sleep_delay_3>113)

 	;LE L54 ,_sleep_delay_3 ,#113
	__SelectBANK _sleep_delay_3
	MOV A, _sleep_delay_3
	CMPRS A, #0x71
	JLT L54
.stabn 0xC0,0,5,L186-_main
L186:
.stabn 0x44,0,160,L187-_main
L187:
;Line#160 		   { 

 .stabn 0x44,0,161,L188-_main
L188:
;Line#161 			  int_wave_up=0;

 	;MOVX1 _int_wave_up ,#0
	__SelectBANK _int_wave_up
	BCLR _int_wave_up
.stabn 0x44,0,162,L189-_main
L189:
;Line#162 			  int_trigger=0;

 	;MOVX1 _int_trigger ,#0
	__SelectBANK _int_trigger
	BCLR _int_trigger
.stabn 0x44,0,163,L190-_main
L190:
;Line#163 			  sleep_delay_3=0;

 	;MOVU1 _sleep_delay_3 ,#0
	__SelectBANK _sleep_delay_3
	CLR _sleep_delay_3
.stabn 0x44,0,164,L191-_main
L191:
;Line#164 			  FP00IRQ=0;

 	;MOVX1 0xC8.0 ,#0
	B0BCLR 0xC8.0
.stabn 0x44,0,165,L192-_main
L192:
;Line#165 			  FGIE=1;

 	;MOVX1 0xDF.7 ,#1
	B0BSET 0xDF.7
.stabn 0x44,0,166,L193-_main
L193:
;Line#166 		      FCPUM1=0;

 	;MOVX1 0xCA.4 ,#0
	B0BCLR 0xCA.4
.stabn 0x44,0,167,L194-_main
L194:
;Line#167 	      	  FCPUM0=1;

 	;MOVX1 0xCA.3 ,#1
	B0BSET 0xCA.3
.stabn 0x44,0,168,L195-_main
L195:
;Line#168 		   	  FCLKMD=1;

 	;MOVX1 0xCA.2 ,#1
	B0BSET 0xCA.2
.stabn 0x44,0,169,L196-_main
L196:
;Line#169 		      FSTPHX=1;

 	;MOVX1 0xCA.1 ,#1
	B0BSET 0xCA.1
.stabn 0xE0,0,5,L197-_main
L197:
.stabn 0x44,0,170,L198-_main
L198:
;Line#170 		  }

 .stabn 0xE0,0,4,L199-_main
L199:
.stabn 0x44,0,171,L200-_main
L200:
;Line#171 		}

	JMP L54
L53:
.stabn 0xC0,0,4,L201-_main
L201:
.stabn 0x44,0,173,L202-_main
L202:
;Line#173 		{

 .stabn 0x44,0,174,L203-_main
L203:
;Line#174 		  if(sleep_delay_3>4) sleep_delay_3=4;

 	;LE L61 ,_sleep_delay_3 ,#4
	__SelectBANK _sleep_delay_3
	MOV A, _sleep_delay_3
	CMPRS A, #0x04
	JLT L61
.stabn 0x44,0,174,L204-_main
L204:
;Line#174 		  if(sleep_delay_3>4) sleep_delay_3=4;

 	;MOVU1 _sleep_delay_3 ,#4
	MOV A, #0x04
	MOV _sleep_delay_3, A
	JMP L62
L61:
.stabn 0xC0,0,5,L205-_main
L205:
.stabn 0x44,0,176,L206-_main
L206:
;Line#176 		  {

 .stabn 0x44,0,177,L207-_main
L207:
;Line#177             if(sleep_delay_3>3)

 	;LE L63 ,_sleep_delay_3 ,#3
	__SelectBANK _sleep_delay_3
	MOV A, _sleep_delay_3
	CMPRS A, #0x03
	JLT L63
.stabn 0xC0,0,6,L208-_main
L208:
.stabn 0x44,0,178,L209-_main
L209:
;Line#178 			{

 .stabn 0x44,0,179,L210-_main
L210:
;Line#179 			  out=1;

 	;MOVX1 0xD5.4 ,#1
	B0BSET 0xD5.4
.stabn 0x44,0,180,L211-_main
L211:
;Line#180 		      out_finish=0;

 	;MOVX1 _out_finish ,#0
	__SelectBANK _out_finish
	BCLR _out_finish
.stabn 0xE0,0,6,L212-_main
L212:
.stabn 0x44,0,181,L213-_main
L213:
;Line#181 			}

	JMP L64
L63:
.stabn 0xC0,0,6,L214-_main
L214:
.stabn 0x44,0,183,L215-_main
L215:
;Line#183 			{

 .stabn 0x44,0,184,L216-_main
L216:
;Line#184 			  if(sleep_delay_3>1)

 	;LE L65 ,_sleep_delay_3 ,#1
	__SelectBANK _sleep_delay_3
	MOV A, _sleep_delay_3
	CMPRS A, #0x01
	JLT L65
.stabn 0xC0,0,7,L217-_main
L217:
.stabn 0x44,0,185,L218-_main
L218:
;Line#185 		      {

 .stabn 0x44,0,186,L219-_main
L219:
;Line#186 		       out=0;

 	;MOVX1 0xD5.4 ,#0
	B0BCLR 0xD5.4
.stabn 0x44,0,187,L220-_main
L220:
;Line#187 		       out_finish=1;

 	;MOVX1 _out_finish ,#1
	__SelectBANK _out_finish
	BSET _out_finish
.stabn 0xE0,0,7,L221-_main
L221:
.stabn 0x44,0,188,L222-_main
L222:
;Line#188 		      }

L65:
.stabn 0xE0,0,6,L223-_main
L223:
.stabn 0x44,0,189,L224-_main
L224:
;Line#189 		    }

L64:
.stabn 0xE0,0,5,L225-_main
L225:
.stabn 0x44,0,190,L226-_main
L226:
;Line#190           }

L62:
.stabn 0xE0,0,4,L227-_main
L227:
.stabn 0x44,0,191,L228-_main
L228:
;Line#191 		}

L54:
.stabn 0xE0,0,3,L229-_main
L229:
.stabn 0x44,0,192,L230-_main
L230:
;Line#192 	  }	    

L47:
L44:
.stabn 0xE0,0,2,L231-_main
L231:
.stabn 0x44,0,193,L232-_main
L232:
;Line#193     }

L31:
.stabn 0xE0,0,1,L233-_main
L233:
.stabn 0x44,0,194,L234-_main
L234:
;Line#194   }

L29:
.stabn 0x44,0,66,L235-_main
L235:
;Line#66   while(1)

	JMP L28
.stabn 0xE0,0,0,L236-_main
L236:
.stabn 0x44,0,195,L237-_main
L237:
;Line#195 }

L27:
_main_end:
	CALL __ClearWatchDogTimer
	JMP _main_end

CALLTREE _main invoke _gpio_init,_time_init

.stabs "interrupt_isr:F13",36,0,0,_interrupt_isr_isr

_interrupt@_interrupt_isr_isr SEGMENT CODE AT 0x8 INBANK
_vector_for_interrupt_isr_isr:
	JMP _interrupt_isr_isr

_Function_interrupt_isr_isr_code SEGMENT CODE INBANK USING _Function_interrupt_isr_isr_data
_interrupt_isr_isr:
	__PUSH_REG 2
.stabn 0xC0,0,0,L241-_interrupt_isr_isr
L241:
.stabn 0x44,0,201,L242-_interrupt_isr_isr
L242:
;Line#201 {

 .stabn 0x44,0,202,L243-_interrupt_isr_isr
L243:
;Line#202   if(FP00IRQ)

 	;EQ L239 ,0xC8.0 ,#0
	B0BTS1 0xC8.0
	JMP L239
.stabn 0xC0,0,1,L244-_interrupt_isr_isr
L244:
.stabn 0x44,0,203,L245-_interrupt_isr_isr
L245:
;Line#203   {

 .stabn 0x44,0,204,L246-_interrupt_isr_isr
L246:
;Line#204     int_wave_up=1;

 	;MOVX1 _int_wave_up ,#1
	__SelectBANK _int_wave_up
	BSET _int_wave_up
.stabn 0x44,0,205,L247-_interrupt_isr_isr
L247:
;Line#205 	out_led=1;

 	;MOVX1 0xD1.2 ,#1
	B0BSET 0xD1.2
.stabn 0x44,0,206,L248-_interrupt_isr_isr
L248:
;Line#206 	sleep_delay_1=0;

 	;MOVU1 _sleep_delay_1 ,#0
	__SelectBANK _sleep_delay_1
	CLR _sleep_delay_1
.stabn 0x44,0,207,L249-_interrupt_isr_isr
L249:
;Line#207 	sleep_delay_2=0;

 	;MOVU1 _sleep_delay_2 ,#0
	__SelectBANK _sleep_delay_2
	CLR _sleep_delay_2
.stabn 0xE0,0,1,L250-_interrupt_isr_isr
L250:
.stabn 0x44,0,208,L251-_interrupt_isr_isr
L251:
;Line#208   }

L239:
.stabn 0x44,0,209,L252-_interrupt_isr_isr
L252:
;Line#209   FP00IRQ=0;

 	;MOVX1 0xC8.0 ,#0
	B0BCLR 0xC8.0
.stabn 0xE0,0,0,L253-_interrupt_isr_isr
L253:
.stabn 0x44,0,210,L254-_interrupt_isr_isr
L254:
;Line#210 }
L238:
	__POP_REG 2
	RETI
.stabs "_intrinsicbitfield:T15=s1bit0:12,0,1;bit1:12,1,1;bit2:12,2,1;\\",128,0,0,0
.stabs "bit3:12,3,1;bit4:12,4,1;bit5:12,5,1;bit6:12,6,1;bit7:12,7,1;;",128,0,0,0
.stabs "", 100, 0, 0,Letext
Letext:
.stabs "out_enable:G300",32,0,0,_out_enable
.stabs "int_trigger:G301",32,0,0,_int_trigger
.stabs "out_finish:G302",32,0,0,_out_finish
.stabs "on_trigger:G303",32,0,0,_on_trigger
.stabs "open_trigger:G304",32,0,0,_open_trigger
.stabs "int_wave_up:G305",32,0,0,_int_wave_up
.stabs "out_delay:G9",32,0,0,_out_delay
.stabs "sleep_delay_3:G9",32,0,0,_sleep_delay_3
.stabs "sleep_delay_2:G9",32,0,0,_sleep_delay_2
.stabs "sleep_delay_1:G9",32,0,0,_sleep_delay_1
EXTERN CODE __ClearWatchDogTimer
