CHIP SN8P2711B
EXTERN DATA X
EXTERN DATA H
EXTERN DATA L
EXTERN DATA T
EXTERN DATA I
.CODE
.stabs "lcc4_compiled.",0x3C,0,0,0
.stabs "F:\PROJECT\ShowHome\ZW-112-ʱ��ɵ�\ZW-112/",0x64,0,3,Ltext0
.stabs ".\Src\single_output.c",0x64,0,3,Ltext0
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
PUBLIC _SingleOutput
EXTERN DATA_BIT _forbidFlag
EXTERN DATA_BIT _sysTriacFlag
EXTERN DATA_BIT _sysTriacInit
EXTERN DATA_BIT _sysPirStatusFlag
EXTERN DATA_BIT _sysKeyStatusFlag
EXTERN DATA _sysForbidTime
_Function_SingleOutput_data SEGMENT DATA INBANK
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
_sdata6@segment BITSEGMENT DATA INBANK
	_sdata6 DSBIT 1
_sdata7@segment BITSEGMENT DATA INBANK
	_sdata7 DSBIT 1
_sdata8@segment BITSEGMENT DATA INBANK
	_sdata8 DSBIT 1
_sdata9@segment SEGMENT DATA INBANK
	_sdata9 DS 2
.stabs "SingleOutput:F13",36,0,0,_SingleOutput
_Function_SingleOutput_code SEGMENT CODE INBANK USING _Function_SingleOutput_data
_SingleOutput:
.stabn 0xC0,0,0,L47-_SingleOutput
L47:
.stabn 0x44,0,13,L48-_SingleOutput
L48:
 .stabn 0x44,0,23,L49-_SingleOutput
L49:
	BTS1 _sysKeyStatusFlag
	JMP L10
.stabn 0xC0,0,1,L50-_SingleOutput
L50:
.stabn 0x44,0,24,L51-_SingleOutput
L51:
 .stabn 0x44,0,25,L52-_SingleOutput
L52:
	B0BCLR 0xD4.0
.stabn 0x44,0,26,L53-_SingleOutput
L53:
	INCMS _sdata2
	NOP
.stabn 0x44,0,27,L54-_SingleOutput
L54:
	MOV A, _sdata2
	CMPRS A, #0x18
	B0BTS1	134.2
	JMP	L12
.stabn 0xC0,0,2,L55-_SingleOutput
L55:
.stabn 0x44,0,28,L56-_SingleOutput
L56:
 .stabn 0x44,0,29,L57-_SingleOutput
L57:
	BCLR _sysKeyStatusFlag
.stabn 0x44,0,30,L58-_SingleOutput
L58:
	CLR _sdata2
.stabn 0x44,0,31,L59-_SingleOutput
L59:
	B0BSET 0xD4.0
.stabn 0xE0,0,2,L60-_SingleOutput
L60:
.stabn 0x44,0,32,L61-_SingleOutput
L61:
L12:
.stabn 0xE0,0,1,L62-_SingleOutput
L62:
.stabn 0x44,0,33,L63-_SingleOutput
L63:
L10:
.stabn 0x44,0,35,L64-_SingleOutput
L64:
	BTS1 _sysPirStatusFlag
	JMP L18
	BTS0 _sdata6
	JMP L18
	BTS1 _forbidFlag
	JMP L16
L18:
	BTS1 _sdata8
	JMP L14
L16:
.stabn 0xC0,0,1,L65-_SingleOutput
L65:
.stabn 0x44,0,36,L66-_SingleOutput
L66:
 .stabn 0x44,0,37,L67-_SingleOutput
L67:
	B0BCLR 0xD4.0
.stabn 0x44,0,38,L68-_SingleOutput
L68:
	INCMS _sdata3
	NOP
.stabn 0x44,0,39,L69-_SingleOutput
L69:
	MOV A, _sdata3
	CMPRS A, #0x18
	B0BTS1	134.2
	JMP	L15
.stabn 0xC0,0,2,L70-_SingleOutput
L70:
.stabn 0x44,0,40,L71-_SingleOutput
L71:
 .stabn 0x44,0,41,L72-_SingleOutput
L72:
	CLR _sdata3
.stabn 0x44,0,42,L73-_SingleOutput
L73:
	BCLR _sdata8
.stabn 0x44,0,43,L74-_SingleOutput
L74:
	BCLR _sysPirStatusFlag
.stabn 0x44,0,44,L75-_SingleOutput
L75:
	B0BSET 0xD4.0
.stabn 0x44,0,45,L76-_SingleOutput
L76:
	BSET _sdata7
.stabn 0xE0,0,2,L77-_SingleOutput
L77:
.stabn 0x44,0,46,L78-_SingleOutput
L78:
 .stabn 0xE0,0,1,L79-_SingleOutput
