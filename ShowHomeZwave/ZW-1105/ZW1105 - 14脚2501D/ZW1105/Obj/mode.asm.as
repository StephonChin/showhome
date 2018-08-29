CHIP SN8P2501D
EXTERN DATA X
EXTERN DATA H
EXTERN DATA L
EXTERN DATA T
EXTERN DATA I
.CODE
.stabs "lcc4_compiled.",0x3C,0,0,0
.stabs "F:\PROJECT\ShowHome\ZW-1105\ZW1105\ZW1105/",0x64,0,3,Ltext0
.stabs ".\Src\mode.c",0x64,0,3,Ltext0
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
PUBLIC _mode_selection
PUBLIC _power_start
PUBLIC _mode_check
PUBLIC _flagTrigger
EXTERN DATA _led_mode
EXTERN DATA_BIT _led_mode_init
PUBLIC _have_get_node
PUBLIC _check_port3_buf
PUBLIC _mode_three
PUBLIC _mode_two
PUBLIC _mode_one
PUBLIC _power_up
PUBLIC _mode_delay_6
_mode_delay_6@segment SEGMENT DATA INBANK
	_mode_delay_6 DS 1
PUBLIC _mode_delay_5
_mode_delay_5@segment SEGMENT DATA INBANK
	_mode_delay_5 DS 1
PUBLIC _mode_delay_4
_mode_delay_4@segment SEGMENT DATA INBANK
	_mode_delay_4 DS 1
PUBLIC _mode_delay_3
_mode_delay_3@segment SEGMENT DATA INBANK
	_mode_delay_3 DS 1
PUBLIC _mode_delay_2
_mode_delay_2@segment SEGMENT DATA INBANK
	_mode_delay_2 DS 1
PUBLIC _mode_delay_1
_mode_delay_1@segment SEGMENT DATA INBANK
	_mode_delay_1 DS 1
PUBLIC _check_port3_change_count
_check_port3_change_count@segment SEGMENT DATA INBANK
	_check_port3_change_count DS 1
_mode_c_GlobalBitDataPool0 BITSEGMENT DATA BANK 0 INBANK
	_flagTrigger DSBIT 1
	_have_get_node DSBIT 1
	_check_port3_buf DSBIT 1
	_mode_three DSBIT 1
	_mode_two DSBIT 1
	_mode_one DSBIT 1
	_power_up DSBIT 1
_Function_mode_selection_data SEGMENT DATA INBANK
_Function_power_start_data SEGMENT DATA INBANK
_Function_mode_check_data SEGMENT DATA INBANK
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
.stabs "mode_selection:F13",36,0,0,_mode_selection
_Function_mode_selection_code SEGMENT CODE INBANK USING _Function_mode_selection_data
_mode_selection:
.stabn 0xC0,0,0,L27-_mode_selection
L27:
.stabn 0x44,0,17,L28-_mode_selection
L28:
 .stabn 0x44,0,18,L29-_mode_selection
L29:
	B0BTS1 0xD1.1
	JMP L2
.stabn 0xC0,0,1,L30-_mode_selection
L30:
.stabn 0x44,0,19,L31-_mode_selection
L31:
 .stabn 0x44,0,20,L32-_mode_selection
L32:
	BTS0 _check_port3_buf
	JMP L3
.stabn 0xC0,0,2,L33-_mode_selection
L33:
.stabn 0x44,0,20,L34-_mode_selection
L34:
 .stabn 0x44,0,20,L35-_mode_selection
L35:
	BSET _check_port3_buf
.stabn 0x44,0,20,L36-_mode_selection
L36:
	INCMS _check_port3_change_count
	NOP
.stabn 0xE0,0,2,L37-_mode_selection
L37:
.stabn 0x44,0,20,L38-_mode_selection
L38:
 .stabn 0xE0,0,1,L39-_mode_selection
L39:
.stabn 0x44,0,21,L40-_mode_selection
L40:
	JMP L3
L2:
.stabn 0xC0,0,1,L41-_mode_selection
L41:
.stabn 0x44,0,23,L42-_mode_selection
L42:
 .stabn 0x44,0,24,L43-_mode_selection
L43:
	BTS1 _check_port3_buf
	JMP L6
.stabn 0xC0,0,2,L44-_mode_selection
L44:
.stabn 0x44,0,24,L45-_mode_selection
L45:
 .stabn 0x44,0,24,L46-_mode_selection
L46:
	BCLR _check_port3_buf
.stabn 0x44,0,24,L47-_mode_selection
L47:
	INCMS _check_port3_change_count
	NOP
.stabn 0xE0,0,2,L48-_mode_selection
L48:
.stabn 0x44,0,24,L49-_mode_selection
L49:
L6:
.stabn 0xE0,0,1,L50-_mode_selection
L50:
.stabn 0x44,0,25,L51-_mode_selection
L51:
L3:
.stabn 0x44,0,28,L52-_mode_selection
L52:
	MOV A, _mode_delay_1
	CMPRS A, #0x0e
	B0BTS1	134.2
	JMP	L8
.stabn 0xC0,0,1,L53-_mode_selection
L53:
.stabn 0x44,0,29,L54-_mode_selection
L54:
 .stabn 0x44,0,30,L55-_mode_selection
L55:
	CLR _mode_delay_1
.stabn 0x44,0,31,L56-_mode_selection
L56:
	MOV A, _check_port3_change_count
	CMPRS A, #0x01
	B0BTS1	134.2
	JMP	L10
.stabn 0xC0,0,2,L57-_mode_selection
L57:
.stabn 0x44,0,32,L58-_mode_selection
L58:
 .stabn 0x44,0,33,L59-_mode_selection
L59:
	CLR _check_port3_change_count
.stabn 0x44,0,34,L60-_mode_selection
L60:
	MOV A, _led_mode
	CMPRS A, #0x00
	JMP L14
	BTS0 _power_up
	JMP L11
L14:
.stabn 0xC0,0,3,L61-_mode_selection
L61:
.stabn 0x44,0,35,L62-_mode_selection
L62:
 .stabn 0x44,0,36,L63-_mode_selection
L63:
	BSET _power_up
.stabn 0x44,0,37,L64-_mode_selection
L64:
	CLR _led_mode
.stabn 0x44,0,38,L65-_mode_selection
L65:
	BTS0 _flagTrigger
	JMP L15
.stabn 0xC0,0,4,L66-_mode_selection
L66:
.stabn 0x44,0,39,L67-_mode_selection
L67:
 .stabn 0x44,0,40,L68-_mode_selection
L68:
	BSET _flagTrigger
.stabn 0x44,0,41,L69-_mode_selection
L69:
	BCLR _led_mode_init
.stabn 0xE0,0,4,L70-_mode_selection
L70:
.stabn 0x44,0,42,L71-_mode_selection
L71:
L15:
.stabn 0x44,0,43,L72-_mode_selection
L72:
	BCLR _have_get_node
.stabn 0x44,0,44,L73-_mode_selection
L73:
	BCLR _mode_one
.stabn 0x44,0,45,L74-_mode_selection
L74:
	BCLR _mode_two
.stabn 0x44,0,46,L75-_mode_selection
L75:
	BCLR _mode_three
.stabn 0xE0,0,3,L76-_mode_selection
L76:
.stabn 0x44,0,47,L77-_mode_selection
L77:
 .stabn 0xE0,0,2,L78-_mode_selection
L78:
.stabn 0x44,0,48,L79-_mode_selection
L79:
	JMP L11
L10:
.stabn 0xC0,0,2,L80-_mode_selection
L80:
.stabn 0x44,0,50,L81-_mode_selection
L81:
 .stabn 0x44,0,51,L82-_mode_selection
L82:
	BCLR _flagTrigger
.stabn 0x44,0,52,L83-_mode_selection
L83:
	BSET _have_get_node
.stabn 0x44,0,53,L84-_mode_selection
L84:
	CLR _check_port3_change_count
.stabn 0xE0,0,2,L85-_mode_selection
L85:
.stabn 0x44,0,54,L86-_mode_selection
L86:
L11:
.stabn 0xE0,0,1,L87-_mode_selection
L87:
.stabn 0x44,0,55,L88-_mode_selection
L88:
L8:
.stabn 0x44,0,58,L89-_mode_selection
L89:
	B0BTS1 0xD1.3
	JMP L17
.stabn 0xC0,0,1,L90-_mode_selection
L90:
.stabn 0x44,0,59,L91-_mode_selection
L91:
 .stabn 0x44,0,60,L92-_mode_selection
L92:
	BTS0 _mode_three
	JMP L18
	BTS1 _have_get_node
	JMP L18
.stabn 0xC0,0,2,L93-_mode_selection
L93:
.stabn 0x44,0,61,L94-_mode_selection
L94:
 .stabn 0x44,0,62,L95-_mode_selection
L95:
	BCLR _mode_one
.stabn 0x44,0,63,L96-_mode_selection
L96:
	BCLR _mode_two
.stabn 0x44,0,64,L97-_mode_selection
L97:
	BSET _mode_three
.stabn 0x44,0,65,L98-_mode_selection
L98:
	MOV A, #0x03
	MOV _led_mode, A
.stabn 0x44,0,66,L99-_mode_selection
L99:
	BCLR _led_mode_init
.stabn 0xE0,0,2,L100-_mode_selection
L100:
.stabn 0x44,0,67,L101-_mode_selection
L101:
 .stabn 0xE0,0,1,L102-_mode_selection
L102:
.stabn 0x44,0,68,L103-_mode_selection
L103:
	JMP L18
L17:
.stabn 0x44,0,69,L104-_mode_selection
L104:
	B0BTS1 0xD1.2
	JMP L21
.stabn 0xC0,0,1,L105-_mode_selection
L105:
.stabn 0x44,0,70,L106-_mode_selection
L106:
 .stabn 0x44,0,71,L107-_mode_selection
L107:
	BTS0 _mode_two
	JMP L22
	BTS1 _have_get_node
	JMP L22
.stabn 0xC0,0,2,L108-_mode_selection
L108:
.stabn 0x44,0,72,L109-_mode_selection
L109:
 .stabn 0x44,0,73,L110-_mode_selection
L110:
	BCLR _mode_one
.stabn 0x44,0,74,L111-_mode_selection
L111:
	BSET _mode_two
.stabn 0x44,0,75,L112-_mode_selection
L112:
	BCLR _mode_three
.stabn 0x44,0,76,L113-_mode_selection
L113:
	MOV A, #0x02
	MOV _led_mode, A
.stabn 0x44,0,77,L114-_mode_selection
L114:
	BCLR _led_mode_init
.stabn 0xE0,0,2,L115-_mode_selection
L115:
.stabn 0x44,0,78,L116-_mode_selection
L116:
 .stabn 0xE0,0,1,L117-_mode_selection
L117:
.stabn 0x44,0,79,L118-_mode_selection
L118:
	JMP L22
L21:
.stabn 0xC0,0,1,L119-_mode_selection
L119:
.stabn 0x44,0,81,L120-_mode_selection
L120:
 .stabn 0x44,0,82,L121-_mode_selection
L121:
	BTS0 _mode_one
	JMP L25
	BTS1 _have_get_node
	JMP L25
.stabn 0xC0,0,2,L122-_mode_selection
L122:
.stabn 0x44,0,83,L123-_mode_selection
L123:
 .stabn 0x44,0,84,L124-_mode_selection
L124:
	BSET _mode_one
.stabn 0x44,0,85,L125-_mode_selection
L125:
	BCLR _mode_two
.stabn 0x44,0,86,L126-_mode_selection
L126:
	BCLR _mode_three
.stabn 0x44,0,87,L127-_mode_selection
L127:
	MOV A, #0x01
	MOV _led_mode, A
.stabn 0x44,0,88,L128-_mode_selection
L128:
	BCLR _led_mode_init
.stabn 0xE0,0,2,L129-_mode_selection
L129:
.stabn 0x44,0,89,L130-_mode_selection
L130:
L25:
.stabn 0xE0,0,1,L131-_mode_selection
L131:
.stabn 0x44,0,90,L132-_mode_selection
L132:
L22:
L18:
.stabn 0xE0,0,0,L133-_mode_selection
L133:
.stabn 0x44,0,91,L134-_mode_selection
L134:
L1:
	RET
.stabs "power_start:F13",36,0,0,_power_start
_Function_power_start_code SEGMENT CODE INBANK USING _Function_power_start_data
_power_start:
.stabn 0xC0,0,0,L136-_power_start
L136:
.stabn 0x44,0,101,L137-_power_start
L137:
 .stabn 0xE0,0,0,L138-_power_start
L138:
.stabn 0x44,0,103,L139-_power_start
L139:
L135:
	RET
.stabs "mode_check:F13",36,0,0,_mode_check
_Function_mode_check_code SEGMENT CODE INBANK USING _Function_mode_check_data
_mode_check:
.stabn 0xC0,0,0,L141-_mode_check
L141:
.stabn 0x44,0,113,L142-_mode_check
L142:
 .stabn 0xE0,0,0,L143-_mode_check
L143:
.stabn 0x44,0,115,L144-_mode_check
L144:
L140:
	RET
.stabs "_intrinsicbitfield:T15=s1bit0:12,0,1;bit1:12,1,1;bit2:12,2,1;\\",128,0,0,0
.stabs "bit3:12,3,1;bit4:12,4,1;bit5:12,5,1;bit6:12,6,1;bit7:12,7,1;;",128,0,0,0
.stabs "", 100, 0, 0,Letext
Letext:
.stabs "flagTrigger:G300",32,0,0,_flagTrigger
.stabs "have_get_node:G301",32,0,0,_have_get_node
.stabs "check_port3_buf:G302",32,0,0,_check_port3_buf
.stabs "mode_three:G303",32,0,0,_mode_three
.stabs "mode_two:G304",32,0,0,_mode_two
.stabs "mode_one:G305",32,0,0,_mode_one
.stabs "power_up:G306",32,0,0,_power_up
.stabs "mode_delay_6:G9",32,0,0,_mode_delay_6
.stabs "mode_delay_5:G9",32,0,0,_mode_delay_5
.stabs "mode_delay_4:G9",32,0,0,_mode_delay_4
.stabs "mode_delay_3:G9",32,0,0,_mode_delay_3
.stabs "mode_delay_2:G9",32,0,0,_mode_delay_2
.stabs "mode_delay_1:G9",32,0,0,_mode_delay_1
.stabs "check_port3_change_count:G9",32,0,0,_check_port3_change_count
