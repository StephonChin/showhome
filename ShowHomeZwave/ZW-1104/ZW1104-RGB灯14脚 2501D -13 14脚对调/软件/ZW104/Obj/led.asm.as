CHIP SN8P2501D
EXTERN DATA X
EXTERN DATA H
EXTERN DATA L
EXTERN DATA T
EXTERN DATA I
.CODE
.stabs "lcc4_compiled.",0x3C,0,0,0
.stabs "H:\�̰�\ShowHome\ZW-1104\ZW1104-RGB��14�� 2501D -13 14�ŶԵ�\����\ZW104/",0x64,0,3,Ltext0
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
	JMP L337
	SUB A, #0x80
	B0BTS1 134.2
	JMP L337
	B0ADD 206, A
	JMP L4
	JMP L5
	JMP L6
	JMP L7
L337:
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
.stabn 0x44,0,48,L38-_led_control_one
L38:
 .stabn 0x44,0,49,L39-_led_control_one
L39:
	BTS0 _led_mode_init
	JMP L27
.stabn 0xC0,0,1,L40-_led_control_one
L40:
.stabn 0x44,0,50,L41-_led_control_one
L41:
 .stabn 0x44,0,51,L42-_led_control_one
L42:
	BSET _led_mode_init
.stabn 0x44,0,52,L43-_led_control_one
L43:
	CLR _led_delay_3
.stabn 0x44,0,53,L44-_led_control_one
L44:
	B0BSET 0xD0.0
.stabn 0x44,0,54,L45-_led_control_one
L45:
	B0BSET 0xD2.4
.stabn 0x44,0,55,L46-_led_control_one
L46:
	B0BSET 0xD2.2
.stabn 0x44,0,56,L47-_led_control_one
L47:
	B0BSET 0xD1.0
.stabn 0x44,0,57,L48-_led_control_one
L48:
	B0BSET 0xD2.3
.stabn 0x44,0,58,L49-_led_control_one
L49:
	B0BSET 0xD2.1
.stabn 0x44,0,59,L50-_led_control_one
L50:
	B0BSET 0xD5.4
.stabn 0x44,0,60,L51-_led_control_one
L51:
	B0BSET 0xD2.5
.stabn 0x44,0,61,L52-_led_control_one
L52:
	B0BSET 0xD2.0
.stabn 0xE0,0,1,L53-_led_control_one
L53:
.stabn 0x44,0,62,L54-_led_control_one
L54:
L27:
.stabn 0x44,0,64,L55-_led_control_one
L55:
	MOV A, _led_delay_3
	CMPRS A, #0x06
	JMP L29
.stabn 0xC0,0,1,L56-_led_control_one
L56:
.stabn 0x44,0,65,L57-_led_control_one
L57:
 .stabn 0x44,0,66,L58-_led_control_one
L58:
	CLR _led_delay_3
.stabn 0xE0,0,1,L59-_led_control_one
L59:
.stabn 0x44,0,67,L60-_led_control_one
L60:
L29:
.stabn 0x44,0,69,L61-_led_control_one
L61:
	MOV A, _led_delay_3
	CMPRS A, #0x00
	JMP L31
.stabn 0xC0,0,1,L62-_led_control_one
L62:
.stabn 0x44,0,70,L63-_led_control_one
L63:
 .stabn 0x44,0,71,L64-_led_control_one
L64:
	B0BCLR 0xD0.0
.stabn 0x44,0,72,L65-_led_control_one
L65:
	B0BCLR 0xD2.4
.stabn 0x44,0,73,L66-_led_control_one
L66:
	B0BCLR 0xD2.2
.stabn 0x44,0,74,L67-_led_control_one
L67:
	B0BSET 0xD1.0
.stabn 0x44,0,75,L68-_led_control_one
L68:
	B0BSET 0xD2.3
.stabn 0x44,0,76,L69-_led_control_one
L69:
	B0BSET 0xD2.1
.stabn 0x44,0,77,L70-_led_control_one
L70:
	B0BSET 0xD5.4
.stabn 0x44,0,78,L71-_led_control_one
L71:
	B0BSET 0xD2.5
.stabn 0x44,0,79,L72-_led_control_one
L72:
	B0BSET 0xD2.0