L79:
.stabn 0x44,0,47,L80-_SingleOutput
L80:
	JMP L15
L14:
.stabn 0xC0,0,1,L81-_SingleOutput
L81:
.stabn 0x44,0,50,L82-_SingleOutput
L82:
 .stabn 0x44,0,51,L83-_SingleOutput
L83:
	BCLR _sdata7
.stabn 0x44,0,52,L84-_SingleOutput
L84:
	BCLR _sysPirStatusFlag
.stabn 0xE0,0,1,L85-_SingleOutput
L85:
.stabn 0x44,0,53,L86-_SingleOutput
L86:
L15:
.stabn 0x44,0,56,L87-_SingleOutput
L87:
	BTS1 _sysTriacFlag
	JMP L21
.stabn 0xC0,0,1,L88-_SingleOutput
L88:
.stabn 0x44,0,57,L89-_SingleOutput
L89:
 .stabn 0x44,0,58,L90-_SingleOutput
L90:
	BTS0 _forbidFlag
	JMP L23
.stabn 0xC0,0,2,L91-_SingleOutput
L91:
.stabn 0x44,0,59,L92-_SingleOutput
L92:
 .stabn 0x44,0,60,L93-_SingleOutput
L93:
	BTS1 _sysTriacInit
	JMP L25
.stabn 0xC0,0,3,L94-_SingleOutput
L94:
.stabn 0x44,0,61,L95-_SingleOutput
L95:
 .stabn 0x44,0,62,L96-_SingleOutput
L96:
	BCLR _sysTriacInit
.stabn 0x44,0,63,L97-_SingleOutput
L97:
	CLR _sdata4
.stabn 0x44,0,64,L98-_SingleOutput
L98:
	CLR _sdata5
.stabn 0xE0,0,3,L99-_SingleOutput
L99:
.stabn 0x44,0,65,L100-_SingleOutput
L100:
L25:
.stabn 0x44,0,67,L101-_SingleOutput
L101:
	MOV A, _sysForbidTime
	B0BTS0	134.0
	JMP	L27
.stabn 0xC0,0,3,L102-_SingleOutput
L102:
.stabn 0x44,0,68,L103-_SingleOutput
L103:
 .stabn 0x44,0,69,L104-_SingleOutput
L104:
	BTS1 _sdata7
	JMP L29
.stabn 0xC0,0,4,L105-_SingleOutput
L105:
.stabn 0x44,0,70,L106-_SingleOutput
L106:
 .stabn 0x44,0,71,L107-_SingleOutput
L107:
	BSET _sdata6
.stabn 0xE0,0,4,L108-_SingleOutput
L108:
.stabn 0x44,0,72,L109-_SingleOutput
L109:
L29:
.stabn 0x44,0,73,L110-_SingleOutput
L110:
	B0BSET 0xD5.3
.stabn 0x44,0,75,L111-_SingleOutput
L111:
	INCMS _sdata4
	NOP
.stabn 0x44,0,77,L112-_SingleOutput
L112:
	MOV A, _sdata4
	CMPRS A, #0xf9
	B0BTS1	134.2
	JMP	L24
.stabn 0xC0,0,4,L113-_SingleOutput
L113:
.stabn 0x44,0,78,L114-_SingleOutput
L114:
 .stabn 0x44,0,79,L115-_SingleOutput
L115:
	CLR _sdata4
.stabn 0x44,0,80,L116-_SingleOutput
L116:
	INCMS _sdata5
	NOP
.stabn 0x44,0,82,L117-_SingleOutput
L117:
	MOV A, _sysForbidTime
	SUB A, #0x01
	B0MOV W0, A
	MOV A, _sdata5
	CMPRS A, W0
	B0BTS1	134.2
	JMP	L24
.stabn 0xC0,0,5,L118-_SingleOutput
L118:
.stabn 0x44,0,83,L119-_SingleOutput
L119:
 .stabn 0x44,0,84,L120-_SingleOutput
L120:
	BCLR _sysTriacFlag
.stabn 0x44,0,85,L121-_SingleOutput
L121:
	CLR _sdata5
.stabn 0x44,0,86,L122-_SingleOutput
L122:
	B0BCLR 0xD5.3
.stabn 0x44,0,87,L123-_SingleOutput
L123:
	BCLR _sdata6
.stabn 0x44,0,88,L124-_SingleOutput
L124:
	BSET _sdata8
.stabn 0x44,0,89,L125-_SingleOutput
L125:
	BSET _forbidFlag
.stabn 0xE0,0,5,L126-_SingleOutput
L126:
.stabn 0x44,0,90,L127-_SingleOutput
L127:
 .stabn 0xE0,0,4,L128-_SingleOutput
L128:
.stabn 0x44,0,91,L129-_SingleOutput
L129:
 .stabn 0xE0,0,3,L130-_SingleOutput
