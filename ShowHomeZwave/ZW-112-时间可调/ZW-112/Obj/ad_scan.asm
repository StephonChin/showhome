
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
.stabs ".\Src\ad_scan.c",0x64,0,3,Ltext0
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

PUBLIC _AdScan
EXTERN DATA _sysForbidTime

_sdata2@segment SEGMENT DATA INBANK
	_sdata2 DS 10
_DATA_INIT_CODE SEGMENT CODE INBANK
_sdata2_initial_value:
	DB 0x0,0x0
	DB 0x00
	DB 0x00
	DB 0x00
	DB 0x00
	DB 0x00
	DB 0x00
	DB 0x00
	DB 0x00
_SGV_INIT_CODE SEGMENT CODE BANK 0x0 INBANK
INIT@global _sdata2,_sdata2_initial_value,10
_Function_AdScan_data SEGMENT DATA INBANK
	_AdScan_data@0	DS	1
	_AdScan_data@1	DS	1
	_AdScan_data@2	DS	1
	_AdScan_data@3	DS	1


_VirtualReg SEGMENT DATA BANK 0 INBANK COMMON
	W0 DS 1
	W1 DS 1
	W2 DS 1
	W3 DS 1
	W4 DS 1
	W5 DS 1

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
.stabs "AdScan:F13",36,0,0,_AdScan
_Function_AdScan_code SEGMENT CODE INBANK USING _Function_AdScan_data
_AdScan:
.stabs "adDataAve:10",128,0,0,_AdScan_data@0
.stabs "iCnt:9",128,0,0,_AdScan_data@2
.stabs "adTime:9",128,0,0,_AdScan_data@3
.stabn 0xC0,0,0,L21-_AdScan
L21:
.stabn 0x44,0,13,L22-_AdScan
L22:
;Line#13 {

 .stabn 0x44,0,15,L23-_AdScan
L23:
;Line#15 	uint			adDataAve = 0;;

 	;MOVI2 _AdScan_data@0 ,#0
	__SelectBANK _AdScan_data@0
	CLR _AdScan_data@0
	CLR _AdScan_data@0+1
.stabn 0x44,0,15,L24-_AdScan
L24:
;Line#15 	uint			adDataAve = 0;;

 .stabn 0x44,0,16,L25-_AdScan
L25:
;Line#16 	uchar			iCnt = 0;

 	;MOVU1 _AdScan_data@2 ,#0
	__SelectBANK _AdScan_data@2
	CLR _AdScan_data@2
.stabn 0x44,0,17,L26-_AdScan
L26:
;Line#17 	uchar 			adTime = 100;

 	;MOVU1 _AdScan_data@3 ,#100
	MOV A, #0x64
	__SelectBANK _AdScan_data@3
	MOV _AdScan_data@3, A
.stabn 0x44,0,20,L27-_AdScan
L27:
;Line#20 	FADENB = 1;

 	;MOVX1 0xB1.7 ,#1
	B0BSET 0xB1.7
.stabn 0x44,0,21,L28-_AdScan
L28:
;Line#21 	FADS = 1;		//start to A/D

 	;MOVX1 0xB1.6 ,#1
	B0BSET 0xB1.6
.stabn 0xC0,0,1,L29-_AdScan
L29:
.stabn 0x44,0,24,L30-_AdScan
L30:
;Line#24 	{

 .stabn 0xE0,0,1,L31-_AdScan
L31:
.stabn 0x44,0,26,L32-_AdScan
L32:
;Line#26 	}

L4:
.stabn 0x44,0,27,L33-_AdScan
L33:
;Line#27 	while (FEOC == 0);

L5:
.stabn 0x44,0,27,L34-_AdScan
L34:
;Line#27 	while (FEOC == 0);

 	;EQ L4 ,0xB1.5 ,#0
	B0BTS1 0xB1.5
	JMP L4
