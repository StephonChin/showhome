
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
.stabs "F:\¹Ì°îÏîÄ¿\project\ZW-1104\ZW1104(Flood Sensor)&ZW1105 - 8½Å¿ØÖÆIC - 2511/",0x64,0,3,Ltext0
.stabs ".\Src\key.c",0x64,0,3,Ltext0
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

PUBLIC _key_scan
PUBLIC _flagWarningInit
PUBLIC _flagKeyTrigger
PUBLIC _out_enable
EXTERN DATA_BIT _power_save_enable

_key_c_GlobalBitDataPool0 BITSEGMENT DATA BANK 0 INBANK
	_flagWarningInit DSBIT 1
	_flagKeyTrigger DSBIT 1
	_out_enable DSBIT 1

_Function_key_scan_data SEGMENT DATA INBANK

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
_sdata3@segment SEGMENT DATA INBANK
	_sdata3 DS 1
_sdata4@segment SEGMENT DATA INBANK
	_sdata4 DS 1
_sdata5@segment SEGMENT DATA INBANK
	_sdata5 DS 1
_sdata6@segment BITSEGMENT DATA INBANK
	_sdata6 DSBIT 1
_sdata7@segment BITSEGMENT DATA INBANK
	_sdata7 DSBIT 1
_sdata8@segment BITSEGMENT DATA INBANK
	_sdata8 DSBIT 1
_sdata9@segment BITSEGMENT DATA INBANK
	_sdata9 DSBIT 1
_sdata10@segment BITSEGMENT DATA INBANK
	_sdata10 DSBIT 1
.stabs "key_scan:F13",36,0,0,_key_scan
_Function_key_scan_code SEGMENT CODE INBANK USING _Function_key_scan_data
_key_scan:
.stabn 0xC0,0,0,L33-_key_scan
L33:
.stabn 0x44,0,14,L34-_key_scan
L34:
;Line#14 {

 .stabn 0x44,0,27,L35-_key_scan
L35:
;Line#27   if(!out_enable)

 	;NEX1 L11 ,_out_enable ,#0
	__SelectBANK _out_enable
	BTS0 _out_enable
	JMP L11
.stabn 0xC0,0,1,L36-_key_scan
L36:
.stabn 0x44,0,28,L37-_key_scan
L37:
;Line#28   {

 .stabn 0x44,0,29,L38-_key_scan
L38:
;Line#29     if(sw1)

 	;EQ L13 ,0xD0.0 ,#0
	B0BTS1 0xD0.0
	JMP L13
.stabn 0xC0,0,2,L39-_key_scan
L39:
.stabn 0x44,0,30,L40-_key_scan
L40:
;Line#30     {

 .stabn 0x44,0,31,L41-_key_scan
L41:
;Line#31 	  sw1_count_1+=1;

 	;ADDU1 _sdata4 ,_sdata4 ,#1
	__SelectBANK _sdata4
	INCMS _sdata4
	NOP
.stabn 0x44,0,32,L42-_key_scan
L42:
;Line#32  	  sw1_count_2=0;

 	;MOVU1 _sdata5 ,#0
	__SelectBANK _sdata5
	CLR _sdata5
.stabn 0x44,0,33,L43-_key_scan
L43:
;Line#33 	  if(sw1_count_1>99)

 	;LE L14 ,_sdata4 ,#99
	__SelectBANK _sdata4
	MOV A, _sdata4
	CMPRS A, #0x63
	JLT L14
.stabn 0xC0,0,3,L44-_key_scan
L44:
.stabn 0x44,0,34,L45-_key_scan
L45:
;Line#34 	  { 

 .stabn 0x44,0,35,L46-_key_scan
L46:
;Line#35 	    sw1_count_1=0;

 	;MOVU1 _sdata4 ,#0
	CLR _sdata4
.stabn 0x44,0,36,L47-_key_scan
L47:
;Line#36 		sw1_have_done_2=0;

 	;MOVX1 _sdata9 ,#0
	__SelectBANK _sdata9
	BCLR _sdata9
.stabn 0x44,0,38,L48-_key_scan
L48:
;Line#38 		flagKeyTrigger = 1;

 	;MOVX1 _flagKeyTrigger ,#1
	__SelectBANK _flagKeyTrigger
	BSET _flagKeyTrigger