.stabn 0xE0,0,1,L73-_led_control_one
L73:
.stabn 0x44,0,80,L74-_led_control_one
L74:
L31:
.stabn 0x44,0,82,L75-_led_control_one
L75:
	MOV A, _led_delay_3
	CMPRS A, #0x02
	JMP L33
.stabn 0xC0,0,1,L76-_led_control_one
L76:
.stabn 0x44,0,83,L77-_led_control_one
L77:
 .stabn 0x44,0,84,L78-_led_control_one
L78:
	B0BSET 0xD0.0
.stabn 0x44,0,85,L79-_led_control_one
L79:
	B0BSET 0xD2.4
.stabn 0x44,0,86,L80-_led_control_one
L80:
	B0BSET 0xD2.2
.stabn 0x44,0,87,L81-_led_control_one
L81:
	B0BCLR 0xD1.0
.stabn 0x44,0,88,L82-_led_control_one
L82:
	B0BCLR 0xD2.3
.stabn 0x44,0,89,L83-_led_control_one
L83:
	B0BCLR 0xD2.1
.stabn 0x44,0,90,L84-_led_control_one
L84:
	B0BSET 0xD5.4
.stabn 0x44,0,91,L85-_led_control_one
L85:
	B0BSET 0xD2.5
.stabn 0x44,0,92,L86-_led_control_one
L86:
	B0BSET 0xD2.0
.stabn 0xE0,0,1,L87-_led_control_one
L87:
.stabn 0x44,0,93,L88-_led_control_one
L88:
L33:
.stabn 0x44,0,95,L89-_led_control_one
L89:
	MOV A, _led_delay_3
	CMPRS A, #0x04
	JMP L35
.stabn 0xC0,0,1,L90-_led_control_one
L90:
.stabn 0x44,0,96,L91-_led_control_one
L91:
 .stabn 0x44,0,97,L92-_led_control_one
L92:
	B0BSET 0xD0.0
.stabn 0x44,0,98,L93-_led_control_one
L93:
	B0BSET 0xD2.4
.stabn 0x44,0,99,L94-_led_control_one
L94:
	B0BSET 0xD2.2
.stabn 0x44,0,100,L95-_led_control_one
L95:
	B0BSET 0xD1.0
.stabn 0x44,0,101,L96-_led_control_one
L96:
	B0BSET 0xD2.3
.stabn 0x44,0,102,L97-_led_control_one
L97:
	B0BSET 0xD2.1
.stabn 0x44,0,103,L98-_led_control_one
L98:
	B0BCLR 0xD5.4
.stabn 0x44,0,104,L99-_led_control_one
L99:
	B0BCLR 0xD2.5
.stabn 0x44,0,105,L100-_led_control_one
L100:
	B0BCLR 0xD2.0
.stabn 0xE0,0,1,L101-_led_control_one
L101:
.stabn 0x44,0,106,L102-_led_control_one
L102:
L35:
.stabn 0xE0,0,0,L103-_led_control_one
L103:
.stabn 0x44,0,107,L104-_led_control_one
L104:
L26:
	RET
.stabs "led_control_two:F13",36,0,0,_led_control_two
_Function_led_control_two_code SEGMENT CODE INBANK USING _Function_led_control_two_data
_led_control_two:
.stabn 0xC0,0,0,L124-_led_control_two
L124:
.stabn 0x44,0,117,L125-_led_control_two
L125:
 .stabn 0x44,0,118,L126-_led_control_two
L126:
	BTS0 _led_mode_init
	JMP L106
.stabn 0xC0,0,1,L127-_led_control_two
L127:
.stabn 0x44,0,119,L128-_led_control_two
L128:
 .stabn 0x44,0,120,L129-_led_control_two
L129:
	BSET _led_mode_init
.stabn 0x44,0,121,L130-_led_control_two
L130:
	CLR _led_delay_3
.stabn 0x44,0,122,L131-_led_control_two
L131:
	B0BSET 0xD1.0
.stabn 0x44,0,123,L132-_led_control_two
L132:
	B0BSET 0xD0.0
.stabn 0x44,0,124,L133-_led_control_two
L133:
	B0BSET 0xD2.4
.stabn 0x44,0,125,L134-_led_control_two
L134:
	B0BSET 0xD2.2
.stabn 0x44,0,126,L135-_led_control_two
L135:
	B0BSET 0xD2.3
.stabn 0x44,0,127,L136-_led_control_two
L136:
	B0BSET 0xD2.1