.stabn 0x44,0,28,L35-_AdScan
L35:
;Line#28 	adDataBuf[adCnt] = (uint)ADB * 16 + (uint)(ADR & 0x0F);

 	;CVUU2 W0:W1 ,_sdata3
	__SelectBANK _sdata3
	MOV A, _sdata3
	B0MOV W0, A
	__SelectBANKCNST 0
	CLR W1
	;LSH W0:W1 ,W0:W1 ,#1
	B0BCLR FC
	__SelectBANKCNST 0
	RLCM W0
	__SelectBANKCNST 0
	RLCM W1
	;LEA W2:W3 ,_sdata2
	;ADDP2 W0:W1 ,W2:W3 ,W0:W1
	B0MOV A, W0
	ADD A, #(_sdata2)$L
	B0MOV W0, A
	MOV A, #(_sdata2)$M
	ADC A, W1
	B0MOV W1, A
	;CVUU2 W2:W3 ,0xB2
	B0MOV A, 0xB2
	B0MOV W2, A
	__SelectBANKCNST 0
	CLR W3
	;LSH W2:W3 ,W2:W3 ,#4
	MOV A, #(W2)$M
	B0MOV H, A
	MOV A, #(W2)$L
	B0MOV L, A
	B0MOV Y, #(W2)$M
	B0MOV Z, #(W2)$L
	MOV A, #0x04
	CALL __Get2ByteRamToLArg
	CALL __SLLong2Ram
	;ANDU1 W4 ,0xB3 ,#15
	B0MOV A, 0xB3
	AND A, #0x0f
	;CVUU2 W4:W5 ,W4
	B0MOV W4, A
	__SelectBANKCNST 0
	CLR W5
	;ADDU2 *W0:W1 ,W4:W5 ,W2:W3
	__SelectBANK __SrcLArg0
	MOV __SrcLArg0, A
	B0MOV A, W5
	__SelectBANK __SrcLArg1
	MOV __SrcLArg1, A
	B0MOV A, W2
	__SelectBANK __SrcRArg0
	MOV __SrcRArg0, A
	B0MOV A, W3
	__SelectBANK __SrcRArg1
	MOV __SrcRArg1, A
	B0MOV A, W1
	B0MOV H, A
	B0MOV A, W0
	B0MOV L, A
	CALL __AddLong2Ram
.stabn 0x44,0,29,L36-_AdScan
L36:
;Line#29 	adCnt++;

 	;ADDU1 _sdata3 ,_sdata3 ,#1
	__SelectBANK _sdata3
	INCMS _sdata3
	NOP
.stabn 0x44,0,30,L37-_AdScan
L37:
;Line#30 	if (adCnt > 4)

 	;LE L7 ,_sdata3 ,#4
	MOV A, _sdata3
	CMPRS A, #0x04
	JLT L7
.stabn 0xC0,0,1,L38-_AdScan
L38:
.stabn 0x44,0,31,L39-_AdScan
L39:
;Line#31 	{

 .stabn 0x44,0,32,L40-_AdScan
L40:
;Line#32 		adCnt = 0;

 	;MOVU1 _sdata3 ,#0
	CLR _sdata3
.stabn 0x44,0,33,L41-_AdScan
L41:
;Line#33 		adDataAve = 0;

 	;MOVI2 _AdScan_data@0 ,#0
	__SelectBANK _AdScan_data@0
	CLR _AdScan_data@0
	CLR _AdScan_data@0+1
.stabn 0xC0,0,2,L42-_AdScan
L42:
.stabn 0x44,0,35,L43-_AdScan
L43:
;Line#35 		for (iCnt = 1; iCnt < 4; iCnt++)

 	;MOVU1 _AdScan_data@2 ,#1
	MOV A, #0x01
	__SelectBANK _AdScan_data@2
	MOV _AdScan_data@2, A
	JMP L12
L9:
.stabn 0xC0,0,3,L44-_AdScan
L44:
.stabn 0x44,0,36,L45-_AdScan
L45:
;Line#36 		{

 .stabn 0x44,0,37,L46-_AdScan
L46:
	__SelectBANK _sdata3
	MOV A, _sdata3
	B0MOV Y, #(_sdata2)$M
	B0MOV Z, #(_sdata2)$L
;Line#37 			adDataAve += adDataBuf[adCnt];

	CALL __Get2ByteRamToReg
	;ADDU2 _AdScan_data@0 ,_AdScan_data@0 ,W0:W1
	__SelectBANK _AdScan_data@0
	ADD _AdScan_data@0, A
	B0MOV A, R
	ADC _AdScan_data@0+1, A
