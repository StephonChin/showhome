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
3337                     ; 41 void Data_Process(void)
3337                     ; 42 {
3338                     	switch	.text
3339  000d               _Data_Process:
3341  000d 89            	pushw	x
3342       00000002      OFST:	set	2
3345                     ; 44   _Uint			TypeBuf = 0;
3347  000e 5f            	clrw	x
3348  000f 1f01          	ldw	(OFST-1,sp),x
3349                     ; 49     if (RcvStatus || PowerOnFlag)
3351  0011 3d00          	tnz	_RcvStatus
3352  0013 2607          	jrne	L7422
3354  0015 3d00          	tnz	_PowerOnFlag
3355  0017 2603          	jrne	L01
3356  0019 cc0196        	jp	L5422
3357  001c               L01:
3358  001c               L7422:
3359                     ; 52         RcvStatus = FALSE;
3361  001c 3f00          	clr	_RcvStatus
3362                     ; 53 		PowerOnFlag = FALSE;
3364  001e 3f00          	clr	_PowerOnFlag
3365                     ; 56         if (BtInitFlag == FALSE)
3367  0020 3d02          	tnz	_BtInitFlag
3368  0022 261b          	jrne	L1522
3369                     ; 58             if (RcvData.Header == 0xF0)
3371  0024 b600          	ld	a,_RcvData
3372  0026 a1f0          	cp	a,#240
3373  0028 2703          	jreq	L21
3374  002a cc0196        	jp	L5422
3375  002d               L21:
3376                     ; 60                 BtInitFlag = TRUE;              // bt's been initialized
3378  002d 35010002      	mov	_BtInitFlag,#1
3379                     ; 63                 PowerReplyFlag = TRUE; 
3381  0031 35010000      	mov	_PowerReplyFlag,#1
3382                     ; 64                 Reply_Repeat()
3384  0035 3f00          	clr	_ReplyRepeatFlag
3387  0037 3f00          	clr	_RepeatCnt
3390  0039 3f00          	clr	_RepeatDelayTime
3391  003b ac960196      	jpf	L5422
3392  003f               L1522:
3393                     ; 74 			TypeBuf = ((_Uint)(RcvData.TypeH >> 8)) + ((_Uint)RcvData.TypeL);
3395  003f b602          	ld	a,_RcvData+2
3396  0041 5f            	clrw	x
3397  0042 97            	ld	xl,a
3398  0043 1f01          	ldw	(OFST-1,sp),x
3399                     ; 80 			if ( (TypeBuf & DEVICE_ID) != DEVICE_ID )
3401  0045 7b01          	ld	a,(OFST-1,sp)
3402  0047 97            	ld	xl,a
3403  0048 7b02          	ld	a,(OFST+0,sp)
3404  004a a408          	and	a,#8
3405  004c 5f            	clrw	x
3406  004d 02            	rlwa	x,a
3407  004e a30008        	cpw	x,#8
3408  0051 2702          	jreq	L7522
3409                     ; 82 				return;
3412  0053 85            	popw	x
3413  0054 81            	ret
3414  0055               L7522:
3415                     ; 91 				switch (RcvData.Header & 0x0F)
3417  0055 b600          	ld	a,_RcvData
3418  0057 a40f          	and	a,#15
3420                     ; 258 					break;
3421  0059 4a            	dec	a
3422  005a 271e          	jreq	L3122
3423  005c a002          	sub	a,#2
3424  005e 274f          	jreq	L5122
3425  0060 a006          	sub	a,#6
3426  0062 2761          	jreq	L7122
3427  0064 4a            	dec	a
3428  0065 2603          	jrne	L41
3429  0067 cc0100        	jp	L1222
3430  006a               L41:
3431  006a 4a            	dec	a
3432  006b 2603          	jrne	L61
3433  006d cc0137        	jp	L3222
3434  0070               L61:
3435  0070 4a            	dec	a
3436  0071 2603          	jrne	L02
3437  0073 cc016e        	jp	L5222
3438  0076               L02:
3439  0076 ac8a018a      	jpf	L1622
3440  007a               L3122:
3441                     ; 96 					case 0x01:
3441                     ; 97 					  // clear repeat variables
3441                     ; 98 					  Reply_Repeat();
3443  007a 3f00          	clr	_ReplyRepeatFlag
3446  007c 3f00          	clr	_RepeatCnt
3449  007e 3f00          	clr	_RepeatDelayTime
3450                     ; 101 					  if (PowerReplyFlag == TRUE)
3453  0080 b600          	ld	a,_PowerReplyFlag
3454  0082 a101          	cp	a,#1
3455  0084 260e          	jrne	L7622
3456                     ; 103 						PowerReplyFlag = FALSE;
3458  0086 3f00          	clr	_PowerReplyFlag
3459                     ; 106 						StatusReplyFlag = TRUE;
3461  0088 35010000      	mov	_StatusReplyFlag,#1
3462                     ; 107 						StatusReplyCommand = 0x02;
3464  008c 35020000      	mov	_StatusReplyCommand,#2
3466  0090 ac8a018a      	jpf	L1622
3467  0094               L7622:
3468                     ; 112 					  if (StatusReplyFlag == TRUE)
3470  0094 b600          	ld	a,_StatusReplyFlag
3471  0096 a101          	cp	a,#1
3472  0098 2606          	jrne	L3722
3473                     ; 114 						StatusReplyFlag = FALSE;
3475  009a 3f00          	clr	_StatusReplyFlag
3477  009c ac8a018a      	jpf	L1622
3478  00a0               L3722:
3479                     ; 119 					  if (NormalReplyFlag == TRUE)
3481  00a0 b600          	ld	a,_NormalReplyFlag
3482  00a2 a101          	cp	a,#1
3483  00a4 2703          	jreq	L22
3484  00a6 cc018a        	jp	L1622
3485  00a9               L22:
3486                     ; 121 						NormalReplyFlag = FALSE;
3488  00a9 3f00          	clr	_NormalReplyFlag
3489  00ab ac8a018a      	jpf	L1622
3490  00af               L5122:
3491                     ; 130 					case 0x03:
3491                     ; 131 					  //ReplyRepeatFlag = TRUE;
3491                     ; 132 					  Reply_Repeat();
3493  00af 3f00          	clr	_ReplyRepeatFlag
3496  00b1 3f00          	clr	_RepeatCnt
3499  00b3 3f00          	clr	_RepeatDelayTime
3500                     ; 134 					  StatusReplyFlag = TRUE;
3503  00b5 35010000      	mov	_StatusReplyFlag,#1
3504                     ; 135 					  StatusReplyCommand = (RcvData.Header & 0xF0) | 0x02;
3506  00b9 b600          	ld	a,_RcvData
3507  00bb a4f0          	and	a,#240
3508  00bd aa02          	or	a,#2
3509  00bf b700          	ld	_StatusReplyCommand,a
3510                     ; 136 					break;
3512  00c1 ac8a018a      	jpf	L1622
3513  00c5               L7122:
3514                     ; 144 					case 0x09:
3514                     ; 145 					  // reply 
3514                     ; 146 					  Reply_Repeat();
3516  00c5 3f00          	clr	_ReplyRepeatFlag
3519  00c7 3f00          	clr	_RepeatCnt
3522  00c9 3f00          	clr	_RepeatDelayTime
3523                     ; 148 					  NormalReplyFlag = TRUE;
3526  00cb 35010000      	mov	_NormalReplyFlag,#1
3527                     ; 149 					  NormalReplyCommand = RcvData.Header;
3529  00cf 450000        	mov	_NormalReplyCommand,_RcvData
3530                     ; 152 					  AppControlFlag = TRUE;
3532  00d2 35010001      	mov	_AppControlFlag,#1
3533                     ; 156 					  if (RcvData.FirstCmd == 0x00)
3535  00d6 3d04          	tnz	_RcvData+4
3536  00d8 2611          	jrne	L1032
3537                     ; 158 						if (SwitchStatus != 0x00)
3539  00da 3d00          	tnz	_SwitchStatus
3540  00dc 2603          	jrne	L42
3541  00de cc018a        	jp	L1622
3542  00e1               L42:
3543                     ; 160 						  SwitchStatus = 0x00;
3545  00e1 3f00          	clr	_SwitchStatus
3546                     ; 161 						  SwitchInit   = TRUE;
3548  00e3 35010000      	mov	_SwitchInit,#1
3549  00e7 ac8a018a      	jpf	L1622
3550  00eb               L1032:
3551                     ; 166 						if (SwitchStatus != 0x01)
3553  00eb b600          	ld	a,_SwitchStatus
3554  00ed a101          	cp	a,#1
3555  00ef 2603          	jrne	L62
3556  00f1 cc018a        	jp	L1622
3557  00f4               L62:
3558                     ; 168 						  SwitchStatus = 0x01;
3560  00f4 35010000      	mov	_SwitchStatus,#1
3561                     ; 169 						  SwitchInit   = TRUE;
3563  00f8 35010000      	mov	_SwitchInit,#1
3564  00fc ac8a018a      	jpf	L1622
3565  0100               L1222:
3566                     ; 179 					case 0x0A:
3566                     ; 180 					  /* reply */
3566                     ; 181 					  Reply_Repeat();
3568  0100 3f00          	clr	_ReplyRepeatFlag
3571  0102 3f00          	clr	_RepeatCnt
3574  0104 3f00          	clr	_RepeatDelayTime
3575                     ; 183 					  NormalReplyFlag = TRUE;
3578  0106 35010000      	mov	_NormalReplyFlag,#1
3579                     ; 184 					  NormalReplyCommand = RcvData.Header;
3581  010a 450000        	mov	_NormalReplyCommand,_RcvData
3582                     ; 187 					  if (RcvData.GroupClass == 0x01)
3584  010d b603          	ld	a,_RcvData+3
3585  010f a101          	cp	a,#1
3586  0111 2608          	jrne	L1132
3587                     ; 189 						GroupOneOnHour   = RcvData.FirstCmd;
3589  0113 450400        	mov	_GroupOneOnHour,_RcvData+4
3590                     ; 190 						GroupOneOnMinute = RcvData.SecondCmd;
3592  0116 450500        	mov	_GroupOneOnMinute,_RcvData+5
3594  0119 206f          	jra	L1622
3595  011b               L1132:
3596                     ; 193 					  if (RcvData.GroupClass == 0x02)
3598  011b b603          	ld	a,_RcvData+3
3599  011d a102          	cp	a,#2
3600  011f 2608          	jrne	L5132
3601                     ; 195 						GroupTwoOnHour   = RcvData.FirstCmd;
3603  0121 450400        	mov	_GroupTwoOnHour,_RcvData+4
3604                     ; 196 						GroupTwoOnMinute = RcvData.SecondCmd;
3606  0124 450500        	mov	_GroupTwoOnMinute,_RcvData+5
3608  0127 2061          	jra	L1622
3609  0129               L5132:
3610                     ; 198 					  else if (RcvData.GroupClass == 0x03)
3612  0129 b603          	ld	a,_RcvData+3
3613  012b a103          	cp	a,#3
3614  012d 265b          	jrne	L1622
3615                     ; 200 						GroupThreeOnHour   = RcvData.FirstCmd;
3617  012f 450400        	mov	_GroupThreeOnHour,_RcvData+4
3618                     ; 201 						GroupThreeOnMinute = RcvData.SecondCmd;
3620  0132 450500        	mov	_GroupThreeOnMinute,_RcvData+5
3621  0135 2053          	jra	L1622
3622  0137               L3222:
3623                     ; 210 					case 0x0B:
3623                     ; 211 					  // reply 
3623                     ; 212 					  Reply_Repeat();
3625  0137 3f00          	clr	_ReplyRepeatFlag
3628  0139 3f00          	clr	_RepeatCnt
3631  013b 3f00          	clr	_RepeatDelayTime
3632                     ; 214 					  NormalReplyFlag = TRUE;
3635  013d 35010000      	mov	_NormalReplyFlag,#1
3636                     ; 215 					  NormalReplyCommand = RcvData.Header;
3638  0141 450000        	mov	_NormalReplyCommand,_RcvData
3639                     ; 218 					  if (RcvData.GroupClass == 0x01)
3641  0144 b603          	ld	a,_RcvData+3
3642  0146 a101          	cp	a,#1
3643  0148 2608          	jrne	L3232
3644                     ; 220 						GroupOneOffHour   = RcvData.FirstCmd;
3646  014a 450400        	mov	_GroupOneOffHour,_RcvData+4
3647                     ; 221 						GroupOneOffMinute = RcvData.SecondCmd;
3649  014d 450500        	mov	_GroupOneOffMinute,_RcvData+5
3651  0150 2038          	jra	L1622
3652  0152               L3232:
3653                     ; 224 					  if (RcvData.GroupClass == 0x02)
3655  0152 b603          	ld	a,_RcvData+3
3656  0154 a102          	cp	a,#2
3657  0156 2608          	jrne	L7232
3658                     ; 226 						GroupTwoOffHour   = RcvData.FirstCmd;
3660  0158 450400        	mov	_GroupTwoOffHour,_RcvData+4
3661                     ; 227 						GroupTwoOffMinute = RcvData.SecondCmd;
3663  015b 450500        	mov	_GroupTwoOffMinute,_RcvData+5
3665  015e 202a          	jra	L1622
3666  0160               L7232:
3667                     ; 230 					  if (RcvData.GroupClass == 0x03)
3669  0160 b603          	ld	a,_RcvData+3
3670  0162 a103          	cp	a,#3
3671  0164 2624          	jrne	L1622
3672                     ; 232 						GroupThreeOffHour   = RcvData.FirstCmd;
3674  0166 450400        	mov	_GroupThreeOffHour,_RcvData+4
3675                     ; 233 						GroupThreeOffMinute = RcvData.SecondCmd;
3677  0169 450500        	mov	_GroupThreeOffMinute,_RcvData+5
3678  016c 201c          	jra	L1622
3679  016e               L5222:
3680                     ; 242 					case 0x0C:
3680                     ; 243 					  // reply
3680                     ; 244 					  Reply_Repeat();
3682  016e 3f00          	clr	_ReplyRepeatFlag
3685  0170 3f00          	clr	_RepeatCnt
3688  0172 3f00          	clr	_RepeatDelayTime
3689                     ; 246 					  NormalReplyFlag = TRUE;
3692  0174 35010000      	mov	_NormalReplyFlag,#1
3693                     ; 247 					  NormalReplyCommand = RcvData.Header;
3695  0178 450000        	mov	_NormalReplyCommand,_RcvData
3696                     ; 250 					  RealHour    = RcvData.GroupClass;
3698  017b 450300        	mov	_RealHour,_RcvData+3
3699                     ; 251 					  RealMinute  = RcvData.FirstCmd;
3701  017e 450400        	mov	_RealMinute,_RcvData+4
3702                     ; 252 					  RealSecond  = RcvData.SecondCmd;
3704  0181 450500        	mov	_RealSecond,_RcvData+5
3705                     ; 255 					  SecondCnt1 = 0;
3707  0184 3f00          	clr	_SecondCnt1
3708                     ; 256 					  SecondCnt2 = 0;
3710  0186 3f00          	clr	_SecondCnt2
3711                     ; 257 					  SecondFlag = FALSE;
3713  0188 3f00          	clr	_SecondFlag
3714                     ; 258 					break;
3716  018a               L5622:
3717  018a               L1622:
3718                     ; 288 			RcvData.Header			 	= 0x00;
3720  018a 3f00          	clr	_RcvData
3721                     ; 289 			RcvData.TypeH			 	= 0x00;
3723  018c 3f01          	clr	_RcvData+1
3724                     ; 290 			RcvData.TypeL				= 0x00;
3726  018e 3f02          	clr	_RcvData+2
3727                     ; 291 			RcvData.GroupClass	 	= 0x00;
3729  0190 3f03          	clr	_RcvData+3
3730                     ; 292 			RcvData.FirstCmd			= 0x00;
3732  0192 3f04          	clr	_RcvData+4
3733                     ; 293 			RcvData.SecondCmd		= 0x00;
3735  0194 3f05          	clr	_RcvData+5
3736  0196               L5422:
3737                     ; 297 }
3740  0196 85            	popw	x
3741  0197 81            	ret
3806                     	xdef	_Data_Process
3807                     	xdef	_Power_On_Init
3808                     	switch	.ubsct
3809  0000               _PowerOnFlag:
3810  0000 00            	ds.b	1
3811                     	xdef	_PowerOnFlag
3812  0001               _AppControlFlag:
3813  0001 00            	ds.b	1
3814                     	xdef	_AppControlFlag
3815  0002               _BtInitFlag:
3816  0002 00            	ds.b	1
3817                     	xdef	_BtInitFlag
3818                     	xref.b	_GroupThreeOffMinute
3819                     	xref.b	_GroupThreeOffHour
3820                     	xref.b	_GroupTwoOffMinute
3821                     	xref.b	_GroupTwoOffHour
3822                     	xref.b	_GroupOneOffMinute
3823                     	xref.b	_GroupOneOffHour
3824                     	xref.b	_GroupThreeOnMinute
3825                     	xref.b	_GroupThreeOnHour
3826                     	xref.b	_GroupTwoOnMinute
3827                     	xref.b	_GroupTwoOnHour
3828                     	xref.b	_GroupOneOnMinute
3829                     	xref.b	_GroupOneOnHour
3830                     	xref.b	_RealHour
3831                     	xref.b	_RealMinute
3832                     	xref.b	_RealSecond
3833                     	xref.b	_SecondFlag
3834                     	xref.b	_SecondCnt2
3835                     	xref.b	_SecondCnt1
3836                     	xref.b	_SwitchInit
3837                     	xref.b	_SwitchStatus
3838                     	xref.b	_RepeatDelayTime
3839                     	xref.b	_RepeatCnt
3840                     	xref.b	_NormalReplyCommand
3841                     	xref.b	_StatusReplyCommand
3842                     	xref.b	_NormalReplyFlag
3843                     	xref.b	_StatusReplyFlag
3844                     	xref.b	_PowerReplyFlag
3845                     	xref.b	_ReplyRepeatFlag
3846                     	xref.b	_RcvStatus
3847                     	xref.b	_RcvData
3867                     	end
