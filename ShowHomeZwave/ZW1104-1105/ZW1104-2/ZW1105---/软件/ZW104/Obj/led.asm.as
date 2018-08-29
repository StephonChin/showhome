CHIP SN8P2511
EXTERN DATA X
EXTERN DATA H
EXTERN DATA L
EXTERN DATA T
EXTERN DATA I
.CODE
.stabs "lcc4_compiled.",0x3C,0,0,0
.stabs "E:\guomeng\2015年项目\z-wave\ZW1105\软件\ZW104/",0x64,0,3,Ltext0
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
 .stabn 0x44,0,17,L10-_led_control
L10:
	MOV A, _led_mode
	ADD A, #0x80
	CMPRS A, #0x84
	B0BTS0 134.2
	JMP L348
	SUB A, #0x80
	B0BTS1 134.2
	JMP L348
	B0ADD 206, A
	JMP L4
	JMP L5
	JMP L6
	JMP L7
L348:
	JMP L3
.stabn 0xC0,0,1,L11-_led_control
L11:
.stabn 0x44,0,18,L12-_led_control
L12:
L4:
.stabn 0x44,0,20,L13-_led_control
L13:
	CALL _led_control_one
.stabn 0x44,0,21,L14-_led_control
L14:
	JMP L3
L5:
.stabn 0x44,0,24,L15-_led_control
L15:
	CALL _led_control_two
.stabn 0x44,0,25,L16-_led_control
L16:
	JMP L3
L6:
.stabn 0x44,0,28,L17-_led_control
L17:
	CALL _led_control_three
.stabn 0x44,0,29,L18-_led_control
L18:
	JMP L3
L7:
.stabn 0x44,0,32,L19-_led_control
L19:
	CALL _led_control_four
.stabn 0x44,0,33,L20-_led_control
L20:
 .stabn 0x44,0,36,L21-_led_control
L21:
 .stabn 0xE0,0,1,L22-_led_control
L22:
.stabn 0x44,0,37,L23-_led_control
L23:
L3:
.stabn 0xE0,0,0,L24-_led_control
L24:
.stabn 0x44,0,38,L25-_led_control
L25:
L1:
	RET
CALLTREE _led_control invoke _led_control_one,_led_control_two,_led_control_three,_led_control_four
.stabs "led_control_one:F13",36,0,0,_led_control_one
_Function_led_control_one_code SEGMENT CODE INBANK USING _Function_led_control_one_data
_led_control_one:
.stabn 0xC0,0,0,L37-_led_control_one
L37:
.stabn 0x44,0,49,L38-_led_control_one
L38:
 .stabn 0x44,0,50,L39-_led_control_one
L39:
	BTS0 _led_mode_init
	JMP L27
.stabn 0xC0,0,1,L40-_led_control_one
L40:
.stabn 0x44,0,51,L41-_led_control_one
L41:
 .stabn 0x44,0,52,L42-_led_control_one
L42:
	BSET _led_mode_init
.stabn 0x44,0,53,L43-_led_control_one
L43:
	CLR _led_delay_3
.stabn 0x44,0,54,L44-_led_control_one
L44:
	B0BSET 0xD0.0
.stabn 0x44,0,55,L45-_led_control_one
L45:
	B0BSET 0xD2.3
.stabn 0x44,0,56,L46-_led_control_one
L46:
	B0BSET 0xD2.2
.stabn 0x44,0,57,L47-_led_control_one
L47:
	B0BCLR 0xD1.0
.stabn 0x44,0,58,L48-_led_control_one
L48:
	B0BCLR 0xD2.4
.stabn 0x44,0,59,L49-_led_control_one
L49:
	B0BCLR 0xD2.1
.stabn 0x44,0,60,L50-_led_control_one
L50:
	B0BCLR 0xD5.4
.stabn 0x44,0,61,L51-_led_control_one
L51:
	B0BCLR 0xD2.5
.stabn 0x44,0,62,L52-_led_control_one
L52:
	B0BCLR 0xD2.0
