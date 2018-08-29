CHIP SN8P2501D
EXTERN DATA X
EXTERN DATA H
EXTERN DATA L
EXTERN DATA T
EXTERN DATA I
.CODE
.stabs "lcc4_compiled.",0x3C,0,0,0
.stabs "F:\¹Ì°îÏîÄ¿\project\ZW-1101--´Å¿Ø\ZW1101/",0x64,0,3,Ltext0
.stabs ".\Src\process_key.c",0x64,0,3,Ltext0
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
PUBLIC _ProcessKey
EXTERN DATA _sleepFlag
EXTERN DATA _wakeFlag
_Function_ProcessKey_data SEGMENT DATA INBANK
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
_sdata3@segment SEGMENT DATA INBANK
	_sdata3 DS 1
_sdata4@segment SEGMENT DATA INBANK
	_sdata4 DS 1
_sdata5@segment SEGMENT DATA INBANK
	_sdata5 DS 1
_sdata6@segment SEGMENT DATA INBANK
	_sdata6 DS 1
_sdata7@segment SEGMENT DATA INBANK
	_sdata7 DS 1
_sdata8@segment SEGMENT DATA INBANK
	_sdata8 DS 1
_sdata9@segment SEGMENT DATA INBANK
	_sdata9 DS 1
_sdata10@segment SEGMENT DATA INBANK
	_sdata10 DS 1
.stabs "ProcessKey:F13",36,0,0,_ProcessKey
_Function_ProcessKey_code SEGMENT CODE INBANK USING _Function_ProcessKey_data
_ProcessKey:
.stabn 0xC0,0,0,L33-_ProcessKey
L33:
.stabn 0x44,0,12,L34-_ProcessKey
L34:
 .stabn 0x44,0,24,L35-_ProcessKey
L35:
	B0BTS1 0xD1.0
	JMP L11
.stabn 0xC0,0,1,L36-_ProcessKey
L36:
.stabn 0x44,0,25,L37-_ProcessKey
L37:
 .stabn 0x44,0,26,L38-_ProcessKey
L38:
	INCMS _sdata3
	NOP
.stabn 0x44,0,27,L39-_ProcessKey
L39:
	CLR _sdata4
.stabn 0x44,0,29,L40-_ProcessKey
L40:
	MOV A, _sdata3
	CMPRS A, #0xc8
	B0BTS1	134.2
	JMP	L12
.stabn 0xC0,0,2,L41-_ProcessKey
L41:
.stabn 0x44,0,30,L42-_ProcessKey
L42:
 .stabn 0x44,0,31,L43-_ProcessKey
L43:
	CLR _sdata3
.stabn 0x44,0,33,L44-_ProcessKey
L44:
	MOV A, _sdata8
	CMPRS A, #0x00
	JMP L15
.stabn 0xC0,0,3,L45-_ProcessKey
L45:
.stabn 0x44,0,34,L46-_ProcessKey
L46:
 .stabn 0x44,0,35,L47-_ProcessKey
L47:
	MOV A, #0x01
	MOV _wakeFlag, A
.stabn 0x44,0,36,L48-_ProcessKey
L48:
	CLR _sleepFlag
.stabn 0xE0,0,3,L49-_ProcessKey
L49:
.stabn 0x44,0,37,L50-_ProcessKey
L50:
L15:
.stabn 0x44,0,39,L51-_ProcessKey
L51:
	CLR _sdata7
.stabn 0x44,0,40,L52-_ProcessKey
L52:
	MOV A, #0x01
	MOV _sdata8, A
.stabn 0xE0,0,2,L53-_ProcessKey
L53:
.stabn 0x44,0,41,L54-_ProcessKey
L54:
 .stabn 0xE0,0,1,L55-_ProcessKey
L55:
.stabn 0x44,0,42,L56-_ProcessKey
L56:
	JMP L12
L11:
.stabn 0xC0,0,1,L57-_ProcessKey
L57:
.stabn 0x44,0,44,L58-_ProcessKey
L58:
 .stabn 0x44,0,45,L59-_ProcessKey
L59:
	INCMS _sdata4
	NOP
.stabn 0x44,0,46,L60-_ProcessKey
L60:
	CLR _sdata3
