   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Generator V4.2.4 - 19 Dec 2007
3213                     	switch	.ubsct
3214  0000               L3712_DutyCnt:
3215  0000 00            	ds.b	1
3265                     ; 66 void Led_Display(void)
3265                     ; 67 {
3267                     	switch	.text
3268  0000               _Led_Display:
3272                     ; 70     DutyCnt++;
3274  0000 3c00          	inc	L3712_DutyCnt
3275                     ; 71     if (DutyCnt > 99)
3277  0002 b600          	ld	a,L3712_DutyCnt
3278  0004 a164          	cp	a,#100
3279  0006 2502          	jrult	L1222
3280                     ; 73       DutyCnt = 0;
3282  0008 3f00          	clr	L3712_DutyCnt
3283  000a               L1222:
3284                     ; 77     if (DutyCnt < LedDuty)
3286  000a b600          	ld	a,L3712_DutyCnt
3287  000c b124          	cp	a,_LedDuty
3288  000e 2406          	jruge	L3222
3289                     ; 79       PORT_LED = LED_ON;
3291  0010 72175000      	bres	_PA_ODR_3
3293  0014 2004          	jra	L5222
3294  0016               L3222:
3295                     ; 83       PORT_LED = LED_OFF;
3297  0016 72165000      	bset	_PA_ODR_3
3298  001a               L5222:
3299                     ; 107 }
3302  001a 81            	ret
3330                     ; 112 @far @interrupt void Tim4_Update_Interrupt(void)
3330                     ; 113 {
3332                     	switch	.text
3333  001b               f_Tim4_Update_Interrupt:
3338                     ; 114   TIM4_SR &= (~0x01);
3340  001b 72115344      	bres	_TIM4_SR,#0
3341                     ; 116   SecondCnt1++;
3343  001f 3c23          	inc	_SecondCnt1
3344                     ; 117   if (SecondCnt1 > 99) //100ms
3346  0021 b623          	ld	a,_SecondCnt1
3347  0023 a164          	cp	a,#100
3348  0025 2510          	jrult	L7322
3349                     ; 119     SecondCnt1 = 0;
3351  0027 3f23          	clr	_SecondCnt1
3352                     ; 120     SecondCnt2++;
3354  0029 3c22          	inc	_SecondCnt2
3355                     ; 121     if (SecondCnt2 > 9)
3357  002b b622          	ld	a,_SecondCnt2
3358  002d a10a          	cp	a,#10
3359  002f 2506          	jrult	L7322
3360                     ; 123       SecondCnt2 = 0;
3362  0031 3f22          	clr	_SecondCnt2
3363                     ; 124       SecondFlag = TRUE;     // set SecondFlag every second
3365  0033 35010021      	mov	_SecondFlag,#1
3366  0037               L7322:
3367                     ; 127 }
3370  0037 80            	iret
3396                     ; 132 void Time_Caculate(void)
3396                     ; 133 {
3398                     	switch	.text
3399  0038               _Time_Caculate:
3403                     ; 134   if (SecondFlag)
3405  0038 3d21          	tnz	_SecondFlag
3406  003a 2720          	jreq	L3522
3407                     ; 137     SecondFlag = FALSE;
3409  003c 3f21          	clr	_SecondFlag
3410                     ; 140     RealSecond++;
3412  003e 3c1b          	inc	_RealSecond
3413                     ; 143     if (RealSecond > 59)
3415  0040 b61b          	ld	a,_RealSecond
3416  0042 a13c          	cp	a,#60
3417  0044 2516          	jrult	L3522
3418                     ; 146       RealSecond = 0;
3420  0046 3f1b          	clr	_RealSecond
3421                     ; 149       RealMinute++;
3423  0048 3c1a          	inc	_RealMinute
3424                     ; 152       if (RealMinute > 59)
3426  004a b61a          	ld	a,_RealMinute
3427  004c a13c          	cp	a,#60
3428  004e 250c          	jrult	L3522
3429                     ; 155         RealMinute = 0;
3431  0050 3f1a          	clr	_RealMinute
3432                     ; 158         RealHour++;
3434  0052 3c19          	inc	_RealHour
3435                     ; 161         if (RealHour > 23)
3437  0054 b619          	ld	a,_RealHour
3438  0056 a118          	cp	a,#24
3439  0058 2502          	jrult	L3522
3440                     ; 163           RealHour = 0;
3442  005a 3f19          	clr	_RealHour
3443  005c               L3522:
3444                     ; 168 }
3447  005c 81            	ret
3511                     ; 173 void Switch_On_Off(void)
3511                     ; 174 {
3512                     	switch	.text
3513  005d               _Switch_On_Off:
3515  005d 88            	push	a
3516       00000001      OFST:	set	1
3519                     ; 175 	_Uchar		TempCnt = 0;
3521  005e 0f01          	clr	(OFST+0,sp)
3522                     ; 177   Time_Caculate();
3524  0060 add6          	call	_Time_Caculate
3526                     ; 181   for (TempCnt = 0; TempCnt < 2; TempCnt++)
3528  0062 0f01          	clr	(OFST+0,sp)
3529  0064               L1032:
3530                     ; 183 	  if ( (GroupOneOffHour[TempCnt]   == RealHour) && (GroupOneOffMinute[TempCnt]    == RealMinute) )
3532  0064 7b01          	ld	a,(OFST+0,sp)
3533  0066 5f            	clrw	x
3534  0067 97            	ld	xl,a
3535  0068 e60b          	ld	a,(_GroupOneOffHour,x)
3536  006a b119          	cp	a,_RealHour
3537  006c 2628          	jrne	L7032
3539  006e 7b01          	ld	a,(OFST+0,sp)
3540  0070 5f            	clrw	x
3541  0071 97            	ld	xl,a
3542  0072 e609          	ld	a,(_GroupOneOffMinute,x)
3543  0074 b11a          	cp	a,_RealMinute
3544  0076 261e          	jrne	L7032
3545                     ; 186 		SwitchStatus[TempCnt]  = 0x00;
3547  0078 7b01          	ld	a,(OFST+0,sp)
3548  007a 5f            	clrw	x
3549  007b 97            	ld	xl,a
3550  007c 6f1f          	clr	(_SwitchStatus,x)
3551                     ; 187 		SwitchInit[TempCnt]    = TRUE;
3553  007e 7b01          	ld	a,(OFST+0,sp)
3554  0080 5f            	clrw	x
3555  0081 97            	ld	xl,a
3556  0082 a601          	ld	a,#1
3557  0084 e71d          	ld	(_SwitchInit,x),a
3558                     ; 190 		GroupOneOffHour[TempCnt]    = 0xff;
3560  0086 7b01          	ld	a,(OFST+0,sp)
3561  0088 5f            	clrw	x
3562  0089 97            	ld	xl,a
3563  008a a6ff          	ld	a,#255
3564  008c e70b          	ld	(_GroupOneOffHour,x),a
3565                     ; 191 		GroupOneOffMinute[TempCnt]  = 0xff;
3567  008e 7b01          	ld	a,(OFST+0,sp)
3568  0090 5f            	clrw	x
3569  0091 97            	ld	xl,a
3570  0092 a6ff          	ld	a,#255
3571  0094 e709          	ld	(_GroupOneOffMinute,x),a
3572  0096               L7032:
3573                     ; 194 	  if ( (GroupTwoOffHour[TempCnt]    == RealHour) && (GroupTwoOffMinute[TempCnt]    == RealMinute) )
3575  0096 7b01          	ld	a,(OFST+0,sp)
3576  0098 5f            	clrw	x
3577  0099 97            	ld	xl,a
3578  009a e607          	ld	a,(_GroupTwoOffHour,x)
3579  009c b119          	cp	a,_RealHour
3580  009e 2628          	jrne	L1132
3582  00a0 7b01          	ld	a,(OFST+0,sp)
3583  00a2 5f            	clrw	x
3584  00a3 97            	ld	xl,a
3585  00a4 e605          	ld	a,(_GroupTwoOffMinute,x)
3586  00a6 b11a          	cp	a,_RealMinute
3587  00a8 261e          	jrne	L1132
3588                     ; 197 		SwitchStatus[TempCnt]  = 0x00;
3590  00aa 7b01          	ld	a,(OFST+0,sp)
3591  00ac 5f            	clrw	x
3592  00ad 97            	ld	xl,a
3593  00ae 6f1f          	clr	(_SwitchStatus,x)
3594                     ; 198 		SwitchInit[TempCnt]    = TRUE;
3596  00b0 7b01          	ld	a,(OFST+0,sp)
3597  00b2 5f            	clrw	x
3598  00b3 97            	ld	xl,a
3599  00b4 a601          	ld	a,#1
3600  00b6 e71d          	ld	(_SwitchInit,x),a
3601                     ; 201 		GroupTwoOffHour[TempCnt]    = 0xff;
3603  00b8 7b01          	ld	a,(OFST+0,sp)
3604  00ba 5f            	clrw	x
3605  00bb 97            	ld	xl,a
3606  00bc a6ff          	ld	a,#255
3607  00be e707          	ld	(_GroupTwoOffHour,x),a
3608                     ; 202 		GroupTwoOffMinute[TempCnt]  = 0xff;
3610  00c0 7b01          	ld	a,(OFST+0,sp)
3611  00c2 5f            	clrw	x
3612  00c3 97            	ld	xl,a
3613  00c4 a6ff          	ld	a,#255
3614  00c6 e705          	ld	(_GroupTwoOffMinute,x),a
3615  00c8               L1132:
3616                     ; 205 	  if ( (GroupThreeOffHour[TempCnt]  == RealHour) && (GroupThreeOffMinute[TempCnt]  == RealMinute) ) 
3618  00c8 7b01          	ld	a,(OFST+0,sp)
3619  00ca 5f            	clrw	x
3620  00cb 97            	ld	xl,a
3621  00cc e603          	ld	a,(_GroupThreeOffHour,x)
3622  00ce b119          	cp	a,_RealHour
3623  00d0 2628          	jrne	L3132
3625  00d2 7b01          	ld	a,(OFST+0,sp)
3626  00d4 5f            	clrw	x
3627  00d5 97            	ld	xl,a
3628  00d6 e601          	ld	a,(_GroupThreeOffMinute,x)
3629  00d8 b11a          	cp	a,_RealMinute
3630  00da 261e          	jrne	L3132
3631                     ; 208 		SwitchStatus[TempCnt]  = 0x00;
3633  00dc 7b01          	ld	a,(OFST+0,sp)
3634  00de 5f            	clrw	x
3635  00df 97            	ld	xl,a
3636  00e0 6f1f          	clr	(_SwitchStatus,x)
3637                     ; 209 		SwitchInit[TempCnt]    = TRUE;
3639  00e2 7b01          	ld	a,(OFST+0,sp)
3640  00e4 5f            	clrw	x
3641  00e5 97            	ld	xl,a
3642  00e6 a601          	ld	a,#1
3643  00e8 e71d          	ld	(_SwitchInit,x),a
3644                     ; 213 		GroupThreeOffHour[TempCnt]    = 0xff;
3646  00ea 7b01          	ld	a,(OFST+0,sp)
3647  00ec 5f            	clrw	x
3648  00ed 97            	ld	xl,a
3649  00ee a6ff          	ld	a,#255
3650  00f0 e703          	ld	(_GroupThreeOffHour,x),a
3651                     ; 214 		GroupThreeOffMinute[TempCnt]  = 0xff;
3653  00f2 7b01          	ld	a,(OFST+0,sp)
3654  00f4 5f            	clrw	x
3655  00f5 97            	ld	xl,a
3656  00f6 a6ff          	ld	a,#255
3657  00f8 e701          	ld	(_GroupThreeOffMinute,x),a
3658  00fa               L3132:
3659                     ; 218 	  if ( (GroupOneOnHour[TempCnt]    == RealHour) && (GroupOneOnMinute[TempCnt]    == RealMinute) )
3661  00fa 7b01          	ld	a,(OFST+0,sp)
3662  00fc 5f            	clrw	x
3663  00fd 97            	ld	xl,a
3664  00fe e617          	ld	a,(_GroupOneOnHour,x)
3665  0100 b119          	cp	a,_RealHour
3666  0102 262a          	jrne	L5132
3668  0104 7b01          	ld	a,(OFST+0,sp)
3669  0106 5f            	clrw	x
3670  0107 97            	ld	xl,a
3671  0108 e615          	ld	a,(_GroupOneOnMinute,x)
3672  010a b11a          	cp	a,_RealMinute
3673  010c 2620          	jrne	L5132
3674                     ; 221 		SwitchStatus[TempCnt]  = 0x01;
3676  010e 7b01          	ld	a,(OFST+0,sp)
3677  0110 5f            	clrw	x
3678  0111 97            	ld	xl,a
3679  0112 a601          	ld	a,#1
3680  0114 e71f          	ld	(_SwitchStatus,x),a
3681                     ; 222 		SwitchInit[TempCnt]    = TRUE;
3683  0116 7b01          	ld	a,(OFST+0,sp)
3684  0118 5f            	clrw	x
3685  0119 97            	ld	xl,a
3686  011a a601          	ld	a,#1
3687  011c e71d          	ld	(_SwitchInit,x),a
3688                     ; 225 		GroupOneOnHour[TempCnt]     = 0xff;
3690  011e 7b01          	ld	a,(OFST+0,sp)
3691  0120 5f            	clrw	x
3692  0121 97            	ld	xl,a
3693  0122 a6ff          	ld	a,#255
3694  0124 e717          	ld	(_GroupOneOnHour,x),a
3695                     ; 226 		GroupOneOnMinute[TempCnt]  = 0xff;
3697  0126 7b01          	ld	a,(OFST+0,sp)
3698  0128 5f            	clrw	x
3699  0129 97            	ld	xl,a
3700  012a a6ff          	ld	a,#255
3701  012c e715          	ld	(_GroupOneOnMinute,x),a
3702  012e               L5132:
3703                     ; 229 	  if ( (GroupTwoOnHour[TempCnt]    == RealHour) && (GroupTwoOnMinute[TempCnt]    == RealMinute) )
3705  012e 7b01          	ld	a,(OFST+0,sp)
3706  0130 5f            	clrw	x
3707  0131 97            	ld	xl,a
3708  0132 e613          	ld	a,(_GroupTwoOnHour,x)
3709  0134 b119          	cp	a,_RealHour
3710  0136 262a          	jrne	L7132
3712  0138 7b01          	ld	a,(OFST+0,sp)
3713  013a 5f            	clrw	x
3714  013b 97            	ld	xl,a
3715  013c e611          	ld	a,(_GroupTwoOnMinute,x)
3716  013e b11a          	cp	a,_RealMinute
3717  0140 2620          	jrne	L7132
3718                     ; 232 		SwitchStatus[TempCnt]  = 0x01;
3720  0142 7b01          	ld	a,(OFST+0,sp)
3721  0144 5f            	clrw	x
3722  0145 97            	ld	xl,a
3723  0146 a601          	ld	a,#1
3724  0148 e71f          	ld	(_SwitchStatus,x),a
3725                     ; 233 		SwitchInit[TempCnt]    = TRUE;
3727  014a 7b01          	ld	a,(OFST+0,sp)
3728  014c 5f            	clrw	x
3729  014d 97            	ld	xl,a
3730  014e a601          	ld	a,#1
3731  0150 e71d          	ld	(_SwitchInit,x),a
3732                     ; 236 		GroupTwoOnHour[TempCnt]    = 0xff;
3734  0152 7b01          	ld	a,(OFST+0,sp)
3735  0154 5f            	clrw	x
3736  0155 97            	ld	xl,a
3737  0156 a6ff          	ld	a,#255
3738  0158 e713          	ld	(_GroupTwoOnHour,x),a
3739                     ; 237 		GroupTwoOnMinute[TempCnt]  = 0xff;
3741  015a 7b01          	ld	a,(OFST+0,sp)
3742  015c 5f            	clrw	x
3743  015d 97            	ld	xl,a
3744  015e a6ff          	ld	a,#255
3745  0160 e711          	ld	(_GroupTwoOnMinute,x),a
3746  0162               L7132:
3747                     ; 240 	  if ( (GroupThreeOnHour[TempCnt]  == RealHour) && (GroupThreeOnMinute[TempCnt]  == RealMinute) ) 
3749  0162 7b01          	ld	a,(OFST+0,sp)
3750  0164 5f            	clrw	x
3751  0165 97            	ld	xl,a
3752  0166 e60f          	ld	a,(_GroupThreeOnHour,x)
3753  0168 b119          	cp	a,_RealHour
3754  016a 262a          	jrne	L1232
3756  016c 7b01          	ld	a,(OFST+0,sp)
3757  016e 5f            	clrw	x
3758  016f 97            	ld	xl,a
3759  0170 e60d          	ld	a,(_GroupThreeOnMinute,x)
3760  0172 b11a          	cp	a,_RealMinute
3761  0174 2620          	jrne	L1232
3762                     ; 243 		SwitchStatus[TempCnt]  = 0x01;
3764  0176 7b01          	ld	a,(OFST+0,sp)
3765  0178 5f            	clrw	x
3766  0179 97            	ld	xl,a
3767  017a a601          	ld	a,#1
3768  017c e71f          	ld	(_SwitchStatus,x),a
3769                     ; 244 		SwitchInit[TempCnt]    = TRUE;
3771  017e 7b01          	ld	a,(OFST+0,sp)
3772  0180 5f            	clrw	x
3773  0181 97            	ld	xl,a
3774  0182 a601          	ld	a,#1
3775  0184 e71d          	ld	(_SwitchInit,x),a
3776                     ; 247 		GroupThreeOnHour[TempCnt]    = 0xff;
3778  0186 7b01          	ld	a,(OFST+0,sp)
3779  0188 5f            	clrw	x
3780  0189 97            	ld	xl,a
3781  018a a6ff          	ld	a,#255
3782  018c e70f          	ld	(_GroupThreeOnHour,x),a
3783                     ; 248 		GroupThreeOnMinute[TempCnt]  = 0xff;
3785  018e 7b01          	ld	a,(OFST+0,sp)
3786  0190 5f            	clrw	x
3787  0191 97            	ld	xl,a
3788  0192 a6ff          	ld	a,#255
3789  0194 e70d          	ld	(_GroupThreeOnMinute,x),a
3790  0196               L1232:
3791                     ; 181   for (TempCnt = 0; TempCnt < 2; TempCnt++)
3793  0196 0c01          	inc	(OFST+0,sp)
3796  0198 7b01          	ld	a,(OFST+0,sp)
3797  019a a102          	cp	a,#2
3798  019c 2403          	jruge	L41
3799  019e cc0064        	jp	L1032
3800  01a1               L41:
3801                     ; 256   if (SwitchInit[0] == TRUE)
3803  01a1 b61d          	ld	a,_SwitchInit
3804  01a3 a101          	cp	a,#1
3805  01a5 2631          	jrne	L3232
3806                     ; 259 		SwitchInit[0] = FALSE;
3808  01a7 3f1d          	clr	_SwitchInit
3809                     ; 263 		if (AppControlFlag == TRUE)
3811  01a9 b600          	ld	a,_AppControlFlag
3812  01ab a101          	cp	a,#1
3813  01ad 2604          	jrne	L5232
3814                     ; 265 		  AppControlFlag = FALSE;			// when switch status is changed by the APP,do not reply
3816  01af 3f00          	clr	_AppControlFlag
3818  01b1 2015          	jra	L7232
3819  01b3               L5232:
3820                     ; 269 		  RepeatCnt = 0;
3822  01b3 3f00          	clr	_RepeatCnt
3823                     ; 270 		  RepeatDelayTime = 0;
3825  01b5 3f00          	clr	_RepeatDelayTime
3826                     ; 271 		  ReplyRepeatFlag     = FALSE;
3828  01b7 3f00          	clr	_ReplyRepeatFlag
3829                     ; 273 		  StatusReplyFlag = TRUE;
3831  01b9 35010000      	mov	_StatusReplyFlag,#1
3832                     ; 274 		  StatusReplyCommand   = 0x02;
3834  01bd 35020000      	mov	_StatusReplyCommand,#2
3835                     ; 276 		  ReplyStatus = SwitchStatus[0];
3837  01c1 451f00        	mov	_ReplyStatus,_SwitchStatus
3838                     ; 277 		  ReplyGroup = 0;
3840  01c4 3f00          	clr	_ReplyGroup
3841                     ; 280 		  SwitchBoth++;
3843  01c6 3c1c          	inc	_SwitchBoth
3844  01c8               L7232:
3845                     ; 283 		if (SwitchStatus[0] == 0x01) // switch on
3847  01c8 b61f          	ld	a,_SwitchStatus
3848  01ca a101          	cp	a,#1
3849  01cc 2606          	jrne	L1332
3850                     ; 285 			PORT_RELAY_0 = RELAY_ON;
3852  01ce 7218500f      	bset	_PD_ODR_4
3854  01d2 2004          	jra	L3232
3855  01d4               L1332:
3856                     ; 290 			PORT_RELAY_0  = RELAY_OFF;
3858  01d4 7219500f      	bres	_PD_ODR_4
3859  01d8               L3232:
3860                     ; 298   if (SwitchInit[1] == TRUE)
3862  01d8 b61e          	ld	a,_SwitchInit+1
3863  01da a101          	cp	a,#1
3864  01dc 263f          	jrne	L5332
3865                     ; 301 		SwitchInit[1] = FALSE;
3867  01de 3f1e          	clr	_SwitchInit+1
3868                     ; 305 		if (AppControlFlag == TRUE)
3870  01e0 b600          	ld	a,_AppControlFlag
3871  01e2 a101          	cp	a,#1
3872  01e4 2604          	jrne	L7332
3873                     ; 307 		  AppControlFlag = FALSE;			// when switch status is changed by the APP,do not reply
3875  01e6 3f00          	clr	_AppControlFlag
3877  01e8 2017          	jra	L1432
3878  01ea               L7332:
3879                     ; 311 		  RepeatCnt = 0;
3881  01ea 3f00          	clr	_RepeatCnt
3882                     ; 312 		  RepeatDelayTime = 0;
3884  01ec 3f00          	clr	_RepeatDelayTime
3885                     ; 313 		  ReplyRepeatFlag     = FALSE;
3887  01ee 3f00          	clr	_ReplyRepeatFlag
3888                     ; 315 		  StatusReplyFlag = TRUE;
3890  01f0 35010000      	mov	_StatusReplyFlag,#1
3891                     ; 316 		  StatusReplyCommand   = 0x02;
3893  01f4 35020000      	mov	_StatusReplyCommand,#2
3894                     ; 318 		  ReplyStatus = SwitchStatus[1];
3896  01f8 452000        	mov	_ReplyStatus,_SwitchStatus+1
3897                     ; 319 		  ReplyGroup = 0x01;
3899  01fb 35010000      	mov	_ReplyGroup,#1
3900                     ; 322 		  SwitchBoth++;
3902  01ff 3c1c          	inc	_SwitchBoth
3903  0201               L1432:
3904                     ; 325 		if (SwitchStatus[1] == 0x01) // switch on
3906  0201 b620          	ld	a,_SwitchStatus+1
3907  0203 a101          	cp	a,#1
3908  0205 2606          	jrne	L3432
3909                     ; 327 			PORT_RELAY_1 = RELAY_ON;
3911  0207 7216500f      	bset	_PD_ODR_3
3913  020b 2004          	jra	L5432
3914  020d               L3432:
3915                     ; 332 			PORT_RELAY_1  = RELAY_OFF;
3917  020d 7217500f      	bres	_PD_ODR_3
3918  0211               L5432:
3919                     ; 338 		if (SwitchBoth == 2)
3921  0211 b61c          	ld	a,_SwitchBoth
3922  0213 a102          	cp	a,#2
3923  0215 2604          	jrne	L7432
3924                     ; 340 			StatusBothReplyFlag = TRUE;
3926  0217 35010000      	mov	_StatusBothReplyFlag,#1
3927  021b               L7432:
3928                     ; 342 		SwitchBoth = 0;
3930  021b 3f1c          	clr	_SwitchBoth
3931  021d               L5332:
3932                     ; 348 	if ( (SwitchStatus[0] == 0) && (SwitchStatus[1] == 0) )
3934  021d 3d1f          	tnz	_SwitchStatus
3935  021f 2608          	jrne	L1532
3937  0221 3d20          	tnz	_SwitchStatus+1
3938  0223 2604          	jrne	L1532
3939                     ; 350 		LedDuty = DUTY_MIN;
3941  0225 3f24          	clr	_LedDuty
3943  0227 2004          	jra	L3532
3944  0229               L1532:
3945                     ; 354 		LedDuty = DUTY_MAX;
3947  0229 35640024      	mov	_LedDuty,#100
3948  022d               L3532:
3949                     ; 356 }
3952  022d 84            	pop	a
3953  022e 81            	ret
4204                     	xdef	_Switch_On_Off
4205                     	xdef	_Time_Caculate
4206                     	xdef	f_Tim4_Update_Interrupt
4207                     	xdef	_Led_Display
4208                     	switch	.ubsct
4209  0001               _GroupThreeOffMinute:
4210  0001 0000          	ds.b	2
4211                     	xdef	_GroupThreeOffMinute
4212  0003               _GroupThreeOffHour:
4213  0003 0000          	ds.b	2
4214                     	xdef	_GroupThreeOffHour
4215  0005               _GroupTwoOffMinute:
4216  0005 0000          	ds.b	2
4217                     	xdef	_GroupTwoOffMinute
4218  0007               _GroupTwoOffHour:
4219  0007 0000          	ds.b	2
4220                     	xdef	_GroupTwoOffHour
4221  0009               _GroupOneOffMinute:
4222  0009 0000          	ds.b	2
4223                     	xdef	_GroupOneOffMinute
4224  000b               _GroupOneOffHour:
4225  000b 0000          	ds.b	2
4226                     	xdef	_GroupOneOffHour
4227  000d               _GroupThreeOnMinute:
4228  000d 0000          	ds.b	2
4229                     	xdef	_GroupThreeOnMinute
4230  000f               _GroupThreeOnHour:
4231  000f 0000          	ds.b	2
4232                     	xdef	_GroupThreeOnHour
4233  0011               _GroupTwoOnMinute:
4234  0011 0000          	ds.b	2
4235                     	xdef	_GroupTwoOnMinute
4236  0013               _GroupTwoOnHour:
4237  0013 0000          	ds.b	2
4238                     	xdef	_GroupTwoOnHour
4239  0015               _GroupOneOnMinute:
4240  0015 0000          	ds.b	2
4241                     	xdef	_GroupOneOnMinute
4242  0017               _GroupOneOnHour:
4243  0017 0000          	ds.b	2
4244                     	xdef	_GroupOneOnHour
4245  0019               _RealHour:
4246  0019 00            	ds.b	1
4247                     	xdef	_RealHour
4248  001a               _RealMinute:
4249  001a 00            	ds.b	1
4250                     	xdef	_RealMinute
4251  001b               _RealSecond:
4252  001b 00            	ds.b	1
4253                     	xdef	_RealSecond
4254  001c               _SwitchBoth:
4255  001c 00            	ds.b	1
4256                     	xdef	_SwitchBoth
4257  001d               _SwitchInit:
4258  001d 0000          	ds.b	2
4259                     	xdef	_SwitchInit
4260  001f               _SwitchStatus:
4261  001f 0000          	ds.b	2
4262                     	xdef	_SwitchStatus
4263  0021               _SecondFlag:
4264  0021 00            	ds.b	1
4265                     	xdef	_SecondFlag
4266  0022               _SecondCnt2:
4267  0022 00            	ds.b	1
4268                     	xdef	_SecondCnt2
4269  0023               _SecondCnt1:
4270  0023 00            	ds.b	1
4271                     	xdef	_SecondCnt1
4272  0024               _LedDuty:
4273  0024 00            	ds.b	1
4274                     	xdef	_LedDuty
4275                     	xref.b	_ReplyGroup
4276                     	xref.b	_ReplyStatus
4277                     	xref.b	_AppControlFlag
4278                     	xref.b	_RepeatDelayTime
4279                     	xref.b	_RepeatCnt
4280                     	xref.b	_StatusBothReplyFlag
4281                     	xref.b	_StatusReplyCommand
4282                     	xref.b	_ReplyRepeatFlag
4283                     	xref.b	_StatusReplyFlag
4303                     	end