.stabn 0xE0,0,1,L53-_led_control_one
L53:
.stabn 0x44,0,63,L54-_led_control_one
L54:
L27:
.stabn 0x44,0,65,L55-_led_control_one
L55:
	DECS _led_delay_3
	JMP L29
.stabn 0xC0,0,1,L56-_led_control_one
L56:
.stabn 0x44,0,66,L57-_led_control_one
L57:
 .stabn 0x44,0,67,L58-_led_control_one
L58:
	B0BCLR 0xD0.0
.stabn 0x44,0,68,L59-_led_control_one
L59:
	B0BCLR 0xD2.3
.stabn 0x44,0,69,L60-_led_control_one
L60:
	B0BCLR 0xD2.2
.stabn 0x44,0,70,L61-_led_control_one
L61:
	B0BSET 0xD1.0
.stabn 0x44,0,71,L62-_led_control_one
L62:
	B0BSET 0xD2.4
.stabn 0x44,0,72,L63-_led_control_one
L63:
	B0BSET 0xD2.1
.stabn 0xE0,0,1,L64-_led_control_one
L64:
.stabn 0x44,0,73,L65-_led_control_one
L65:
L29:
.stabn 0x44,0,75,L66-_led_control_one
L66:
	MOV A, _led_delay_3
	CMPRS A, #0x03
	JMP L31
.stabn 0xC0,0,1,L67-_led_control_one
L67:
.stabn 0x44,0,76,L68-_led_control_one
L68:
 .stabn 0x44,0,77,L69-_led_control_one
L69:
	B0BCLR 0xD1.0
.stabn 0x44,0,78,L70-_led_control_one
L70:
	B0BCLR 0xD2.4
.stabn 0x44,0,79,L71-_led_control_one
L71:
	B0BCLR 0xD2.1
.stabn 0x44,0,80,L72-_led_control_one
L72:
	B0BSET 0xD5.4
.stabn 0x44,0,81,L73-_led_control_one
L73:
	B0BSET 0xD2.5
.stabn 0x44,0,82,L74-_led_control_one
L74:
	B0BSET 0xD2.0
.stabn 0xE0,0,1,L75-_led_control_one
L75:
.stabn 0x44,0,83,L76-_led_control_one
L76:
L31:
.stabn 0x44,0,84,L77-_led_control_one
L77:
	MOV A, _led_delay_3
	CMPRS A, #0x05
	JMP L33
.stabn 0xC0,0,1,L78-_led_control_one
L78:
.stabn 0x44,0,85,L79-_led_control_one
L79:
 .stabn 0x44,0,86,L80-_led_control_one
L80:
	B0BCLR 0xD5.4
.stabn 0x44,0,87,L81-_led_control_one
L81:
	B0BCLR 0xD2.5
.stabn 0x44,0,88,L82-_led_control_one
L82:
	B0BCLR 0xD2.0
.stabn 0x44,0,89,L83-_led_control_one
L83:
	B0BSET 0xD0.0
.stabn 0x44,0,90,L84-_led_control_one
L84:
	B0BSET 0xD2.3
.stabn 0x44,0,91,L85-_led_control_one
L85:
	B0BSET 0xD2.2
.stabn 0x44,0,92,L86-_led_control_one
L86:
	CLR _led_delay_3
.stabn 0xE0,0,1,L87-_led_control_one
L87:
.stabn 0x44,0,93,L88-_led_control_one
L88:
L33:
.stabn 0x44,0,94,L89-_led_control_one
L89:
	MOV A, _led_delay_3
	CMPRS A, #0x06
	JMP L35
.stabn 0xC0,0,1,L90-_led_control_one
L90:
.stabn 0x44,0,95,L91-_led_control_one
L91:
 .stabn 0x44,0,96,L92-_led_control_one
L92:
	CLR _led_delay_3
