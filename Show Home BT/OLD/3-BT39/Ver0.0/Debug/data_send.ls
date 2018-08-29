   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Generator V4.2.4 - 19 Dec 2007
3261                     ; 41 void Respond_App(void)
3261                     ; 42 {
3263                     	switch	.text
3264  0000               _Respond_App:
3268                     ; 43     if (PowerReplyFlag)// power on
3270  0000 3d08          	tnz	_PowerReplyFlag
3271  0002 273f          	jreq	L1122
3272                     ; 45       if (ReplyRepeatFlag)  //send repeat
3274  0004 3d09          	tnz	_ReplyRepeatFlag
3275  0006 271f          	jreq	L3122
3276                     ; 48           ReplyRepeatFlag = FALSE;
3278  0008 3f09          	clr	_ReplyRepeatFlag
3279                     ; 51           Respond_Byte(PACKAGE_HEAD);   // 0xFD
3281  000a a6fd          	ld	a,#253
3282  000c cd00b5        	call	_Respond_Byte
3284                     ; 52           Respond_Byte(0x01);  // 0x01
3286  000f a601          	ld	a,#1
3287  0011 cd00b5        	call	_Respond_Byte
3289                     ; 53           Respond_Byte(0x00); 
3291  0014 4f            	clr	a
3292  0015 cd00b5        	call	_Respond_Byte
3294                     ; 54           Respond_Byte(0x00);
3296  0018 4f            	clr	a
3297  0019 cd00b5        	call	_Respond_Byte
3299                     ; 55           Respond_Byte(0x00);
3301  001c 4f            	clr	a
3302  001d cd00b5        	call	_Respond_Byte
3304                     ; 56           Respond_Byte(PACKAGE_TAIL);   // 0xFE
3306  0020 a6fe          	ld	a,#254
3307  0022 cd00b5        	call	_Respond_Byte
3310  0025 205e          	jra	L3222
3311  0027               L3122:
3312                     ; 61           RepeatDelayTime++;
3314  0027 3c02          	inc	_RepeatDelayTime
3315                     ; 62           if (RepeatDelayTime > 49) // 50 * 10ms = 500ms
3317  0029 b602          	ld	a,_RepeatDelayTime
3318  002b a132          	cp	a,#50
3319  002d 2556          	jrult	L3222
3320                     ; 64             RepeatDelayTime = 0;
3322  002f 3f02          	clr	_RepeatDelayTime
3323                     ; 65             ReplyRepeatFlag =TRUE;
3325  0031 35010009      	mov	_ReplyRepeatFlag,#1
3326                     ; 67             RepeatCnt++;
3328  0035 3c03          	inc	_RepeatCnt
3329                     ; 68             if (RepeatCnt > 6)  //send 10 times
3331  0037 b603          	ld	a,_RepeatCnt
3332  0039 a107          	cp	a,#7
3333  003b 2548          	jrult	L3222
3334                     ; 70               RepeatCnt = 0;
3336  003d 3f03          	clr	_RepeatCnt
3337                     ; 71               PowerReplyFlag = FALSE;
3339  003f 3f08          	clr	_PowerReplyFlag
3340  0041 2042          	jra	L3222
3341  0043               L1122:
3342                     ; 79     if (StatusReplyFlag) 
3344  0043 3d07          	tnz	_StatusReplyFlag
3345  0045 273a          	jreq	L5222
3346                     ; 81         if (ReplyRepeatFlag)  //send repeat
3348  0047 3d09          	tnz	_ReplyRepeatFlag
3349  0049 271a          	jreq	L7222
3350                     ; 84           ReplyRepeatFlag = FALSE;
3352  004b 3f09          	clr	_ReplyRepeatFlag
3353                     ; 87           Respond_Byte(PACKAGE_HEAD);   // 0xFD
3355  004d a6fd          	ld	a,#253
3356  004f ad64          	call	_Respond_Byte
3358                     ; 88           Respond_Byte(StatusReplyCommand);  // 0x02 | (flag | 0x02)
3360  0051 b605          	ld	a,_StatusReplyCommand
3361  0053 ad60          	call	_Respond_Byte
3363                     ; 89           Respond_Byte(0x00); 
3365  0055 4f            	clr	a
3366  0056 ad5d          	call	_Respond_Byte
3368                     ; 90           Respond_Byte(ReplyStatus);
3370  0058 b601          	ld	a,_ReplyStatus
3371  005a ad59          	call	_Respond_Byte
3373                     ; 91           Respond_Byte(0x00);
3375  005c 4f            	clr	a
3376  005d ad56          	call	_Respond_Byte
3378                     ; 92           Respond_Byte(PACKAGE_TAIL);   // 0xFE
3380  005f a6fe          	ld	a,#254
3381  0061 ad52          	call	_Respond_Byte
3384  0063 2020          	jra	L3222
3385  0065               L7222:
3386                     ; 97           RepeatDelayTime++;
3388  0065 3c02          	inc	_RepeatDelayTime
3389                     ; 98           if (RepeatDelayTime > 4) // 80 * 10ms = 800ms
3391  0067 b602          	ld	a,_RepeatDelayTime
3392  0069 a105          	cp	a,#5
3393  006b 2518          	jrult	L3222
3394                     ; 100             RepeatDelayTime = 0;
3396  006d 3f02          	clr	_RepeatDelayTime
3397                     ; 101             ReplyRepeatFlag =TRUE;
3399  006f 35010009      	mov	_ReplyRepeatFlag,#1
3400                     ; 103             RepeatCnt++;
3402  0073 3c03          	inc	_RepeatCnt
3403                     ; 104             if (RepeatCnt > 2)  //send 3 times
3405  0075 b603          	ld	a,_RepeatCnt
3406  0077 a103          	cp	a,#3
3407  0079 250a          	jrult	L3222
3408                     ; 106               RepeatCnt = 0;
3410  007b 3f03          	clr	_RepeatCnt
3411                     ; 107               StatusReplyFlag = FALSE;
3413  007d 3f07          	clr	_StatusReplyFlag
3414  007f 2004          	jra	L3222
3415  0081               L5222:
3416                     ; 151       RepeatDelayTime = 0;
3418  0081 3f02          	clr	_RepeatDelayTime
3419                     ; 152       RepeatCnt = 0;
3421  0083 3f03          	clr	_RepeatCnt
3422  0085               L3222:
3423                     ; 154 }
3426  0085 81            	ret
3472                     ; 160 void Respond_Str(_Uchar *RspdStr)
3472                     ; 161 {
3473                     	switch	.text
3474  0086               _Respond_Str:
3476  0086 89            	pushw	x
3477  0087 88            	push	a
3478       00000001      OFST:	set	1
3481                     ; 162     _Uchar  ErrCnt = 0;
3483  0088 0f01          	clr	(OFST+0,sp)
3485  008a 2021          	jra	L7622
3486  008c               L3622:
3487                     ; 166         ErrCnt = 200;
3489  008c a6c8          	ld	a,#200
3490  008e 6b01          	ld	(OFST+0,sp),a
3492  0090 2002          	jra	L7722
3493  0092               L3722:
3494                     ; 169             ErrCnt--;
3496  0092 0a01          	dec	(OFST+0,sp)
3497  0094               L7722:
3498                     ; 167         while (!UART_SEND_FLAG && ErrCnt)		
3500                     	btst	_UART_SEND_FLAG
3501  0099 2504          	jrult	L3032
3503  009b 0d01          	tnz	(OFST+0,sp)
3504  009d 26f3          	jrne	L3722
3505  009f               L3032:
3506                     ; 171         UART_REGISTER = *RspdStr++;
3508  009f 1e02          	ldw	x,(OFST+1,sp)
3509  00a1 1c0001        	addw	x,#1
3510  00a4 1f02          	ldw	(OFST+1,sp),x
3511  00a6 1d0001        	subw	x,#1
3512  00a9 f6            	ld	a,(x)
3513  00aa c75231        	ld	_UART1_DR,a
3514  00ad               L7622:
3515                     ; 164     while (*RspdStr != '\0')
3517  00ad 1e02          	ldw	x,(OFST+1,sp)
3518  00af 7d            	tnz	(x)
3519  00b0 26da          	jrne	L3622
3520                     ; 173 }   
3523  00b2 5b03          	addw	sp,#3
3524  00b4 81            	ret
3560                     ; 178 void Respond_Byte(_Uchar RspdByte)
3560                     ; 179 {
3561                     	switch	.text
3562  00b5               _Respond_Byte:
3566                     ; 181     UART_REGISTER = RspdByte;
3568  00b5 c75231        	ld	_UART1_DR,a
3570  00b8               L7232:
3571                     ; 182     while (!UART_SEND_FLAG);
3573                     	btst	_UART_SEND_FLAG
3574  00bd 24f9          	jruge	L7232
3575                     ; 183 }
3578  00bf 81            	ret
3717                     	xdef	_Respond_App
3718                     	switch	.ubsct
3719  0000               _ReplyGroup:
3720  0000 00            	ds.b	1
3721                     	xdef	_ReplyGroup
3722  0001               _ReplyStatus:
3723  0001 00            	ds.b	1
3724                     	xdef	_ReplyStatus
3725  0002               _RepeatDelayTime:
3726  0002 00            	ds.b	1
3727                     	xdef	_RepeatDelayTime
3728  0003               _RepeatCnt:
3729  0003 00            	ds.b	1
3730                     	xdef	_RepeatCnt
3731  0004               _NormalReplyCommand:
3732  0004 00            	ds.b	1
3733                     	xdef	_NormalReplyCommand
3734  0005               _StatusReplyCommand:
3735  0005 00            	ds.b	1
3736                     	xdef	_StatusReplyCommand
3737  0006               _NormalReplyFlag:
3738  0006 00            	ds.b	1
3739                     	xdef	_NormalReplyFlag
3740  0007               _StatusReplyFlag:
3741  0007 00            	ds.b	1
3742                     	xdef	_StatusReplyFlag
3743  0008               _PowerReplyFlag:
3744  0008 00            	ds.b	1
3745                     	xdef	_PowerReplyFlag
3746  0009               _ReplyRepeatFlag:
3747  0009 00            	ds.b	1
3748                     	xdef	_ReplyRepeatFlag
3749                     	xdef	_Respond_Byte
3750                     	xdef	_Respond_Str
3770                     	end