.stabn 0x44,0,128,L137-_led_control_two
L137:
	B0BSET 0xD5.4
.stabn 0x44,0,129,L138-_led_control_two
L138:
	B0BSET 0xD2.5
.stabn 0x44,0,130,L139-_led_control_two
L139:
	B0BSET 0xD2.0
.stabn 0xE0,0,1,L140-_led_control_two
L140:
.stabn 0x44,0,131,L141-_led_control_two
L141:
L106:
.stabn 0x44,0,133,L142-_led_control_two
L142:
	MOV A, _led_delay_3
	CMPRS A, #0x95
	B0BTS1	134.2
	JMP	L108
.stabn 0xC0,0,1,L143-_led_control_two
L143:
.stabn 0x44,0,134,L144-_led_control_two
L144:
 .stabn 0x44,0,135,L145-_led_control_two
L145:
	CLR _led_delay_3
.stabn 0xE0,0,1,L146-_led_control_two
L146:
.stabn 0x44,0,136,L147-_led_control_two
L147:
L108:
.stabn 0x44,0,138,L148-_led_control_two
L148:
	MOV A, _led_delay_3
	B0BTS0	134.0
	JMP	L113
	SUB A, #0x03
	B0BTS0	134.0
	JMP	L113
	MOV A, _led_delay_3
	CMPRS A, #0x06
	JMP L110
L113:
.stabn 0xC0,0,1,L149-_led_control_two
L149:
.stabn 0x44,0,139,L150-_led_control_two
L150:
 .stabn 0x44,0,140,L151-_led_control_two
L151:
	B0BCLR 0xD5.4
.stabn 0x44,0,141,L152-_led_control_two
L152:
	B0BSET 0xD2.5
.stabn 0x44,0,142,L153-_led_control_two
L153:
	B0BSET 0xD2.0
.stabn 0xE0,0,1,L154-_led_control_two
L154:
.stabn 0x44,0,143,L155-_led_control_two
L155:
L110:
.stabn 0x44,0,144,L156-_led_control_two
L156:
	MOV A, _led_delay_3
	SUB A, #0x01
	B0BTS0	134.0
	JMP	L117
	MOV A, _led_delay_3
	SUB A, #0x04
	B0BTS0	134.0
	JMP	L117
	MOV A, _led_delay_3
	CMPRS A, #0x07
	JMP L114
L117:
.stabn 0xC0,0,1,L157-_led_control_two
L157:
.stabn 0x44,0,145,L158-_led_control_two
L158:
 .stabn 0x44,0,146,L159-_led_control_two
L159:
	B0BSET 0xD5.4
.stabn 0x44,0,147,L160-_led_control_two
L160:
	B0BCLR 0xD2.5
.stabn 0x44,0,148,L161-_led_control_two
L161:
	B0BSET 0xD2.0
.stabn 0xE0,0,1,L162-_led_control_two
L162:
.stabn 0x44,0,149,L163-_led_control_two
L163:
L114:
.stabn 0x44,0,150,L164-_led_control_two
L164:
	MOV A, _led_delay_3
	SUB A, #0x02
	B0BTS0	134.0
	JMP	L121
	MOV A, _led_delay_3
	SUB A, #0x05
	B0BTS0	134.0
	JMP	L121
	MOV A, _led_delay_3
	CMPRS A, #0x08
	JMP L118
L121:
.stabn 0xC0,0,1,L165-_led_control_two
L165:
.stabn 0x44,0,151,L166-_led_control_two
L166:
 .stabn 0x44,0,152,L167-_led_control_two
L167:
	B0BSET 0xD5.4
.stabn 0x44,0,153,L168-_led_control_two
L168:
	B0BSET 0xD2.5
.stabn 0x44,0,154,L169-_led_control_two
L169:
	B0BCLR 0xD2.0
.stabn 0xE0,0,1,L170-_led_control_two
L170:
.stabn 0x44,0,155,L171-_led_control_two
L171:
L118:
.stabn 0x44,0,157,L172-_led_control_two
L172:
	MOV A, _led_delay_3
	CMPRS A, #0x09
	JMP L122
.stabn 0xC0,0,1,L173-_led_control_two
L173:
.stabn 0x44,0,158,L174-_led_control_two
L174:
 .stabn 0x44,0,159,L175-_led_control_two
L175:
	B0BSET 0xD5.4
.stabn 0x44,0,160,L176-_led_control_two
L176:
	B0BSET 0xD2.5
.stabn 0x44,0,161,L177-_led_control_two
L177:
	B0BSET 0xD2.0
.stabn 0xE0,0,1,L178-_led_control_two
L178:
.stabn 0x44,0,162,L179-_led_control_two
L179:
L122:
.stabn 0xE0,0,0,L180-_led_control_two
L180:
.stabn 0x44,0,163,L181-_led_control_two
L181:
L105:
	RET
.stabs "led_control_three:F13",36,0,0,_led_control_three
_Function_led_control_three_code SEGMENT CODE INBANK USING _Function_led_control_three_data
_led_control_three:
.stabn 0xC0,0,0,L201-_led_control_three
L201:
.stabn 0x44,0,173,L202-_led_control_three
L202:
 .stabn 0x44,0,174,L203-_led_control_three
L203:
	BTS0 _led_mode_init
	JMP L183
.stabn 0xC0,0,1,L204-_led_control_three
L204:
.stabn 0x44,0,175,L205-_led_control_three
L205:
 .stabn 0x44,0,176,L206-_led_control_three
L206:
	BSET _led_mode_init
.stabn 0x44,0,177,L207-_led_control_three
L207:
	CLR _led_delay_3
.stabn 0x44,0,178,L208-_led_control_three
L208:
	B0BSET 0xD0.0
.stabn 0x44,0,179,L209-_led_control_three
L209:
	B0BSET 0xD2.4
.stabn 0x44,0,180,L210-_led_control_three
L210:
	B0BSET 0xD2.2
.stabn 0x44,0,181,L211-_led_control_three
L211:
	B0BSET 0xD1.0
.stabn 0x44,0,182,L212-_led_control_three
L212:
	B0BSET 0xD2.3
.stabn 0x44,0,183,L213-_led_control_three
L213:
	B0BSET 0xD2.1
.stabn 0x44,0,184,L214-_led_control_three
L214:
	B0BSET 0xD5.4
.stabn 0x44,0,185,L215-_led_control_three
L215:
	B0BSET 0xD2.5
.stabn 0x44,0,186,L216-_led_control_three
L216:
	B0BSET 0xD2.0
.stabn 0xE0,0,1,L217-_led_control_three
L217:
.stabn 0x44,0,187,L218-_led_control_three
L218:
L183:
.stabn 0x44,0,189,L219-_led_control_three
L219:
	MOV A, _led_delay_3
	CMPRS A, #0x96
	B0BTS1	134.2
	JMP	L185
.stabn 0xC0,0,1,L220-_led_control_three
L220:
.stabn 0x44,0,190,L221-_led_control_three
L221:
 .stabn 0x44,0,191,L222-_led_control_three
L222:
	CLR _led_delay_3
.stabn 0xE0,0,1,L223-_led_control_three
L223:
.stabn 0x44,0,192,L224-_led_control_three
L224:
L185:
.stabn 0x44,0,194,L225-_led_control_three
L225:
	MOV A, _led_delay_3
	B0BTS0	134.0
	JMP	L190
	SUB A, #0x03
	B0BTS0	134.0
	JMP	L190
	MOV A, _led_delay_3
	CMPRS A, #0x06
	JMP L187
L190:
.stabn 0xC0,0,1,L226-_led_control_three
L226:
.stabn 0x44,0,195,L227-_led_control_three
L227:
 .stabn 0x44,0,196,L228-_led_control_three
L228:
	B0BCLR 0xD0.0
.stabn 0x44,0,197,L229-_led_control_three
L229:
	B0BSET 0xD2.4
.stabn 0x44,0,198,L230-_led_control_three
L230:
	B0BSET 0xD2.2
.stabn 0xE0,0,1,L231-_led_control_three
L231:
.stabn 0x44,0,199,L232-_led_control_three
L232:
L187:
.stabn 0x44,0,200,L233-_led_control_three
L233:
	MOV A, _led_delay_3
	SUB A, #0x01
	B0BTS0	134.0
	JMP	L194
	MOV A, _led_delay_3
	SUB A, #0x04
	B0BTS0	134.0
	JMP	L194
	MOV A, _led_delay_3
	CMPRS A, #0x07
	JMP L191
L194:
.stabn 0xC0,0,1,L234-_led_control_three
L234:
.stabn 0x44,0,201,L235-_led_control_three
L235:
 .stabn 0x44,0,202,L236-_led_control_three
L236:
	B0BSET 0xD0.0
.stabn 0x44,0,203,L237-_led_control_three
L237:
	B0BCLR 0xD2.4
.stabn 0x44,0,204,L238-_led_control_three
L238:
	B0BSET 0xD2.2
.stabn 0xE0,0,1,L239-_led_control_three
L239:
.stabn 0x44,0,205,L240-_led_control_three
L240:
L191:
.stabn 0x44,0,206,L241-_led_control_three
L241:
	MOV A, _led_delay_3
	SUB A, #0x02
	B0BTS0	134.0
	JMP	L198
	MOV A, _led_delay_3
	SUB A, #0x05
	B0BTS0	134.0
	JMP	L198
	MOV A, _led_delay_3
	CMPRS A, #0x08
	JMP L195
L198:
.stabn 0xC0,0,1,L242-_led_control_three
L242:
.stabn 0x44,0,207,L243-_led_control_three
L243:
 .stabn 0x44,0,208,L244-_led_control_three
L244:
	B0BSET 0xD0.0
.stabn 0x44,0,209,L245-_led_control_three
L245:
	B0BSET 0xD2.4
.stabn 0x44,0,210,L246-_led_control_three
L246:
	B0BCLR 0xD2.2
.stabn 0xE0,0,1,L247-_led_control_three
L247:
.stabn 0x44,0,211,L248-_led_control_three
L248:
L195:
.stabn 0x44,0,214,L249-_led_control_three
L249:
	MOV A, _led_delay_3
	CMPRS A, #0x09
	JMP L199
.stabn 0xC0,0,1,L250-_led_control_three
L250:
.stabn 0x44,0,215,L251-_led_control_three
L251:
 .stabn 0x44,0,216,L252-_led_control_three
L252:
	B0BSET 0xD0.0
.stabn 0x44,0,217,L253-_led_control_three
L253:
	B0BSET 0xD2.4
.stabn 0x44,0,218,L254-_led_control_three
L254:
	B0BSET 0xD2.2
.stabn 0xE0,0,1,L255-_led_control_three
L255:
.stabn 0x44,0,219,L256-_led_control_three
L256:
L199:
.stabn 0xE0,0,0,L257-_led_control_three
L257:
.stabn 0x44,0,220,L258-_led_control_three
L258:
L182:
	RET
.stabs "led_control_four:F13",36,0,0,_led_control_four
_Function_led_control_four_code SEGMENT CODE INBANK USING _Function_led_control_four_data
_led_control_four:
.stabn 0xC0,0,0,L278-_led_control_four
L278:
.stabn 0x44,0,230,L279-_led_control_four
L279:
 .stabn 0x44,0,231,L280-_led_control_four
L280:
	BTS0 _led_mode_init
	JMP L260
.stabn 0xC0,0,1,L281-_led_control_four
L281:
.stabn 0x44,0,232,L282-_led_control_four
L282:
 .stabn 0x44,0,233,L283-_led_control_four
L283:
	BSET _led_mode_init
.stabn 0x44,0,234,L284-_led_control_four
L284:
	CLR _led_delay_3
.stabn 0x44,0,235,L285-_led_control_four
L285:
	B0BSET 0xD0.0
.stabn 0x44,0,236,L286-_led_control_four
L286:
	B0BSET 0xD1.0
.stabn 0x44,0,237,L287-_led_control_four
L287:
	B0BSET 0xD2.4
.stabn 0x44,0,238,L288-_led_control_four
L288:
	B0BSET 0xD2.2
.stabn 0x44,0,239,L289-_led_control_four
L289:
	B0BSET 0xD2.3
.stabn 0x44,0,240,L290-_led_control_four
L290:
	B0BSET 0xD2.1
.stabn 0x44,0,241,L291-_led_control_four
L291:
	B0BSET 0xD5.4
.stabn 0x44,0,242,L292-_led_control_four
L292:
	B0BSET 0xD2.5
.stabn 0x44,0,243,L293-_led_control_four
L293:
	B0BSET 0xD2.0
.stabn 0xE0,0,1,L294-_led_control_four
L294:
.stabn 0x44,0,244,L295-_led_control_four
L295:
L260:
.stabn 0x44,0,246,L296-_led_control_four
L296:
	MOV A, _led_delay_3
	CMPRS A, #0x95
	B0BTS1	134.2
	JMP	L262