.stabn 0xE0,0,1,L93-_led_control_one
L93:
.stabn 0x44,0,97,L94-_led_control_one
L94:
L35:
.stabn 0xE0,0,0,L95-_led_control_one
L95:
.stabn 0x44,0,98,L96-_led_control_one
L96:
L26:
	RET
.stabs "led_control_two:F13",36,0,0,_led_control_two
_Function_led_control_two_code SEGMENT CODE INBANK USING _Function_led_control_two_data
_led_control_two:
.stabn 0xC0,0,0,L112-_led_control_two
L112:
.stabn 0x44,0,108,L113-_led_control_two
L113:
 .stabn 0x44,0,109,L114-_led_control_two
L114:
	BTS0 _led_mode_init
	JMP L98
.stabn 0xC0,0,1,L115-_led_control_two
L115:
.stabn 0x44,0,110,L116-_led_control_two
L116:
 .stabn 0x44,0,111,L117-_led_control_two
L117:
	BSET _led_mode_init
.stabn 0x44,0,112,L118-_led_control_two
L118:
	CLR _led_delay_3
.stabn 0x44,0,113,L119-_led_control_two
L119:
	B0BCLR 0xD1.0
.stabn 0x44,0,114,L120-_led_control_two
L120:
	B0BCLR 0xD0.0
.stabn 0x44,0,115,L121-_led_control_two
L121:
	B0BCLR 0xD2.3
.stabn 0x44,0,116,L122-_led_control_two
L122:
	B0BCLR 0xD2.2
.stabn 0x44,0,117,L123-_led_control_two
L123:
	B0BCLR 0xD2.4
.stabn 0x44,0,118,L124-_led_control_two
L124:
	B0BCLR 0xD2.1
.stabn 0x44,0,119,L125-_led_control_two
L125:
	B0BSET 0xD5.4
.stabn 0x44,0,120,L126-_led_control_two
L126:
	B0BSET 0xD2.5
.stabn 0x44,0,121,L127-_led_control_two
L127:
	B0BSET 0xD2.0
.stabn 0xE0,0,1,L128-_led_control_two
L128:
.stabn 0x44,0,122,L129-_led_control_two
L129:
L98:
.stabn 0x44,0,124,L130-_led_control_two
L130:
	DECS _led_delay_3
	JMP L100
.stabn 0xC0,0,1,L131-_led_control_two
L131:
.stabn 0x44,0,125,L132-_led_control_two
L132:
 .stabn 0x44,0,126,L133-_led_control_two
L133:
	B0BCLR 0xD5.4
.stabn 0x44,0,127,L134-_led_control_two
L134:
	B0BCLR 0xD2.5
.stabn 0x44,0,128,L135-_led_control_two
L135:
	B0BCLR 0xD2.0
.stabn 0xE0,0,1,L136-_led_control_two
L136:
.stabn 0x44,0,129,L137-_led_control_two
L137:
L100:
.stabn 0x44,0,130,L138-_led_control_two
L138:
	MOV A, _led_delay_3
	CMPRS A, #0x02
	JMP L102
.stabn 0xC0,0,1,L139-_led_control_two
L139:
.stabn 0x44,0,131,L140-_led_control_two
L140:
 .stabn 0x44,0,132,L141-_led_control_two
L141:
	B0BSET 0xD5.4
.stabn 0x44,0,133,L142-_led_control_two
L142:
	B0BSET 0xD2.5
.stabn 0x44,0,134,L143-_led_control_two
L143:
	B0BSET 0xD2.0
.stabn 0xE0,0,1,L144-_led_control_two
L144:
.stabn 0x44,0,135,L145-_led_control_two
L145:
L102:
.stabn 0x44,0,136,L146-_led_control_two
L146:
	MOV A, _led_delay_3
	CMPRS A, #0x03
	JMP L104
.stabn 0xC0,0,1,L147-_led_control_two
L147:
.stabn 0x44,0,137,L148-_led_control_two
L148:
 .stabn 0x44,0,138,L149-_led_control_two
L149:
	B0BCLR 0xD5.4
.stabn 0x44,0,139,L150-_led_control_two
L150:
	B0BCLR 0xD2.5
