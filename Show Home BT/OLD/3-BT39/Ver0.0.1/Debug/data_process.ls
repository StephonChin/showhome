   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Generator V4.2.4 - 19 Dec 2007
3251                     ; 31 void Power_On_Init(void)
3251                     ; 32 {
3253                     	switch	.text
3254  0000               _Power_On_Init:
3258                     ; 33   RcvStatus = TRUE;
3260  0000 35010000      	mov	_RcvStatus,#1
3261                     ; 34   RcvData.Header = 0xF0;
3263  0004 35f00000      	mov	_RcvData,#240
3264                     ; 35   PowerOnFlag = TRUE;
3266  0008 35010000      	mov	_PowerOnFlag,#1
3267                     ; 36 }
3270  000c 81            	ret
3339                     ; 41 void Data_Process(void)
3339                     ; 42 {
3340                     	switch	.text
3341  000d               _Data_Process:
3343  000d 89            	pushw	x
3344       00000002      OFST:	set	2
3347                     ; 44   _Uint			TypeBuf = 0;
3349  000e 5f            	clrw	x
3350  000f 1f01          	ldw	(OFST-1,sp),x
3351                     ; 49     if (RcvStatus || PowerOnFlag)
3353  0011 3d00          	tnz	_RcvStatus
3354  0013 2607          	jrne	L1522
3356  0015 3d00          	tnz	_PowerOnFlag
3357  0017 2603          	jrne	L01
3358  0019 cc01ea        	jp	L7422
3359  001c               L01:
3360  001c               L1522:
3361                     ; 52         RcvStatus = FALSE;
3363  001c 3f00          	clr	_RcvStatus
3364                     ; 53 		PowerOnFlag = FALSE;
3366  001e 3f00          	clr	_PowerOnFlag
3367                     ; 56         if (BtInitFlag == FALSE)
3369  0020 3d02          	tnz	_BtInitFlag
3370  0022 261b          	jrne	L3522
3371                     ; 58             if (RcvData.Header == 0xF0)
3373  0024 b600          	ld	a,_RcvData
3374  0026 a1f0          	cp	a,#240
3375  0028 2703          	jreq	L21
3376  002a cc01ea        	jp	L7422
3377  002d               L21:
3378                     ; 60                 BtInitFlag = TRUE;              // bt's been initialized
3380  002d 35010002      	mov	_BtInitFlag,#1
3381                     ; 63                 PowerReplyFlag = TRUE; 
3383  0031 35010000      	mov	_PowerReplyFlag,#1
3384                     ; 64                 Reply_Repeat()
3386  0035 3f00          	clr	_ReplyRepeatFlag
3389  0037 3f00          	clr	_RepeatCnt
3392  0039 3f00          	clr	_RepeatDelayTime
3393  003b acea01ea      	jpf	L7422
3394  003f               L3522:
3395                     ; 74 			TypeBuf = ((_Uint)(RcvData.TypeH >> 8)) + ((_Uint)RcvData.TypeL);
3397  003f b602          	ld	a,_RcvData+2
3398  0041 5f            	clrw	x
3399  0042 97            	ld	xl,a
3400  0043 1f01          	ldw	(OFST-1,sp),x
3401                     ; 80 			if ( (TypeBuf & DEVICE_ID) != DEVICE_ID )
3403  0045 7b01          	ld	a,(OFST-1,sp)
3404  0047 97            	ld	xl,a
3405  0048 7b02          	ld	a,(OFST+0,sp)
3406  004a a402          	and	a,#2
3407  004c 5f            	clrw	x
3408  004d 02            	rlwa	x,a
3409  004e a30002        	cpw	x,#2
3410  0051 2702          	jreq	L1622
3411                     ; 82 				return;
3414  0053 85            	popw	x
3415  0054 81            	ret
3416  0055               L1622:
3417                     ; 91 				switch (RcvData.Header & 0x0F)
3419  0055 b600          	ld	a,_RcvData
3420  0057 a40f          	and	a,#15
3422                     ; 294 					break;
3423  0059 4a            	dec	a
3424  005a 2724          	jreq	L3122
3425  005c a002          	sub	a,#2
3426  005e 2755          	jreq	L5122
3427  0060 a006          	sub	a,#6
3428  0062 2767          	jreq	L7122
3429  0064 4a            	dec	a
3430  0065 2603          	jrne	L41
3431  0067 cc0106        	jp	L1222
3432  006a               L41:
3433  006a 4a            	dec	a
3434  006b 2603          	jrne	L61
3435  006d cc0146        	jp	L3222
3436  0070               L61:
3437  0070 4a            	dec	a
3438  0071 2603          	jrne	L02
3439  0073 cc017d        	jp	L5222
3440  0076               L02:
3441  0076 4a            	dec	a
3442  0077 2603          	jrne	L22
3443  0079 cc019b        	jp	L7222
3444  007c               L22:
3445  007c acde01de      	jpf	L3622
3446  0080               L3122:
3447                     ; 96 					case 0x01:
3447                     ; 97 					  // clear repeat variables
3447                     ; 98 					  Reply_Repeat();
3449  0080 3f00          	clr	_ReplyRepeatFlag
3452  0082 3f00          	clr	_RepeatCnt
3455  0084 3f00          	clr	_RepeatDelayTime
3456                     ; 101 					  if (PowerReplyFlag == TRUE)
3459  0086 b600          	ld	a,_PowerReplyFlag
3460  0088 a101          	cp	a,#1
3461  008a 260e          	jrne	L1722
3462                     ; 103 						PowerReplyFlag = FALSE;
3464  008c 3f00          	clr	_PowerReplyFlag
3465                     ; 106 						StatusReplyFlag = TRUE;
3467  008e 35010000      	mov	_StatusReplyFlag,#1
3468                     ; 107 						StatusReplyCommand = 0x02;
3470  0092 35020000      	mov	_StatusReplyCommand,#2
3472  0096 acde01de      	jpf	L3622
3473  009a               L1722:
3474                     ; 112 					  if (StatusReplyFlag == TRUE)
3476  009a b600          	ld	a,_StatusReplyFlag
3477  009c a101          	cp	a,#1
3478  009e 2606          	jrne	L5722
3479                     ; 114 						StatusReplyFlag = FALSE;
3481  00a0 3f00          	clr	_StatusReplyFlag
3483  00a2 acde01de      	jpf	L3622
3484  00a6               L5722:
3485                     ; 119 					  if (NormalReplyFlag == TRUE)
3487  00a6 b600          	ld	a,_NormalReplyFlag
3488  00a8 a101          	cp	a,#1
3489  00aa 2703          	jreq	L42
3490  00ac cc01de        	jp	L3622
3491  00af               L42:
3492                     ; 121 						NormalReplyFlag = FALSE;
3494  00af 3f00          	clr	_NormalReplyFlag
3495  00b1 acde01de      	jpf	L3622
3496  00b5               L5122:
3497                     ; 130 					case 0x03:
3497                     ; 131 					  //ReplyRepeatFlag = TRUE;
3497                     ; 132 					  Reply_Repeat();
3499  00b5 3f00          	clr	_ReplyRepeatFlag
3502  00b7 3f00          	clr	_RepeatCnt
3505  00b9 3f00          	clr	_RepeatDelayTime
3506                     ; 134 					  StatusReplyFlag = TRUE;
3509  00bb 35010000      	mov	_StatusReplyFlag,#1
3510                     ; 135 					  StatusReplyCommand = (RcvData.Header & 0xF0) | 0x02;
3512  00bf b600          	ld	a,_RcvData
3513  00c1 a4f0          	and	a,#240
3514  00c3 aa02          	or	a,#2
3515  00c5 b700          	ld	_StatusReplyCommand,a
3516                     ; 136 					break;
3518  00c7 acde01de      	jpf	L3622
3519  00cb               L7122:
3520                     ; 144 					case 0x09:
3520                     ; 145 					  // reply 
3520                     ; 146 					  Reply_Repeat();
3522  00cb 3f00          	clr	_ReplyRepeatFlag
3525  00cd 3f00          	clr	_RepeatCnt
3528  00cf 3f00          	clr	_RepeatDelayTime
3529                     ; 148 					  NormalReplyFlag = TRUE;
3532  00d1 35010000      	mov	_NormalReplyFlag,#1
3533                     ; 149 					  NormalReplyCommand = RcvData.Header;
3535  00d5 450000        	mov	_NormalReplyCommand,_RcvData
3536                     ; 152 					  AppControlFlag = TRUE;
3538  00d8 35010001      	mov	_AppControlFlag,#1
3539                     ; 156 					  if (RcvData.FirstCmd == 0x00)
3541  00dc 3d04          	tnz	_RcvData+4
3542  00de 2611          	jrne	L3032
3543                     ; 158 						if (SwitchStatus != 0x00)
3545  00e0 3d00          	tnz	_SwitchStatus
3546  00e2 2603          	jrne	L62
3547  00e4 cc01de        	jp	L3622
3548  00e7               L62:
3549                     ; 160 						  SwitchStatus = 0x00;
3551  00e7 3f00          	clr	_SwitchStatus
3552                     ; 161 						  SwitchInit   = TRUE;
3554  00e9 35010000      	mov	_SwitchInit,#1
3555  00ed acde01de      	jpf	L3622
3556  00f1               L3032:
3557                     ; 166 						if (SwitchStatus != 0x01)
3559  00f1 b600          	ld	a,_SwitchStatus
3560  00f3 a101          	cp	a,#1
3561  00f5 2603          	jrne	L03
3562  00f7 cc01de        	jp	L3622
3563  00fa               L03:
3564                     ; 168 						  SwitchStatus = 0x01;
3566  00fa 35010000      	mov	_SwitchStatus,#1
3567                     ; 169 						  SwitchInit   = TRUE;
3569  00fe 35010000      	mov	_SwitchInit,#1
3570  0102 acde01de      	jpf	L3622
3571  0106               L1222:
3572                     ; 179 					case 0x0A:
3572                     ; 180 					  /* reply */
3572                     ; 181 					  Reply_Repeat();
3574  0106 3f00          	clr	_ReplyRepeatFlag
3577  0108 3f00          	clr	_RepeatCnt
3580  010a 3f00          	clr	_RepeatDelayTime
3581                     ; 183 					  NormalReplyFlag = TRUE;
3584  010c 35010000      	mov	_NormalReplyFlag,#1
3585                     ; 184 					  NormalReplyCommand = RcvData.Header;
3587  0110 450000        	mov	_NormalReplyCommand,_RcvData
3588                     ; 187 					  if (RcvData.GroupClass == 0x01)
3590  0113 b603          	ld	a,_RcvData+3
3591  0115 a101          	cp	a,#1
3592  0117 260a          	jrne	L3132
3593                     ; 189 						GroupOneOnHour   = RcvData.FirstCmd;
3595  0119 450400        	mov	_GroupOneOnHour,_RcvData+4
3596                     ; 190 						GroupOneOnMinute = RcvData.SecondCmd;
3598  011c 450500        	mov	_GroupOneOnMinute,_RcvData+5
3600  011f acde01de      	jpf	L3622
3601  0123               L3132:
3602                     ; 193 					  if (RcvData.GroupClass == 0x02)
3604  0123 b603          	ld	a,_RcvData+3
3605  0125 a102          	cp	a,#2
3606  0127 260a          	jrne	L7132
3607                     ; 195 						GroupTwoOnHour   = RcvData.FirstCmd;
3609  0129 450400        	mov	_GroupTwoOnHour,_RcvData+4
3610                     ; 196 						GroupTwoOnMinute = RcvData.SecondCmd;
3612  012c 450500        	mov	_GroupTwoOnMinute,_RcvData+5
3614  012f acde01de      	jpf	L3622
3615  0133               L7132:
3616                     ; 198 					  else if (RcvData.GroupClass == 0x03)
3618  0133 b603          	ld	a,_RcvData+3
3619  0135 a103          	cp	a,#3
3620  0137 2703          	jreq	L23
3621  0139 cc01de        	jp	L3622
3622  013c               L23:
3623                     ; 200 						GroupThreeOnHour   = RcvData.FirstCmd;
3625  013c 450400        	mov	_GroupThreeOnHour,_RcvData+4
3626                     ; 201 						GroupThreeOnMinute = RcvData.SecondCmd;
3628  013f 450500        	mov	_GroupThreeOnMinute,_RcvData+5
3629  0142 acde01de      	jpf	L3622
3630  0146               L3222:
3631                     ; 210 					case 0x0B:
3631                     ; 211 					  // reply 
3631                     ; 212 					  Reply_Repeat();
3633  0146 3f00          	clr	_ReplyRepeatFlag
3636  0148 3f00          	clr	_RepeatCnt
3639  014a 3f00          	clr	_RepeatDelayTime
3640                     ; 214 					  NormalReplyFlag = TRUE;
3643  014c 35010000      	mov	_NormalReplyFlag,#1
3644                     ; 215 					  NormalReplyCommand = RcvData.Header;
3646  0150 450000        	mov	_NormalReplyCommand,_RcvData
3647                     ; 218 					  if (RcvData.GroupClass == 0x01)
3649  0153 b603          	ld	a,_RcvData+3
3650  0155 a101          	cp	a,#1
3651  0157 2608          	jrne	L5232
3652                     ; 220 						GroupOneOffHour   = RcvData.FirstCmd;
3654  0159 450400        	mov	_GroupOneOffHour,_RcvData+4
3655                     ; 221 						GroupOneOffMinute = RcvData.SecondCmd;
3657  015c 450500        	mov	_GroupOneOffMinute,_RcvData+5
3659  015f 207d          	jra	L3622
3660  0161               L5232:
3661                     ; 224 					  if (RcvData.GroupClass == 0x02)
3663  0161 b603          	ld	a,_RcvData+3
3664  0163 a102          	cp	a,#2
3665  0165 2608          	jrne	L1332
3666                     ; 226 						GroupTwoOffHour   = RcvData.FirstCmd;
3668  0167 450400        	mov	_GroupTwoOffHour,_RcvData+4
3669                     ; 227 						GroupTwoOffMinute = RcvData.SecondCmd;
3671  016a 450500        	mov	_GroupTwoOffMinute,_RcvData+5
3673  016d 206f          	jra	L3622
3674  016f               L1332:
3675                     ; 230 					  if (RcvData.GroupClass == 0x03)
3677  016f b603          	ld	a,_RcvData+3
3678  0171 a103          	cp	a,#3
3679  0173 2669          	jrne	L3622
3680                     ; 232 						GroupThreeOffHour   = RcvData.FirstCmd;
3682  0175 450400        	mov	_GroupThreeOffHour,_RcvData+4
3683                     ; 233 						GroupThreeOffMinute = RcvData.SecondCmd;
3685  0178 450500        	mov	_GroupThreeOffMinute,_RcvData+5
3686  017b 2061          	jra	L3622
3687  017d               L5222:
3688                     ; 242 					case 0x0C:
3688                     ; 243 					  // reply
3688                     ; 244 					  Reply_Repeat();
3690  017d 3f00          	clr	_ReplyRepeatFlag
3693  017f 3f00          	clr	_RepeatCnt
3696  0181 3f00          	clr	_RepeatDelayTime
3697                     ; 246 					  NormalReplyFlag = TRUE;
3700  0183 35010000      	mov	_NormalReplyFlag,#1
3701                     ; 247 					  NormalReplyCommand = RcvData.Header;
3703  0187 450000        	mov	_NormalReplyCommand,_RcvData
3704                     ; 250 					  RealHour    = RcvData.GroupClass;
3706  018a 450300        	mov	_RealHour,_RcvData+3
3707                     ; 251 					  RealMinute  = RcvData.FirstCmd;
3709  018d 450400        	mov	_RealMinute,_RcvData+4
3710                     ; 252 					  RealSecond  = RcvData.SecondCmd;
3712  0190 450500        	mov	_RealSecond,_RcvData+5
3713                     ; 255 					  SecondCnt1 = 0;
3715  0193 3f00          	clr	_SecondCnt1
3716                     ; 256 					  SecondCnt2 = 0;
3718  0195 3f00          	clr	_SecondCnt2
3719                     ; 257 					  SecondFlag = FALSE;
3721  0197 3f00          	clr	_SecondFlag
3722                     ; 258 					break;
3724  0199 2043          	jra	L3622
3725  019b               L7222:
3726                     ; 264 					case 0x0D:
3726                     ; 265 						// reply
3726                     ; 266 						Reply_Repeat();
3728  019b 3f00          	clr	_ReplyRepeatFlag
3731  019d 3f00          	clr	_RepeatCnt
3734  019f 3f00          	clr	_RepeatDelayTime
3735                     ; 268 						NormalReplyFlag = TRUE;
3738  01a1 35010000      	mov	_NormalReplyFlag,#1
3739                     ; 269 						NormalReplyCommand = RcvData.Header;
3741  01a5 450000        	mov	_NormalReplyCommand,_RcvData
3742                     ; 271 						if (RcvData.GroupClass == 0x01)
3744  01a8 b603          	ld	a,_RcvData+3
3745  01aa a101          	cp	a,#1
3746  01ac 2630          	jrne	L3622
3747                     ; 273 							DimmerDuty = RcvData.FirstCmd;
3749  01ae 450400        	mov	_DimmerDuty,_RcvData+4
3750                     ; 274 							if (DimmerDuty > 100)
3752  01b1 b600          	ld	a,_DimmerDuty
3753  01b3 a165          	cp	a,#101
3754  01b5 2504          	jrult	L1432
3755                     ; 276 								DimmerDuty = 100;
3757  01b7 35640000      	mov	_DimmerDuty,#100
3758  01bb               L1432:
3759                     ; 278 							DimmerDutyBuf = DimmerDuty;
3761  01bb 450000        	mov	_DimmerDutyBuf,_DimmerDuty
3762                     ; 281 							if ( (DimmerDuty == 0) && (SwitchStatus == 0x01) )
3764  01be 3d00          	tnz	_DimmerDuty
3765  01c0 260c          	jrne	L3432
3767  01c2 b600          	ld	a,_SwitchStatus
3768  01c4 a101          	cp	a,#1
3769  01c6 2606          	jrne	L3432
3770                     ; 283 								SwitchStatus = 0x00;
3772  01c8 3f00          	clr	_SwitchStatus
3773                     ; 284 								SwitchInit = TRUE;
3775  01ca 35010000      	mov	_SwitchInit,#1
3776  01ce               L3432:
3777                     ; 288 							if ( (SwitchStatus == 0x00) && (DimmerDuty > 0))
3779  01ce 3d00          	tnz	_SwitchStatus
3780  01d0 260c          	jrne	L3622
3782  01d2 3d00          	tnz	_DimmerDuty
3783  01d4 2708          	jreq	L3622
3784                     ; 290 								SwitchStatus = 0x01;
3786  01d6 35010000      	mov	_SwitchStatus,#1
3787                     ; 291 								SwitchInit = TRUE;
3789  01da 35010000      	mov	_SwitchInit,#1
3790  01de               L7622:
3791  01de               L3622:
3792                     ; 300 			RcvData.Header			 	= 0x00;
3794  01de 3f00          	clr	_RcvData
3795                     ; 301 			RcvData.TypeH			 	= 0x00;
3797  01e0 3f01          	clr	_RcvData+1
3798                     ; 302 			RcvData.TypeL				= 0x00;
3800  01e2 3f02          	clr	_RcvData+2
3801                     ; 303 			RcvData.GroupClass	 	= 0x00;
3803  01e4 3f03          	clr	_RcvData+3
3804                     ; 304 			RcvData.FirstCmd			= 0x00;
3806  01e6 3f04          	clr	_RcvData+4
3807                     ; 305 			RcvData.SecondCmd		= 0x00;
3809  01e8 3f05          	clr	_RcvData+5
3810  01ea               L7422:
3811                     ; 309 }
3814  01ea 85            	popw	x
3815  01eb 81            	ret
3880                     	xdef	_Data_Process
3881                     	xdef	_Power_On_Init
3882                     	switch	.ubsct
3883  0000               _PowerOnFlag:
3884  0000 00            	ds.b	1
3885                     	xdef	_PowerOnFlag
3886  0001               _AppControlFlag:
3887  0001 00            	ds.b	1
3888                     	xdef	_AppControlFlag
3889  0002               _BtInitFlag:
3890  0002 00            	ds.b	1
3891                     	xdef	_BtInitFlag
3892                     	xref.b	_GroupThreeOffMinute
3893                     	xref.b	_GroupThreeOffHour
3894                     	xref.b	_GroupTwoOffMinute
3895                     	xref.b	_GroupTwoOffHour
3896                     	xref.b	_GroupOneOffMinute
3897                     	xref.b	_GroupOneOffHour
3898                     	xref.b	_GroupThreeOnMinute
3899                     	xref.b	_GroupThreeOnHour
3900                     	xref.b	_GroupTwoOnMinute
3901                     	xref.b	_GroupTwoOnHour
3902                     	xref.b	_GroupOneOnMinute
3903                     	xref.b	_GroupOneOnHour
3904                     	xref.b	_RealHour
3905                     	xref.b	_RealMinute
3906                     	xref.b	_RealSecond
3907                     	xref.b	_SecondFlag
3908                     	xref.b	_SecondCnt2
3909                     	xref.b	_SecondCnt1
3910                     	xref.b	_DimmerDutyBuf
3911                     	xref.b	_DimmerDuty
3912                     	xref.b	_SwitchInit
3913                     	xref.b	_SwitchStatus
3914                     	xref.b	_RepeatDelayTime
3915                     	xref.b	_RepeatCnt
3916                     	xref.b	_NormalReplyCommand
3917                     	xref.b	_StatusReplyCommand
3918                     	xref.b	_NormalReplyFlag
3919                     	xref.b	_StatusReplyFlag
3920                     	xref.b	_PowerReplyFlag
3921                     	xref.b	_ReplyRepeatFlag
3922                     	xref.b	_RcvStatus
3923                     	xref.b	_RcvData
3943                     	end
