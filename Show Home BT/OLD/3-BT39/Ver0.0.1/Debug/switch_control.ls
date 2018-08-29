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
3443                     ; 117 	if ( (DimmerDutyCnt == (115 - DimmerDuty)) && (DimmerDuty > 0) )
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
3458  0047 2608          	jrne	L1622
3460  0049 3d0d          	tnz	_DimmerDuty
3461  004b 2704          	jreq	L1622
3462                     ; 119 		PORT_RELAY = 1;
3464  004d 7218500f      	bset	_PD_ODR_4
3465  0051               L1622:
3466                     ; 122 	if (DimmerDutyCnt > 114 )
3468  0051 b601          	ld	a,L7322_DimmerDutyCnt
3469  0053 a173          	cp	a,#115
3470  0055 2504          	jrult	L3622
3471                     ; 124 		PORT_RELAY = 0;
3473  0057 7219500f      	bres	_PD_ODR_4
3474  005b               L3622:
3475                     ; 130 	SecondCnt1++;
3477  005b 3c08          	inc	_SecondCnt1
3478                     ; 131 	if (SecondCnt1 > 124) //8ms
3480  005d b608          	ld	a,_SecondCnt1
3481  005f a17d          	cp	a,#125
3482  0061 2510          	jrult	L5622
3483                     ; 133 		SecondCnt1 = 0;
3485  0063 3f08          	clr	_SecondCnt1
3486                     ; 134 		SecondCnt2++;
3488  0065 3c07          	inc	_SecondCnt2
3489                     ; 135 		if (SecondCnt2 > 124) // 1s
3491  0067 b607          	ld	a,_SecondCnt2
3492  0069 a17d          	cp	a,#125
3493  006b 2506          	jrult	L5622
3494                     ; 137 			SecondCnt2 = 0;
3496  006d 3f07          	clr	_SecondCnt2
3497                     ; 138 			SecondFlag = TRUE;     // set SecondFlag every second
3499  006f 35010006      	mov	_SecondFlag,#1
3500  0073               L5622:
3501                     ; 141 }
3504  0073 5b02          	addw	sp,#2
3505  0075 80            	iret
3531                     ; 146 void Time_Caculate(void)
3531                     ; 147 {
3533                     	switch	.text
3534  0076               _Time_Caculate:
3538                     ; 148   if (SecondFlag)
3540  0076 3d06          	tnz	_SecondFlag
3541  0078 2720          	jreq	L1032
3542                     ; 151     SecondFlag = FALSE;
3544  007a 3f06          	clr	_SecondFlag
3545                     ; 154     RealSecond++;
3547  007c 3c04          	inc	_RealSecond
3548                     ; 157     if (RealSecond > 59)
3550  007e b604          	ld	a,_RealSecond
3551  0080 a13c          	cp	a,#60
3552  0082 2516          	jrult	L1032
3553                     ; 160       RealSecond = 0;
3555  0084 3f04          	clr	_RealSecond
3556                     ; 163       RealMinute++;
3558  0086 3c03          	inc	_RealMinute
3559                     ; 166       if (RealMinute > 59)
3561  0088 b603          	ld	a,_RealMinute
3562  008a a13c          	cp	a,#60
3563  008c 250c          	jrult	L1032
3564                     ; 169         RealMinute = 0;
3566  008e 3f03          	clr	_RealMinute
3567                     ; 172         RealHour++;
3569  0090 3c02          	inc	_RealHour
3570                     ; 175         if (RealHour > 23)
3572  0092 b602          	ld	a,_RealHour
3573  0094 a118          	cp	a,#24
3574  0096 2502          	jrult	L1032
3575                     ; 177           RealHour = 0;
3577  0098 3f02          	clr	_RealHour
3578  009a               L1032:
3579                     ; 182 }
3582  009a 81            	ret
3633                     ; 187 void Switch_On_Off(void)
3633                     ; 188 {
3634                     	switch	.text
3635  009b               _Switch_On_Off:
3639                     ; 189   Time_Caculate();
3641  009b add9          	call	_Time_Caculate
3643                     ; 195   if ( (GroupOneOffHour   == RealHour) && (GroupOneOffMinute   == RealMinute) )
3645  009d b607          	ld	a,_GroupOneOffHour
3646  009f b102          	cp	a,_RealHour
3647  00a1 2614          	jrne	L1232
3649  00a3 b608          	ld	a,_GroupOneOffMinute
3650  00a5 b103          	cp	a,_RealMinute
3651  00a7 260e          	jrne	L1232
3652                     ; 198     SwitchStatus = 0x00;
3654  00a9 3f05          	clr	_SwitchStatus
3655                     ; 199     SwitchInit   = TRUE;
3657  00ab 35010000      	mov	_SwitchInit,#1
3658                     ; 202     GroupOneOffHour   = 0xff;
3660  00af 35ff0007      	mov	_GroupOneOffHour,#255
3661                     ; 203     GroupOneOffMinute = 0xff;
3663  00b3 35ff0008      	mov	_GroupOneOffMinute,#255
3664  00b7               L1232:
3665                     ; 206   if ( (GroupTwoOffHour   == RealHour) && (GroupTwoOffMinute   == RealMinute) )
3667  00b7 b609          	ld	a,_GroupTwoOffHour
3668  00b9 b102          	cp	a,_RealHour
3669  00bb 2614          	jrne	L3232
3671  00bd b60a          	ld	a,_GroupTwoOffMinute
3672  00bf b103          	cp	a,_RealMinute
3673  00c1 260e          	jrne	L3232
3674                     ; 209     SwitchStatus = 0x00;
3676  00c3 3f05          	clr	_SwitchStatus
3677                     ; 210     SwitchInit   = TRUE;
3679  00c5 35010000      	mov	_SwitchInit,#1
3680                     ; 213     GroupTwoOffHour   = 0xff;
3682  00c9 35ff0009      	mov	_GroupTwoOffHour,#255
3683                     ; 214     GroupTwoOffMinute = 0xff;
3685  00cd 35ff000a      	mov	_GroupTwoOffMinute,#255
3686  00d1               L3232:
3687                     ; 217   if ( (GroupThreeOffHour == RealHour) && (GroupThreeOffMinute == RealMinute) ) 
3689  00d1 b60b          	ld	a,_GroupThreeOffHour
3690  00d3 b102          	cp	a,_RealHour
3691  00d5 2614          	jrne	L5232
3693  00d7 b60c          	ld	a,_GroupThreeOffMinute
3694  00d9 b103          	cp	a,_RealMinute
3695  00db 260e          	jrne	L5232
3696                     ; 220     SwitchStatus = 0x00;
3698  00dd 3f05          	clr	_SwitchStatus
3699                     ; 221     SwitchInit   = TRUE;
3701  00df 35010000      	mov	_SwitchInit,#1
3702                     ; 225     GroupThreeOffHour   = 0xff;
3704  00e3 35ff000b      	mov	_GroupThreeOffHour,#255
3705                     ; 226     GroupThreeOffMinute = 0xff;
3707  00e7 35ff000c      	mov	_GroupThreeOffMinute,#255
3708  00eb               L5232:
3709                     ; 230   if ( (GroupOneOnHour   == RealHour) && (GroupOneOnMinute   == RealMinute) )
3711  00eb b601          	ld	a,_GroupOneOnHour
3712  00ed b102          	cp	a,_RealHour
3713  00ef 2616          	jrne	L7232
3715  00f1 b602          	ld	a,_GroupOneOnMinute
3716  00f3 b103          	cp	a,_RealMinute
3717  00f5 2610          	jrne	L7232
3718                     ; 233     SwitchStatus = 0x01;
3720  00f7 35010005      	mov	_SwitchStatus,#1
3721                     ; 234     SwitchInit   = TRUE;
3723  00fb 35010000      	mov	_SwitchInit,#1
3724                     ; 237     GroupOneOnHour   = 0xff;
3726  00ff 35ff0001      	mov	_GroupOneOnHour,#255
3727                     ; 238     GroupOneOnMinute = 0xff;
3729  0103 35ff0002      	mov	_GroupOneOnMinute,#255
3730  0107               L7232:
3731                     ; 241   if ( (GroupTwoOnHour   == RealHour) && (GroupTwoOnMinute   == RealMinute) )
3733  0107 b603          	ld	a,_GroupTwoOnHour
3734  0109 b102          	cp	a,_RealHour
3735  010b 2616          	jrne	L1332
3737  010d b604          	ld	a,_GroupTwoOnMinute
3738  010f b103          	cp	a,_RealMinute
3739  0111 2610          	jrne	L1332
3740                     ; 244     SwitchStatus = 0x01;
3742  0113 35010005      	mov	_SwitchStatus,#1
3743                     ; 245     SwitchInit   = TRUE;
3745  0117 35010000      	mov	_SwitchInit,#1
3746                     ; 248     GroupTwoOnHour   = 0xff;
3748  011b 35ff0003      	mov	_GroupTwoOnHour,#255
3749                     ; 249     GroupTwoOnMinute = 0xff;
3751  011f 35ff0004      	mov	_GroupTwoOnMinute,#255
3752  0123               L1332:
3753                     ; 252   if ( (GroupThreeOnHour == RealHour) && (GroupThreeOnMinute == RealMinute) ) 
3755  0123 b605          	ld	a,_GroupThreeOnHour
3756  0125 b102          	cp	a,_RealHour
3757  0127 2616          	jrne	L3332
3759  0129 b606          	ld	a,_GroupThreeOnMinute
3760  012b b103          	cp	a,_RealMinute
3761  012d 2610          	jrne	L3332
3762                     ; 255     SwitchStatus = 0x01;
3764  012f 35010005      	mov	_SwitchStatus,#1
3765                     ; 256     SwitchInit   = TRUE;
3767  0133 35010000      	mov	_SwitchInit,#1
3768                     ; 259     GroupThreeOnHour   = 0xff;
3770  0137 35ff0005      	mov	_GroupThreeOnHour,#255
3771                     ; 260     GroupThreeOnMinute = 0xff;
3773  013b 35ff0006      	mov	_GroupThreeOnMinute,#255
3774  013f               L3332:
3775                     ; 267   if (SwitchInit == TRUE)
3777  013f b600          	ld	a,_SwitchInit
3778  0141 a101          	cp	a,#1
3779  0143 264e          	jrne	L5332
3780                     ; 270     SwitchInit = FALSE;
3782  0145 3f00          	clr	_SwitchInit
3783                     ; 274     if (AppControlFlag == TRUE)
3785  0147 b600          	ld	a,_AppControlFlag
3786  0149 a101          	cp	a,#1
3787  014b 2604          	jrne	L7332
3788                     ; 276       AppControlFlag = FALSE;			// when switch status is changed by the APP,do not reply
3790  014d 3f00          	clr	_AppControlFlag
3792  014f 2011          	jra	L1432
3793  0151               L7332:
3794                     ; 280       RepeatCnt = 0;
3796  0151 3f00          	clr	_RepeatCnt
3797                     ; 281       RepeatDelayTime = 0;
3799  0153 3f00          	clr	_RepeatDelayTime
3800                     ; 282       ReplyRepeatFlag     = FALSE;
3802  0155 3f00          	clr	_ReplyRepeatFlag
3803                     ; 284       StatusReplyFlag = TRUE;
3805  0157 35010000      	mov	_StatusReplyFlag,#1
3806                     ; 285       StatusReplyCommand   = 0x02;
3808  015b 35020000      	mov	_StatusReplyCommand,#2
3809                     ; 287 	  ReplyStatus = SwitchStatus;
3811  015f 450500        	mov	_ReplyStatus,_SwitchStatus
3812  0162               L1432:
3813                     ; 290     if (SwitchStatus == 0x01) // switch on
3815  0162 b605          	ld	a,_SwitchStatus
3816  0164 a101          	cp	a,#1
3817  0166 2627          	jrne	L3432
3818                     ; 292 		LedDuty    =  100;
3820  0168 35640009      	mov	_LedDuty,#100
3821                     ; 295 		if (DimmerBySwitchFlag == TRUE)
3823  016c b60a          	ld	a,_DimmerBySwitchFlag
3824  016e a101          	cp	a,#1
3825  0170 260c          	jrne	L5432
3826                     ; 297 			DimmerBySwitchFlag 	= FALSE;
3828  0172 3f0a          	clr	_DimmerBySwitchFlag
3829                     ; 298 			DimmerDuty 				 	= 100;
3831  0174 3564000d      	mov	_DimmerDuty,#100
3832                     ; 299 			DimmerDutyBuf 				 = 100;
3834  0178 3564000c      	mov	_DimmerDutyBuf,#100
3836  017c 2003          	jra	L7432
3837  017e               L5432:
3838                     ; 305 			DimmerDuty = DimmerDutyBuf;
3840  017e 450c0d        	mov	_DimmerDuty,_DimmerDutyBuf
3841  0181               L7432:
3842                     ; 310 		if (DimmerDuty == 0)
3844  0181 3d0d          	tnz	_DimmerDuty
3845  0183 260e          	jrne	L5332
3846                     ; 312 			DimmerDuty = 100;
3848  0185 3564000d      	mov	_DimmerDuty,#100
3849                     ; 313 			DimmerDutyBuf = 100;
3851  0189 3564000c      	mov	_DimmerDutyBuf,#100
3852  018d 2004          	jra	L5332
3853  018f               L3432:
3854                     ; 319 		LedDuty     = DUTY_MIN;
3856  018f 3f09          	clr	_LedDuty
3857                     ; 320 		DimmerDuty = 0;
3859  0191 3f0d          	clr	_DimmerDuty
3860  0193               L5332:
3861                     ; 323 }
3864  0193 81            	ret
4138                     	xdef	_Switch_On_Off
4139                     	xdef	_Time_Caculate
4140                     	xdef	f_Tim4_Update_Interrupt
4141                     	xdef	f_Zero_Detect_Interrupt
4142                     	xdef	_Led_Display
4143                     	xdef	_GroupThreeOffMinute
4144                     	xdef	_GroupThreeOffHour
4145                     	xdef	_GroupTwoOffMinute
4146                     	xdef	_GroupTwoOffHour
4147                     	xdef	_GroupOneOffMinute
4148                     	xdef	_GroupOneOffHour
4149                     	xdef	_GroupThreeOnMinute
4150                     	xdef	_GroupThreeOnHour
4151                     	xdef	_GroupTwoOnMinute
4152                     	xdef	_GroupTwoOnHour
4153                     	xdef	_GroupOneOnMinute
4154                     	xdef	_GroupOneOnHour
4155                     	switch	.ubsct
4156  0002               _RealHour:
4157  0002 00            	ds.b	1
4158                     	xdef	_RealHour
4159  0003               _RealMinute:
4160  0003 00            	ds.b	1
4161                     	xdef	_RealMinute
4162  0004               _RealSecond:
4163  0004 00            	ds.b	1
4164                     	xdef	_RealSecond
4165                     	xdef	_SwitchInit
4166  0005               _SwitchStatus:
4167  0005 00            	ds.b	1
4168                     	xdef	_SwitchStatus
4169  0006               _SecondFlag:
4170  0006 00            	ds.b	1
4171                     	xdef	_SecondFlag
4172  0007               _SecondCnt2:
4173  0007 00            	ds.b	1
4174                     	xdef	_SecondCnt2
4175  0008               _SecondCnt1:
4176  0008 00            	ds.b	1
4177                     	xdef	_SecondCnt1
4178  0009               _LedDuty:
4179  0009 00            	ds.b	1
4180                     	xdef	_LedDuty
4181  000a               _DimmerBySwitchFlag:
4182  000a 00            	ds.b	1
4183                     	xdef	_DimmerBySwitchFlag
4184  000b               _DimmerMax:
4185  000b 00            	ds.b	1
4186                     	xdef	_DimmerMax
4187  000c               _DimmerDutyBuf:
4188  000c 00            	ds.b	1
4189                     	xdef	_DimmerDutyBuf
4190  000d               _DimmerDuty:
4191  000d 00            	ds.b	1
4192                     	xdef	_DimmerDuty
4193  000e               _ZeroDetectFlag:
4194  000e 00            	ds.b	1
4195                     	xdef	_ZeroDetectFlag
4196                     	xref.b	_ReplyStatus
4197                     	xref.b	_AppControlFlag
4198                     	xref.b	_RepeatDelayTime
4199                     	xref.b	_RepeatCnt
4200                     	xref.b	_StatusReplyCommand
4201                     	xref.b	_ReplyRepeatFlag
4202                     	xref.b	_StatusReplyFlag
4222                     	end