.stabn 0x44,0,48,L61-_ProcessKey
L61:
	MOV A, _sdata4
	CMPRS A, #0xc8
	B0BTS1	134.2
	JMP	L17
.stabn 0xC0,0,2,L62-_ProcessKey
L62:
.stabn 0x44,0,49,L63-_ProcessKey
L63:
 .stabn 0x44,0,50,L64-_ProcessKey
L64:
	CLR _sdata4
.stabn 0x44,0,52,L65-_ProcessKey
L65:
	MOV A, _sdata7
	CMPRS A, #0x00
	JMP L19
.stabn 0xC0,0,3,L66-_ProcessKey
L66:
.stabn 0x44,0,53,L67-_ProcessKey
L67:
 .stabn 0x44,0,54,L68-_ProcessKey
L68:
	MOV A, #0x01
	MOV _wakeFlag, A
.stabn 0x44,0,55,L69-_ProcessKey
L69:
	CLR _sleepFlag
.stabn 0xE0,0,3,L70-_ProcessKey
L70:
.stabn 0x44,0,56,L71-_ProcessKey
L71:
L19:
.stabn 0x44,0,58,L72-_ProcessKey
L72:
	MOV A, #0x01
	MOV _sdata7, A
.stabn 0x44,0,59,L73-_ProcessKey
L73:
	CLR _sdata8
.stabn 0xE0,0,2,L74-_ProcessKey
L74:
.stabn 0x44,0,60,L75-_ProcessKey
L75:
L17:
.stabn 0xE0,0,1,L76-_ProcessKey
L76:
.stabn 0x44,0,61,L77-_ProcessKey
L77:
L12:
.stabn 0x44,0,65,L78-_ProcessKey
L78:
	MOV A, _sdata7
	B0BTS0	134.0
	JMP	L21
.stabn 0xC0,0,1,L79-_ProcessKey
L79:
.stabn 0x44,0,66,L80-_ProcessKey
L80:
 .stabn 0x44,0,67,L81-_ProcessKey
L81:
	B0BTS1 0xD0.0
	JMP L23
.stabn 0xC0,0,2,L82-_ProcessKey
L82:
.stabn 0x44,0,68,L83-_ProcessKey
L83:
 .stabn 0x44,0,69,L84-_ProcessKey
L84:
	INCMS _sdata5
	NOP
.stabn 0x44,0,70,L85-_ProcessKey
L85:
	CLR _sdata6
.stabn 0x44,0,72,L86-_ProcessKey
L86:
	MOV A, _sdata5
	CMPRS A, #0xc8
	B0BTS1	134.2
	JMP	L22
.stabn 0xC0,0,3,L87-_ProcessKey
L87:
.stabn 0x44,0,73,L88-_ProcessKey
L88:
 .stabn 0x44,0,74,L89-_ProcessKey
L89:
	CLR _sdata5
.stabn 0x44,0,76,L90-_ProcessKey
L90:
	MOV A, _sdata10
	CMPRS A, #0x00
	JMP L27
.stabn 0xC0,0,4,L91-_ProcessKey
L91:
.stabn 0x44,0,77,L92-_ProcessKey
L92:
 .stabn 0x44,0,78,L93-_ProcessKey
L93:
	MOV A, #0x01
	MOV _wakeFlag, A
.stabn 0x44,0,79,L94-_ProcessKey
L94:
	CLR _sleepFlag
.stabn 0xE0,0,4,L95-_ProcessKey
L95:
.stabn 0x44,0,80,L96-_ProcessKey
L96:
L27:
.stabn 0x44,0,81,L97-_ProcessKey
L97:
	MOV A, #0x01
	MOV _sdata10, A
.stabn 0x44,0,82,L98-_ProcessKey
L98:
	CLR _sdata9
.stabn 0xE0,0,3,L99-_ProcessKey
L99:
.stabn 0x44,0,83,L100-_ProcessKey
L100:
 .stabn 0xE0,0,2,L101-_ProcessKey
L101:
.stabn 0x44,0,84,L102-_ProcessKey
L102:
	JMP L22
