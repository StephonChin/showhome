   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Generator V4.2.4 - 19 Dec 2007
3274                     ; 31 void Power_On_Init(void)
3274                     ; 32 {
3276                     	switch	.text
3277  0000               _Power_On_Init:
3279  0000 88            	push	a
3280       00000001      OFST:	set	1
3283                     ; 33 	_Uchar	TempCnt = 0;
3285  0001 0f01          	clr	(OFST+0,sp)
3286                     ; 34   RcvStatus = TRUE;
3288  0003 35010000      	mov	_RcvStatus,#1
3289                     ; 35   RcvData.Header = 0xF0;
3291  0007 35f00000      	mov	_RcvData,#240
3292                     ; 36   PowerOnFlag = TRUE;
3294  000b 35010000      	mov	_PowerOnFlag,#1
3295                     ; 39   for (TempCnt = 0; TempCnt < 2; TempCnt++)
3297  000f 0f01          	clr	(OFST+0,sp)
3298  0011               L7122:
3299                     ; 41 	GroupOneOnHour[TempCnt] = 0xFF;
3301  0011 7b01          	ld	a,(OFST+0,sp)
3302  0013 5f            	clrw	x
3303  0014 97            	ld	xl,a
3304  0015 a6ff          	ld	a,#255
3305  0017 e700          	ld	(_GroupOneOnHour,x),a
3306                     ; 42 	GroupOneOnMinute[TempCnt] = 0xFF;
3308  0019 7b01          	ld	a,(OFST+0,sp)
3309  001b 5f            	clrw	x
3310  001c 97            	ld	xl,a
3311  001d a6ff          	ld	a,#255
3312  001f e700          	ld	(_GroupOneOnMinute,x),a
3313                     ; 43 	GroupTwoOnHour[TempCnt] = 0xFF;
3315  0021 7b01          	ld	a,(OFST+0,sp)
3316  0023 5f            	clrw	x
3317  0024 97            	ld	xl,a
3318  0025 a6ff          	ld	a,#255
3319  0027 e700          	ld	(_GroupTwoOnHour,x),a
3320                     ; 44 	GroupTwoOnMinute[TempCnt] = 0xFF;
3322  0029 7b01          	ld	a,(OFST+0,sp)
3323  002b 5f            	clrw	x
3324  002c 97            	ld	xl,a
3325  002d a6ff          	ld	a,#255
3326  002f e700          	ld	(_GroupTwoOnMinute,x),a
3327                     ; 45 	GroupThreeOnHour[TempCnt] = 0xFF;
3329  0031 7b01          	ld	a,(OFST+0,sp)
3330  0033 5f            	clrw	x
3331  0034 97            	ld	xl,a
3332  0035 a6ff          	ld	a,#255
3333  0037 e700          	ld	(_GroupThreeOnHour,x),a
3334                     ; 46 	GroupThreeOnMinute[TempCnt] = 0xFF;
3336  0039 7b01          	ld	a,(OFST+0,sp)
3337  003b 5f            	clrw	x
3338  003c 97            	ld	xl,a
3339  003d a6ff          	ld	a,#255
3340  003f e700          	ld	(_GroupThreeOnMinute,x),a
3341                     ; 48 	GroupOneOffHour[TempCnt] = 0xFF;
3343  0041 7b01          	ld	a,(OFST+0,sp)
3344  0043 5f            	clrw	x
3345  0044 97            	ld	xl,a
3346  0045 a6ff          	ld	a,#255
3347  0047 e700          	ld	(_GroupOneOffHour,x),a
3348                     ; 49 	GroupOneOffMinute[TempCnt] = 0xFF;
3350  0049 7b01          	ld	a,(OFST+0,sp)
3351  004b 5f            	clrw	x
3352  004c 97            	ld	xl,a
3353  004d a6ff          	ld	a,#255
3354  004f e700          	ld	(_GroupOneOffMinute,x),a
3355                     ; 50 	GroupTwoOffHour[TempCnt] = 0xFF;
3357  0051 7b01          	ld	a,(OFST+0,sp)
3358  0053 5f            	clrw	x
3359  0054 97            	ld	xl,a
3360  0055 a6ff          	ld	a,#255
3361  0057 e700          	ld	(_GroupTwoOffHour,x),a
3362                     ; 51 	GroupTwoOffMinute[TempCnt] = 0xFF;
3364  0059 7b01          	ld	a,(OFST+0,sp)
3365  005b 5f            	clrw	x
3366  005c 97            	ld	xl,a
3367  005d a6ff          	ld	a,#255
3368  005f e700          	ld	(_GroupTwoOffMinute,x),a
3369                     ; 52 	GroupThreeOffHour[TempCnt] = 0xFF;
3371  0061 7b01          	ld	a,(OFST+0,sp)
3372  0063 5f            	clrw	x
3373  0064 97            	ld	xl,a
3374  0065 a6ff          	ld	a,#255
3375  0067 e700          	ld	(_GroupThreeOffHour,x),a
3376                     ; 53 	GroupThreeOffMinute[TempCnt] = 0xFF;
3378  0069 7b01          	ld	a,(OFST+0,sp)
3379  006b 5f            	clrw	x
3380  006c 97            	ld	xl,a
3381  006d a6ff          	ld	a,#255
3382  006f e700          	ld	(_GroupThreeOffMinute,x),a
3383                     ; 39   for (TempCnt = 0; TempCnt < 2; TempCnt++)
3385  0071 0c01          	inc	(OFST+0,sp)
3388  0073 7b01          	ld	a,(OFST+0,sp)
3389  0075 a102          	cp	a,#2
3390  0077 2598          	jrult	L7122
3391                     ; 55 }
3394  0079 84            	pop	a
3395  007a 81            	ret
3472                     ; 60 void Data_Process(void)
3472                     ; 61 {
3473                     	switch	.text
3474  007b               _Data_Process:
3476  007b 5203          	subw	sp,#3
3477       00000003      OFST:	set	3
3480                     ; 63   _Uint			TypeBuf = 0;
3482  007d 1e01          	ldw	x,(OFST-2,sp)
3483                     ; 64   _Uchar		GroupBuf = 0;
3485  007f 7b03          	ld	a,(OFST+0,sp)
3486  0081 97            	ld	xl,a
3487                     ; 69     if (RcvStatus || PowerOnFlag)
3489  0082 3d00          	tnz	_RcvStatus
3490  0084 2607          	jrne	L7622
3492  0086 3d00          	tnz	_PowerOnFlag
3493  0088 2603          	jrne	L21
3494  008a cc0271        	jp	L5622
3495  008d               L21:
3496  008d               L7622:
3497                     ; 72         RcvStatus = FALSE;
3499  008d 3f00          	clr	_RcvStatus
3500                     ; 73 		PowerOnFlag = FALSE;
3502  008f 3f00          	clr	_PowerOnFlag
3503                     ; 76         if (BtInitFlag == FALSE)
3505  0091 3d02          	tnz	_BtInitFlag
3506  0093 261b          	jrne	L1722
3507                     ; 78             if (RcvData.Header == 0xF0)
3509  0095 b600          	ld	a,_RcvData
3510  0097 a1f0          	cp	a,#240
3511  0099 2703          	jreq	L41
3512  009b cc0271        	jp	L5622
3513  009e               L41:
3514                     ; 80                 BtInitFlag = TRUE;              // bt's been initialized
3516  009e 35010002      	mov	_BtInitFlag,#1
3517                     ; 83                 PowerReplyFlag = TRUE; 
3519  00a2 35010000      	mov	_PowerReplyFlag,#1
3520                     ; 84                 Reply_Repeat()
3522  00a6 3f00          	clr	_ReplyRepeatFlag
3525  00a8 3f00          	clr	_RepeatCnt
3528  00aa 3f00          	clr	_RepeatDelayTime
3529  00ac ac710271      	jpf	L5622
3530  00b0               L1722:
3531                     ; 94 			TypeBuf = ((_Uint)(RcvData.TypeH >> 8)) + ((_Uint)RcvData.TypeL);
3533  00b0 b602          	ld	a,_RcvData+2
3534  00b2 5f            	clrw	x
3535  00b3 97            	ld	xl,a
3536  00b4 1f01          	ldw	(OFST-2,sp),x
3537                     ; 100 			if ( (TypeBuf & DEVICE_ID) != DEVICE_ID )
3539  00b6 7b01          	ld	a,(OFST-2,sp)
3540  00b8 97            	ld	xl,a
3541  00b9 7b02          	ld	a,(OFST-1,sp)
3542  00bb a401          	and	a,#1
3543  00bd 5f            	clrw	x
3544  00be 02            	rlwa	x,a
3545  00bf a30001        	cpw	x,#1
3546  00c2 260a          	jrne	L01
3547                     ; 102 				return;
3549                     ; 112 				GroupBuf = RcvData.GroupClass;
3551  00c4 b603          	ld	a,_RcvData+3
3552  00c6 6b03          	ld	(OFST+0,sp),a
3553                     ; 113 				if (GroupBuf > 1)
3555  00c8 7b03          	ld	a,(OFST+0,sp)
3556  00ca a102          	cp	a,#2
3557  00cc 2503          	jrult	L3032
3558                     ; 115 					return;		// when GroupClass is overflow
3559  00ce               L01:
3562  00ce 5b03          	addw	sp,#3
3563  00d0 81            	ret
3564  00d1               L3032:
3565                     ; 118 				switch (RcvData.Header & 0x0F)
3567  00d1 b600          	ld	a,_RcvData
3568  00d3 a40f          	and	a,#15
3570                     ; 287 					break;
3571  00d5 4a            	dec	a
3572  00d6 271e          	jreq	L7222
3573  00d8 a002          	sub	a,#2
3574  00da 274f          	jreq	L1322
3575  00dc a006          	sub	a,#6
3576  00de 2765          	jreq	L3322
3577  00e0 4a            	dec	a
3578  00e1 2603          	jrne	L61
3579  00e3 cc0198        	jp	L5322
3580  00e6               L61:
3581  00e6 4a            	dec	a
3582  00e7 2603          	jrne	L02
3583  00e9 cc01f4        	jp	L7322
3584  00ec               L02:
3585  00ec 4a            	dec	a
3586  00ed 2603          	jrne	L22
3587  00ef cc0249        	jp	L1422
3588  00f2               L22:
3589  00f2 ac650265      	jpf	L1032
3590  00f6               L7222:
3591                     ; 123 					case 0x01:
3591                     ; 124 					  // clear repeat variables
3591                     ; 125 					  Reply_Repeat();
3593  00f6 3f00          	clr	_ReplyRepeatFlag
3596  00f8 3f00          	clr	_RepeatCnt
3599  00fa 3f00          	clr	_RepeatDelayTime
3600                     ; 128 					  if (PowerReplyFlag == TRUE)
3603  00fc b600          	ld	a,_PowerReplyFlag
3604  00fe a101          	cp	a,#1
3605  0100 260e          	jrne	L1132
3606                     ; 130 						PowerReplyFlag = FALSE;
3608  0102 3f00          	clr	_PowerReplyFlag
3609                     ; 133 						StatusReplyFlag = TRUE;
3611  0104 35010000      	mov	_StatusReplyFlag,#1
3612                     ; 134 						StatusReplyCommand = 0x02;
3614  0108 35020000      	mov	_StatusReplyCommand,#2
3616  010c ac650265      	jpf	L1032
3617  0110               L1132:
3618                     ; 139 					  if (StatusReplyFlag == TRUE)
3620  0110 b600          	ld	a,_StatusReplyFlag
3621  0112 a101          	cp	a,#1
3622  0114 2606          	jrne	L5132
3623                     ; 141 						StatusReplyFlag = FALSE;
3625  0116 3f00          	clr	_StatusReplyFlag
3627  0118 ac650265      	jpf	L1032
3628  011c               L5132:
3629                     ; 146 					  if (NormalReplyFlag == TRUE)
3631  011c b600          	ld	a,_NormalReplyFlag
3632  011e a101          	cp	a,#1
3633  0120 2703          	jreq	L42
3634  0122 cc0265        	jp	L1032
3635  0125               L42:
3636                     ; 148 						NormalReplyFlag = FALSE;
3638  0125 3f00          	clr	_NormalReplyFlag
3639  0127 ac650265      	jpf	L1032
3640  012b               L1322:
3641                     ; 157 					case 0x03:
3641                     ; 158 					  //ReplyRepeatFlag = TRUE;
3641                     ; 159 					  Reply_Repeat();
3643  012b 3f00          	clr	_ReplyRepeatFlag
3646  012d 3f00          	clr	_RepeatCnt
3649  012f 3f00          	clr	_RepeatDelayTime
3650                     ; 161 					  StatusReplyFlag = TRUE;
3653  0131 35010000      	mov	_StatusReplyFlag,#1
3654                     ; 162 					  StatusReplyCommand = (RcvData.Header & 0xF0) | 0x02;
3656  0135 b600          	ld	a,_RcvData
3657  0137 a4f0          	and	a,#240
3658  0139 aa02          	or	a,#2
3659  013b b700          	ld	_StatusReplyCommand,a
3660                     ; 164 					  StatusBothReplyFlag = TRUE;
3662  013d 35010000      	mov	_StatusBothReplyFlag,#1
3663                     ; 166 					break;
3665  0141 ac650265      	jpf	L1032
3666  0145               L3322:
3667                     ; 174 					case 0x09:
3667                     ; 175 					  // reply 
3667                     ; 176 					  Reply_Repeat();
3669  0145 3f00          	clr	_ReplyRepeatFlag
3672  0147 3f00          	clr	_RepeatCnt
3675  0149 3f00          	clr	_RepeatDelayTime
3676                     ; 178 					  NormalReplyFlag = TRUE;
3679  014b 35010000      	mov	_NormalReplyFlag,#1
3680                     ; 179 					  NormalReplyCommand = RcvData.Header;
3682  014f 450000        	mov	_NormalReplyCommand,_RcvData
3683                     ; 182 					  AppControlFlag = TRUE;
3685  0152 35010001      	mov	_AppControlFlag,#1
3686                     ; 185 					  if (RcvData.FirstCmd == 0x00)
3688  0156 3d04          	tnz	_RcvData+4
3689  0158 261d          	jrne	L3232
3690                     ; 187 						if (SwitchStatus[GroupBuf] != 0x00)
3692  015a 7b03          	ld	a,(OFST+0,sp)
3693  015c 5f            	clrw	x
3694  015d 97            	ld	xl,a
3695  015e 6d00          	tnz	(_SwitchStatus,x)
3696  0160 2603          	jrne	L62
3697  0162 cc0265        	jp	L1032
3698  0165               L62:
3699                     ; 189 						  SwitchStatus[GroupBuf] = 0x00;
3701  0165 7b03          	ld	a,(OFST+0,sp)
3702  0167 5f            	clrw	x
3703  0168 97            	ld	xl,a
3704  0169 6f00          	clr	(_SwitchStatus,x)
3705                     ; 190 						  SwitchInit[GroupBuf]   = TRUE;
3707  016b 7b03          	ld	a,(OFST+0,sp)
3708  016d 5f            	clrw	x
3709  016e 97            	ld	xl,a
3710  016f a601          	ld	a,#1
3711  0171 e700          	ld	(_SwitchInit,x),a
3712  0173 ac650265      	jpf	L1032
3713  0177               L3232:
3714                     ; 195 						if (SwitchStatus[GroupBuf] != 0x01)
3716  0177 7b03          	ld	a,(OFST+0,sp)
3717  0179 5f            	clrw	x
3718  017a 97            	ld	xl,a
3719  017b e600          	ld	a,(_SwitchStatus,x)
3720  017d a101          	cp	a,#1
3721  017f 2603          	jrne	L03
3722  0181 cc0265        	jp	L1032
3723  0184               L03:
3724                     ; 197 						  SwitchStatus[GroupBuf] = 0x01;
3726  0184 7b03          	ld	a,(OFST+0,sp)
3727  0186 5f            	clrw	x
3728  0187 97            	ld	xl,a
3729  0188 a601          	ld	a,#1
3730  018a e700          	ld	(_SwitchStatus,x),a
3731                     ; 198 						  SwitchInit[GroupBuf]   = TRUE;
3733  018c 7b03          	ld	a,(OFST+0,sp)
3734  018e 5f            	clrw	x
3735  018f 97            	ld	xl,a
3736  0190 a601          	ld	a,#1
3737  0192 e700          	ld	(_SwitchInit,x),a
3738  0194 ac650265      	jpf	L1032
3739  0198               L5322:
3740                     ; 208 					case 0x0A:
3740                     ; 209 					  /* reply */
3740                     ; 210 					  Reply_Repeat();
3742  0198 3f00          	clr	_ReplyRepeatFlag
3745  019a 3f00          	clr	_RepeatCnt
3748  019c 3f00          	clr	_RepeatDelayTime
3749                     ; 212 					  NormalReplyFlag = TRUE;
3752  019e 35010000      	mov	_NormalReplyFlag,#1
3753                     ; 213 					  NormalReplyCommand = RcvData.Header;
3755  01a2 450000        	mov	_NormalReplyCommand,_RcvData
3756                     ; 216 					  if (RcvData.GroupClass == 0x01)
3758  01a5 b603          	ld	a,_RcvData+3
3759  01a7 a101          	cp	a,#1
3760  01a9 2614          	jrne	L3332
3761                     ; 218 						GroupOneOnHour[GroupBuf]   = RcvData.FirstCmd;
3763  01ab 7b03          	ld	a,(OFST+0,sp)
3764  01ad 5f            	clrw	x
3765  01ae 97            	ld	xl,a
3766  01af b604          	ld	a,_RcvData+4
3767  01b1 e700          	ld	(_GroupOneOnHour,x),a
3768                     ; 219 						GroupOneOnMinute[GroupBuf] = RcvData.SecondCmd;
3770  01b3 7b03          	ld	a,(OFST+0,sp)
3771  01b5 5f            	clrw	x
3772  01b6 97            	ld	xl,a
3773  01b7 b605          	ld	a,_RcvData+5
3774  01b9 e700          	ld	(_GroupOneOnMinute,x),a
3776  01bb ac650265      	jpf	L1032
3777  01bf               L3332:
3778                     ; 222 					  if (RcvData.GroupClass == 0x02)
3780  01bf b603          	ld	a,_RcvData+3
3781  01c1 a102          	cp	a,#2
3782  01c3 2614          	jrne	L7332
3783                     ; 224 						GroupTwoOnHour[GroupBuf]   = RcvData.FirstCmd;
3785  01c5 7b03          	ld	a,(OFST+0,sp)
3786  01c7 5f            	clrw	x
3787  01c8 97            	ld	xl,a
3788  01c9 b604          	ld	a,_RcvData+4
3789  01cb e700          	ld	(_GroupTwoOnHour,x),a
3790                     ; 225 						GroupTwoOnMinute[GroupBuf] = RcvData.SecondCmd;
3792  01cd 7b03          	ld	a,(OFST+0,sp)
3793  01cf 5f            	clrw	x
3794  01d0 97            	ld	xl,a
3795  01d1 b605          	ld	a,_RcvData+5
3796  01d3 e700          	ld	(_GroupTwoOnMinute,x),a
3798  01d5 ac650265      	jpf	L1032
3799  01d9               L7332:
3800                     ; 227 					  else if (RcvData.GroupClass == 0x03)
3802  01d9 b603          	ld	a,_RcvData+3
3803  01db a103          	cp	a,#3
3804  01dd 2703          	jreq	L23
3805  01df cc0265        	jp	L1032
3806  01e2               L23:
3807                     ; 229 						GroupThreeOnHour[GroupBuf]   = RcvData.FirstCmd;
3809  01e2 7b03          	ld	a,(OFST+0,sp)
3810  01e4 5f            	clrw	x
3811  01e5 97            	ld	xl,a
3812  01e6 b604          	ld	a,_RcvData+4
3813  01e8 e700          	ld	(_GroupThreeOnHour,x),a
3814                     ; 230 						GroupThreeOnMinute[GroupBuf] = RcvData.SecondCmd;
3816  01ea 7b03          	ld	a,(OFST+0,sp)
3817  01ec 5f            	clrw	x
3818  01ed 97            	ld	xl,a
3819  01ee b605          	ld	a,_RcvData+5
3820  01f0 e700          	ld	(_GroupThreeOnMinute,x),a
3821  01f2 2071          	jra	L1032
3822  01f4               L7322:
3823                     ; 239 					case 0x0B:
3823                     ; 240 					  // reply 
3823                     ; 241 					  Reply_Repeat();
3825  01f4 3f00          	clr	_ReplyRepeatFlag
3828  01f6 3f00          	clr	_RepeatCnt
3831  01f8 3f00          	clr	_RepeatDelayTime
3832                     ; 243 					  NormalReplyFlag = TRUE;
3835  01fa 35010000      	mov	_NormalReplyFlag,#1
3836                     ; 244 					  NormalReplyCommand = RcvData.Header;
3838  01fe 450000        	mov	_NormalReplyCommand,_RcvData
3839                     ; 247 					  if (RcvData.GroupClass == 0x01)
3841  0201 b603          	ld	a,_RcvData+3
3842  0203 a101          	cp	a,#1
3843  0205 2612          	jrne	L5432
3844                     ; 249 						GroupOneOffHour[GroupBuf]   = RcvData.FirstCmd;
3846  0207 7b03          	ld	a,(OFST+0,sp)
3847  0209 5f            	clrw	x
3848  020a 97            	ld	xl,a
3849  020b b604          	ld	a,_RcvData+4
3850  020d e700          	ld	(_GroupOneOffHour,x),a
3851                     ; 250 						GroupOneOffMinute[GroupBuf] = RcvData.SecondCmd;
3853  020f 7b03          	ld	a,(OFST+0,sp)
3854  0211 5f            	clrw	x
3855  0212 97            	ld	xl,a
3856  0213 b605          	ld	a,_RcvData+5
3857  0215 e700          	ld	(_GroupOneOffMinute,x),a
3859  0217 204c          	jra	L1032
3860  0219               L5432:
3861                     ; 253 					  if (RcvData.GroupClass == 0x02)
3863  0219 b603          	ld	a,_RcvData+3
3864  021b a102          	cp	a,#2
3865  021d 2612          	jrne	L1532
3866                     ; 255 						GroupTwoOffHour[GroupBuf]   = RcvData.FirstCmd;
3868  021f 7b03          	ld	a,(OFST+0,sp)
3869  0221 5f            	clrw	x
3870  0222 97            	ld	xl,a
3871  0223 b604          	ld	a,_RcvData+4
3872  0225 e700          	ld	(_GroupTwoOffHour,x),a
3873                     ; 256 						GroupTwoOffMinute[GroupBuf] = RcvData.SecondCmd;
3875  0227 7b03          	ld	a,(OFST+0,sp)
3876  0229 5f            	clrw	x
3877  022a 97            	ld	xl,a
3878  022b b605          	ld	a,_RcvData+5
3879  022d e700          	ld	(_GroupTwoOffMinute,x),a
3881  022f 2034          	jra	L1032
3882  0231               L1532:
3883                     ; 259 					  if (RcvData.GroupClass == 0x03)
3885  0231 b603          	ld	a,_RcvData+3
3886  0233 a103          	cp	a,#3
3887  0235 262e          	jrne	L1032
3888                     ; 261 						GroupThreeOffHour[GroupBuf]   = RcvData.FirstCmd;
3890  0237 7b03          	ld	a,(OFST+0,sp)
3891  0239 5f            	clrw	x
3892  023a 97            	ld	xl,a
3893  023b b604          	ld	a,_RcvData+4
3894  023d e700          	ld	(_GroupThreeOffHour,x),a
3895                     ; 262 						GroupThreeOffMinute[GroupBuf] = RcvData.SecondCmd;
3897  023f 7b03          	ld	a,(OFST+0,sp)
3898  0241 5f            	clrw	x
3899  0242 97            	ld	xl,a
3900  0243 b605          	ld	a,_RcvData+5
3901  0245 e700          	ld	(_GroupThreeOffMinute,x),a
3902  0247 201c          	jra	L1032
3903  0249               L1422:
3904                     ; 271 					case 0x0C:
3904                     ; 272 					  // reply
3904                     ; 273 					  Reply_Repeat();
3906  0249 3f00          	clr	_ReplyRepeatFlag
3909  024b 3f00          	clr	_RepeatCnt
3912  024d 3f00          	clr	_RepeatDelayTime
3913                     ; 275 					  NormalReplyFlag = TRUE;
3916  024f 35010000      	mov	_NormalReplyFlag,#1
3917                     ; 276 					  NormalReplyCommand = RcvData.Header;
3919  0253 450000        	mov	_NormalReplyCommand,_RcvData
3920                     ; 279 					  RealHour    = RcvData.GroupClass;
3922  0256 450300        	mov	_RealHour,_RcvData+3
3923                     ; 280 					  RealMinute  = RcvData.FirstCmd;
3925  0259 450400        	mov	_RealMinute,_RcvData+4
3926                     ; 281 					  RealSecond  = RcvData.SecondCmd;
3928  025c 450500        	mov	_RealSecond,_RcvData+5
3929                     ; 284 					  SecondCnt1 = 0;
3931  025f 3f00          	clr	_SecondCnt1
3932                     ; 285 					  SecondCnt2 = 0;
3934  0261 3f00          	clr	_SecondCnt2
3935                     ; 286 					  SecondFlag = FALSE;
3937  0263 3f00          	clr	_SecondFlag
3938                     ; 287 					break;
3940  0265               L7032:
3941  0265               L1032:
3942                     ; 292 			RcvData.Header			 	= 0x00;
3944  0265 3f00          	clr	_RcvData
3945                     ; 293 			RcvData.TypeH			 	= 0x00;
3947  0267 3f01          	clr	_RcvData+1
3948                     ; 294 			RcvData.TypeL				= 0x00;
3950  0269 3f02          	clr	_RcvData+2
3951                     ; 295 			RcvData.GroupClass	 	= 0x00;
3953  026b 3f03          	clr	_RcvData+3
3954                     ; 296 			RcvData.FirstCmd			= 0x00;
3956  026d 3f04          	clr	_RcvData+4
3957                     ; 297 			RcvData.SecondCmd		= 0x00;
3959  026f 3f05          	clr	_RcvData+5
3960  0271               L5622:
3961                     ; 301 }
3963  0271 acce00ce      	jpf	L01
4028                     	xdef	_Data_Process
4029                     	xdef	_Power_On_Init
4030                     	switch	.ubsct
4031  0000               _PowerOnFlag:
4032  0000 00            	ds.b	1
4033                     	xdef	_PowerOnFlag
4034  0001               _AppControlFlag:
4035  0001 00            	ds.b	1
4036                     	xdef	_AppControlFlag
4037  0002               _BtInitFlag:
4038  0002 00            	ds.b	1
4039                     	xdef	_BtInitFlag
4040                     	xref.b	_GroupThreeOffMinute
4041                     	xref.b	_GroupThreeOffHour
4042                     	xref.b	_GroupTwoOffMinute
4043                     	xref.b	_GroupTwoOffHour
4044                     	xref.b	_GroupOneOffMinute
4045                     	xref.b	_GroupOneOffHour
4046                     	xref.b	_GroupThreeOnMinute
4047                     	xref.b	_GroupThreeOnHour
4048                     	xref.b	_GroupTwoOnMinute
4049                     	xref.b	_GroupTwoOnHour
4050                     	xref.b	_GroupOneOnMinute
4051                     	xref.b	_GroupOneOnHour
4052                     	xref.b	_RealHour
4053                     	xref.b	_RealMinute
4054                     	xref.b	_RealSecond
4055                     	xref.b	_SecondFlag
4056                     	xref.b	_SecondCnt2
4057                     	xref.b	_SecondCnt1
4058                     	xref.b	_SwitchInit
4059                     	xref.b	_SwitchStatus
4060                     	xref.b	_RepeatDelayTime
4061                     	xref.b	_RepeatCnt
4062                     	xref.b	_NormalReplyCommand
4063                     	xref.b	_StatusReplyCommand
4064                     	xref.b	_StatusBothReplyFlag
4065                     	xref.b	_NormalReplyFlag
4066                     	xref.b	_StatusReplyFlag
4067                     	xref.b	_PowerReplyFlag
4068                     	xref.b	_ReplyRepeatFlag
4069                     	xref.b	_RcvStatus
4070                     	xref.b	_RcvData
4090                     	end
