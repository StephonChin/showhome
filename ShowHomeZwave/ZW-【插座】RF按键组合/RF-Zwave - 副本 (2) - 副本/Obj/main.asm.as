CHIP SN8P2711
EXTERN DATA X
EXTERN DATA H
EXTERN DATA L
EXTERN DATA T
EXTERN DATA I
.CODE
.stabs "lcc4_compiled.",0x3C,0,0,0
.stabs "F:\RF按键组合\RF-Zwave - 副本 (2) - 副本/",0x64,0,3,Ltext0
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
PUBLIC _main
PUBLIC _Delay5s
PUBLIC _SingleJudge
PUBLIC _rfOnPulse
PUBLIC _rfOffPulse
PUBLIC _waveOffPulse
_Function_main_data SEGMENT DATA INBANK
	_main_data@0	DS	1
_Function_Delay5s_data SEGMENT DATA INBANK
	_Delay5s_data@0	DS	1
	_Delay5s_data@1	DS	1
_Function_SingleJudge_data SEGMENT DATA INBANK
	_SingleJudge_data@0	DS	1
_Function_rfOnPulse_data SEGMENT DATA INBANK
	_rfOnPulse_data@0	DS	1
_Function_rfOffPulse_data SEGMENT DATA INBANK
	_rfOffPulse_data@0	DS	1
_Function_waveOffPulse_data SEGMENT DATA INBANK
	_waveOffPulse_data@0	DS	1
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
.stabs " :T15=eFALSE:0,TRUE:1,;",128,0,0,0
.stabs "flagSingle:15",128,0,0,_main_data@0
.stabn 0xC0,0,0,L9-_main
L9:
.stabn 0x44,0,9,L10-_main
L10:
 .stabn 0x44,0,10,L11-_main
L11:
	CLR _main_data@0
.stabn 0x44,0,11,L12-_main
L12:
	CALL _GpioInit
.stabn 0x44,0,12,L13-_main
L13:
	CALL _TimerInit
.stabn 0xC0,0,1,L14-_main
L14:
.stabn 0x44,0,15,L15-_main
L15:
	JMP L7
L6:
.stabn 0xC0,0,2,L16-_main
L16:
.stabn 0x44,0,17,L17-_main
L17:
 .stabn 0x44,0,18,L18-_main
L18:
	CALL _SingleJudge
	MOV _main_data@0, A
.stabn 0xE0,0,2,L19-_main
L19:
.stabn 0x44,0,19,L20-_main
L20:
L7:
.stabn 0x44,0,16,L21-_main
L21:
	MOV A, _main_data@0
	B0BTS0	134.0
	JMP	L6
.stabn 0x44,0,21,L22-_main
L22:
	CALL _rfOnPulse
.stabn 0x44,0,23,L23-_main
L23:
	CALL _Delay5s
.stabn 0x44,0,25,L24-_main
L24:
	CALL _rfOffPulse
.stabn 0x44,0,27,L25-_main
L25:
	CALL _waveOffPulse
.stabn 0x44,0,29,L26-_main
L26:
	CLR _main_data@0
.stabn 0xE0,0,1,L27-_main
L27:
.stabn 0x44,0,30,L28-_main
L28:
L4:
.stabn 0x44,0,14,L29-_main
L29:
	JMP L7
.stabn 0xE0,0,0,L30-_main
L30:
.stabn 0x44,0,31,L31-_main
L31:
L2:
_main_end:
	CALL __ClearWatchDogTimer
	JMP _main_end
CALLTREE _main invoke _GpioInit,_TimerInit,_SingleJudge,_rfOnPulse,_Delay5s,_rfOffPulse,_waveOffPulse
.stabs "Delay5s:F13",36,0,0,_Delay5s
_Function_Delay5s_code SEGMENT CODE INBANK USING _Function_Delay5s_data
_Delay5s:
.stabs "catNum1:9",128,0,0,_Delay5s_data@0
.stabs "catNum2:9",128,0,0,_Delay5s_data@1
.stabn 0xC0,0,0,L40-_Delay5s
L40:
.stabn 0x44,0,37,L41-_Delay5s
L41:
 .stabn 0x44,0,38,L42-_Delay5s
L42:
	CLR _Delay5s_data@0