L23:
.stabn 0xC0,0,2,L103-_ProcessKey
L103:
.stabn 0x44,0,86,L104-_ProcessKey
L104:
 .stabn 0x44,0,87,L105-_ProcessKey
L105:
	INCMS _sdata6
	NOP
.stabn 0x44,0,88,L106-_ProcessKey
L106:
	CLR _sdata5
.stabn 0x44,0,90,L107-_ProcessKey
L107:
	MOV A, _sdata6
	CMPRS A, #0xc8
	B0BTS1	134.2
	JMP	L22
.stabn 0xC0,0,3,L108-_ProcessKey
L108:
.stabn 0x44,0,91,L109-_ProcessKey
L109:
 .stabn 0x44,0,92,L110-_ProcessKey
L110:
	CLR _sdata6
.stabn 0x44,0,94,L111-_ProcessKey
L111:
	MOV A, _sdata9
	CMPRS A, #0x00
	JMP L31
.stabn 0xC0,0,4,L112-_ProcessKey
L112:
.stabn 0x44,0,95,L113-_ProcessKey
L113:
 .stabn 0x44,0,96,L114-_ProcessKey
L114:
	MOV A, #0x01
	MOV _wakeFlag, A
.stabn 0x44,0,97,L115-_ProcessKey
L115:
	CLR _sleepFlag
.stabn 0xE0,0,4,L116-_ProcessKey
L116:
.stabn 0x44,0,98,L117-_ProcessKey
L117:
L31:
.stabn 0x44,0,100,L118-_ProcessKey
L118:
	MOV A, #0x01
	MOV _sdata9, A
.stabn 0x44,0,101,L119-_ProcessKey
L119:
	CLR _sdata10
.stabn 0xE0,0,3,L120-_ProcessKey
L120:
.stabn 0x44,0,102,L121-_ProcessKey
L121:
 .stabn 0xE0,0,2,L122-_ProcessKey
L122:
.stabn 0x44,0,103,L123-_ProcessKey
L123:
 .stabn 0xE0,0,1,L124-_ProcessKey
L124:
.stabn 0x44,0,104,L125-_ProcessKey
L125:
	JMP L22
L21:
.stabn 0xC0,0,1,L126-_ProcessKey
L126:
.stabn 0x44,0,106,L127-_ProcessKey
L127:
 .stabn 0x44,0,107,L128-_ProcessKey
L128:
	CLR _sdata5
.stabn 0x44,0,108,L129-_ProcessKey
L129:
	CLR _sdata6
.stabn 0x44,0,109,L130-_ProcessKey
L130:
	CLR _sdata10
.stabn 0x44,0,110,L131-_ProcessKey
L131:
	CLR _sdata9
.stabn 0xE0,0,1,L132-_ProcessKey
L132:
.stabn 0x44,0,111,L133-_ProcessKey
L133:
L22:
.stabs " :T15=eFALSE:0,TRUE:1,;",128,0,0,0
.stabs "triggerKeyOffFlag:V15",40,0,0,_sdata10
.stabs "triggerKeyOnFlag:V15",40,0,0,_sdata9
.stabs "protectKeyOffFlag:V15",40,0,0,_sdata8
.stabs "protectKeyOnFlag:V15",40,0,0,_sdata7
.stabs "timeCnt4:V9",40,0,0,_sdata6
.stabs "timeCnt3:V9",40,0,0,_sdata5
.stabs "timeCnt2:V9",40,0,0,_sdata4
.stabs "timeCnt1:V9",40,0,0,_sdata3
.stabn 0xE0,0,0,L134-_ProcessKey
L134:
.stabn 0x44,0,112,L135-_ProcessKey
L135:
L2:
	RET
.stabs "_intrinsicbitfield:T16=s1bit0:12,0,1;bit1:12,1,1;bit2:12,2,1;\\",128,0,0,0
.stabs "bit3:12,3,1;bit4:12,4,1;bit5:12,5,1;bit6:12,6,1;bit7:12,7,1;;",128,0,0,0
.stabs "FlagStatus:t15",128,0,0,0
.stabs "u16t:t12",128,0,0,0
.stabs "u8t:t9",128,0,0,0
.stabs "", 100, 0, 0,Letext
Letext:
