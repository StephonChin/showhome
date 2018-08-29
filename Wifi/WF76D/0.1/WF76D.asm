;++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
;
;  	ProjName   	 WF76D
;  	MCU Info   	  MC30P6060
;  	   	   	   	|>  No reset volatage
;  	   	   	   	|> 	WDT clock enable 288ms
;  	   	   	   	|> 	Crystal 8M 2T
;  	Date   	   	2018.08.25
;  	Author 	   	DS.Chin
;  	Version	   	0.0
;  	Brief  	   	the initial version
;
;++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
#include "mc30P6060.inc"


;--------------------------------------------------------------------
; Port Define
#define	   	PORT_SWITCH_1  	   	  P1,4
#define     PORT_SWITCH_2         P1,5
#define	   	PORT_KEY_1 	   	   	  P1,0
#define     PORT_KEY_2            P1,1


;--------------------------------------------------------------------
; Parameters
cblock    0x10
StatusTemp
AccTemp

WorkFlag
WorkFlag1

LowTime1
HighTime1
LowTime2
HighTime2

PowerLowTime
PowerHighTime

ResetTime1
ResetTime2


ResetTime1_1
ResetTime2_1
ResetTime1_2
ResetTime2_2
KeyNum1
KeyNum2
KeyTime1
KeyTime2


endc

;--------------------------------------------------------------------
; Flag Define
#define     ModeInit                WorkFlag,0
#define     ResetFlag               WorkFlag,1
#define     KeyLowFlag2             WorkFlag,2
#define     KeyHighFlag2            WorkFlag,3
#define     KeyTrigFlag2            WorkFlag,4
#define     KeyLowFlag1             WorkFlag,5
#define     KeyHighFlag1            WorkFlag,6
#define     KeyTrigFlag1            WorkFlag,7

#define     PowerOnFlag1            WorkFlag1,0
#define	 	 	PowerOnFlag2 	 	 	 	 	 	WorkFlag1,1
#define     PowerStableFlag         WorkFlag1,2
#define     ResetClrFlag1           WorkFlag1,3
#define	 	 	ResetClrFlag2	 	 	 	 	 	WorkFlag1,4



;--------------------------------------------------------------------
; Programm & Interrupt Entrance
   	org	   	    0x03ff
   	goto   	    _Start
   	org	   	    0x08
   	goto   	    _Interrupt

;--------------------------------------------------------------------
; Interrupt Code
_Interrupt:
   	movra  	   	AccTemp
    swapar 	   	STATUS
    movra  	   	StatusTemp


_Interrupt_Exit:
   	clrr   	   	INTFLAG
    bclr        KBIF
   	swapar 	   	StatusTemp
    movra  	   	STATUS
    swapr  	   	AccTemp
    swapar 	   	AccTemp
   	RETIE




;--------------------------------------------------------------------
; MCU Config
_Start:
   	clrr   	INTECON             ;interrupt
   	clrr    MCR    	   	   	   	;watch dog

   	movai   b'00000011'
   	movra   DDR1   	   	   	   	;P14 P15 output P10 P11 input
    movai   b'00110000'
   	movra   ODCON  	   	   	   	;output open-drain
 	 	movai  	b'11001100'
   	movra   PUCON	 	 	 	 	 	 	 	;P10 P11 up-pull


   	movai  	0x02
   	movra  	T0CR   	   	   	   	;uping edge, Ft0 = Fcpu, Pre for T0, Ft=8/2/8=0.5M Tt=2us  (2T)
   	movai   56
   	movra   T0CNT               ;time0 - 200  200 * 2 = 400us


   	bset   	WDTEN
   	CLRWDT 	   	   	   	   	   	; Clear the watch dog timer count

   	movai   0x3f
   	movra   FSR
   	goto    _Ram_clear





;--------------------------------------------------------------------
; Parameters Initialize
_Ram_clear:
   	clrr    INDF
   	decr    FSR
   	movai   0xd0
   	rsubar  FSR
   	jbclr   C
   	goto    _Ram_clear
   	goto    _User_Init




;--------------------------------------------------------------------
; User Data Initialize
_User_Init:
    bset    PORT_SWITCH_1
    bset    PORT_SWITCH_2
   	goto    Main





;--------------------------------------------------------------------
; Main Code
Main:
   	jbset   T0IF
   	goto    Main
   	bclr    T0IF

   	movai   56
   	movra   T0CNT  	   	   	   	; scan each 200us

   	CLRWDT 	   	   	   	   	   	;clear the WDT timer count

;  	jbclr   PORT_OUT
;  	goto    $+3
;  	bset    PORT_OUT
;  	goto    $+2
;  	bclr    PORT_OUT
;  	goto    Main

   	goto   	Power_Stability

;--------------------------------------------------------------------
;Wait the power stability
;--------------------------------------------------------------------
Power_Stability:
    jbclr   PowerStableFlag
    goto    Power_Stability_Exit

    jbclr   PORT_KEY_1
    goto    High_Stability
    goto    Low_Stability

High_Stability:
    clrr    PowerLowTime

    incr    PowerHighTime
    movai   200           ;80ms
    rsubar  PowerHighTime
    jbset   C
    goto    Power_Stability_Ret

    clrr    PowerHighTime
    bset    PowerStableFlag
    goto    Power_Stability_Ret

Low_Stability:
    clrr    PowerHighTime

    incr    PowerLowTime
    movai   200
    rsubar  PowerLowTime
    jbset   C
    goto    Power_Stability_Ret

    clrr    PowerLowTime
    bset    PowerStableFlag
    goto    Power_Stability_Ret

Power_Stability_Ret:
    goto    Main


Power_Stability_Exit:
    goto    Key_Scan_1

;--------------------------------------------------------------------
; Scan the key 1 status
;--------------------------------------------------------------------
Key_Scan_1:
    jbclr   PORT_KEY_1
    goto    Key_High_1
    goto    Key_Low_1

Key_High_1:
    clrr    LowTime1

    jbclr   KeyHighFlag1
    goto    Key_Scan_Exit_1

    incr    HighTime1
    movai   100
    rsubar  HighTime1
    jbset   C
    goto    Key_Scan_Exit_1

    clrr   HighTime1
    bset    KeyHighFlag1
    bclr    KeyLowFlag1
 	 	jbset	 	PowerOnFlag1
 	 	goto 	 	Key_Power_On_1

    bset    KeyTrigFlag1
    incr    KeyNum1
    goto    Key_Scan_Exit_1

Key_Low_1:
    clrr    HighTime1

    jbclr   KeyLowFlag1
    goto    Key_Scan_Exit_1

    incr    LowTime1
    movai   100
    rsubar  LowTime1
    jbset   C
    goto    Key_Scan_Exit_1

    clrr    LowTime1
    bset    KeyLowFlag1
    bclr    KeyHighFlag1
 	 	jbset	 	PowerOnFlag1
 	 	goto 	 	Key_Power_On_1

    bset    KeyTrigFlag1
    incr    KeyNum1
    goto    Key_Scan_Exit_1

Key_Power_On_1:
 	 	bset 	 	PowerOnFlag1
 	 	goto 	 	Key_Scan_Exit_1

Key_Scan_Exit_1:
    goto    Key_Scan_2


;--------------------------------------------------------------------
; Scan the key 2 status
;--------------------------------------------------------------------
Key_Scan_2:
    jbclr   PORT_KEY_2
    goto    Key_High_2
    goto    Key_Low_2

Key_High_2:
    clrr    LowTime2

    jbclr   KeyHighFlag2
    goto    Key_Scan_Exit_2

    incr    HighTime2
    movai   100
    rsubar  HighTime2
    jbset   C
    goto    Key_Scan_Exit_2

    clrr    HighTime2
    bset    KeyHighFlag2
    bclr    KeyLowFlag2
 	 	jbset	 	PowerOnFlag2
 	 	goto 	 	Key_Power_On_2

    bset    KeyTrigFlag2
    incr    KeyNum2
    goto    Key_Scan_Exit_2

Key_Low_2:
    clrr    HighTime2

    jbclr   KeyLowFlag2
    goto    Key_Scan_Exit_2

    incr    LowTime2
    movai   100
    rsubar  LowTime2
    jbset   C
    goto    Key_Scan_Exit_2

    clrr    LowTime2
    bset    KeyLowFlag2
    bclr    KeyHighFlag2
 	 	jbset	 	PowerOnFlag2
 	 	goto 	 	Key_Power_On_2

    bset    KeyTrigFlag2
    incr    KeyNum2
    goto    Key_Scan_Exit_2

Key_Power_On_2:
 	 	bset 	 	PowerOnFlag2
 	 	goto 	 	Key_Scan_Exit_2

Key_Scan_Exit_2:
    goto    Mode_Change_1

;---------------------------------------------------------------------
Mode_Change_1:
 	 	jbclr  	ResetFlag
 	 	goto 	 	Mode_Change_None_1

    jbset   KeyTrigFlag1
    goto    Mode_Change_Exit_1

    bclr    PORT_SWITCH_1
    incr    KeyTime1
    movai   200
    rsubar  KeyTime1
    jbset   C
    goto    Mode_Change_Exit_1

    bclr    KeyTrigFlag1
    bset    PORT_SWITCH_1
    goto    Mode_Change_None_1