.stabn 0x44,0,39,L43-_Delay5s
L43:
	CLR _Delay5s_data@1
.stabn 0x44,0,41,L44-_Delay5s
L44:
	B0BSET 0xDA.7
	JMP L34
L33:
.stabn 0xC0,0,1,L45-_Delay5s
L45:
.stabn 0x44,0,43,L46-_Delay5s
L46:
 .stabn 0x44,0,44,L47-_Delay5s
L47:
	B0BTS1 0xC8.5
	JMP L36
.stabn 0xC0,0,2,L48-_Delay5s
L48:
.stabn 0x44,0,45,L49-_Delay5s
L49:
 .stabn 0x44,0,46,L50-_Delay5s
L50:
	B0BCLR 0xC8.5
.stabn 0x44,0,47,L51-_Delay5s
L51:
	INCMS _Delay5s_data@0
	NOP
.stabn 0x44,0,48,L52-_Delay5s
L52:
	MOV A, _Delay5s_data@0
	CMPRS A, #0x1e
	B0BTS1	134.2
	JMP	L38
.stabn 0xC0,0,3,L53-_Delay5s
L53:
.stabn 0x44,0,49,L54-_Delay5s
L54:
 .stabn 0x44,0,50,L55-_Delay5s
L55:
	CLR _Delay5s_data@0
.stabn 0x44,0,51,L56-_Delay5s
L56:
	INCMS _Delay5s_data@1
	NOP
.stabn 0xE0,0,3,L57-_Delay5s
L57:
.stabn 0x44,0,52,L58-_Delay5s
L58:
L38:
.stabn 0xE0,0,2,L59-_Delay5s
L59:
.stabn 0x44,0,53,L60-_Delay5s
L60:
L36:
.stabn 0xE0,0,1,L61-_Delay5s
L61:
.stabn 0x44,0,54,L62-_Delay5s
L62:
L34:
.stabn 0x44,0,42,L63-_Delay5s
L63:
	MOV A, _Delay5s_data@1
	SUB A, #0xc8
	B0BTS1	134.2
	JMP	L33
.stabn 0x44,0,55,L64-_Delay5s
L64:
	B0BCLR 0xDA.7
.stabn 0xE0,0,0,L65-_Delay5s
L65:
.stabn 0x44,0,56,L66-_Delay5s
L66:
L32:
	RET
.stabs "SingleJudge:F15",36,0,0,_SingleJudge
_Function_SingleJudge_code SEGMENT CODE INBANK USING _Function_SingleJudge_data
_SingleJudge:
.stabs "catNum:9",128,0,0,_SingleJudge_data@0
.stabn 0xC0,0,0,L78-_SingleJudge
L78:
.stabn 0x44,0,61,L79-_SingleJudge
L79:
 .stabn 0x44,0,62,L80-_SingleJudge
L80:
	CLR _SingleJudge_data@0
L68:
.stabn 0x44,0,64,L81-_SingleJudge
L81:
L69:
.stabn 0x44,0,64,L82-_SingleJudge
L82:
	B0BTS0 0xD2.4
	JMP L68
.stabn 0x44,0,65,L83-_SingleJudge
L83:
	B0BSET 0xDA.7
	JMP L72
L71:
.stabn 0xC0,0,1,L84-_SingleJudge
L84:
.stabn 0x44,0,67,L85-_SingleJudge
L85:
 .stabn 0x44,0,68,L86-_SingleJudge
L86:
	B0BTS1 0xC8.5
	JMP L74
.stabn 0xC0,0,2,L87-_SingleJudge
L87:
.stabn 0x44,0,69,L88-_SingleJudge
L88:
 .stabn 0x44,0,70,L89-_SingleJudge
L89:
	INCMS _SingleJudge_data@0
	NOP
.stabn 0x44,0,71,L90-_SingleJudge
L90:
	B0BCLR 0xC8.5
.stabn 0xE0,0,2,L91-_SingleJudge
L91:
.stabn 0x44,0,72,L92-_SingleJudge
L92:
L74:
.stabn 0xE0,0,1,L93-_SingleJudge
L93:
.stabn 0x44,0,73,L94-_SingleJudge
L94:
L72:
.stabn 0x44,0,66,L95-_SingleJudge
L95:
	MOV A, _SingleJudge_data@0
	SUB A, #0x1e
	B0BTS1	134.2
	JMP	L71
