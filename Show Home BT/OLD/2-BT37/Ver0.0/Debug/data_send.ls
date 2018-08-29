   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Generator V4.2.4 - 19 Dec 2007
3264                     ; 42 void Respond_App(void)
3264                     ; 43 {
3266                     	switch	.text
3267  0000               _Respond_App:
3271                     ; 44     if (PowerReplyFlag)// power on
3273  0000 3d09          	tnz	_PowerReplyFlag
3274  0002 2749          	jreq	L1122
3275                     ; 46       if (ReplyRepeatFlag)  //send repeat
3277  0004 3d0a          	tnz	_ReplyRepeatFlag
3278  0006 2721          	jreq	L3122
3279                     ; 49           ReplyRepeatFlag = FALSE;
3281  0008 3f0a          	clr	_ReplyRepeatFlag
3282                     ; 52           Respond_Byte(PACKAGE_HEAD);   // 0xFD
3284  000a a6fd          	ld	a,#253
3285  000c cd0116        	call	_Respond_Byte
3287                     ; 53           Respond_Byte(0x01);  // 0x01
3289  000f a601          	ld	a,#1
3290  0011 cd0116        	call	_Respond_Byte
3292                     ; 54           Respond_Byte(0x00); 
3294  0014 4f            	clr	a
3295  0015 cd0116        	call	_Respond_Byte
3297                     ; 55           Respond_Byte(0x00);
3299  0018 4f            	clr	a
3300  0019 cd0116        	call	_Respond_Byte
3302                     ; 56           Respond_Byte(0x00);
3304  001c 4f            	clr	a
3305  001d cd0116        	call	_Respond_Byte
3307                     ; 57           Respond_Byte(PACKAGE_TAIL);   // 0xFE
3309  0020 a6fe          	ld	a,#254
3310  0022 cd0116        	call	_Respond_Byte
3313  0025 ace600e6      	jpf	L3222
3314  0029               L3122:
3315                     ; 62           RepeatDelayTime++;
3317  0029 3c02          	inc	_RepeatDelayTime
3318                     ; 63           if (RepeatDelayTime > 49) // 50 * 10ms = 500ms
3320  002b b602          	ld	a,_RepeatDelayTime
3321  002d a132          	cp	a,#50
3322  002f 2403          	jruge	L6
3323  0031 cc00e6        	jp	L3222
3324  0034               L6:
3325                     ; 65             RepeatDelayTime = 0;
3327  0034 3f02          	clr	_RepeatDelayTime
3328                     ; 66             ReplyRepeatFlag =TRUE;
3330  0036 3501000a      	mov	_ReplyRepeatFlag,#1
3331                     ; 68             RepeatCnt++;
3333  003a 3c03          	inc	_RepeatCnt
3334                     ; 69             if (RepeatCnt > 6)  //send 10 times
3336  003c b603          	ld	a,_RepeatCnt
3337  003e a107          	cp	a,#7
3338  0040 2403          	jruge	L01
3339  0042 cc00e6        	jp	L3222
3340  0045               L01:
3341                     ; 71               RepeatCnt = 0;
3343  0045 3f03          	clr	_RepeatCnt
3344                     ; 72               PowerReplyFlag = FALSE;
3346  0047 3f09          	clr	_PowerReplyFlag
3347  0049 ace600e6      	jpf	L3222
3348  004d               L1122:
3349                     ; 80     if (StatusReplyFlag) 
3351  004d 3d08          	tnz	_StatusReplyFlag
3352  004f 2603          	jrne	L21
3353  0051 cc00e2        	jp	L5222
3354  0054               L21:
3355                     ; 82 		if (StatusBothReplyFlag == FALSE)
3357  0054 3d06          	tnz	_StatusBothReplyFlag
3358  0056 2641          	jrne	L7222
3359                     ; 84 			if (ReplyRepeatFlag)  //send repeat
3361  0058 3d0a          	tnz	_ReplyRepeatFlag
3362  005a 2721          	jreq	L1322
3363                     ; 87 				ReplyRepeatFlag = FALSE;
3365  005c 3f0a          	clr	_ReplyRepeatFlag
3366                     ; 90 				Respond_Byte(PACKAGE_HEAD);   // 0xFD
3368  005e a6fd          	ld	a,#253
3369  0060 cd0116        	call	_Respond_Byte
3371                     ; 91 				Respond_Byte(StatusReplyCommand);  // 0x02 | (flag | 0x02)
3373  0063 b605          	ld	a,_StatusReplyCommand
3374  0065 cd0116        	call	_Respond_Byte
3376                     ; 92 				Respond_Byte(ReplyGroup); 
3378  0068 b600          	ld	a,_ReplyGroup
3379  006a cd0116        	call	_Respond_Byte
3381                     ; 93 				Respond_Byte(ReplyStatus);
3383  006d b601          	ld	a,_ReplyStatus
3384  006f cd0116        	call	_Respond_Byte
3386                     ; 94 				Respond_Byte(0x00);
3388  0072 4f            	clr	a
3389  0073 cd0116        	call	_Respond_Byte
3391                     ; 95 				Respond_Byte(PACKAGE_TAIL);   // 0xFE
3393  0076 a6fe          	ld	a,#254
3394  0078 cd0116        	call	_Respond_Byte
3397  007b 2069          	jra	L3222
3398  007d               L1322:
3399                     ; 100 				RepeatDelayTime++;
3401  007d 3c02          	inc	_RepeatDelayTime
3402                     ; 101 				if (RepeatDelayTime > 4) // 5 * 10ms = 50ms
3404  007f b602          	ld	a,_RepeatDelayTime
3405  0081 a105          	cp	a,#5
3406  0083 2561          	jrult	L3222
3407                     ; 103 					RepeatDelayTime = 0;
3409  0085 3f02          	clr	_RepeatDelayTime
3410                     ; 104 					ReplyRepeatFlag =TRUE;
3412  0087 3501000a      	mov	_ReplyRepeatFlag,#1
3413                     ; 106 					RepeatCnt++;
3415  008b 3c03          	inc	_RepeatCnt
3416                     ; 107 					if (RepeatCnt > 2)  //send 3 times
3418  008d b603          	ld	a,_RepeatCnt
3419  008f a103          	cp	a,#3
3420  0091 2553          	jrult	L3222
3421                     ; 109 					RepeatCnt = 0;
3423  0093 3f03          	clr	_RepeatCnt
3424                     ; 110 					StatusReplyFlag = FALSE;
3426  0095 3f08          	clr	_StatusReplyFlag
3427  0097 204d          	jra	L3222
3428  0099               L7222:
3429                     ; 120 			if (ReplyRepeatFlag)  //send repeat
3431  0099 3d0a          	tnz	_ReplyRepeatFlag
3432  009b 271f          	jreq	L3422
3433                     ; 123 				ReplyRepeatFlag = FALSE;
3435  009d 3f0a          	clr	_ReplyRepeatFlag
3436                     ; 126 				Respond_Byte(PACKAGE_HEAD);   // 0xFD
3438  009f a6fd          	ld	a,#253
3439  00a1 ad73          	call	_Respond_Byte
3441                     ; 127 				Respond_Byte(StatusReplyCommand);  // 0x02 | (flag | 0x02)
3443  00a3 b605          	ld	a,_StatusReplyCommand
3444  00a5 ad6f          	call	_Respond_Byte
3446                     ; 128 				Respond_Byte(ReplyGroup); 
3448  00a7 b600          	ld	a,_ReplyGroup
3449  00a9 ad6b          	call	_Respond_Byte
3451                     ; 129 				Respond_Byte(SwitchStatus[ReplyGroup]);
3453  00ab b600          	ld	a,_ReplyGroup
3454  00ad 5f            	clrw	x
3455  00ae 97            	ld	xl,a
3456  00af e600          	ld	a,(_SwitchStatus,x)
3457  00b1 ad63          	call	_Respond_Byte
3459                     ; 130 				Respond_Byte(0x00);
3461  00b3 4f            	clr	a
3462  00b4 ad60          	call	_Respond_Byte
3464                     ; 131 				Respond_Byte(PACKAGE_TAIL);   // 0xFE
3466  00b6 a6fe          	ld	a,#254
3467  00b8 ad5c          	call	_Respond_Byte
3470  00ba 202a          	jra	L3222
3471  00bc               L3422:
3472                     ; 136 				RepeatDelayTime++;
3474  00bc 3c02          	inc	_RepeatDelayTime
3475                     ; 137 				if (RepeatDelayTime > 4) // 5 * 10ms = 50ms
3477  00be b602          	ld	a,_RepeatDelayTime
3478  00c0 a105          	cp	a,#5
3479  00c2 2522          	jrult	L3222
3480                     ; 139 					RepeatDelayTime = 0;
3482  00c4 3f02          	clr	_RepeatDelayTime
3483                     ; 140 					ReplyRepeatFlag =TRUE;
3485  00c6 3501000a      	mov	_ReplyRepeatFlag,#1
3486                     ; 142 					ReplyGroup++;
3488  00ca 3c00          	inc	_ReplyGroup
3489                     ; 143 					if (ReplyGroup > 1)
3491  00cc b600          	ld	a,_ReplyGroup
3492  00ce a102          	cp	a,#2
3493  00d0 2502          	jrult	L1522
3494                     ; 145 						ReplyGroup = 0;
3496  00d2 3f00          	clr	_ReplyGroup
3497  00d4               L1522:
3498                     ; 148 					RepeatCnt++;
3500  00d4 3c03          	inc	_RepeatCnt
3501                     ; 149 					if (RepeatCnt > 5)  //send 3 times
3503  00d6 b603          	ld	a,_RepeatCnt
3504  00d8 a106          	cp	a,#6
3505  00da 250a          	jrult	L3222
3506                     ; 151 					RepeatCnt = 0;
3508  00dc 3f03          	clr	_RepeatCnt
3509                     ; 152 					StatusReplyFlag = FALSE;
3511  00de 3f08          	clr	_StatusReplyFlag
3512  00e0 2004          	jra	L3222
3513  00e2               L5222:
3514                     ; 197       RepeatDelayTime = 0;
3516  00e2 3f02          	clr	_RepeatDelayTime
3517                     ; 198       RepeatCnt = 0;
3519  00e4 3f03          	clr	_RepeatCnt
3520  00e6               L3222:
3521                     ; 200 }
3524  00e6 81            	ret
3570                     ; 206 void Respond_Str(_Uchar *RspdStr)
3570                     ; 207 {
3571                     	switch	.text
3572  00e7               _Respond_Str:
3574  00e7 89            	pushw	x
3575  00e8 88            	push	a
3576       00000001      OFST:	set	1
3579                     ; 208     _Uchar  ErrCnt = 0;
3581  00e9 0f01          	clr	(OFST+0,sp)
3583  00eb 2021          	jra	L5032
3584  00ed               L1032:
3585                     ; 212         ErrCnt = 200;
3587  00ed a6c8          	ld	a,#200
3588  00ef 6b01          	ld	(OFST+0,sp),a
3590  00f1 2002          	jra	L5132
3591  00f3               L1132:
3592                     ; 215             ErrCnt--;
3594  00f3 0a01          	dec	(OFST+0,sp)
3595  00f5               L5132:
3596                     ; 213         while (!UART_SEND_FLAG && ErrCnt)		
3598                     	btst	_UART_SEND_FLAG
3599  00fa 2504          	jrult	L1232
3601  00fc 0d01          	tnz	(OFST+0,sp)
3602  00fe 26f3          	jrne	L1132
3603  0100               L1232:
3604                     ; 217         UART_REGISTER = *RspdStr++;
3606  0100 1e02          	ldw	x,(OFST+1,sp)
3607  0102 1c0001        	addw	x,#1
3608  0105 1f02          	ldw	(OFST+1,sp),x
3609  0107 1d0001        	subw	x,#1
3610  010a f6            	ld	a,(x)
3611  010b c75231        	ld	_UART1_DR,a
3612  010e               L5032:
3613                     ; 210     while (*RspdStr != '\0')
3615  010e 1e02          	ldw	x,(OFST+1,sp)
3616  0110 7d            	tnz	(x)
3617  0111 26da          	jrne	L1032
3618                     ; 219 }   
3621  0113 5b03          	addw	sp,#3
3622  0115 81            	ret
3658                     ; 224 void Respond_Byte(_Uchar RspdByte)
3658                     ; 225 {
3659                     	switch	.text
3660  0116               _Respond_Byte:
3664                     ; 227     UART_REGISTER = RspdByte;
3666  0116 c75231        	ld	_UART1_DR,a
3668  0119               L5432:
3669                     ; 228     while (!UART_SEND_FLAG);
3671                     	btst	_UART_SEND_FLAG
3672  011e 24f9          	jruge	L5432
3673                     ; 229 }
3676  0120 81            	ret
3826                     	xdef	_Respond_App
3827                     	switch	.ubsct
3828  0000               _ReplyGroup:
3829  0000 00            	ds.b	1
3830                     	xdef	_ReplyGroup
3831  0001               _ReplyStatus:
3832  0001 00            	ds.b	1
3833                     	xdef	_ReplyStatus
3834  0002               _RepeatDelayTime:
3835  0002 00            	ds.b	1
3836                     	xdef	_RepeatDelayTime
3837  0003               _RepeatCnt:
3838  0003 00            	ds.b	1
3839                     	xdef	_RepeatCnt
3840  0004               _NormalReplyCommand:
3841  0004 00            	ds.b	1
3842                     	xdef	_NormalReplyCommand
3843  0005               _StatusReplyCommand:
3844  0005 00            	ds.b	1
3845                     	xdef	_StatusReplyCommand
3846  0006               _StatusBothReplyFlag:
3847  0006 00            	ds.b	1
3848                     	xdef	_StatusBothReplyFlag
3849  0007               _NormalReplyFlag:
3850  0007 00            	ds.b	1
3851                     	xdef	_NormalReplyFlag
3852  0008               _StatusReplyFlag:
3853  0008 00            	ds.b	1
3854                     	xdef	_StatusReplyFlag
3855  0009               _PowerReplyFlag:
3856  0009 00            	ds.b	1
3857                     	xdef	_PowerReplyFlag
3858  000a               _ReplyRepeatFlag:
3859  000a 00            	ds.b	1
3860                     	xdef	_ReplyRepeatFlag
3861                     	xref.b	_SwitchStatus
3862                     	xdef	_Respond_Byte
3863                     	xdef	_Respond_Str
3883                     	end
