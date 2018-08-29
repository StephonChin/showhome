;++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
;
;  	ProjName   	 WF30
;  	MCU Info   	  MC30P6060
;  	   	   	   	|>  No reset volatage
;  	   	   	   	|> 	WDT clock enable 288ms
;  	   	   	   	|> 	Crystal 8M 2T
;  	Date   	   	2018.08.18
;  	Author 	   	DS.Chin
;  	Version	   	0.0
;  	Brief  	   	the initial version
;
;++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
#include "mc30P6060.inc"


;--------------------------------------------------------------------
; Port Define
#define	   	PORT_RELAY 	   	   	P1,2
#define	   	PORT_ON  	   	   	  P1,4
#define	   	PORT_OFF 	   	   	  P1,5
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
ModeTime

OnTime
OffTime


endc

;--------------------------------------------------------------------
; Flag Define
#define     ModeInit                WorkFlag,0
#define     OnOffFlag               WorkFlag,1
#define     OnFlag                  WorkFlag,2
#define     OffFlag                	WorkFlag,3
#define     KeyLowFlag              WorkFlag,4
#define     KeyHighFlag             WorkFlag,5
#define     KeyTrigFlag             WorkFlag,6
#define     PowerOnFlag             WorkFlag,7
#define     PowerStableFlag         WorkFlag1,0



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
   	clrr    PUCON
    clrr    PDCON


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
    bset    PORT_ON
    bset    PORT_OFF
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
    goto    On_Off_Det

;--------------------------------------------------------------------
;Get the output status
;--------------------------------------------------------------------
On_Off_Det:
    jbclr   PORT_RELAY
    goto    On_Det
    goto    Off_Det
On_Det:
    clrr    OffTime

    jbclr   OnFlag
    goto    On_Off_Det_Exit

    incr    OnTime
    movai   100     ;40ms
    rsubar  OnTime
    jbset   C
    goto    On_Off_Det_Exit

    bset    OnFlag
    bclr    OffFlag
    bset    OnOffFlag
    clrr    OnTime
    goto    On_Off_Det_Exit

Off_Det:
    clrr    OnTime

    jbclr     OffFlag
    goto      On_Off_Det_Exit

    incr      OffTime
    movai     100
    rsubar    OffTime
    jbset     C
    goto      On_Off_Det_Exit

    clrr      OffTime
    bset      OffFlag
    bclr      OnFlag
    bclr      OnOffFlag
    goto      On_Off_Det_Exit

On_Off_Det_Exit:
    goto      Key_Scan


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
    bset    KeyTrigFlag
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
    bset    KeyTrigFlag
    goto    Key_Scan_Exit

Key_Scan_Exit:
   	goto   	Mode_Change

;---------------------------------------------------------------------
;Change the mode
;---------------------------------------------------------------------
Mode_Change:
    jbset   KeyTrigFlag
    goto    Mode_Change_Exit

    bclr    KeyTrigFlag

    jbset   PowerOnFlag
    goto    Power_On_Init

    jbset   OnOffFlag
    goto    Change_On
    goto    Change_Off

Change_On:
    movai   1
    movra   Mode
    bset    ModeInit
    goto    Mode_Change_Exit

Change_Off:
    movai   2
    movra   Mode
    bset    ModeInit
    goto    Mode_Change_Exit

Power_On_Init:
    bset    PowerOnFlag
    goto    Mode_Change_Exit

Mode_Change_Exit:
    goto    Mode_Control

;---------------------------------------------------------------------
Mode_Control:
    jbclr   ModeInit
    goto    Mode_Control_Sub

    bclr    ModeInit
    bset    PORT_ON
    bset    PORT_OFF
    clrr    ModeTime
    goto    Mode_Control_Sub

Mode_Control_Sub:
    movai   1
    rsubar  Mode
    jbset   C
    goto    Mode_Standby

    movai   2
    rsubar  Mode
    jbset   C
    goto    Mode_On
    goto    Mode_Off

Mode_Standby:
    bset    PORT_ON
    bset    PORT_OFF
    goto    Mode_Control_Exit

Mode_On:
    bclr    PORT_ON
    goto    Mode_Time_Delay

Mode_Off:
    bclr    PORT_OFF
    goto    Mode_Time_Delay

Mode_Time_Delay:
    incr    ModeTime
    movai   200       ;400 * 200 = 80ms
    rsubar  ModeTime
    jbset   C
    goto    Mode_Control_Exit

    clrr    ModeTime
    clrr    Mode
    bset    ModeInit
    goto    Mode_Control_Exit

Mode_Control_Exit:
   	goto   	Main







;--------------------------------------------------------------------
   	end