.stabn 0x44,0,140,L151-_led_control_two
L151:
	B0BCLR 0xD2.0
.stabn 0xE0,0,1,L152-_led_control_two
L152:
.stabn 0x44,0,141,L153-_led_control_two
L153:
L104:
.stabn 0x44,0,143,L154-_led_control_two
L154:
	MOV A, _led_delay_3
	CMPRS A, #0x04
	JMP L106
.stabn 0xC0,0,1,L155-_led_control_two
L155:
.stabn 0x44,0,144,L156-_led_control_two
L156:
 .stabn 0x44,0,145,L157-_led_control_two
L157:
	B0BSET 0xD5.4
.stabn 0x44,0,146,L158-_led_control_two
L158:
	B0BSET 0xD2.5
.stabn 0x44,0,147,L159-_led_control_two
L159:
	B0BSET 0xD2.0
.stabn 0xE0,0,1,L160-_led_control_two
L160:
.stabn 0x44,0,148,L161-_led_control_two
L161:
L106:
.stabn 0x44,0,150,L162-_led_control_two
L162:
	MOV A, _led_delay_3
	CMPRS A, #0x05
	JMP L108
.stabn 0xC0,0,1,L163-_led_control_two
L163:
.stabn 0x44,0,151,L164-_led_control_two
L164:
 .stabn 0x44,0,152,L165-_led_control_two
L165:
	B0BCLR 0xD5.4
.stabn 0x44,0,153,L166-_led_control_two
L166:
	B0BCLR 0xD2.5
.stabn 0x44,0,154,L167-_led_control_two
L167:
	B0BCLR 0xD2.0
.stabn 0xE0,0,1,L168-_led_control_two
L168:
.stabn 0x44,0,155,L169-_led_control_two
L169:
L108:
.stabn 0x44,0,156,L170-_led_control_two
L170:
	MOV A, _led_delay_3
	CMPRS A, #0x6e
	JMP L110
.stabn 0xC0,0,1,L171-_led_control_two
L171:
.stabn 0x44,0,157,L172-_led_control_two
L172:
 .stabn 0x44,0,158,L173-_led_control_two
L173:
	CLR _led_delay_3
.stabn 0x44,0,159,L174-_led_control_two
L174:
	B0BSET 0xD5.4
.stabn 0x44,0,160,L175-_led_control_two
L175:
	B0BSET 0xD2.5
.stabn 0x44,0,161,L176-_led_control_two
L176:
	B0BSET 0xD2.0
.stabn 0xE0,0,1,L177-_led_control_two
L177:
.stabn 0x44,0,162,L178-_led_control_two
L178:
L110:
.stabn 0xE0,0,0,L179-_led_control_two
L179:
.stabn 0x44,0,163,L180-_led_control_two
L180:
L97:
	RET
.stabs "led_control_three:F13",36,0,0,_led_control_three
_Function_led_control_three_code SEGMENT CODE INBANK USING _Function_led_control_three_data
_led_control_three:
.stabn 0xC0,0,0,L196-_led_control_three
L196:
.stabn 0x44,0,173,L197-_led_control_three
L197:
 .stabn 0x44,0,174,L198-_led_control_three
L198:
	BTS0 _led_mode_init
	JMP L182
.stabn 0xC0,0,1,L199-_led_control_three
L199:
.stabn 0x44,0,175,L200-_led_control_three
L200:
 .stabn 0x44,0,176,L201-_led_control_three
L201:
	BSET _led_mode_init
.stabn 0x44,0,177,L202-_led_control_three
L202:
	CLR _led_delay_3
.stabn 0x44,0,178,L203-_led_control_three
L203:
	B0BSET 0xD0.0
.stabn 0x44,0,179,L204-_led_control_three
L204:
	B0BSET 0xD2.3
.stabn 0x44,0,180,L205-_led_control_three
L205:
	B0BSET 0xD2.2