.stabn 0x44,0,74,L96-_SingleJudge
L96:
	B0BCLR 0xDA.7
.stabn 0x44,0,76,L97-_SingleJudge
L97:
	B0BTS1 0xD2.4
	JMP L76
.stabn 0x44,0,77,L98-_SingleJudge
L98:
	MOV A, #0x01
	JMP L67
L76:
.stabn 0x44,0,79,L99-_SingleJudge
L99:
	MOV A, #0x00
.stabn 0xE0,0,0,L100-_SingleJudge
L100:
.stabn 0x44,0,80,L101-_SingleJudge
L101:
L67:
	RET
.stabs "rfOnPulse:F13",36,0,0,_rfOnPulse
_Function_rfOnPulse_code SEGMENT CODE INBANK USING _Function_rfOnPulse_data
_rfOnPulse:
.stabs "catNum:9",128,0,0,_rfOnPulse_data@0
.stabn 0xC0,0,0,L108-_rfOnPulse
L108:
.stabn 0x44,0,86,L109-_rfOnPulse
L109:
 .stabn 0x44,0,87,L110-_rfOnPulse
L110:
	CLR _rfOnPulse_data@0
.stabn 0x44,0,88,L111-_rfOnPulse
L111:
	B0BSET 0xD2.2
.stabn 0x44,0,89,L112-_rfOnPulse
L112:
	B0BSET 0xDA.7
	JMP L104
L103:
.stabn 0xC0,0,1,L113-_rfOnPulse
L113:
.stabn 0x44,0,91,L114-_rfOnPulse
L114:
 .stabn 0x44,0,92,L115-_rfOnPulse
L115:
	B0BTS1 0xC8.5
	JMP L106
.stabn 0xC0,0,2,L116-_rfOnPulse
L116:
.stabn 0x44,0,93,L117-_rfOnPulse
L117:
 .stabn 0x44,0,94,L118-_rfOnPulse
L118:
	INCMS _rfOnPulse_data@0
	NOP
.stabn 0x44,0,95,L119-_rfOnPulse
L119:
	B0BCLR 0xC8.5
.stabn 0xE0,0,2,L120-_rfOnPulse
L120:
.stabn 0x44,0,96,L121-_rfOnPulse
L121:
L106:
.stabn 0xE0,0,1,L122-_rfOnPulse
L122:
.stabn 0x44,0,97,L123-_rfOnPulse
L123:
L104:
.stabn 0x44,0,90,L124-_rfOnPulse
L124:
	MOV A, _rfOnPulse_data@0
	SUB A, #0xc8
	B0BTS1	134.2
	JMP	L103
.stabn 0x44,0,98,L125-_rfOnPulse
L125:
	B0BCLR 0xD2.2
.stabn 0x44,0,99,L126-_rfOnPulse
L126:
	B0BCLR 0xDA.7
.stabn 0xE0,0,0,L127-_rfOnPulse
L127:
.stabn 0x44,0,100,L128-_rfOnPulse
L128:
L102:
	RET
.stabs "rfOffPulse:F13",36,0,0,_rfOffPulse
_Function_rfOffPulse_code SEGMENT CODE INBANK USING _Function_rfOffPulse_data
_rfOffPulse:
.stabs "catNum:9",128,0,0,_rfOffPulse_data@0
.stabn 0xC0,0,0,L135-_rfOffPulse
L135:
.stabn 0x44,0,106,L136-_rfOffPulse
L136:
 .stabn 0x44,0,107,L137-_rfOffPulse
L137:
	CLR _rfOffPulse_data@0
.stabn 0x44,0,108,L138-_rfOffPulse
L138:
	B0BSET 0xD5.4
.stabn 0x44,0,109,L139-_rfOffPulse
L139:
	B0BSET 0xDA.7
	JMP L131
L130:
.stabn 0xC0,0,1,L140-_rfOffPulse
L140:
.stabn 0x44,0,111,L141-_rfOffPulse
L141:
 .stabn 0x44,0,112,L142-_rfOffPulse
L142:
	B0BTS1 0xC8.5
	JMP L133