.stabn 0x44,0,39,L49-_key_scan
L49:
;Line#39 		flagWarningInit = 1;

 	;MOVX1 _flagWarningInit ,#1
	__SelectBANK _flagWarningInit
	BSET _flagWarningInit
.stabn 0x44,0,41,L50-_key_scan
L50:
;Line#41 		if(!sw1_have_done_1)

 	;NEX1 L14 ,_sdata8 ,#0
	__SelectBANK _sdata8
	BTS0 _sdata8
	JMP L14
.stabn 0xC0,0,4,L51-_key_scan
L51:
.stabn 0x44,0,42,L52-_key_scan
L52:
;Line#42 		{

 .stabn 0x44,0,43,L53-_key_scan
L53:
;Line#43 		  sw1_have_done_1=1;

 	;MOVX1 _sdata8 ,#1
	BSET _sdata8
.stabn 0x44,0,44,L54-_key_scan
L54:
;Line#44 		  power_save_enable=1; 			           

 	;MOVX1 _power_save_enable ,#1
	__SelectBANK _power_save_enable
	BSET _power_save_enable
.stabn 0xE0,0,4,L55-_key_scan
L55:
.stabn 0x44,0,45,L56-_key_scan
L56:
;Line#45 		}

 .stabn 0xE0,0,3,L57-_key_scan
L57:
.stabn 0x44,0,46,L58-_key_scan
L58:
;Line#46 	  } 

 .stabn 0xE0,0,2,L59-_key_scan
L59:
.stabn 0x44,0,47,L60-_key_scan
L60:
;Line#47     }

	JMP L14
L13:
.stabn 0xC0,0,2,L61-_key_scan
L61:
.stabn 0x44,0,49,L62-_key_scan
L62:
;Line#49     {

 .stabn 0x44,0,50,L63-_key_scan
L63:
;Line#50 	  sw1_count_1=0;

 	;MOVU1 _sdata4 ,#0
	__SelectBANK _sdata4
	CLR _sdata4
.stabn 0x44,0,51,L64-_key_scan
L64:
;Line#51 	  sw1_count_2+=1;

 	;ADDU1 _sdata5 ,_sdata5 ,#1
	__SelectBANK _sdata5
	INCMS _sdata5
	NOP
.stabn 0x44,0,52,L65-_key_scan
L65:
;Line#52 	  if(sw1_count_2>99)

 	;LE L19 ,_sdata5 ,#99
	MOV A, _sdata5
	CMPRS A, #0x63
	JLT L19
.stabn 0xC0,0,3,L66-_key_scan
L66:
.stabn 0x44,0,53,L67-_key_scan
L67:
;Line#53 	  { 

 .stabn 0x44,0,54,L68-_key_scan
L68:
;Line#54 	    sw1_count_2=0;

 	;MOVU1 _sdata5 ,#0
	CLR _sdata5
.stabn 0x44,0,55,L69-_key_scan
L69:
;Line#55 		sw1_have_done_1=0;

 	;MOVX1 _sdata8 ,#0
	__SelectBANK _sdata8
	BCLR _sdata8
.stabn 0x44,0,56,L70-_key_scan
L70:
;Line#56 		if(!sw1_have_done_2)

 	;NEX1 L21 ,_sdata9 ,#0
	__SelectBANK _sdata9
	BTS0 _sdata9
	JMP L21
.stabn 0xC0,0,4,L71-_key_scan
L71:
.stabn 0x44,0,57,L72-_key_scan
L72:
;Line#57 		{

 .stabn 0x44,0,58,L73-_key_scan
L73:
;Line#58 		  sw1_have_done_2=1;

 	;MOVX1 _sdata9 ,#1
	BSET _sdata9
.stabn 0x44,0,59,L74-_key_scan
L74:
;Line#59 		  power_save_enable=1;              

 	;MOVX1 _power_save_enable ,#1
	__SelectBANK _power_save_enable
	BSET _power_save_enable
.stabn 0xE0,0,4,L75-_key_scan
L75:
.stabn 0x44,0,60,L76-_key_scan
L76:
;Line#60 		}

L21:
.stabn 0xE0,0,3,L77-_key_scan
L77:
.stabn 0x44,0,61,L78-_key_scan
L78:
;Line#61 	  }