.stabn 0x44,0,181,L206-_led_control_three
L206:
	B0BCLR 0xD1.0
.stabn 0x44,0,182,L207-_led_control_three
L207:
	B0BCLR 0xD2.4
.stabn 0x44,0,183,L208-_led_control_three
L208:
	B0BCLR 0xD2.1
.stabn 0x44,0,184,L209-_led_control_three
L209:
	B0BCLR 0xD5.4
.stabn 0x44,0,185,L210-_led_control_three
L210:
	B0BCLR 0xD2.5
.stabn 0x44,0,186,L211-_led_control_three
L211:
	B0BCLR 0xD2.0
.stabn 0xE0,0,1,L212-_led_control_three
L212:
.stabn 0x44,0,187,L213-_led_control_three
L213:
L182:
.stabn 0x44,0,189,L214-_led_control_three
L214:
	DECS _led_delay_3
	JMP L184
.stabn 0xC0,0,1,L215-_led_control_three
L215:
.stabn 0x44,0,190,L216-_led_control_three
L216:
 .stabn 0x44,0,191,L217-_led_control_three
L217:
	B0BCLR 0xD0.0
.stabn 0x44,0,192,L218-_led_control_three
L218:
	B0BCLR 0xD2.3
.stabn 0x44,0,193,L219-_led_control_three
L219:
	B0BCLR 0xD2.2
.stabn 0xE0,0,1,L220-_led_control_three
L220:
.stabn 0x44,0,194,L221-_led_control_three
L221:
L184:
.stabn 0x44,0,195,L222-_led_control_three
L222:
	MOV A, _led_delay_3
	CMPRS A, #0x02
	JMP L186
.stabn 0xC0,0,1,L223-_led_control_three
L223:
.stabn 0x44,0,196,L224-_led_control_three
L224:
 .stabn 0x44,0,197,L225-_led_control_three
L225:
	B0BSET 0xD0.0
.stabn 0x44,0,198,L226-_led_control_three
L226:
	B0BSET 0xD2.3
.stabn 0x44,0,199,L227-_led_control_three
L227:
	B0BSET 0xD2.2
.stabn 0xE0,0,1,L228-_led_control_three
L228:
.stabn 0x44,0,200,L229-_led_control_three
L229:
L186:
.stabn 0x44,0,201,L230-_led_control_three
L230:
	MOV A, _led_delay_3
	CMPRS A, #0x03
	JMP L188
.stabn 0xC0,0,1,L231-_led_control_three
L231:
.stabn 0x44,0,202,L232-_led_control_three
L232:
 .stabn 0x44,0,203,L233-_led_control_three
L233:
	B0BCLR 0xD0.0
.stabn 0x44,0,204,L234-_led_control_three
L234:
	B0BCLR 0xD2.3
.stabn 0x44,0,205,L235-_led_control_three
L235:
	B0BCLR 0xD2.2
.stabn 0xE0,0,1,L236-_led_control_three
L236:
.stabn 0x44,0,206,L237-_led_control_three
L237:
L188:
.stabn 0x44,0,208,L238-_led_control_three
L238:
	MOV A, _led_delay_3
	CMPRS A, #0x04
	JMP L190
.stabn 0xC0,0,1,L239-_led_control_three
L239:
.stabn 0x44,0,209,L240-_led_control_three
L240:
 .stabn 0x44,0,210,L241-_led_control_three
L241:
	B0BSET 0xD0.0
.stabn 0x44,0,211,L242-_led_control_three
L242:
	B0BSET 0xD2.3
.stabn 0x44,0,212,L243-_led_control_three
L243:
	B0BSET 0xD2.2
.stabn 0xE0,0,1,L244-_led_control_three
L244:
.stabn 0x44,0,213,L245-_led_control_three
L245:
L190:
.stabn 0x44,0,214,L246-_led_control_three
L246:
	MOV A, _led_delay_3
	CMPRS A, #0x05
	JMP L192
