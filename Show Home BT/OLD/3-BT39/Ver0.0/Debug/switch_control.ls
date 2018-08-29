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
3292                     ; 65 void Led_Display(void)
3292                     ; 66 {
3294                     	switch	.text
3295  0000               _Led_Display:
3299                     ; 69     DutyCnt++;
3301  0000 3c00          	inc	L3712_DutyCnt
3302                     ; 70     if (DutyCnt > 99)
3304  0002 b600          	ld	a,L3712_DutyCnt
3305  0004 a164          	cp	a,#100
3306  0006 2502          	jrult	L1222
3307                     ; 72       DutyCnt = 0;
3309  0008 3f00          	clr	L3712_DutyCnt
3310  000a               L1222:
3311                     ; 76     if (DutyCnt < LedDuty)
3313  000a b600          	ld	a,L3712_DutyCnt
3314  000c b109          	cp	a,_LedDuty
3315  000e 2406          	jruge	L3222
3316                     ; 78       PORT_LED = LED_ON;
3318  0010 72175000      	bres	_PA_ODR_3
3320  0014 2004          	jra	L5222
3321  0016               L3222:
3322                     ; 82       PORT_LED = LED_OFF;
3324  0016 72165000      	bset	_PA_ODR_3
3325  001a               L5222:
3326                     ; 84 }
3329  001a 81            	ret
3354                     ; 89 @far @interrupt void Zero_Detect_Interrupt(void)
3354                     ; 90 {
3356                     	switch	.text
3357  001b               f_Zero_Detect_Interrupt:
3362                     ; 92 	ZeroDetectFlag = TRUE;
3364  001b 3501000e      	mov	_ZeroDetectFlag,#1
3365                     ; 93 	return;
3368  001f 80            	iret
3370                     	switch	.ubsct
3371  0001               L7322_DimmerDutyCnt:
3372  0001 00            	ds.b	1
3413                     ; 99 @far @interrupt void Tim4_Update_Interrupt(void)
3413                     ; 100 {
3414                     	switch	.text
3415  0020               f_Tim4_Update_Interrupt:
3418       00000002      OFST:	set	2
3419  0020 89            	pushw	x
3422                     ; 104 	TIM4_SR =0x00;
3424  0021 725f5344      	clr	_TIM4_SR
3425                     ; 109 	DimmerDutyCnt++;
3427  0025 3c01          	inc	L7322_DimmerDutyCnt
3428                     ; 110 	if (ZeroDetectFlag == TRUE)
3430  0027 b60e          	ld	a,_ZeroDetectFlag
3431  0029 a101          	cp	a,#1
3432  002b 2607          	jrne	L7522
3433                     ; 112 		ZeroDetectFlag = FALSE;
3435  002d 3f0e          	clr	_ZeroDetectFlag
3436                     ; 113 		DimmerMax = DimmerDutyCnt;
3438  002f 45010b        	mov	_DimmerMax,L7322_DimmerDutyCnt
3439                     ; 114 		DimmerDutyCnt = 0;
3441  0032 3f01          	clr	L7322_DimmerDutyCnt
3442  0034               L7522:
3443                     ; 117 	if (DimmerDutyCnt == (115 - DimmerDuty) )
3445  0034 b601          	ld	a,L7322_DimmerDutyCnt
3446  0036 5f            	clrw	x
3447  0037 97            	ld	xl,a
3448  0038 1f01          	ldw	(OFST-1,sp),x
3449  003a a600          	ld	a,#0
3450  003c 97            	ld	xl,a
3451  003d a673          	ld	a,#115
3452  003f b00d          	sub	a,_DimmerDuty
3453  0041 2401          	jrnc	L21
3454  0043 5a            	decw	x
3455  0044               L21:
3456  0044 02            	rlwa	x,a
3457  0045 1301          	cpw	x,(OFST-1,sp)
3458  0047 2604          	jrne	L1622
3459                     ; 119 		PORT_RELAY = 1;
3461  0049 7218500f      	bset	_PD_ODR_4
3462  004d               L1622:
3463                     ; 121 	if (DimmerDutyCnt > 114 )
3465  004d b601          	ld	a,L7322_DimmerDutyCnt
3466  004f a173          	cp	a,#115
3467  0051 2504          	jrult	L3622
3468                     ; 123 		PORT_RELAY = 0;
3470  0053 7219500f      	bres	_PD_ODR_4
3471  0057               L3622:
3472                     ; 129 	SecondCnt1++;
3474  0057 3c08          	inc	_SecondCnt1
3475                     ; 130 	if (SecondCnt1 > 124) //8ms
3477  0059 b608          	ld	a,_SecondCnt1
3478  005b a17d          	cp	a,#125
3479  005d 2510          	jrult	L5622
3480                     ; 132 		SecondCnt1 = 0;
3482  005f 3f08          	clr	_SecondCnt1
3483                     ; 133 		SecondCnt2++;
3485  0061 3c07          	inc	_SecondCnt2
3486                     ; 134 		if (SecondCnt2 > 124) // 1s
3488  0063 b607          	ld	a,_SecondCnt2
3489  0065 a17d          	cp	a,#125
3490  0067 2506          	jrult	L5622
3491                     ; 136 			SecondCnt2 = 0;
3493  0069 3f07          	clr	_SecondCnt2
3494                     ; 137 			SecondFlag = TRUE;     // set SecondFlag every second
3496  006b 35010006      	mov	_SecondFlag,#1
3497  006f               L5622:
3498                     ; 140 }
3501  006f 5b02          	addw	sp,#2
3502  0071 80            	iret
3528                     ; 145 void Time_Caculate(void)
3528                     ; 146 {
3530                     	switch	.text
3531  0072               _Time_Caculate:
3535                     ; 147   if (SecondFlag)
3537  0072 3d06          	tnz	_SecondFlag
3538  0074 2720          	jreq	L1032
3539                     ; 150     SecondFlag = FALSE;
3541  0076 3f06          	clr	_SecondFlag
3542                     ; 153     RealSecond++;
3544  0078 3c04          	inc	_RealSecond
3545                     ; 156     if (RealSecond > 59)
3547  007a b604          	ld	a,_RealSecond
3548  007c a13c          	cp	a,#60
3549  007e 2516          	jrult	L1032
3550                     ; 159       RealSecond = 0;
3552  0080 3f04          	clr	_RealSecond
3553                     ; 162       RealMinute++;
3555  0082 3c03          	inc	_RealMinute
3556                     ; 165       if (RealMinute > 59)
3558  0084 b603          	ld	a,_RealMinute
3559  0086 a13c          	cp	a,#60
3560  0088 250c          	jrult	L1032
3561                     ; 168         RealMinute = 0;
3563  008a 3f03          	clr	_RealMinute
3564                     ; 171         RealHour++;
3566  008c 3c02          	inc	_RealHour
3567                     ; 174         if (RealHour > 23)
3569  008e b602          	ld	a,_RealHour
3570  0090 a118          	cp	a,#24
3571  0092 2502          	jrult	L1032
3572                     ; 176           RealHour = 0;
3574  0094 3f02          	clr	_RealHour
3575  0096               L1032:
3576                     ; 181 }
3579  0096 81            	ret
3630                     ; 186 void Switch_On_Off(void)
3630                     ; 187 {
3631                     	switch	.text
3632  0097               _Switch_On_Off:
3636                     ; 188   Time_Caculate();
3638  0097 add9          	call	_Time_Caculate
3640                     ; 194   if ( (GroupOneOffHour   == RealHour) && (GroupOneOffMinute   == RealMinute) )
3642  0099 b607          	ld	a,_GroupOneOffHour
3643  009b b102          	cp	a,_RealHour
3644  009d 2614          	jrne	L1232
3646  009f b608          	ld	a,_GroupOneOffMinute
3647  00a1 b103          	cp	a,_RealMinute
3648  00a3 260e          	jrne	L1232
3649                     ; 197     SwitchStatus = 0x00;
3651  00a5 3f05          	clr	_SwitchStatus
3652                     ; 198     SwitchInit   = TRUE;
3654  00a7 35010000      	mov	_SwitchInit,#1
3655                     ; 201     GroupOneOffHour   = 0xff;
3657  00ab 35ff0007      	mov	_GroupOneOffHour,#255
3658                     ; 202     GroupOneOffMinute = 0xff;
3660  00af 35ff0008      	mov	_GroupOneOffMinute,#255
3661  00b3               L1232:
3662                     ; 205   if ( (GroupTwoOffHour   == RealHour) && (GroupTwoOffMinute   == RealMinute) )
3664  00b3 b609          	ld	a,_GroupTwoOffHour
3665  00b5 b102          	cp	a,_RealHour
3666  00b7 2614          	jrne	L3232
3668  00b9 b60a          	ld	a,_GroupTwoOffMinute
3669  00bb b103          	cp	a,_RealMinute
3670  00bd 260e          	jrne	L3232
3671                     ; 208     SwitchStatus = 0x00;
3673  00bf 3f05          	clr	_SwitchStatus
3674                     ; 209     SwitchInit   = TRUE;
3676  00c1 35010000      	mov	_SwitchInit,#1
3677                     ; 212     GroupTwoOffHour   = 0xff;
3679  00c5 35ff0009      	mov	_GroupTwoOffHour,#255
3680                     ; 213     GroupTwoOffMinute = 0xff;
3682  00c9 35ff000a      	mov	_GroupTwoOffMinute,#255
3683  00cd               L3232:
3684                     ; 216   if ( (GroupThreeOffHour == RealHour) && (GroupThreeOffMinute == RealMinute) ) 
3686  00cd b60b          	ld	a,_GroupThreeOffHour
3687  00cf b102          	cp	a,_RealHour
3688  00d1 2614          	jrne	L5232
3690  00d3 b60c          	ld	a,_GroupThreeOffMinute
3691  00d5 b103          	cp	a,_RealMinute
3692  00d7 260e          	jrne	L5232
3693                     ; 219     SwitchStatus = 0x00;
3695  00d9 3f05          	clr	_SwitchStatus
3696                     ; 220     SwitchInit   = TRUE;
3698  00db 35010000      	mov	_SwitchInit,#1
3699                     ; 224     GroupThreeOffHour   = 0xff;
3701  00df 35ff000b      	mov	_GroupThreeOffHour,#255
3702                     ; 225     GroupThreeOffMinute = 0xff;
3704  00e3 35ff000c      	mov	_GroupThreeOffMinute,#255
3705  00e7               L5232:
3706                     ; 229   if ( (GroupOneOnHour   == RealHour) && (GroupOneOnMinute   == RealMinute) )
3708  00e7 b601          	ld	a,_GroupOneOnHour
3709  00e9 b102          	cp	a,_RealHour
3710  00eb 2616          	jrne	L7232
3712  00ed b602          	ld	a,_GroupOneOnMinute
3713  00ef b103          	cp	a,_RealMinute
3714  00f1 2610          	jrne	L7232
3715                     ; 232     SwitchStatus = 0x01;
3717  00f3 35010005      	mov	_SwitchStatus,#1
3718                     ; 233     SwitchInit   = TRUE;
3720  00f7 35010000      	mov	_SwitchInit,#1
3721                     ; 236     GroupOneOnHour   = 0xff;
3723  00fb 35ff0001      	mov	_GroupOneOnHour,#255
3724                     ; 237     GroupOneOnMinute = 0xff;
3726  00ff 35ff0002      	mov	_GroupOneOnMinute,#255
3727  0103               L7232:
3728                     ; 240   if ( (GroupTwoOnHour   == RealHour) && (GroupTwoOnMinute   == RealMinute) )
3730  0103 b603          	ld	a,_GroupTwoOnHour
3731  0105 b102          	cp	a,_RealHour
3732  0107 2616          	jrne	L1332
3734  0109 b604          	ld	a,_GroupTwoOnMinute
3735  010b b103          	cp	a,_RealMinute
3736  010d 2610          	jrne	L1332
3737                     ; 243     SwitchStatus = 0x01;
3739  010f 35010005      	mov	_SwitchStatus,#1
3740                     ; 244     SwitchInit   = TRUE;
3742  0113 35010000      	mov	_SwitchInit,#1
3743                     ; 247     GroupTwoOnHour   = 0xff;
3745  0117 35ff0003      	mov	_GroupTwoOnHour,#255
3746                     ; 248     GroupTwoOnMinute = 0xff;
3748  011b 35ff0004      	mov	_GroupTwoOnMinute,#255
3749  011f               L1332:
3750                     ; 251   if ( (GroupThreeOnHour == RealHour) && (GroupThreeOnMinute == RealMinute) ) 
3752  011f b605          	ld	a,_GroupThreeOnHour
3753  0121 b102          	cp	a,_RealHour
3754  0123 2616          	jrne	L3332
3756  0125 b606          	ld	a,_GroupThreeOnMinute
3757  0127 b103          	cp	a,_RealMinute
3758  0129 2610          	jrne	L3332
3759                     ; 254     SwitchStatus = 0x01;
3761  012b 35010005      	mov	_SwitchStatus,#1
3762                     ; 255     SwitchInit   = TRUE;
3764  012f 35010000      	mov	_SwitchInit,#1
3765                     ; 258     GroupThreeOnHour   = 0xff;
3767  0133 35ff0005      	mov	_GroupThreeOnHour,#255
3768                     ; 259     GroupThreeOnMinute = 0xff;
3770  0137 35ff0006      	mov	_GroupThreeOnMinute,#255
3771  013b               L3332:
3772                     ; 266   if (SwitchInit == TRUE)
3774  013b b600          	ld	a,_SwitchInit
3775  013d a101          	cp	a,#1
3776  013f 264e          	jrne	L5332
3777                     ; 269     SwitchInit = FALSE;
3779  0141 3f00          	clr	_SwitchInit
3780                     ; 273     if (AppControlFlag == TRUE)
3782  0143 b600          	ld	a,_AppControlFlag
3783  0145 a101          	cp	a,#1
3784  0147 2604          	jrne	L7332
3785                     ; 275       AppControlFlag = FALSE;			// when switch status is changed by the APP,do not reply
3787  0149 3f00          	clr	_AppControlFlag
3789  014b 2011          	jra	L1432
3790  014d               L7332:
3791                     ; 279       RepeatCnt = 0;
3793  014d 3f00          	clr	_RepeatCnt
3794                     ; 280       RepeatDelayTime = 0;
3796  014f 3f00          	clr	_RepeatDelayTime
3797                     ; 281       ReplyRepeatFlag     = FALSE;
3799  0151 3f00          	clr	_ReplyRepeatFlag
3800                     ; 283       StatusReplyFlag = TRUE;
3802  0153 35010000      	mov	_StatusReplyFlag,#1
3803                     ; 284       StatusReplyCommand   = 0x02;
3805  0157 35020000      	mov	_StatusReplyCommand,#2
3806                     ; 286 	  ReplyStatus = SwitchStatus;
3808  015b 450500        	mov	_ReplyStatus,_SwitchStatus
3809  015e               L1432:
3810                     ; 289     if (SwitchStatus == 0x01) // switch on
3812  015e b605          	ld	a,_SwitchStatus
3813  0160 a101          	cp	a,#1
3814  0162 2627          	jrne	L3432
3815                     ; 291 		LedDuty    =  100;
3817  0164 35640009      	mov	_LedDuty,#100
3818                     ; 294 		if (DimmerBySwitchFlag == TRUE)
3820  0168 b60a          	ld	a,_DimmerBySwitchFlag
3821  016a a101          	cp	a,#1
3822  016c 260c          	jrne	L5432
3823                     ; 296 			DimmerBySwitchFlag 	= FALSE;
3825  016e 3f0a          	clr	_DimmerBySwitchFlag
3826                     ; 297 			DimmerDuty 				 	= 100;
3828  0170 3564000d      	mov	_DimmerDuty,#100
3829                     ; 298 			DimmerDutyBuf 				 = 100;
3831  0174 3564000c      	mov	_DimmerDutyBuf,#100
3833  0178 2003          	jra	L7432
3834  017a               L5432:
3835                     ; 304 			DimmerDuty = DimmerDutyBuf;
3837  017a 450c0d        	mov	_DimmerDuty,_DimmerDutyBuf
3838  017d               L7432:
3839                     ; 309 		if (DimmerDuty == 0)
3841  017d 3d0d          	tnz	_DimmerDuty
3842  017f 260e          	jrne	L5332
3843                     ; 311 			DimmerDuty = 100;
3845  0181 3564000d      	mov	_DimmerDuty,#100
3846                     ; 312 			DimmerDutyBuf = 100;
3848  0185 3564000c      	mov	_DimmerDutyBuf,#100
3849  0189 2004          	jra	L5332
3850  018b               L3432:
3851                     ; 318 		LedDuty     = DUTY_MIN;
3853  018b 3f09          	clr	_LedDuty
3854                     ; 319 		DimmerDuty = 0;
3856  018d 3f0d          	clr	_DimmerDuty
3857  018f               L5332:
3858                     ; 322 }
3861  018f 81            	ret
4135                     	xdef	_Switch_On_Off
4136                     	xdef	_Time_Caculate
4137                     	xdef	f_Tim4_Update_Interrupt
4138                     	xdef	f_Zero_Detect_Interrupt
4139                     	xdef	_Led_Display
4140                     	xdef	_GroupThreeOffMinute
4141                     	xdef	_GroupThreeOffHour
4142                     	xdef	_GroupTwoOffMinute
4143                     	xdef	_GroupTwoOffHour
4144                     	xdef	_GroupOneOffMinute
4145                     	xdef	_GroupOneOffHour
4146                     	xdef	_GroupThreeOnMinute
4147                     	xdef	_GroupThreeOnHour
4148                     	xdef	_GroupTwoOnMinute
4149                     	xdef	_GroupTwoOnHour
4150                     	xdef	_GroupOneOnMinute
4151                     	xdef	_GroupOneOnHour
4152                     	switch	.ubsct
4153  0002               _RealHour:
4154  0002 00            	ds.b	1
4155                     	xdef	_RealHour
4156  0003               _RealMinute:
4157  0003 00            	ds.b	1
4158                     	xdef	_RealMinute
4159  0004               _RealSecond:
4160  0004 00            	ds.b	1
4161                     	xdef	_RealSecond
4162                     	xdef	_SwitchInit
4163  0005               _SwitchStatus:
4164  0005 00            	ds.b	1
4165                     	xdef	_SwitchStatus
4166  0006               _SecondFlag:
4167  0006 00            	ds.b	1
4168                     	xdef	_SecondFlag
4169  0007               _SecondCnt2:
4170  0007 00            	ds.b	1
4171                     	xdef	_SecondCnt2
4172  0008               _SecondCnt1:
4173  0008 00            	ds.b	1
4174                     	xdef	_SecondCnt1
4175  0009               _LedDuty:
4176  0009 00            	ds.b	1
4177                     	xdef	_LedDuty
4178  000a               _DimmerBySwitchFlag:
4179  000a 00            	ds.b	1
4180                     	xdef	_DimmerBySwitchFlag
4181  000b               _DimmerMax:
4182  000b 00            	ds.b	1
4183                     	xdef	_DimmerMax
4184  000c               _DimmerDutyBuf:
4185  000c 00            	ds.b	1
4186                     	xdef	_DimmerDutyBuf
4187  000d               _DimmerDuty:
4188  000d 00            	ds.b	1
4189                     	xdef	_DimmerDuty
4190  000e               _ZeroDetectFlag:
4191  000e 00            	ds.b	1
4192                     	xdef	_ZeroDetectFlag
4193                     	xref.b	_ReplyStatus
4194                     	xref.b	_AppControlFlag
4195                     	xref.b	_RepeatDelayTime
4196                     	xref.b	_RepeatCnt
4197                     	xref.b	_StatusReplyCommand
4198                     	xref.b	_ReplyRepeatFlag
4199                     	xref.b	_StatusReplyFlag
4219                     	end