.stabn 0xC0,0,2,L143-_rfOffPulse
L143:
.stabn 0x44,0,113,L144-_rfOffPulse
L144:
 .stabn 0x44,0,114,L145-_rfOffPulse
L145:
	INCMS _rfOffPulse_data@0
	NOP
.stabn 0x44,0,115,L146-_rfOffPulse
L146:
	B0BCLR 0xC8.5
.stabn 0xE0,0,2,L147-_rfOffPulse
L147:
.stabn 0x44,0,116,L148-_rfOffPulse
L148:
L133:
.stabn 0xE0,0,1,L149-_rfOffPulse
L149:
.stabn 0x44,0,117,L150-_rfOffPulse
L150:
L131:
.stabn 0x44,0,110,L151-_rfOffPulse
L151:
	MOV A, _rfOffPulse_data@0
	SUB A, #0xc8
	B0BTS1	134.2
	JMP	L130
.stabn 0x44,0,118,L152-_rfOffPulse
L152:
	B0BCLR 0xD5.4
.stabn 0x44,0,119,L153-_rfOffPulse
L153:
	B0BCLR 0xDA.7
.stabn 0xE0,0,0,L154-_rfOffPulse
L154:
.stabn 0x44,0,120,L155-_rfOffPulse
L155:
L129:
	RET
.stabs "waveOffPulse:F13",36,0,0,_waveOffPulse
_Function_waveOffPulse_code SEGMENT CODE INBANK USING _Function_waveOffPulse_data
_waveOffPulse:
.stabs "catNum:9",128,0,0,_waveOffPulse_data@0
.stabn 0xC0,0,0,L162-_waveOffPulse
L162:
.stabn 0x44,0,126,L163-_waveOffPulse
L163:
 .stabn 0x44,0,127,L164-_waveOffPulse
L164:
	CLR _waveOffPulse_data@0
.stabn 0x44,0,128,L165-_waveOffPulse
L165:
	B0BCLR 0xD2.3
.stabn 0x44,0,129,L166-_waveOffPulse
L166:
	B0BSET 0xDA.7
	JMP L158
L157:
.stabn 0xC0,0,1,L167-_waveOffPulse
L167:
.stabn 0x44,0,131,L168-_waveOffPulse
L168:
 .stabn 0x44,0,132,L169-_waveOffPulse
L169:
	B0BTS1 0xC8.5
	JMP L160
.stabn 0xC0,0,2,L170-_waveOffPulse
L170:
.stabn 0x44,0,133,L171-_waveOffPulse
L171:
 .stabn 0x44,0,134,L172-_waveOffPulse
L172:
	INCMS _waveOffPulse_data@0
	NOP
.stabn 0x44,0,135,L173-_waveOffPulse
L173:
	B0BCLR 0xC8.5
.stabn 0xE0,0,2,L174-_waveOffPulse
L174:
.stabn 0x44,0,136,L175-_waveOffPulse
L175:
L160:
.stabn 0xE0,0,1,L176-_waveOffPulse
L176:
.stabn 0x44,0,137,L177-_waveOffPulse
L177:
L158:
.stabn 0x44,0,130,L178-_waveOffPulse
L178:
	MOV A, _waveOffPulse_data@0
	SUB A, #0x64
	B0BTS1	134.2
	JMP	L157
.stabn 0x44,0,138,L179-_waveOffPulse
L179:
	B0BSET 0xD2.3
.stabn 0x44,0,139,L180-_waveOffPulse
L180:
	B0BCLR 0xDA.7
.stabn 0xE0,0,0,L181-_waveOffPulse
L181:
.stabn 0x44,0,140,L182-_waveOffPulse
L182:
L156:
	RET
.stabs "_intrinsicbitfield:T16=s1bit0:12,0,1;bit1:12,1,1;bit2:12,2,1;\\",128,0,0,0
.stabs "bit3:12,3,1;bit4:12,4,1;bit5:12,5,1;bit6:12,6,1;bit7:12,7,1;;",128,0,0,0
.stabs "FlagStatus:t15",128,0,0,0
.stabs "u16t:t12",128,0,0,0
.stabs "u8t:t9",128,0,0,0
.stabs "", 100, 0, 0,Letext
Letext:
EXTERN CODE _GpioInit
EXTERN CODE _TimerInit
EXTERN CODE __ClearWatchDogTimer