.stabn 0xC0,0,1,L247-_led_control_three
L247:
.stabn 0x44,0,215,L248-_led_control_three
L248:
 .stabn 0x44,0,216,L249-_led_control_three
L249:
	B0BCLR 0xD0.0
.stabn 0x44,0,217,L250-_led_control_three
L250:
	B0BCLR 0xD2.3
.stabn 0x44,0,218,L251-_led_control_three
L251:
	B0BCLR 0xD2.2
.stabn 0xE0,0,1,L252-_led_control_three
L252:
.stabn 0x44,0,219,L253-_led_control_three
L253:
L192:
.stabn 0x44,0,221,L254-_led_control_three
L254:
	MOV A, _led_delay_3
	CMPRS A, #0x6e
	JMP L194
.stabn 0xC0,0,1,L255-_led_control_three
L255:
.stabn 0x44,0,222,L256-_led_control_three
L256:
 .stabn 0x44,0,223,L257-_led_control_three
L257:
	CLR _led_delay_3
.stabn 0x44,0,225,L258-_led_control_three
L258:
	BCLR _led_mode_init
.stabn 0xE0,0,1,L259-_led_control_three
L259:
.stabn 0x44,0,226,L260-_led_control_three
L260:
L194:
.stabn 0xE0,0,0,L261-_led_control_three
L261:
.stabn 0x44,0,227,L262-_led_control_three
L262:
L181:
	RET
.stabs "led_control_four:F13",36,0,0,_led_control_four
_Function_led_control_four_code SEGMENT CODE INBANK USING _Function_led_control_four_data
_led_control_four:
.stabn 0xC0,0,0,L278-_led_control_four
L278:
.stabn 0x44,0,237,L279-_led_control_four
L279:
 .stabn 0x44,0,238,L280-_led_control_four
L280:
	BTS0 _led_mode_init
	JMP L264
.stabn 0xC0,0,1,L281-_led_control_four
L281:
.stabn 0x44,0,239,L282-_led_control_four
L282:
 .stabn 0x44,0,240,L283-_led_control_four
L283:
	BSET _led_mode_init
.stabn 0x44,0,241,L284-_led_control_four
L284:
	CLR _led_delay_3
.stabn 0x44,0,242,L285-_led_control_four
L285:
	B0BCLR 0xD0.0
.stabn 0x44,0,243,L286-_led_control_four
L286:
	B0BSET 0xD1.0
.stabn 0x44,0,244,L287-_led_control_four
L287:
	B0BCLR 0xD2.3
.stabn 0x44,0,245,L288-_led_control_four
L288:
	B0BCLR 0xD2.2
.stabn 0x44,0,246,L289-_led_control_four
L289:
	B0BSET 0xD2.4
.stabn 0x44,0,247,L290-_led_control_four
L290:
	B0BSET 0xD2.1
.stabn 0x44,0,248,L291-_led_control_four
L291:
	B0BCLR 0xD5.4
.stabn 0x44,0,249,L292-_led_control_four
L292:
	B0BCLR 0xD2.5
.stabn 0x44,0,250,L293-_led_control_four
L293:
	B0BCLR 0xD2.0
.stabn 0xE0,0,1,L294-_led_control_four
L294:
.stabn 0x44,0,251,L295-_led_control_four
L295:
L264:
.stabn 0x44,0,253,L296-_led_control_four
L296:
	DECS _led_delay_3
	JMP L266
.stabn 0xC0,0,1,L297-_led_control_four
L297:
.stabn 0x44,0,254,L298-_led_control_four
L298:
 .stabn 0x44,0,255,L299-_led_control_four
L299:
	B0BCLR 0xD1.0
.stabn 0x44,0,256,L300-_led_control_four
L300:
	B0BCLR 0xD2.4
.stabn 0x44,0,257,L301-_led_control_four
L301:
	B0BCLR 0xD2.1
.stabn 0xE0,0,1,L302-_led_control_four
L302:
.stabn 0x44,0,258,L303-_led_control_four
L303:
L266:
.stabn 0x44,0,259,L304-_led_control_four
L304:
	MOV A, _led_delay_3
	CMPRS A, #0x02
	JMP L268