Mode_Change_None_1:
    clrr    KeyTime1

Mode_Change_Exit_1:
    goto    Mode_Change_2

;---------------------------------------------------------------------
Mode_Change_2:
    jbclr  	ResetFlag
    goto 	 	Mode_Change_None_2

    jbset   KeyTrigFlag2
    goto    Mode_Change_Exit_2

    bclr    PORT_SWITCH_2
    incr    KeyTime2
    movai   200
    rsubar  KeyTime2
    jbset   C
    goto    Mode_Change_Exit_2

    bclr    KeyTrigFlag2
    goto    Mode_Change_None_2

Mode_Change_None_2:
 	 	bset    PORT_SWITCH_2
    clrr    KeyTime2

Mode_Change_Exit_2:
    goto    Reset_Det_1

;---------------------------------------------------------------------
Reset_Det_1:
    movr    KeyNum1
    jbclr   Z
    goto    Reset_Det_None_1

 	 	jbclr  	ResetFlag
 	 	goto 	 	Reset_Det_None_1

    call    Reset_Time_Clear_1

    jbclr   ResetClrFlag1
    goto    Reset_Det_None_1

    movai   12
    rsubar  KeyNum1
    jbset   C
    goto    Reset_Det_Exit_1

    clrr    KeyNum1
 	 	bset 	 	ResetFlag
    goto    Reset_Det_Exit_1

Reset_Det_None_1:
    bclr    ResetClrFlag1
    clrr    ResetTime1_1
    clrr    ResetTime2_1
 	 	clrr 	 	KeyNum1
    goto    Reset_Det_Exit_1

Reset_Det_Exit_1:
    goto    Reset_Det_2


Reset_Time_Clear_1:
    incr    ResetTime1_1
    movai   250         ;100ms
    rsubar  ResetTime1_1
    jbset   C
    goto    Reset_Time_Clear_Cnt_1

    clrr    ResetTime1_1
    incr    ResetTime2_1
    movai   30        ;3s
    rsubar  ResetTime2_1
    jbset   C
    goto    Reset_Time_Clear_Cnt_1

    bset    ResetClrFlag1
    return

Reset_Time_Clear_Cnt_1:
    bclr   ResetClrFlag1
    return

;---------------------------------------------------------------------
Reset_Det_2:
    movr    KeyNum2
    jbclr   Z
    goto    Reset_Det_None_2

 	 	jbclr  	ResetFlag
 	 	goto 	 	Reset_Det_None_2

    call    Reset_Time_Clear_2

    jbclr   ResetClrFlag2
    goto    Reset_Det_None_2

    movai   12
    rsubar  KeyNum2
    jbset   C
    goto    Reset_Det_Exit_2

    clrr    KeyNum2
 	 	bset 	 	ResetFlag
    goto    Reset_Det_Exit_2

Reset_Det_None_2:
    bclr    ResetClrFlag1
    clrr    ResetTime1_2
    clrr    ResetTime2_2
 	 	clrr 	 	KeyNum2
    goto    Reset_Det_Exit_2

Reset_Det_Exit_2:
    goto    Reset_Control


Reset_Time_Clear_2:
    incr    ResetTime1_2
    movai   250         ;100ms
    rsubar  ResetTime1_2
    jbset   C
    goto    Reset_Time_Clear_Cnt_2

    clrr    ResetTime1_2
    incr    ResetTime2_2
    movai   30        ;3s
    rsubar  ResetTime2_2
    jbset   C
    goto    Reset_Time_Clear_Cnt_2

    bset    ResetClrFlag2
    return

Reset_Time_Clear_Cnt_2:
    bclr   ResetClrFlag2
    return

;---------------------------------------------------------------------
Reset_Control:
    jbset   ResetFlag
    goto    Reset_Control_None

    bclr    PORT_SWITCH_1
    incr    ResetTime1
    movai   250         ;100ms
    rsubar  ResetTime1
    jbset   C
    goto    Mode_Control_Exit

    clrr    ResetTime1
    incr    ResetTime2
    movai   50          ;5s
    rsubar  ResetTime2
    jbset   C
    goto    Mode_Control_Exit

    clrr    ResetTime2
 	 	bclr 	 	ResetFlag
    bset    PORT_SWITCH_1
    goto    Mode_Control_Exit

Reset_Control_None:
    clrr    ResetTime1
    clrr    ResetTime2

Mode_Control_Exit:
   	goto   	Main







;--------------------------------------------------------------------
   	end
