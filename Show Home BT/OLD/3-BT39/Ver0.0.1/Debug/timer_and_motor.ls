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
3292                     ; 56 void Led_Display(void)
3292                     ; 57 {
3294                     	switch	.text
3295  0000               _Led_Display:
3299                     ; 60     DutyCnt++;
3301  0000 3c00          	inc	L3712_DutyCnt
3302                     ; 61     if (DutyCnt > 99)
3304  0002 b600          	ld	a,L3712_DutyCnt
3305  0004 a164          	cp	a,#100
3306  0006 2502          	jrult	L1222
3307                     ; 63       DutyCnt = 0;
3309  0008 3f00          	clr	L3712_DutyCnt
3310  000a               L1222:
3311                     ; 67     if (DutyCnt < RedDuty)
3313  000a b600          	ld	a,L3712_DutyCnt
3314  000c b108          	cp	a,_RedDuty
3315  000e 2406          	jruge	L3222
3316                     ; 69       PORT_RED = LED_ON;
3318  0010 721e500a      	bset	_PC_ODR_7
3320  0014 2004          	jra	L5222
3321  0016               L3222:
3322                     ; 73       PORT_RED = LED_OFF;
3324  0016 721f500a      	bres	_PC_ODR_7
3325  001a               L5222:
3326                     ; 76 }
3329  001a 81            	ret
3357                     ; 81 @far @interrupt void Tim4_Update_Interrupt(void)
3357                     ; 82 {
3359                     	switch	.text
3360  001b               f_Tim4_Update_Interrupt:
3365                     ; 83   TIM4_SR &= (~0x01);
3367  001b 72115344      	bres	_TIM4_SR,#0
3368                     ; 85   SecondCnt1++;
3370  001f 3c07          	inc	_SecondCnt1
3371                     ; 86   if (SecondCnt1 > 99) //100ms
3373  0021 b607          	ld	a,_SecondCnt1
3374  0023 a164          	cp	a,#100
3375  0025 2510          	jrult	L7322
3376                     ; 88     SecondCnt1 = 0;
3378  0027 3f07          	clr	_SecondCnt1
3379                     ; 89     SecondCnt2++;
3381  0029 3c06          	inc	_SecondCnt2
3382                     ; 90     if (SecondCnt2 > 9)
3384  002b b606          	ld	a,_SecondCnt2
3385  002d a10a          	cp	a,#10
3386  002f 2506          	jrult	L7322
3387                     ; 92       SecondCnt2 = 0;
3389  0031 3f06          	clr	_SecondCnt2
3390                     ; 93       SecondFlag = TRUE;     // set SecondFlag every second
3392  0033 35010005      	mov	_SecondFlag,#1
3393  0037               L7322:
3394                     ; 96 }
3397  0037 80            	iret
3423                     ; 101 void Time_Caculate(void)
3423                     ; 102 {
3425                     	switch	.text
3426  0038               _Time_Caculate:
3430                     ; 103   if (SecondFlag)
3432  0038 3d05          	tnz	_SecondFlag
3433  003a 2720          	jreq	L3522
3434                     ; 106     SecondFlag = FALSE;
3436  003c 3f05          	clr	_SecondFlag
3437                     ; 109     RealSecond++;
3439  003e 3c03          	inc	_RealSecond
3440                     ; 112     if (RealSecond > 59)
3442  0040 b603          	ld	a,_RealSecond
3443  0042 a13c          	cp	a,#60
3444  0044 2516          	jrult	L3522
3445                     ; 115       RealSecond = 0;
3447  0046 3f03          	clr	_RealSecond
3448                     ; 118       RealMinute++;
3450  0048 3c02          	inc	_RealMinute
3451                     ; 121       if (RealMinute > 59)
3453  004a b602          	ld	a,_RealMinute
3454  004c a13c          	cp	a,#60
3455  004e 250c          	jrult	L3522
3456                     ; 124         RealMinute = 0;
3458  0050 3f02          	clr	_RealMinute
3459                     ; 127         RealHour++;
3461  0052 3c01          	inc	_RealHour
3462                     ; 130         if (RealHour > 23)
3464  0054 b601          	ld	a,_RealHour
3465  0056 a118          	cp	a,#24
3466  0058 2502          	jrult	L3522
3467                     ; 132           RealHour = 0;
3469  005a 3f01          	clr	_RealHour
3470  005c               L3522:
3471                     ; 137 }
3474  005c 81            	ret
3522                     ; 142 void Switch_On_Off(void)
3522                     ; 143 {
3523                     	switch	.text
3524  005d               _Switch_On_Off:
3528                     ; 144   Time_Caculate();
3530  005d add9          	call	_Time_Caculate
3532                     ; 148   if ( (GroupOneOffHour   == RealHour) && (GroupOneOffMinute   == RealMinute) )
3534  005f b607          	ld	a,_GroupOneOffHour
3535  0061 b101          	cp	a,_RealHour
3536  0063 2614          	jrne	L3722
3538  0065 b608          	ld	a,_GroupOneOffMinute
3539  0067 b102          	cp	a,_RealMinute
3540  0069 260e          	jrne	L3722
3541                     ; 151     SwitchStatus = 0x00;
3543  006b 3f04          	clr	_SwitchStatus
3544                     ; 152     SwitchInit   = TRUE;
3546  006d 35010000      	mov	_SwitchInit,#1
3547                     ; 155     GroupOneOffHour   = 0xff;
3549  0071 35ff0007      	mov	_GroupOneOffHour,#255
3550                     ; 156     GroupOneOffMinute = 0xff;
3552  0075 35ff0008      	mov	_GroupOneOffMinute,#255
3553  0079               L3722:
3554                     ; 159   if ( (GroupTwoOffHour   == RealHour) && (GroupTwoOffMinute   == RealMinute) )
3556  0079 b609          	ld	a,_GroupTwoOffHour
3557  007b b101          	cp	a,_RealHour
3558  007d 2614          	jrne	L5722
3560  007f b60a          	ld	a,_GroupTwoOffMinute
3561  0081 b102          	cp	a,_RealMinute
3562  0083 260e          	jrne	L5722
3563                     ; 162     SwitchStatus = 0x00;
3565  0085 3f04          	clr	_SwitchStatus
3566                     ; 163     SwitchInit   = TRUE;
3568  0087 35010000      	mov	_SwitchInit,#1
3569                     ; 166     GroupTwoOffHour   = 0xff;
3571  008b 35ff0009      	mov	_GroupTwoOffHour,#255
3572                     ; 167     GroupTwoOffMinute = 0xff;
3574  008f 35ff000a      	mov	_GroupTwoOffMinute,#255
3575  0093               L5722:
3576                     ; 170   if ( (GroupThreeOffHour == RealHour) && (GroupThreeOffMinute == RealMinute) ) 
3578  0093 b60b          	ld	a,_GroupThreeOffHour
3579  0095 b101          	cp	a,_RealHour
3580  0097 2614          	jrne	L7722
3582  0099 b60c          	ld	a,_GroupThreeOffMinute
3583  009b b102          	cp	a,_RealMinute
3584  009d 260e          	jrne	L7722
3585                     ; 173     SwitchStatus = 0x00;
3587  009f 3f04          	clr	_SwitchStatus
3588                     ; 174     SwitchInit   = TRUE;
3590  00a1 35010000      	mov	_SwitchInit,#1
3591                     ; 178     GroupThreeOffHour   = 0xff;
3593  00a5 35ff000b      	mov	_GroupThreeOffHour,#255
3594                     ; 179     GroupThreeOffMinute = 0xff;
3596  00a9 35ff000c      	mov	_GroupThreeOffMinute,#255
3597  00ad               L7722:
3598                     ; 183   if ( (GroupOneOnHour   == RealHour) && (GroupOneOnMinute   == RealMinute) )
3600  00ad b601          	ld	a,_GroupOneOnHour
3601  00af b101          	cp	a,_RealHour
3602  00b1 2616          	jrne	L1032
3604  00b3 b602          	ld	a,_GroupOneOnMinute
3605  00b5 b102          	cp	a,_RealMinute
3606  00b7 2610          	jrne	L1032
3607                     ; 186     SwitchStatus = 0x01;
3609  00b9 35010004      	mov	_SwitchStatus,#1
3610                     ; 187     SwitchInit   = TRUE;
3612  00bd 35010000      	mov	_SwitchInit,#1
3613                     ; 190     GroupOneOnHour   = 0xff;
3615  00c1 35ff0001      	mov	_GroupOneOnHour,#255
3616                     ; 191     GroupOneOnMinute = 0xff;
3618  00c5 35ff0002      	mov	_GroupOneOnMinute,#255
3619  00c9               L1032:
3620                     ; 194   if ( (GroupTwoOnHour   == RealHour) && (GroupTwoOnMinute   == RealMinute) )
3622  00c9 b603          	ld	a,_GroupTwoOnHour
3623  00cb b101          	cp	a,_RealHour
3624  00cd 2616          	jrne	L3032
3626  00cf b604          	ld	a,_GroupTwoOnMinute
3627  00d1 b102          	cp	a,_RealMinute
3628  00d3 2610          	jrne	L3032
3629                     ; 197     SwitchStatus = 0x01;
3631  00d5 35010004      	mov	_SwitchStatus,#1
3632                     ; 198     SwitchInit   = TRUE;
3634  00d9 35010000      	mov	_SwitchInit,#1
3635                     ; 201     GroupTwoOnHour   = 0xff;
3637  00dd 35ff0003      	mov	_GroupTwoOnHour,#255
3638                     ; 202     GroupTwoOnMinute = 0xff;
3640  00e1 35ff0004      	mov	_GroupTwoOnMinute,#255
3641  00e5               L3032:
3642                     ; 205   if ( (GroupThreeOnHour == RealHour) && (GroupThreeOnMinute == RealMinute) ) 
3644  00e5 b605          	ld	a,_GroupThreeOnHour
3645  00e7 b101          	cp	a,_RealHour
3646  00e9 2616          	jrne	L5032
3648  00eb b606          	ld	a,_GroupThreeOnMinute
3649  00ed b102          	cp	a,_RealMinute
3650  00ef 2610          	jrne	L5032
3651                     ; 208     SwitchStatus = 0x01;
3653  00f1 35010004      	mov	_SwitchStatus,#1
3654                     ; 209     SwitchInit   = TRUE;
3656  00f5 35010000      	mov	_SwitchInit,#1
3657                     ; 212     GroupThreeOnHour   = 0xff;
3659  00f9 35ff0005      	mov	_GroupThreeOnHour,#255
3660                     ; 213     GroupThreeOnMinute = 0xff;
3662  00fd 35ff0006      	mov	_GroupThreeOnMinute,#255
3663  0101               L5032:
3664                     ; 220   if (SwitchInit == TRUE)
3666  0101 b600          	ld	a,_SwitchInit
3667  0103 a101          	cp	a,#1
3668  0105 2630          	jrne	L7032
3669                     ; 223     SwitchInit = FALSE;
3671  0107 3f00          	clr	_SwitchInit
3672                     ; 226     if (AppControlFlag == TRUE)
3674  0109 b600          	ld	a,_AppControlFlag
3675  010b a101          	cp	a,#1
3676  010d 2604          	jrne	L1132
3677                     ; 228       AppControlFlag = FALSE;
3679  010f 3f00          	clr	_AppControlFlag
3681  0111 200e          	jra	L3132
3682  0113               L1132:
3683                     ; 232       RepeatCnt = 0;
3685  0113 3f00          	clr	_RepeatCnt
3686                     ; 233       RepeatDelayTime = 0;
3688  0115 3f00          	clr	_RepeatDelayTime
3689                     ; 234       ReplyRepeatFlag     = FALSE;
3691  0117 3f00          	clr	_ReplyRepeatFlag
3692                     ; 236       StatusReplyFlag = TRUE;
3694  0119 35010000      	mov	_StatusReplyFlag,#1
3695                     ; 237       StatusReplyCommand   = 0x02;
3697  011d 35020000      	mov	_StatusReplyCommand,#2
3698  0121               L3132:
3699                     ; 240     if (SwitchStatus == 0x01) // switch on
3701  0121 b604          	ld	a,_SwitchStatus
3702  0123 a101          	cp	a,#1
3703  0125 260a          	jrne	L5132
3704                     ; 242       RedDuty    = 100;
3706  0127 35640008      	mov	_RedDuty,#100
3707                     ; 243       PORT_RELAY = 1;
3709  012b 7214500f      	bset	_PD_ODR_2
3711  012f 2006          	jra	L7032
3712  0131               L5132:
3713                     ; 248       RedDuty     = 0;
3715  0131 3f08          	clr	_RedDuty
3716                     ; 249       PORT_RELAY  = 0;
3718  0133 7215500f      	bres	_PD_ODR_2
3719  0137               L7032:
3720                     ; 252 }
3723  0137 81            	ret
3950                     	xdef	_Switch_On_Off
3951                     	xdef	_Time_Caculate
3952                     	xdef	f_Tim4_Update_Interrupt
3953                     	xdef	_Led_Display
3954                     	xdef	_GroupThreeOffMinute
3955                     	xdef	_GroupThreeOffHour
3956                     	xdef	_GroupTwoOffMinute
3957                     	xdef	_GroupTwoOffHour
3958                     	xdef	_GroupOneOffMinute
3959                     	xdef	_GroupOneOffHour
3960                     	xdef	_GroupThreeOnMinute
3961                     	xdef	_GroupThreeOnHour
3962                     	xdef	_GroupTwoOnMinute
3963                     	xdef	_GroupTwoOnHour
3964                     	xdef	_GroupOneOnMinute
3965                     	xdef	_GroupOneOnHour
3966                     	switch	.ubsct
3967  0001               _RealHour:
3968  0001 00            	ds.b	1
3969                     	xdef	_RealHour
3970  0002               _RealMinute:
3971  0002 00            	ds.b	1
3972                     	xdef	_RealMinute
3973  0003               _RealSecond:
3974  0003 00            	ds.b	1
3975                     	xdef	_RealSecond
3976                     	xdef	_SwitchInit
3977  0004               _SwitchStatus:
3978  0004 00            	ds.b	1
3979                     	xdef	_SwitchStatus
3980  0005               _SecondFlag:
3981  0005 00            	ds.b	1
3982                     	xdef	_SecondFlag
3983  0006               _SecondCnt2:
3984  0006 00            	ds.b	1
3985                     	xdef	_SecondCnt2
3986  0007               _SecondCnt1:
3987  0007 00            	ds.b	1
3988                     	xdef	_SecondCnt1
3989  0008               _RedDuty:
3990  0008 00            	ds.b	1
3991                     	xdef	_RedDuty
3992                     	xref.b	_AppControlFlag
3993                     	xref.b	_RepeatDelayTime
3994                     	xref.b	_RepeatCnt
3995                     	xref.b	_StatusReplyCommand
3996                     	xref.b	_ReplyRepeatFlag
3997                     	xref.b	_StatusReplyFlag
4017                     	end