.stabn 0xC0,0,1,L305-_led_control_four
L305:
.stabn 0x44,0,260,L306-_led_control_four
L306:
 .stabn 0x44,0,261,L307-_led_control_four
L307:
	B0BSET 0xD1.0
.stabn 0x44,0,262,L308-_led_control_four
L308:
	B0BSET 0xD2.4
.stabn 0x44,0,263,L309-_led_control_four
L309:
	B0BSET 0xD2.1
.stabn 0xE0,0,1,L310-_led_control_four
L310:
.stabn 0x44,0,264,L311-_led_control_four
L311:
L268:
.stabn 0x44,0,265,L312-_led_control_four
L312:
	MOV A, _led_delay_3
	CMPRS A, #0x03
	JMP L270
.stabn 0xC0,0,1,L313-_led_control_four
L313:
.stabn 0x44,0,266,L314-_led_control_four
L314:
 .stabn 0x44,0,267,L315-_led_control_four
L315:
	B0BCLR 0xD1.0
.stabn 0x44,0,268,L316-_led_control_four
L316:
	B0BCLR 0xD2.4
.stabn 0x44,0,269,L317-_led_control_four
L317:
	B0BCLR 0xD2.1
.stabn 0xE0,0,1,L318-_led_control_four
L318:
.stabn 0x44,0,270,L319-_led_control_four
L319:
L270:
.stabn 0x44,0,272,L320-_led_control_four
L320:
	MOV A, _led_delay_3
	CMPRS A, #0x04
	JMP L272
.stabn 0xC0,0,1,L321-_led_control_four
L321:
.stabn 0x44,0,273,L322-_led_control_four
L322:
 .stabn 0x44,0,274,L323-_led_control_four
L323:
	B0BSET 0xD1.0
.stabn 0x44,0,275,L324-_led_control_four
L324:
	B0BSET 0xD2.4
.stabn 0x44,0,276,L325-_led_control_four
L325:
	B0BSET 0xD2.1
.stabn 0xE0,0,1,L326-_led_control_four
L326:
.stabn 0x44,0,277,L327-_led_control_four
L327:
L272:
.stabn 0x44,0,278,L328-_led_control_four
L328:
	MOV A, _led_delay_3
	CMPRS A, #0x05
	JMP L274
.stabn 0xC0,0,1,L329-_led_control_four
L329:
.stabn 0x44,0,279,L330-_led_control_four
L330:
 .stabn 0x44,0,280,L331-_led_control_four
L331:
	B0BCLR 0xD1.0
.stabn 0x44,0,281,L332-_led_control_four
L332:
	B0BCLR 0xD2.4
.stabn 0x44,0,282,L333-_led_control_four
L333:
	B0BCLR 0xD2.1
.stabn 0xE0,0,1,L334-_led_control_four
L334:
.stabn 0x44,0,283,L335-_led_control_four
L335:
L274:
.stabn 0x44,0,285,L336-_led_control_four
L336:
	MOV A, _led_delay_3
	CMPRS A, #0x6e
	JMP L276
.stabn 0xC0,0,1,L337-_led_control_four
L337:
.stabn 0x44,0,286,L338-_led_control_four
L338:
 .stabn 0x44,0,287,L339-_led_control_four
L339:
	CLR _led_delay_3
.stabn 0x44,0,288,L340-_led_control_four
L340:
	B0BSET 0xD1.0
.stabn 0x44,0,289,L341-_led_control_four
L341:
	B0BSET 0xD2.4
.stabn 0x44,0,290,L342-_led_control_four
L342:
	B0BSET 0xD2.1
.stabn 0xE0,0,1,L343-_led_control_four
L343:
.stabn 0x44,0,291,L344-_led_control_four
L344:
L276:
.stabn 0xE0,0,0,L345-_led_control_four
L345:
.stabn 0x44,0,292,L346-_led_control_four
L346:
L263:
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