.stabn 0xC0,0,1,L297-_led_control_four
L297:
.stabn 0x44,0,247,L298-_led_control_four
L298:
 .stabn 0x44,0,248,L299-_led_control_four
L299:
	CLR _led_delay_3
.stabn 0xE0,0,1,L300-_led_control_four
L300:
.stabn 0x44,0,249,L301-_led_control_four
L301:
L262:
.stabn 0x44,0,251,L302-_led_control_four
L302:
	MOV A, _led_delay_3
	B0BTS0	134.0
	JMP	L267
	SUB A, #0x03
	B0BTS0	134.0
	JMP	L267
	MOV A, _led_delay_3
	CMPRS A, #0x06
	JMP L264
L267:
.stabn 0xC0,0,1,L303-_led_control_four
L303:
.stabn 0x44,0,252,L304-_led_control_four
L304:
 .stabn 0x44,0,253,L305-_led_control_four
L305:
	B0BCLR 0xD1.0
.stabn 0x44,0,254,L306-_led_control_four
L306:
	B0BSET 0xD2.3
.stabn 0x44,0,255,L307-_led_control_four
L307:
	B0BSET 0xD2.1
.stabn 0xE0,0,1,L308-_led_control_four
L308:
.stabn 0x44,0,256,L309-_led_control_four
L309:
L264:
.stabn 0x44,0,257,L310-_led_control_four
L310:
	MOV A, _led_delay_3
	SUB A, #0x01
	B0BTS0	134.0
	JMP	L271
	MOV A, _led_delay_3
	SUB A, #0x04
	B0BTS0	134.0
	JMP	L271
	MOV A, _led_delay_3
	CMPRS A, #0x07
	JMP L268
L271:
.stabn 0xC0,0,1,L311-_led_control_four
L311:
.stabn 0x44,0,258,L312-_led_control_four
L312:
 .stabn 0x44,0,259,L313-_led_control_four
L313:
	B0BSET 0xD1.0
.stabn 0x44,0,260,L314-_led_control_four
L314:
	B0BCLR 0xD2.3
.stabn 0x44,0,261,L315-_led_control_four
L315:
	B0BSET 0xD2.1
.stabn 0xE0,0,1,L316-_led_control_four
L316:
.stabn 0x44,0,262,L317-_led_control_four
L317:
L268:
.stabn 0x44,0,263,L318-_led_control_four
L318:
	MOV A, _led_delay_3
	SUB A, #0x02
	B0BTS0	134.0
	JMP	L275
	MOV A, _led_delay_3
	SUB A, #0x05
	B0BTS0	134.0
	JMP	L275
	MOV A, _led_delay_3
	CMPRS A, #0x08
	JMP L272
L275:
.stabn 0xC0,0,1,L319-_led_control_four
L319:
.stabn 0x44,0,264,L320-_led_control_four
L320:
 .stabn 0x44,0,265,L321-_led_control_four
L321:
	B0BSET 0xD1.0
.stabn 0x44,0,266,L322-_led_control_four
L322:
	B0BSET 0xD2.3
.stabn 0x44,0,267,L323-_led_control_four
L323:
	B0BCLR 0xD2.1
.stabn 0xE0,0,1,L324-_led_control_four
L324:
.stabn 0x44,0,268,L325-_led_control_four
L325:
L272:
.stabn 0x44,0,270,L326-_led_control_four
L326:
	MOV A, _led_delay_3
	CMPRS A, #0x09
	JMP L276
.stabn 0xC0,0,1,L327-_led_control_four
L327:
.stabn 0x44,0,271,L328-_led_control_four
L328:
 .stabn 0x44,0,272,L329-_led_control_four
L329:
	B0BSET 0xD1.0
.stabn 0x44,0,273,L330-_led_control_four
L330:
	B0BSET 0xD2.3
.stabn 0x44,0,274,L331-_led_control_four
L331:
	B0BSET 0xD2.1
.stabn 0xE0,0,1,L332-_led_control_four
L332:
.stabn 0x44,0,275,L333-_led_control_four
L333:
L276:
.stabn 0xE0,0,0,L334-_led_control_four
L334:
.stabn 0x44,0,277,L335-_led_control_four
L335:
L259:
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
