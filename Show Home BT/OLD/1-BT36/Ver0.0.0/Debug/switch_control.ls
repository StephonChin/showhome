   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Generator V4.2.4 - 19 Dec 2007
3213                     	bsct
3214  0000               _SwitchInit:
3215  0000 01            	dc.b	1
3216  0001               _GroupOneOnHour:
3217  0001 ff            	dc.b	255
3218  0002               _GroupOneOnMinute:
3219  0002 ff            	dc.b	255
3220  0003               _GroupTwoOnHour:
3221  0003 ff            	dc.b	255
3222  0004               _GroupTwoOnMinute:
3223  0004 ff            	dc.b	255
3224  0005               _GroupThreeOnHour:
3225  0005 ff            	dc.b	255
3226  0006               _GroupThreeOnMinute:
3227  0006 ff            	dc.b	255
3228  0007               _GroupOneOffHour:
3229  0007 ff            	dc.b	255
3230  0008               _GroupOneOffMinute:
3231  0008 ff            	dc.b	255
3232  0009               _GroupTwoOffHour:
3233  0009 ff            	dc.b	255
3234  000a               _GroupTwoOffMinute:
3235  000a ff            	dc.b	255
3236  000b               _GroupThreeOffHour:
3237  000b ff            	dc.b	255
3238  000c               _GroupThreeOffMinute:
3239  000c ff            	dc.b	255
3240                     	switch	.ubsct
3241  0000               L3712_DutyCnt:
3242  0000 00            	ds.b	1
3292                     ; 76 void Led_Display(void)
3292                     ; 77 {
3294                     	switch	.text
3295  0000               _Led_Display:
3299                     ; 80     DutyCnt++;
3301  0000 3c00          	inc	L3712_DutyCnt
3302                     ; 81     if (DutyCnt > 99)
3304  0002 b600          	ld	a,L3712_DutyCnt
3305  0004 a164          	cp	a,#100
3306  0006 2502          	jrult	L1222
3307                     ; 83       DutyCnt = 0;
3309  0008 3f00          	clr	L3712_DutyCnt
3310  000a               L1222:
3311                     ; 87     if (DutyCnt < LedDuty)
3313  000a b600          	ld	a,L3712_DutyCnt
3314  000c b108          	cp	a,_LedDuty
3315  000e 2406          	jruge	L3222
3316                     ; 89       PORT_LED = LED_ON;
3318  0010 72175000      	bres	_PA_ODR_3
3320  0014 2004          	jra	L5222
3321  0016               L3222:
3322                     ; 93       PORT_LED = LED_OFF;
3324  0016 72165000      	bset	_PA_ODR_3
3325  001a               L5222:
3326                     ; 117 }
3329  001a 81            	ret
3357                     ; 122 @far @interrupt void Tim4_Update_Interrupt(void)
3357                     ; 123 {
3359                     	switch	.text
3360  001b               f_Tim4_Update_Interrupt:
3365                     ; 124   TIM4_SR &= (~0x01);
3367  001b 72115344      	bres	_TIM4_SR,#0
3368                     ; 126   SecondCnt1++;
3370  001f 3c07          	inc	_SecondCnt1
3371                     ; 127   if (SecondCnt1 > 99) //100ms
3373  0021 b607          	ld	a,_SecondCnt1
3374  0023 a164          	cp	a,#100
3375  0025 2510          	jrult	L7322
3376                     ; 129     SecondCnt1 = 0;
3378  0027 3f07          	clr	_SecondCnt1
3379                     ; 130     SecondCnt2++;
3381  0029 3c06          	inc	_SecondCnt2
3382                     ; 131     if (SecondCnt2 > 9)
3384  002b b606          	ld	a,_SecondCnt2
3385  002d a10a          	cp	a,#10
3386  002f 2506          	jrult	L7322
3387                     ; 133       SecondCnt2 = 0;
3389  0031 3f06          	clr	_SecondCnt2
3390                     ; 134       SecondFlag = TRUE;     // set SecondFlag every second
3392  0033 35010005      	mov	_SecondFlag,#1
3393  0037               L7322:
3394                     ; 137 }
3397  0037 80            	iret
3423                     ; 142 void Time_Caculate(void)
3423                     ; 143 {
3425                     	switch	.text
3426  0038               _Time_Caculate:
3430                     ; 144   if (SecondFlag)
3432  0038 3d05          	tnz	_SecondFlag
3433  003a 2720          	jreq	L3522
3434                     ; 147     SecondFlag = FALSE;
3436  003c 3f05          	clr	_SecondFlag
3437                     ; 150     RealSecond++;
3439  003e 3c03          	inc	_RealSecond
3440                     ; 153     if (RealSecond > 59)
3442  0040 b603          	ld	a,_RealSecond
3443  0042 a13c          	cp	a,#60
3444  0044 2516          	jrult	L3522
3445                     ; 156       RealSecond = 0;
3447  0046 3f03          	clr	_RealSecond
3448                     ; 159       RealMinute++;
3450  0048 3c02          	inc	_RealMinute
3451                     ; 162       if (RealMinute > 59)
3453  004a b602          	ld	a,_RealMinute
3454  004c a13c          	cp	a,#60
3455  004e 250c          	jrult	L3522
3456                     ; 165         RealMinute = 0;
3458  0050 3f02          	clr	_RealMinute
3459                     ; 168         RealHour++;
3461  0052 3c01          	inc	_RealHour
3462                     ; 171         if (RealHour > 23)
3464  0054 b601          	ld	a,_RealHour
3465  0056 a118          	cp	a,#24
3466  0058 2502          	jrult	L3522
3467                     ; 173           RealHour = 0;
3469  005a 3f01          	clr	_RealHour
3470  005c               L3522:
3471                     ; 178 }
3474  005c 81            	ret
3523                     ; 183 void Switch_On_Off(void)
3523                     ; 184 {
3524                     	switch	.text
3525  005d               _Switch_On_Off:
3529                     ; 185   Time_Caculate();
3531  005d add9          	call	_Time_Caculate
3533                     ; 189   if ( (GroupOneOffHour   == RealHour) && (GroupOneOffMinute   == RealMinute) )
3535  005f b607          	ld	a,_GroupOneOffHour
3536  0061 b101          	cp	a,_RealHour
3537  0063 2614          	jrne	L3722
3539  0065 b608          	ld	a,_GroupOneOffMinute
3540  0067 b102          	cp	a,_RealMinute
3541  0069 260e          	jrne	L3722
3542                     ; 192     SwitchStatus = 0x00;
3544  006b 3f04          	clr	_SwitchStatus
3545                     ; 193     SwitchInit   = TRUE;
3547  006d 35010000      	mov	_SwitchInit,#1
3548                     ; 196     GroupOneOffHour   = 0xff;
3550  0071 35ff0007      	mov	_GroupOneOffHour,#255
3551                     ; 197     GroupOneOffMinute = 0xff;
3553  0075 35ff0008      	mov	_GroupOneOffMinute,#255
3554  0079               L3722:
3555                     ; 200   if ( (GroupTwoOffHour   == RealHour) && (GroupTwoOffMinute   == RealMinute) )
3557  0079 b609          	ld	a,_GroupTwoOffHour
3558  007b b101          	cp	a,_RealHour
3559  007d 2614          	jrne	L5722
3561  007f b60a          	ld	a,_GroupTwoOffMinute
3562  0081 b102          	cp	a,_RealMinute
3563  0083 260e          	jrne	L5722
3564                     ; 203     SwitchStatus = 0x00;
3566  0085 3f04          	clr	_SwitchStatus
3567                     ; 204     SwitchInit   = TRUE;
3569  0087 35010000      	mov	_SwitchInit,#1
3570                     ; 207     GroupTwoOffHour   = 0xff;
3572  008b 35ff0009      	mov	_GroupTwoOffHour,#255
3573                     ; 208     GroupTwoOffMinute = 0xff;
3575  008f 35ff000a      	mov	_GroupTwoOffMinute,#255
3576  0093               L5722:
3577                     ; 211   if ( (GroupThreeOffHour == RealHour) && (GroupThreeOffMinute == RealMinute) ) 
3579  0093 b60b          	ld	a,_GroupThreeOffHour
3580  0095 b101          	cp	a,_RealHour
3581  0097 2614          	jrne	L7722
3583  0099 b60c          	ld	a,_GroupThreeOffMinute
3584  009b b102          	cp	a,_RealMinute
3585  009d 260e          	jrne	L7722
3586                     ; 214     SwitchStatus = 0x00;
3588  009f 3f04          	clr	_SwitchStatus
3589                     ; 215     SwitchInit   = TRUE;
3591  00a1 35010000      	mov	_SwitchInit,#1
3592                     ; 219     GroupThreeOffHour   = 0xff;
3594  00a5 35ff000b      	mov	_GroupThreeOffHour,#255
3595                     ; 220     GroupThreeOffMinute = 0xff;
3597  00a9 35ff000c      	mov	_GroupThreeOffMinute,#255
3598  00ad               L7722:
3599                     ; 224   if ( (GroupOneOnHour   == RealHour) && (GroupOneOnMinute   == RealMinute) )
3601  00ad b601          	ld	a,_GroupOneOnHour
3602  00af b101          	cp	a,_RealHour
3603  00b1 2616          	jrne	L1032
3605  00b3 b602          	ld	a,_GroupOneOnMinute
3606  00b5 b102          	cp	a,_RealMinute
3607  00b7 2610          	jrne	L1032
3608                     ; 227     SwitchStatus = 0x01;
3610  00b9 35010004      	mov	_SwitchStatus,#1
3611                     ; 228     SwitchInit   = TRUE;
3613  00bd 35010000      	mov	_SwitchInit,#1
3614                     ; 231     GroupOneOnHour   = 0xff;
3616  00c1 35ff0001      	mov	_GroupOneOnHour,#255
3617                     ; 232     GroupOneOnMinute = 0xff;
3619  00c5 35ff0002      	mov	_GroupOneOnMinute,#255
3620  00c9               L1032:
3621                     ; 235   if ( (GroupTwoOnHour   == RealHour) && (GroupTwoOnMinute   == RealMinute) )
3623  00c9 b603          	ld	a,_GroupTwoOnHour
3624  00cb b101          	cp	a,_RealHour
3625  00cd 2616          	jrne	L3032
3627  00cf b604          	ld	a,_GroupTwoOnMinute
3628  00d1 b102          	cp	a,_RealMinute
3629  00d3 2610          	jrne	L3032
3630                     ; 238     SwitchStatus = 0x01;
3632  00d5 35010004      	mov	_SwitchStatus,#1
3633                     ; 239     SwitchInit   = TRUE;
3635  00d9 35010000      	mov	_SwitchInit,#1
3636                     ; 242     GroupTwoOnHour   = 0xff;
3638  00dd 35ff0003      	mov	_GroupTwoOnHour,#255
3639                     ; 243     GroupTwoOnMinute = 0xff;
3641  00e1 35ff0004      	mov	_GroupTwoOnMinute,#255
3642  00e5               L3032:
3643                     ; 246   if ( (GroupThreeOnHour == RealHour) && (GroupThreeOnMinute == RealMinute) ) 
3645  00e5 b605          	ld	a,_GroupThreeOnHour
3646  00e7 b101          	cp	a,_RealHour
3647  00e9 2616          	jrne	L5032
3649  00eb b606          	ld	a,_GroupThreeOnMinute
3650  00ed b102          	cp	a,_RealMinute
3651  00ef 2610          	jrne	L5032
3652                     ; 249     SwitchStatus = 0x01;
3654  00f1 35010004      	mov	_SwitchStatus,#1
3655                     ; 250     SwitchInit   = TRUE;
3657  00f5 35010000      	mov	_SwitchInit,#1
3658                     ; 253     GroupThreeOnHour   = 0xff;
3660  00f9 35ff0005      	mov	_GroupThreeOnHour,#255
3661                     ; 254     GroupThreeOnMinute = 0xff;
3663  00fd 35ff0006      	mov	_GroupThreeOnMinute,#255
3664  0101               L5032:
3665                     ; 261   if (SwitchInit == TRUE)
3667  0101 b600          	ld	a,_SwitchInit
3668  0103 a101          	cp	a,#1
3669  0105 2633          	jrne	L7032
3670                     ; 264     SwitchInit = FALSE;
3672  0107 3f00          	clr	_SwitchInit
3673                     ; 268     if (AppControlFlag == TRUE)
3675  0109 b600          	ld	a,_AppControlFlag
3676  010b a101          	cp	a,#1
3677  010d 2604          	jrne	L1132
3678                     ; 270       AppControlFlag = FALSE;			// when switch status is changed by the APP,do not reply
3680  010f 3f00          	clr	_AppControlFlag
3682  0111 2011          	jra	L3132
3683  0113               L1132:
3684                     ; 274       RepeatCnt = 0;
3686  0113 3f00          	clr	_RepeatCnt
3687                     ; 275       RepeatDelayTime = 0;
3689  0115 3f00          	clr	_RepeatDelayTime
3690                     ; 276       ReplyRepeatFlag     = FALSE;
3692  0117 3f00          	clr	_ReplyRepeatFlag
3693                     ; 278       StatusReplyFlag = TRUE;
3695  0119 35010000      	mov	_StatusReplyFlag,#1
3696                     ; 279       StatusReplyCommand   = 0x02;
3698  011d 35020000      	mov	_StatusReplyCommand,#2
3699                     ; 281 	  ReplyStatus = SwitchStatus;
3701  0121 450400        	mov	_ReplyStatus,_SwitchStatus
3702  0124               L3132:
3703                     ; 284     if (SwitchStatus == 0x01) // switch on
3705  0124 b604          	ld	a,_SwitchStatus
3706  0126 a101          	cp	a,#1
3707  0128 260a          	jrne	L5132
3708                     ; 293 		LedDuty    =  DUTY_MAX;
3710  012a 35640008      	mov	_LedDuty,#100
3711                     ; 294 		PORT_RELAY = 1;
3713  012e 7218500f      	bset	_PD_ODR_4
3715  0132 2006          	jra	L7032
3716  0134               L5132:
3717                     ; 306 		LedDuty     = DUTY_MIN;
3719  0134 3f08          	clr	_LedDuty
3720                     ; 307 		PORT_RELAY  = 0;
3722  0136 7219500f      	bres	_PD_ODR_4
3723  013a               L7032:
3724                     ; 310 }
3727  013a 81            	ret
3954                     	xdef	_Switch_On_Off
3955                     	xdef	_Time_Caculate
3956                     	xdef	f_Tim4_Update_Interrupt
3957                     	xdef	_Led_Display
3958                     	xdef	_GroupThreeOffMinute
3959                     	xdef	_GroupThreeOffHour
3960                     	xdef	_GroupTwoOffMinute
3961                     	xdef	_GroupTwoOffHour
3962                     	xdef	_GroupOneOffMinute
3963                     	xdef	_GroupOneOffHour
3964                     	xdef	_GroupThreeOnMinute
3965                     	xdef	_GroupThreeOnHour
3966                     	xdef	_GroupTwoOnMinute
3967                     	xdef	_GroupTwoOnHour
3968                     	xdef	_GroupOneOnMinute
3969                     	xdef	_GroupOneOnHour
3970                     	switch	.ubsct
3971  0001               _RealHour:
3972  0001 00            	ds.b	1
3973                     	xdef	_RealHour
3974  0002               _RealMinute:
3975  0002 00            	ds.b	1
3976                     	xdef	_RealMinute
3977  0003               _RealSecond:
3978  0003 00            	ds.b	1
3979                     	xdef	_RealSecond
3980                     	xdef	_SwitchInit
3981  0004               _SwitchStatus:
3982  0004 00            	ds.b	1
3983                     	xdef	_SwitchStatus
3984  0005               _SecondFlag:
3985  0005 00            	ds.b	1
3986                     	xdef	_SecondFlag
3987  0006               _SecondCnt2:
3988  0006 00            	ds.b	1
3989                     	xdef	_SecondCnt2
3990  0007               _SecondCnt1:
3991  0007 00            	ds.b	1
3992                     	xdef	_SecondCnt1
3993  0008               _LedDuty:
3994  0008 00            	ds.b	1
3995                     	xdef	_LedDuty
3996                     	xref.b	_ReplyStatus
3997                     	xref.b	_AppControlFlag
3998                     	xref.b	_RepeatDelayTime
3999                     	xref.b	_RepeatCnt
4000                     	xref.b	_StatusReplyCommand
4001                     	xref.b	_ReplyRepeatFlag
4002                     	xref.b	_StatusReplyFlag
4022                     	end