.stabn 0xE0,0,3,L47-_AdScan
L47:
.stabn 0x44,0,38,L48-_AdScan
L48:
;Line#38 		}

L10:
.stabn 0x44,0,35,L49-_AdScan
L49:
;Line#35 		for (iCnt = 1; iCnt < 4; iCnt++)

 	;ADDU1 _AdScan_data@2 ,_AdScan_data@2 ,#1
	__SelectBANK _AdScan_data@2
	INCMS _AdScan_data@2
	NOP
L12:
.stabn 0x44,0,35,L50-_AdScan
L50:
;Line#35 		for (iCnt = 1; iCnt < 4; iCnt++)

 	;LT L9 ,_AdScan_data@2 ,#4
	__SelectBANK _AdScan_data@2
	MOV A, _AdScan_data@2
	SUB A, #0x04
	JLT L9
.stabn 0xE0,0,2,L51-_AdScan
L51:
.stabn 0x44,0,39,L52-_AdScan
L52:
;Line#39 		adDataAve /= 3;

 .stabn 0x44,0,39,L53-_AdScan
L53:
;Line#39 		adDataAve /= 3;

 	;DIV _AdScan_data@0 ,_AdScan_data@0 ,#3
	MOV A, #(_AdScan_data@0)$M
	B0MOV H, A
	MOV A, #(_AdScan_data@0)$L
	B0MOV L, A
	B0MOV Y, #(_AdScan_data@0)$M
	B0MOV Z, #(_AdScan_data@0)$L
	B0MOV R, #0x00
	MOV A, #0x03
	CALL __Get2ByteRamCst
	CALL __DivULong2Ram
.stabn 0x44,0,41,L54-_AdScan
L54:
;Line#41 		if (adDataAve < 367)

 	;GE L13 ,_AdScan_data@0 ,#367
	B0MOV Y, #(_AdScan_data@0)$M
	B0MOV Z, #(_AdScan_data@0)$L
	MOV A, #0x6f
	B0MOV R, #0x01
	CALL __Get2ByteRamCst
	CALL __CmpULong
	JGE L13
.stabn 0xC0,0,2,L55-_AdScan
L55:
.stabn 0x44,0,42,L56-_AdScan
L56:
;Line#42 		{

 .stabn 0x44,0,43,L57-_AdScan
L57:
;Line#43 			sysForbidTime = 0;

 	;MOVU1 _sysForbidTime ,#0
	__SelectBANK _sysForbidTime
	CLR _sysForbidTime
.stabn 0xE0,0,2,L58-_AdScan
L58:
.stabn 0x44,0,44,L59-_AdScan
L59:
;Line#44 		}

	JMP L14
L13:
.stabn 0x44,0,45,L60-_AdScan
L60:
;Line#45 		else if (adDataAve < 733)

 	;GE L15 ,_AdScan_data@0 ,#733
	B0MOV Y, #(_AdScan_data@0)$M
	B0MOV Z, #(_AdScan_data@0)$L
	MOV A, #0xdd
	B0MOV R, #0x02
	CALL __Get2ByteRamCst
	CALL __CmpULong
	JGE L15
.stabn 0xC0,0,2,L61-_AdScan
L61:
.stabn 0x44,0,46,L62-_AdScan
L62:
;Line#46 		{

 .stabn 0x44,0,47,L63-_AdScan
L63:
;Line#47 			sysForbidTime = 30;

 	;MOVU1 _sysForbidTime ,#30
	MOV A, #0x1e
	__SelectBANK _sysForbidTime
	MOV _sysForbidTime, A
.stabn 0xE0,0,2,L64-_AdScan
L64:
.stabn 0x44,0,48,L65-_AdScan
L65:
;Line#48 		}

	JMP L16
L15:
.stabn 0x44,0,49,L66-_AdScan
L66:
;Line#49 		else if (adDataAve < 1100)

 	;GE L17 ,_AdScan_data@0 ,#1100
	B0MOV Y, #(_AdScan_data@0)$M
	B0MOV Z, #(_AdScan_data@0)$L
	MOV A, #0x4c
	B0MOV R, #0x04
	CALL __Get2ByteRamCst
	CALL __CmpULong
	JGE L17
.stabn 0xC0,0,2,L67-_AdScan
L67:
.stabn 0x44,0,50,L68-_AdScan
L68:
;Line#50 		{

 .stabn 0x44,0,51,L69-_AdScan
L69:
;Line#51 			sysForbidTime = 60;

 	;MOVU1 _sysForbidTime ,#60
	MOV A, #0x3c
	__SelectBANK _sysForbidTime
	MOV _sysForbidTime, A
.stabn 0xE0,0,2,L70-_AdScan
L70:
.stabn 0x44,0,52,L71-_AdScan
L71:
;Line#52 		}

	JMP L18
L17:
.stabn 0x44,0,53,L72-_AdScan
L72:
;Line#53 		else if (adDataAve < 1466)

 	;GE L19 ,_AdScan_data@0 ,#1466
	B0MOV Y, #(_AdScan_data@0)$M
	B0MOV Z, #(_AdScan_data@0)$L
	MOV A, #0xba
	B0MOV R, #0x05
	CALL __Get2ByteRamCst
	CALL __CmpULong
	JGE L19
.stabn 0xC0,0,2,L73-_AdScan
L73:
.stabn 0x44,0,54,L74-_AdScan
L74:
;Line#54 		{

 .stabn 0x44,0,55,L75-_AdScan
L75:
;Line#55 			sysForbidTime = 90;

 	;MOVU1 _sysForbidTime ,#90
	MOV A, #0x5a
	__SelectBANK _sysForbidTime
	MOV _sysForbidTime, A
.stabn 0xE0,0,2,L76-_AdScan
L76:
.stabn 0x44,0,56,L77-_AdScan
L77:
;Line#56 		}

	JMP L20
L19:
.stabn 0xC0,0,2,L78-_AdScan
L78:
.stabn 0x44,0,58,L79-_AdScan
L79:
;Line#58 		{

 .stabn 0x44,0,59,L80-_AdScan
L80:
;Line#59 			sysForbidTime = 120;

 	;MOVU1 _sysForbidTime ,#120
	MOV A, #0x78
	__SelectBANK _sysForbidTime
	MOV _sysForbidTime, A
.stabn 0xE0,0,2,L81-_AdScan
L81:
.stabn 0x44,0,60,L82-_AdScan
L82:
;Line#60 		}

L20:
L18:
L16:
L14:
.stabn 0xE0,0,1,L83-_AdScan
L83:
.stabn 0x44,0,61,L84-_AdScan
L84:
;Line#61 	}

L7:
.stabs "adCnt:V9",40,0,0,_sdata3
.stabs ":t15=ar1;0;4;10",128,0,0,0
.stabs "adDataBuf:V15",38,0,0,_sdata2
.stabn 0xE0,0,0,L85-_AdScan
L85:
.stabn 0x44,0,63,L86-_AdScan
L86:
;Line#63 }
L1:
	RET

CALLTREE _AdScan invoke __Get2ByteRamToLArg,__SLLong2Ram,__AddLong2Ram,__Get2ByteRamToReg,__Get2ByteRamCst,__DivULong2Ram,__CmpULong

.stabs "_intrinsicbitfield:T16=s1bit0:12,0,1;bit1:12,1,1;bit2:12,2,1;\\",128,0,0,0
.stabs "bit3:12,3,1;bit4:12,4,1;bit5:12,5,1;bit6:12,6,1;bit7:12,7,1;;",128,0,0,0
.stabs "BitStatus:t14",128,0,0,0
.stabs "uint:t10",128,0,0,0
.stabs "uchar:t9",128,0,0,0
.stabs "", 100, 0, 0,Letext
Letext:
extern data __SrcRArg1
extern data __SrcRArg0
extern data __SrcLArg1
extern data __SrcLArg0
EXTERN CODE __CmpULong
EXTERN CODE __DivULong2Ram
EXTERN CODE __Get2ByteRamCst
EXTERN CODE __Get2ByteRamToReg
EXTERN CODE __AddLong2Ram
EXTERN CODE __SLLong2Ram
EXTERN CODE __Get2ByteRamToLArg
