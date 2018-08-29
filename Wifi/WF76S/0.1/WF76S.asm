;++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
;
;  	ProjName   	 WF76S
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
#define	   	PORT_SWITCH  	   	  P1,4
#define	   	PORT_KEY   	   	   	P1,0


;--------------------------------------------------------------------
; Parameters
cblock    0x10
StatusTemp
AccTemp

WorkFlag
WorkFlag1

LowTime
HighTime

PowerLowTime
PowerHighTime

Mode
ModeTime1
ModeTime2

OnTime
OffTime

ResetStep
ResetTime1
ResetTime2
KeyNum


endc

;--------------------------------------------------------------------
; Flag Define
#define     ModeInit                WorkFlag,0
#define     ResetFlag               WorkFlag,1
#define     KeyLowFlag              WorkFlag,4
#define     KeyHighFlag             WorkFlag,5
#define     KeyTrigFlag             WorkFlag,6
#define     PowerOnFlag             WorkFlag,7
#define     PowerStableFlag         WorkFlag1,0
#define     ResetClrFlag            WorkFlag1,1



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

   	movai   b'00000101'
   	movra   DDR1   	   	   	   	;P14 P15 output P10 P12 input
    movai   b'00110000'
   	movra   ODCON  	   	   	   	;output open-drain
 	 	movai  	b'11101110'
   	movra   PUCON	 	 	 	 	 	 	 	;P10 up-pull


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
    bset    PORT_SWITCH
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

    jbclr   PORT_KEY
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
    goto    Key_Scan

;--------------------------------------------------------------------
; Scan the key status
;--------------------------------------------------------------------
Key_Scan:
    jbclr   PORT_KEY
    goto    Key_High
    goto    Key_Low

Key_High:
    clrr    LowTime

    jbclr   KeyHighFlag
    goto    Key_Scan_Exit

    incr    HighTime
    movai   100
    rsubar  HighTime
    jbset   C
    goto    Key_Scan_Exit

    clrr   HighTime
    bset    KeyHighFlag
    bclr    KeyLowFlag
 	 	jbset	 	PowerOnFlag
 	 	goto 	 	Key_Power_On

    bset    KeyTrigFlag
    incr    KeyNum
    goto    Key_Scan_Exit

Key_Low:
    clrr    HighTime

    jbclr   KeyLowFlag
    goto    Key_Scan_Exit

    incr    LowTime
    movai   100
    rsubar  LowTime
    jbset   C
    goto    Key_Scan_Exit

    clrr    LowTime
    bset    KeyLowFlag
    bclr    KeyHighFlag
 	 	jbset	 	PowerOnFlag
 	 	goto 	 	Key_Power_On

    bset    KeyTrigFlag
    incr    KeyNum
    goto    Key_Scan_Exit

Key_Power_On:
 	 	bset 	 	PowerOnFlag
 	 	goto 	 	Key_Scan_Exit

Key_Scan_Exit:
    goto    Mode_Change

;---------------------------------------------------------------------
Mode_Change:
 	 	jbclr  	ResetFlag
 	 	goto 	 	Mode_Change_Exit

    jbset   KeyTrigFlag
    goto    Mode_Change_Exit

    bclr    KeyTrigFlag
    movai   1
    movra   Mode
    bset    ModeInit
    goto    Mode_Change_Exit

Mode_Change_Exit:
    goto    Reset_Det

;---------------------------------------------------------------------
Reset_Det:
    movr    KeyNum
    jbclr   Z
    goto    Reset_Det_None

 	 	jbclr  	ResetFlag
 	 	goto 	 	Reset_Det_None

    call    Reset_Time_Clear

    jbclr   ResetClrFlag
    goto    Reset_Det_None

    movai   12
    rsubar  KeyNum
    jbset   C
    goto    Reset_Det_Exit

    clrr    KeyNum
    movai   2
    movra   Mode
    bset    ModeInit
 	 	bset 	 	ResetFlag
    goto    Reset_Det_Exit

Reset_Det_None:
    bclr    ResetClrFlag
    clrr    ResetTime1
    clrr    ResetTime2
 	 	clrr 	 	KeyNum
    goto    Reset_Det_Exit

Reset_Det_Exit:
    goto    Mode_Control


Reset_Time_Clear:
    incr    ResetTime1
    movai   250         ;100ms
    rsubar  ResetTime1
    jbset   C
    goto    Reset_Time_Clear_Cnt

    clrr    ResetTime1
    incr    ResetTime2
    movai   30        ;3s
    rsubar  ResetTime2
    jbset   C
    goto    Reset_Time_Clear_Cnt

    bset    ResetClrFlag
    return

Reset_Time_Clear_Cnt:
    bclr   ResetClrFlag
    return

;---------------------------------------------------------------------
Mode_Control:
    jbclr   ModeInit
    goto    Mode_Control_Sub

    bclr    ModeInit
    bset    PORT_SWITCH
    clrr    ModeTime1
    clrr    ModeTime2
    goto    Mode_Control_Sub

Mode_Control_Sub:
    movai   1
    rsubar  Mode
    jbset   C
    goto    Mode_Standby

    movai   2
    rsubar  Mode
    jbset   C
    goto    Mode_On_Off
    goto    Mode_Reset

Mode_Standby:
    bset    PORT_SWITCH
    goto    Mode_Control_Exit

Mode_On_Off:
    bclr    PORT_SWITCH
    incr    ModeTime1
    movai   200       ;400 * 200 = 80ms
    rsubar  ModeTime1
    jbset   C
    goto    Mode_Control_Exit

    clrr    ModeTime1
    clrr    Mode
    bset    ModeInit
    goto    Mode_Control_Exit

Mode_Reset:
    bclr    PORT_SWITCH
    incr    ModeTime1
    movai   250         ;100ms
    rsubar  ModeTime1
    jbset   C
    goto    Mode_Control_Exit

    clrr    ModeTime1
    incr    ModeTime2
    movai   50          ;5s
    rsubar  ModeTime2
    jbset   C
    goto    Mode_Control_Exit

    clrr    ModeTime2
    clrr    Mode
    bset    ModeInit
 	 	bclr 	 	ResetFlag
    goto    Mode_Control_Exit

Mode_Control_Exit:
   	goto   	Main







;--------------------------------------------------------------------
   	end