L19:
.stabn 0xE0,0,2,L79-_key_scan
L79:
.stabn 0x44,0,62,L80-_key_scan
L80:
;Line#62     }

L14:
.stabn 0x44,0,64,L81-_key_scan
L81:
;Line#64     if(sw2)

 	;EQ L23 ,0xD1.0 ,#0
	B0BTS1 0xD1.0
	JMP L23
.stabn 0xC0,0,2,L82-_key_scan
L82:
.stabn 0x44,0,65,L83-_key_scan
L83:
;Line#65     {

 .stabn 0x44,0,66,L84-_key_scan
L84:
;Line#66       sw2_count_1+=1;

 	;ADDU1 _sdata2 ,_sdata2 ,#1
	__SelectBANK _sdata2
	INCMS _sdata2
	NOP
.stabn 0x44,0,67,L85-_key_scan
L85:
;Line#67  	  sw2_count_2=0;

 	;MOVU1 _sdata3 ,#0
	__SelectBANK _sdata3
	CLR _sdata3
.stabn 0x44,0,68,L86-_key_scan
L86:
;Line#68 	  if(sw2_count_1>99)

 	;LE L24 ,_sdata2 ,#99
	__SelectBANK _sdata2
	MOV A, _sdata2
	CMPRS A, #0x63
	JLT L24
.stabn 0xC0,0,3,L87-_key_scan
L87:
.stabn 0x44,0,69,L88-_key_scan
L88:
;Line#69 	  { 

 .stabn 0x44,0,70,L89-_key_scan
L89:
;Line#70 	    sw2_count_1=0;

 	;MOVU1 _sdata2 ,#0
	CLR _sdata2
.stabn 0x44,0,71,L90-_key_scan
L90:
;Line#71 		sw2_have_done_2=0;

 	;MOVX1 _sdata7 ,#0
	__SelectBANK _sdata7
	BCLR _sdata7
.stabn 0x44,0,72,L91-_key_scan
L91:
;Line#72 		if(!sw2_have_done_1)

 	;NEX1 L24 ,_sdata6 ,#0
	__SelectBANK _sdata6
	BTS0 _sdata6
	JMP L24
.stabn 0xC0,0,4,L92-_key_scan
L92:
.stabn 0x44,0,73,L93-_key_scan
L93:
;Line#73 		{

 .stabn 0x44,0,74,L94-_key_scan
L94:
;Line#74 		  sw2_have_done_1=1;

 	;MOVX1 _sdata6 ,#1
	BSET _sdata6
.stabn 0x44,0,75,L95-_key_scan
L95:
;Line#75 		  power_save_enable=1;

 	;MOVX1 _power_save_enable ,#1
	__SelectBANK _power_save_enable
	BSET _power_save_enable
.stabn 0x44,0,76,L96-_key_scan
L96:
;Line#76 		  out_enable=1; 

 	;MOVX1 _out_enable ,#1
	__SelectBANK _out_enable
	BSET _out_enable
.stabn 0x44,0,77,L97-_key_scan
L97:
;Line#77 		  sw2_buf=1;             

 	;MOVX1 _sdata10 ,#1
	__SelectBANK _sdata10
	BSET _sdata10
.stabn 0xE0,0,4,L98-_key_scan
L98:
.stabn 0x44,0,78,L99-_key_scan
L99:
;Line#78 		}

 .stabn 0xE0,0,3,L100-_key_scan
L100:
.stabn 0x44,0,79,L101-_key_scan
L101:
;Line#79 	  } 

 .stabn 0xE0,0,2,L102-_key_scan
L102:
.stabn 0x44,0,80,L103-_key_scan
L103:
;Line#80     }

	JMP L24
L23:
.stabn 0xC0,0,2,L104-_key_scan
L104:
.stabn 0x44,0,82,L105-_key_scan
L105:
;Line#82     {

 .stabn 0x44,0,83,L106-_key_scan
L106:
;Line#83 	  sw2_count_1=0;

 	;MOVU1 _sdata2 ,#0
	__SelectBANK _sdata2
	CLR _sdata2
.stabn 0x44,0,84,L107-_key_scan
L107:
;Line#84 	  sw2_count_2+=1;

 	;ADDU1 _sdata3 ,_sdata3 ,#1
	__SelectBANK _sdata3
	INCMS _sdata3
	NOP
.stabn 0x44,0,85,L108-_key_scan
L108:
;Line#85 	  if(sw2_count_2>99)

 	;LE L29 ,_sdata3 ,#99
	MOV A, _sdata3
	CMPRS A, #0x63
	JLT L29
.stabn 0xC0,0,3,L109-_key_scan
L109:
.stabn 0x44,0,86,L110-_key_scan
L110:
;Line#86 	  {  

 .stabn 0x44,0,87,L111-_key_scan
L111:
;Line#87 	    sw2_count_2=0;

 	;MOVU1 _sdata3 ,#0
	CLR _sdata3
.stabn 0x44,0,88,L112-_key_scan
L112:
;Line#88 		sw2_have_done_1=0;

 	;MOVX1 _sdata6 ,#0
	__SelectBANK _sdata6
	BCLR _sdata6
.stabn 0x44,0,89,L113-_key_scan
L113:
;Line#89 		if(!sw2_have_done_2)

 	;NEX1 L31 ,_sdata7 ,#0
	__SelectBANK _sdata7
	BTS0 _sdata7
	JMP L31
.stabn 0xC0,0,4,L114-_key_scan
L114:
.stabn 0x44,0,90,L115-_key_scan
L115:
;Line#90 		{

 .stabn 0x44,0,91,L116-_key_scan
L116:
;Line#91 		  sw2_have_done_2=1;

 	;MOVX1 _sdata7 ,#1
	BSET _sdata7
.stabn 0x44,0,92,L117-_key_scan
L117:
;Line#92 		  power_save_enable=1;

 	;MOVX1 _power_save_enable ,#1
	__SelectBANK _power_save_enable
	BSET _power_save_enable
.stabn 0x44,0,93,L118-_key_scan
L118:
;Line#93 		  out_enable=1;

 	;MOVX1 _out_enable ,#1
	__SelectBANK _out_enable
	BSET _out_enable
.stabn 0x44,0,94,L119-_key_scan
L119:
;Line#94 		  sw2_buf=0;              

 	;MOVX1 _sdata10 ,#0
	__SelectBANK _sdata10
	BCLR _sdata10
.stabn 0xE0,0,4,L120-_key_scan
L120:
.stabn 0x44,0,95,L121-_key_scan
L121:
;Line#95 		}

L31:
.stabn 0xE0,0,3,L122-_key_scan
L122:
.stabn 0x44,0,96,L123-_key_scan
L123:
;Line#96 	  }  

L29:
.stabn 0xE0,0,2,L124-_key_scan
L124:
.stabn 0x44,0,97,L125-_key_scan
L125:
;Line#97     }

L24:
.stabn 0xE0,0,1,L126-_key_scan
L126:
.stabn 0x44,0,98,L127-_key_scan
L127:
;Line#98   } 

L11:
.stabs "sw2_buf:V300",40,0,0,_sdata10
.stabs "sw1_have_done_2:V300",40,0,0,_sdata9
.stabs "sw1_have_done_1:V300",40,0,0,_sdata8
.stabs "sw2_have_done_2:V300",40,0,0,_sdata7
.stabs "sw2_have_done_1:V300",40,0,0,_sdata6
.stabs "sw1_count_2:V9",40,0,0,_sdata5
.stabs "sw1_count_1:V9",40,0,0,_sdata4
.stabs "sw2_count_2:V9",40,0,0,_sdata3
.stabs "sw2_count_1:V9",40,0,0,_sdata2
.stabn 0xE0,0,0,L128-_key_scan
L128:
.stabn 0x44,0,99,L129-_key_scan
L129:
;Line#99 }
L1:
	RET
.stabs "_intrinsicbitfield:T15=s1bit0:12,0,1;bit1:12,1,1;bit2:12,2,1;\\",128,0,0,0
.stabs "bit3:12,3,1;bit4:12,4,1;bit5:12,5,1;bit6:12,6,1;bit7:12,7,1;;",128,0,0,0
.stabs "", 100, 0, 0,Letext
Letext:
.stabs "flagWarningInit:G300",32,0,0,_flagWarningInit
.stabs "flagKeyTrigger:G301",32,0,0,_flagKeyTrigger
.stabs "out_enable:G302",32,0,0,_out_enable