L130:
.stabn 0x44,0,92,L131-_SingleOutput
L131:
	JMP L24
L27:
.stabn 0xC0,0,3,L132-_SingleOutput
L132:
.stabn 0x44,0,94,L133-_SingleOutput
L133:
 .stabn 0x44,0,95,L134-_SingleOutput
L134:
	BCLR _sdata7
.stabn 0x44,0,96,L135-_SingleOutput
L135:
	BCLR _sysTriacFlag
.stabn 0x44,0,97,L136-_SingleOutput
L136:
	BSET _forbidFlag
.stabn 0xE0,0,3,L137-_SingleOutput
L137:
.stabn 0x44,0,98,L138-_SingleOutput
L138:
 .stabn 0xE0,0,2,L139-_SingleOutput
L139:
.stabn 0x44,0,99,L140-_SingleOutput
L140:
	JMP L24
L23:
.stabn 0xC0,0,2,L141-_SingleOutput
L141:
.stabn 0x44,0,101,L142-_SingleOutput
L142:
 .stabn 0x44,0,102,L143-_SingleOutput
L143:
	BCLR _sysTriacFlag
.stabn 0xE0,0,2,L144-_SingleOutput
L144:
.stabn 0x44,0,103,L145-_SingleOutput
L145:
L24:
.stabn 0xE0,0,1,L146-_SingleOutput
L146:
.stabn 0x44,0,104,L147-_SingleOutput
L147:
L21:
.stabn 0x44,0,106,L148-_SingleOutput
L148:
	BTS1 _forbidFlag
	JMP L35
.stabn 0xC0,0,1,L149-_SingleOutput
L149:
.stabn 0x44,0,107,L150-_SingleOutput
L150:
 .stabn 0x44,0,108,L151-_SingleOutput
L151:
	INCMS _sdata9+0
	NOP
.stabn 0x44,0,109,L152-_SingleOutput
L152:
	MOV A, _sdata9+0
	CMPRS A, #0xf9
	B0BTS1	134.2
	JMP	L38
.stabn 0xC0,0,2,L153-_SingleOutput
L153:
.stabn 0x44,0,110,L154-_SingleOutput
L154:
 .stabn 0x44,0,111,L155-_SingleOutput
L155:
	CLR _sdata9+0
.stabn 0x44,0,112,L156-_SingleOutput
L156:
	INCMS _sdata9+1
	NOP
.stabn 0x44,0,113,L157-_SingleOutput
L157:
	MOV A, _sdata9+1
	CMPRS A, #0x04
	B0BTS1	134.2
	JMP	L43
.stabn 0xC0,0,3,L158-_SingleOutput
L158:
.stabn 0x44,0,114,L159-_SingleOutput
L159:
 .stabn 0x44,0,115,L160-_SingleOutput
L160:
	CLR _sdata9+1
.stabn 0x44,0,116,L161-_SingleOutput
L161:
	BCLR _forbidFlag
.stabn 0xE0,0,3,L162-_SingleOutput
L162:
.stabn 0x44,0,117,L163-_SingleOutput
L163:
L43:
.stabn 0xE0,0,2,L164-_SingleOutput
L164:
.stabn 0x44,0,118,L165-_SingleOutput
L165:
L38:
.stabn 0xE0,0,1,L166-_SingleOutput
L166:
.stabn 0x44,0,119,L167-_SingleOutput
L167:
L35:
.stabs ":t15=ar1;0;1;9",128,0,0,0
.stabs "forbidTime:V15",40,0,0,_sdata9
.stabs "wakeLastFlag:V300",40,0,0,_sdata8
.stabs "wakeDoneFlag:V300",40,0,0,_sdata7
.stabs "pirForbidFlag:V300",40,0,0,_sdata6
.stabs "triacCnt2:V9",40,0,0,_sdata5
.stabs "triacCnt1:V9",40,0,0,_sdata4
.stabs "wakeCnt2:V9",40,0,0,_sdata3
.stabs "wakeCnt1:V9",40,0,0,_sdata2
.stabn 0xE0,0,0,L168-_SingleOutput
L168:
.stabn 0x44,0,120,L169-_SingleOutput
L169:
L1:
	RET
.stabs "_intrinsicbitfield:T16=s1bit0:12,0,1;bit1:12,1,1;bit2:12,2,1;\\",128,0,0,0
.stabs "bit3:12,3,1;bit4:12,4,1;bit5:12,5,1;bit6:12,6,1;bit7:12,7,1;;",128,0,0,0
.stabs "BitStatus:t14",128,0,0,0
.stabs "uint:t10",128,0,0,0
.stabs "uchar:t9",128,0,0,0
.stabs "", 100, 0, 0,Letext
Letext:
