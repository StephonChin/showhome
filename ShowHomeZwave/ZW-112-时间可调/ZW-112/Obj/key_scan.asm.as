CHIP SN8P2711B
EXTERN DATA X
EXTERN DATA H
EXTERN DATA L
EXTERN DATA T
EXTERN DATA I
.CODE
.stabs "lcc4_compiled.",0x3C,0,0,0
.stabs "F:\PROJECT\ShowHome\ZW-112-时间可调\ZW-112/",0x64,0,3,Ltext0
.stabs ".\Src\key_scan.c",0x64,0,3,Ltext0
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
PUBLIC _KeyScan
PUBLIC _PirChk
EXTERN DATA_BIT _sysTriacFlag
EXTERN DATA_BIT _sysTriacInit
EXTERN DATA_BIT _sysPirStatusFlag
EXTERN DATA_BIT _sysKeyStatusFlag
_Function_KeyScan_data SEGMENT DATA INBANK
_Function_PirChk_data SEGMENT DATA INBANK
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
_sdata2@segment SEGMENT DATA INBANK
	_sdata2 DS 1
_sdata3@segment SEGMENT DATA INBANK
	_sdata3 DS 1
_sdata4@segment SEGMENT DATA INBANK
	_sdata4 DS 1
_sdata5@segment SEGMENT DATA INBANK
	_sdata5 DS 1
.stabs "KeyScan:F13",36,0,0,_KeyScan
_Function_KeyScan_code SEGMENT CODE INBANK USING _Function_KeyScan_data
_KeyScan:
.stabn 0xC0,0,0,L16-_KeyScan
L16:
.stabn 0x44,0,13,L17-_KeyScan
L17:
 .stabn 0x44,0,19,L18-_KeyScan
L18:
	B0BTS1 0xD0.2
	JMP L6
.stabn 0xC0,0,1,L19-_KeyScan
L19:
.stabn 0x44,0,20,L20-_KeyScan
L20:
 .stabn 0x44,0,21,L21-_KeyScan
L21:
	CLR _sdata3
.stabn 0x44,0,23,L22-_KeyScan
L22:
	MOV A, _sdata4
	CMPRS A, #0x00
	JMP L7
.stabn 0xC0,0,2,L23-_KeyScan
L23:
.stabn 0x44,0,24,L24-_KeyScan
L24:
 .stabn 0x44,0,25,L25-_KeyScan
L25:
	INCMS _sdata2
	NOP
.stabn 0x44,0,26,L26-_KeyScan
L26:
	MOV A, _sdata2
	CMPRS A, #0x0e
	B0BTS1	134.2
	JMP	L7
.stabn 0xC0,0,3,L27-_KeyScan
L27:
.stabn 0x44,0,27,L28-_KeyScan
L28:
 .stabn 0x44,0,28,L29-_KeyScan
L29:
	MOV A, #0x01
	MOV _sdata4, A
.stabn 0x44,0,29,L30-_KeyScan
L30:
	CLR _sdata5
.stabn 0x44,0,30,L31-_KeyScan
L31:
	BSET _sysKeyStatusFlag
.stabn 0xE0,0,3,L32-_KeyScan
L32:
.stabn 0x44,0,31,L33-_KeyScan
L33:
 .stabn 0xE0,0,2,L34-_KeyScan
L34:
.stabn 0x44,0,32,L35-_KeyScan
L35:
 .stabn 0xE0,0,1,L36-_KeyScan
L36:
.stabn 0x44,0,33,L37-_KeyScan
L37:
	JMP L7
L6:
.stabn 0xC0,0,1,L38-_KeyScan
L38:
.stabn 0x44,0,35,L39-_KeyScan
L39:
 .stabn 0x44,0,36,L40-_KeyScan
L40:
	CLR _sdata2
.stabn 0x44,0,38,L41-_KeyScan
L41:
	MOV A, _sdata5
	CMPRS A, #0x00
	JMP L12
.stabn 0xC0,0,2,L42-_KeyScan
L42:
.stabn 0x44,0,39,L43-_KeyScan
L43:
 .stabn 0x44,0,40,L44-_KeyScan
L44:
	INCMS _sdata3
	NOP
.stabn 0x44,0,41,L45-_KeyScan
L45:
	MOV A, _sdata3
	CMPRS A, #0x0e
	B0BTS1	134.2
	JMP	L14
.stabn 0xC0,0,3,L46-_KeyScan
L46:
.stabn 0x44,0,42,L47-_KeyScan
L47:
 .stabn 0x44,0,43,L48-_KeyScan
L48:
	MOV A, #0x01
	MOV _sdata5, A
.stabn 0x44,0,44,L49-_KeyScan
L49:
	CLR _sdata4
.stabn 0x44,0,45,L50-_KeyScan
L50:
	BSET _sysKeyStatusFlag
.stabn 0xE0,0,3,L51-_KeyScan
L51:
.stabn 0x44,0,46,L52-_KeyScan
L52:
L14:
.stabn 0xE0,0,2,L53-_KeyScan
L53:
.stabn 0x44,0,47,L54-_KeyScan
L54:
L12:
.stabn 0xE0,0,1,L55-_KeyScan
L55:
.stabn 0x44,0,48,L56-_KeyScan
L56:
L7:
.stabs "keyOffFlag:V9",40,0,0,_sdata5
.stabs "keyOnFlag:V9",40,0,0,_sdata4
.stabs "keyOffCnt:V9",40,0,0,_sdata3
.stabs "keyOnCnt:V9",40,0,0,_sdata2
.stabn 0xE0,0,0,L57-_KeyScan
L57:
.stabn 0x44,0,49,L58-_KeyScan
L58:
L1:
	RET
_sdata60@segment SEGMENT DATA INBANK
	_sdata60 DS 1
_sdata61@segment SEGMENT DATA INBANK
	_sdata61 DS 1
.stabs "PirChk:F13",36,0,0,_PirChk
_Function_PirChk_code SEGMENT CODE INBANK USING _Function_PirChk_data
_PirChk:
.stabn 0xC0,0,0,L68-_PirChk
L68:
.stabn 0x44,0,55,L69-_PirChk
L69:
 .stabn 0x44,0,59,L70-_PirChk
L70:
	B0BTS0 0xD0.4
	JMP L62
.stabn 0xC0,0,1,L71-_PirChk
L71:
.stabn 0x44,0,60,L72-_PirChk
L72:
 .stabn 0x44,0,61,L73-_PirChk
L73:
	MOV A, _sdata61
	CMPRS A, #0x00
	JMP L63
.stabn 0xC0,0,2,L74-_PirChk
L74:
.stabn 0x44,0,62,L75-_PirChk
L75:
 .stabn 0x44,0,63,L76-_PirChk
L76:
	INCMS _sdata60
	NOP
.stabn 0x44,0,64,L77-_PirChk
L77:
	MOV A, _sdata60
	CMPRS A, #0x0a
	B0BTS1	134.2
	JMP	L63
.stabn 0xC0,0,3,L78-_PirChk
L78:
.stabn 0x44,0,65,L79-_PirChk
L79:
 .stabn 0x44,0,66,L80-_PirChk
L80:
	MOV A, #0x01
	MOV _sdata61, A
.stabn 0x44,0,67,L81-_PirChk
L81:
	BSET _sysPirStatusFlag
.stabn 0x44,0,68,L82-_PirChk
L82:
	BSET _sysTriacFlag
.stabn 0x44,0,69,L83-_PirChk
L83:
	BSET _sysTriacInit
.stabn 0xE0,0,3,L84-_PirChk
L84:
.stabn 0x44,0,70,L85-_PirChk
L85:
 .stabn 0xE0,0,2,L86-_PirChk
L86:
.stabn 0x44,0,71,L87-_PirChk
L87:
 .stabn 0xE0,0,1,L88-_PirChk
L88:
.stabn 0x44,0,72,L89-_PirChk
L89:
	JMP L63
L62:
.stabn 0xC0,0,1,L90-_PirChk
L90:
.stabn 0x44,0,74,L91-_PirChk
L91:
 .stabn 0x44,0,75,L92-_PirChk
L92:
	CLR _sdata60
.stabn 0x44,0,76,L93-_PirChk
L93:
	CLR _sdata61
.stabn 0xE0,0,1,L94-_PirChk
L94:
.stabn 0x44,0,77,L95-_PirChk
L95:
L63:
.stabs "pirOnFlag:V9",40,0,0,_sdata61
.stabs "pirCnt:V9",40,0,0,_sdata60
.stabn 0xE0,0,0,L96-_PirChk
L96:
.stabn 0x44,0,78,L97-_PirChk
L97:
L59:
	RET
.stabs "_intrinsicbitfield:T15=s1bit0:12,0,1;bit1:12,1,1;bit2:12,2,1;\\",128,0,0,0
.stabs "bit3:12,3,1;bit4:12,4,1;bit5:12,5,1;bit6:12,6,1;bit7:12,7,1;;",128,0,0,0
.stabs "BitStatus:t14",128,0,0,0
.stabs "uint:t10",128,0,0,0
.stabs "uchar:t9",128,0,0,0
.stabs "", 100, 0, 0,Letext
Letext:
