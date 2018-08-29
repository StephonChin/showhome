CHIP SN8P2511
EXTERN DATA X
EXTERN DATA H
EXTERN DATA L
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
_InterruptBackupData SEGMENT DATA BANK 0 INBANK COMMON
	_bufT ds 1
	_bufI ds 1
	_bufY ds 1
	_bufZ ds 1
	_bufR ds 1
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
 .stabn 0x44,0,32,L4-_gpio_init
L4:
	CLR (0xB8 &  0xFF)
.stabn 0x44,0,34,L5-_gpio_init
L5:
	CLR (0xC8 &  0xFF)
.stabn 0x44,0,35,L6-_gpio_init
L6:
	MOV A, #0x01
	B0MOV 0xC9, A
.stabn 0x44,0,36,L7-_gpio_init
L7:
	MOV A, #0x08
	B0MOV 0xBF, A
.stabn 0x44,0,37,L8-_gpio_init
L8:
	B0BSET 0xDF.7
.stabn 0x44,0,39,L9-_gpio_init
L9:
	MOV A, #0xfe
	B0MOV 0xC1, A
.stabn 0x44,0,40,L10-_gpio_init
L10:
	MOV A, #0x01
	B0MOV 0xE1, A
.stabn 0x44,0,41,L11-_gpio_init
L11:
	CLR (0xD1 &  0xFF)
.stabn 0x44,0,42,L12-_gpio_init
L12:
	B0MOV 0xC0, A
.stabn 0x44,0,44,L13-_gpio_init
L13:
	MOV A, #0xff
	B0MOV 0xC2, A
.stabn 0x44,0,45,L14-_gpio_init
L14:
	CLR (0xD2 &  0xFF)
.stabn 0x44,0,47,L15-_gpio_init
L15:
	B0MOV 0xC5, A
.stabn 0x44,0,48,L16-_gpio_init
L16:
	MOV A, #0x10
	B0MOV 0xD5, A
.stabn 0xE0,0,0,L17-_gpio_init
L17:
.stabn 0x44,0,49,L18-_gpio_init
L18:
L1:
	RET
.stabs "time_init:F13",36,0,0,_time_init
_Function_time_init_code SEGMENT CODE INBANK USING _Function_time_init_data
_time_init:
.stabn 0xC0,0,0,L20-_time_init
L20:
.stabn 0x44,0,53,L21-_time_init
L21:
 .stabn 0x44,0,54,L22-_time_init
L22:
	MOV A, #0x9c
	B0MOV 0xDB, A
.stabn 0x44,0,55,L23-_time_init
L23:
	B0MOV 0xCD, A
.stabn 0x44,0,56,L24-_time_init
L24:
	MOV A, #0xf4
	B0MOV 0xDA, A
.stabn 0xE0,0,0,L25-_time_init
L25:
.stabn 0x44,0,57,L26-_time_init
L26:
L19:
	RET
.stabs "main:F13",36,0,0,_main
_Function_main_code SEGMENT CODE INBANK USING _Function_main_data
_main:
.stabn 0xC0,0,0,L67-_main
L67:
.stabn 0x44,0,61,L68-_main
L68:
 .stabn 0x44,0,62,L69-_main
L69:
	MOV A, #0x06
	B0MOV 0xCA, A
.stabn 0x44,0,63,L70-_main
L70:
	CALL _gpio_init
.stabn 0x44,0,64,L71-_main
L71:
	CALL _time_init
L28:
.stabn 0xC0,0,1,L72-_main
L72:
.stabn 0x44,0,67,L73-_main
L73:
 .stabn 0x44,0,68,L74-_main
L74:
	B0BTS1 0xC8.5
	JMP L31
.stabn 0xC0,0,2,L75-_main
L75:
.stabn 0x44,0,69,L76-_main
L76:
 .stabn 0x44,0,70,L77-_main
L77:
	B0BCLR 0xC8.5
.stabn 0x44,0,74,L78-_main
L78:
	B0BTS1 0xD1.0
	JMP L33
.stabn 0xC0,0,3,L79-_main
L79:
.stabn 0x44,0,75,L80-_main
L80:
 .stabn 0x44,0,76,L81-_main
L81:
	BTS0 _open_trigger
	JMP L34
	BTS0 _out_finish
	JMP L34
.stabn 0xC0,0,4,L82-_main
L82:
.stabn 0x44,0,77,L83-_main
L83:
 .stabn 0x44,0,78,L84-_main
L84:
	BSET _open_trigger
.stabn 0x44,0,79,L85-_main
L85:
	BCLR _on_trigger
.stabn 0x44,0,80,L86-_main
L86:
	BSET _out_finish
.stabn 0x44,0,81,L87-_main
L87:
	BSET _out_enable
.stabn 0x44,0,82,L88-_main
L88:
	B0BCLR 0xD5.4
.stabn 0x44,0,83,L89-_main
L89:
	B0BCLR 0xD1.2
.stabn 0x44,0,84,L90-_main
L90:
	CLR _out_delay
.stabn 0xE0,0,4,L91-_main
L91:
.stabn 0x44,0,85,L92-_main
L92:
 .stabn 0xE0,0,3,L93-_main
L93:
.stabn 0x44,0,86,L94-_main
L94:
	JMP L34
L33:
.stabn 0xC0,0,3,L95-_main
L95:
.stabn 0x44,0,88,L96-_main
L96:
 .stabn 0x44,0,89,L97-_main
L97:
	BTS0 _on_trigger
	JMP L37
	BTS0 _out_finish
	JMP L37
.stabn 0xC0,0,4,L98-_main
L98:
.stabn 0x44,0,90,L99-_main
L99:
 .stabn 0x44,0,91,L100-_main
L100:
	BSET _on_trigger
.stabn 0x44,0,92,L101-_main
L101:
	BCLR _open_trigger
.stabn 0x44,0,93,L102-_main
L102:
	BSET _out_finish
.stabn 0x44,0,94,L103-_main
L103:
	B0BCLR 0xD5.4
.stabn 0x44,0,95,L104-_main
L104:
	CLR _out_delay
.stabn 0x44,0,96,L105-_main
L105:
	BCLR _int_wave_up
.stabn 0x44,0,97,L106-_main
L106:
	B0BCLR 0xD1.2
.stabn 0x44,0,98,L107-_main
L107:
	BSET _out_enable
.stabn 0x44,0,99,L108-_main
L108:
	CLR _sleep_delay_3
.stabn 0xE0,0,4,L109-_main
L109:
.stabn 0x44,0,100,L110-_main
L110:
	JMP L38
L37:
.stabn 0xC0,0,4,L111-_main
L111:
.stabn 0x44,0,102,L112-_main
L112:
 .stabn 0x44,0,103,L113-_main
L113:
	BTS0 _out_finish
	JMP L39
.stabn 0xC0,0,5,L114-_main
L114:
.stabn 0x44,0,104,L115-_main
L115:
 .stabn 0x44,0,105,L116-_main
L116:
	BTS1 _int_wave_up
	JMP L41
.stabn 0xC0,0,6,L117-_main
L117:
.stabn 0x44,0,106,L118-_main
L118:
 .stabn 0x44,0,107,L119-_main
L119:
	BSET _int_trigger
.stabn 0xE0,0,6,L120-_main
L120:
.stabn 0x44,0,108,L121-_main
L121:
L41:
.stabn 0xE0,0,5,L122-_main
L122:
.stabn 0x44,0,109,L123-_main
L123:
L39:
.stabn 0xE0,0,4,L124-_main
L124:
.stabn 0x44,0,110,L125-_main
L125:
L38:
.stabn 0xE0,0,3,L126-_main
L126:
.stabn 0x44,0,111,L127-_main
L127:
L34:
.stabn 0x44,0,113,L128-_main
L128:
	BTS1 _out_enable
	JMP L43
.stabn 0xC0,0,3,L129-_main
L129:
.stabn 0x44,0,114,L130-_main
L130:
 .stabn 0x44,0,115,L131-_main
L131:
	INCMS _out_delay
	NOP
.stabn 0x44,0,116,L132-_main
L132:
	MOV A, _out_delay
	CMPRS A, #0x02
	B0BTS1	134.2
	JMP	L44
.stabn 0xC0,0,4,L133-_main
L133:
.stabn 0x44,0,117,L134-_main
L134:
 .stabn 0x44,0,118,L135-_main
L135:
	CLR _out_delay
.stabn 0x44,0,119,L136-_main
L136:
	B0BSET 0xD5.4
.stabn 0x44,0,120,L137-_main
L137:
	BCLR _out_finish
.stabn 0x44,0,121,L138-_main
L138:
	BCLR _out_enable
.stabn 0x44,0,123,L139-_main
L139:
	B0BCLR 0xCA.4
.stabn 0x44,0,124,L140-_main
L140:
	B0BSET 0xCA.3
.stabn 0x44,0,125,L141-_main
L141:
	B0BSET 0xCA.2
.stabn 0x44,0,126,L142-_main
L142:
	B0BSET 0xCA.1
.stabn 0xE0,0,4,L143-_main
L143:
.stabn 0x44,0,127,L144-_main
L144:
 .stabn 0xE0,0,3,L145-_main
L145:
.stabn 0x44,0,128,L146-_main
L146:
	JMP L44
L43:
.stabn 0x44,0,129,L147-_main
L147:
	BTS1 _int_trigger
	JMP L47
.stabn 0xC0,0,3,L148-_main
L148:
.stabn 0x44,0,130,L149-_main
L149:
 .stabn 0x44,0,131,L150-_main
L150:
	INCMS _sleep_delay_1
	NOP
.stabn 0x44,0,132,L151-_main
L151:
	MOV A, _sleep_delay_1
	CMPRS A, #0x04
	B0BTS1	134.2
	JMP	L49
.stabn 0xC0,0,4,L152-_main
L152:
.stabn 0x44,0,133,L153-_main
L153:
 .stabn 0x44,0,134,L154-_main
L154:
	CLR _sleep_delay_1
.stabn 0x44,0,135,L155-_main
L155:
	INCMS _sleep_delay_2
	NOP
.stabn 0x44,0,136,L156-_main
L156:
	MOV A, _sleep_delay_2
	CMPRS A, #0x7c
	B0BTS1	134.2
	JMP	L51
.stabn 0xC0,0,5,L157-_main
L157:
.stabn 0x44,0,137,L158-_main
L158:
 .stabn 0x44,0,138,L159-_main
L159:
	B0BCLR 0xD1.2
.stabn 0x44,0,139,L160-_main
L160:
	CLR _sleep_delay_2
.stabn 0x44,0,140,L161-_main
L161:
	MOV A, #0x06
	MOV _sleep_delay_3, A
.stabn 0xE0,0,5,L162-_main
L162:
.stabn 0x44,0,141,L163-_main
L163:
L51:
.stabn 0xE0,0,4,L164-_main
L164:
.stabn 0x44,0,142,L165-_main
L165:
L49:
.stabn 0x44,0,144,L166-_main
L166:
	INCMS _sleep_delay_3
	NOP
.stabn 0x44,0,145,L167-_main
L167:
	MOV A, _sleep_delay_3
	CMPRS A, #0x06
	B0BTS1	134.2
	JMP	L53
.stabn 0xC0,0,4,L168-_main
L168:
.stabn 0x44,0,146,L169-_main
L169:
 .stabn 0x44,0,147,L170-_main
L170:
	CMPRS A, #0x08
	JMP L55
.stabn 0xC0,0,5,L171-_main
L171:
.stabn 0x44,0,148,L172-_main
L172:
 .stabn 0x44,0,149,L173-_main
L173:
	B0BCLR 0xDF.7
.stabn 0x44,0,150,L174-_main
L174:
	B0BCLR 0xD5.4
.stabn 0x44,0,151,L175-_main
L175:
	BSET _out_finish
.stabn 0xE0,0,5,L176-_main
L176:
.stabn 0x44,0,152,L177-_main
L177:
L55:
.stabn 0x44,0,154,L178-_main
L178:
	MOV A, _sleep_delay_3
	CMPRS A, #0x09
	JMP L57
.stabn 0xC0,0,5,L179-_main
L179:
.stabn 0x44,0,155,L180-_main
L180:
 .stabn 0x44,0,156,L181-_main
L181:
	B0BSET 0xD5.4
.stabn 0x44,0,157,L182-_main
L182:
	BCLR _out_finish
.stabn 0xE0,0,5,L183-_main
L183:
.stabn 0x44,0,158,L184-_main
L184:
L57:
.stabn 0x44,0,159,L185-_main
L185:
	MOV A, _sleep_delay_3
	CMPRS A, #0x71
	B0BTS1	134.2
	JMP	L54
.stabn 0xC0,0,5,L186-_main
L186:
.stabn 0x44,0,160,L187-_main
L187:
 .stabn 0x44,0,161,L188-_main
L188:
	BCLR _int_wave_up
.stabn 0x44,0,162,L189-_main
L189:
	BCLR _int_trigger
.stabn 0x44,0,163,L190-_main
L190:
	CLR _sleep_delay_3
.stabn 0x44,0,164,L191-_main
L191:
	B0BCLR 0xC8.0
.stabn 0x44,0,165,L192-_main
L192:
	B0BSET 0xDF.7
.stabn 0x44,0,166,L193-_main
L193:
	B0BCLR 0xCA.4
.stabn 0x44,0,167,L194-_main
L194:
	B0BSET 0xCA.3
.stabn 0x44,0,168,L195-_main
L195:
	B0BSET 0xCA.2
.stabn 0x44,0,169,L196-_main
L196:
	B0BSET 0xCA.1
.stabn 0xE0,0,5,L197-_main
L197:
.stabn 0x44,0,170,L198-_main
L198:
 .stabn 0xE0,0,4,L199-_main
L199:
.stabn 0x44,0,171,L200-_main
L200:
	JMP L54
L53:
.stabn 0xC0,0,4,L201-_main
L201:
.stabn 0x44,0,173,L202-_main
L202:
 .stabn 0x44,0,174,L203-_main
L203:
	MOV A, _sleep_delay_3
	CMPRS A, #0x04
	B0BTS1	134.2
	JMP	L61
.stabn 0x44,0,174,L204-_main
L204:
	MOV A, #0x04
	MOV _sleep_delay_3, A
	JMP L62
L61:
.stabn 0xC0,0,5,L205-_main
L205:
.stabn 0x44,0,176,L206-_main
L206:
 .stabn 0x44,0,177,L207-_main
L207:
	MOV A, _sleep_delay_3
	CMPRS A, #0x03
	B0BTS1	134.2
	JMP	L63
.stabn 0xC0,0,6,L208-_main
L208:
.stabn 0x44,0,178,L209-_main
L209:
 .stabn 0x44,0,179,L210-_main
L210:
	B0BSET 0xD5.4
.stabn 0x44,0,180,L211-_main
L211:
	BCLR _out_finish
.stabn 0xE0,0,6,L212-_main
L212:
.stabn 0x44,0,181,L213-_main
L213:
	JMP L64
L63:
.stabn 0xC0,0,6,L214-_main
L214:
.stabn 0x44,0,183,L215-_main
L215:
 .stabn 0x44,0,184,L216-_main
L216:
	MOV A, _sleep_delay_3
	CMPRS A, #0x01
	B0BTS1	134.2
	JMP	L65
.stabn 0xC0,0,7,L217-_main
L217:
.stabn 0x44,0,185,L218-_main
L218:
 .stabn 0x44,0,186,L219-_main
L219:
	B0BCLR 0xD5.4
.stabn 0x44,0,187,L220-_main
L220:
	BSET _out_finish
.stabn 0xE0,0,7,L221-_main
L221:
.stabn 0x44,0,188,L222-_main
L222:
L65:
.stabn 0xE0,0,6,L223-_main
L223:
.stabn 0x44,0,189,L224-_main
L224:
L64:
.stabn 0xE0,0,5,L225-_main
L225:
.stabn 0x44,0,190,L226-_main
L226:
L62:
.stabn 0xE0,0,4,L227-_main
L227:
.stabn 0x44,0,191,L228-_main
L228:
L54:
.stabn 0xE0,0,3,L229-_main
L229:
.stabn 0x44,0,192,L230-_main
L230:
L47:
L44:
.stabn 0xE0,0,2,L231-_main
L231:
.stabn 0x44,0,193,L232-_main
L232:
L31:
.stabn 0xE0,0,1,L233-_main
L233:
.stabn 0x44,0,194,L234-_main
L234:
L29:
.stabn 0x44,0,66,L235-_main
L235:
	JMP L28
.stabn 0xE0,0,0,L236-_main
L236:
.stabn 0x44,0,195,L237-_main
L237:
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
	PUSH
	B0MOV A, 132
	B0MOV _bufY, A
	B0MOV A, 131
	B0MOV _bufZ, A
	B0MOV A, 130
	B0MOV _bufR, A
	B0MOV A, T
	B0MOV _bufT, A
	B0MOV A, I
	B0MOV _bufI, A
.stabn 0xC0,0,0,L241-_interrupt_isr_isr
L241:
.stabn 0x44,0,201,L242-_interrupt_isr_isr
L242:
 .stabn 0x44,0,202,L243-_interrupt_isr_isr
L243:
	B0BTS1 0xC8.0
	JMP L239
.stabn 0xC0,0,1,L244-_interrupt_isr_isr
L244:
.stabn 0x44,0,203,L245-_interrupt_isr_isr
L245:
 .stabn 0x44,0,204,L246-_interrupt_isr_isr
L246:
	BSET _int_wave_up
.stabn 0x44,0,205,L247-_interrupt_isr_isr
L247:
	B0BSET 0xD1.2
.stabn 0x44,0,206,L248-_interrupt_isr_isr
L248:
	CLR _sleep_delay_1
.stabn 0x44,0,207,L249-_interrupt_isr_isr
L249:
	CLR _sleep_delay_2
.stabn 0xE0,0,1,L250-_interrupt_isr_isr
L250:
.stabn 0x44,0,208,L251-_interrupt_isr_isr
L251:
L239:
.stabn 0x44,0,209,L252-_interrupt_isr_isr
L252:
	B0BCLR 0xC8.0
.stabn 0xE0,0,0,L253-_interrupt_isr_isr
L253:
.stabn 0x44,0,210,L254-_interrupt_isr_isr
L254:
L238:
	B0MOV A, _bufT
	B0MOV T, A
	B0MOV A, _bufI
	B0MOV I, A
	B0MOV A, _bufY
	B0MOV 132, A
	B0MOV A, _bufZ
	B0MOV 131, A
	B0MOV A, _bufR
	B0MOV 130, A
	POP
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
