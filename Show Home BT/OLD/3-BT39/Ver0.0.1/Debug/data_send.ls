   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Generator V4.2.4 - 19 Dec 2007
3262                     ; 41 void Respond_App(void)
3262                     ; 42 {
3264                     	switch	.text
3265  0000               _Respond_App:
3269                     ; 43     if (PowerReplyFlag)// power on
3271  0000 3d08          	tnz	_PowerReplyFlag
3272  0002 273f          	jreq	L1122
3273                     ; 45       if (ReplyRepeatFlag)  //send repeat
3275  0004 3d09          	tnz	_ReplyRepeatFlag
3276  0006 271f          	jreq	L3122
3277                     ; 48           ReplyRepeatFlag = FALSE;
3279  0008 3f09          	clr	_ReplyRepeatFlag
3280                     ; 51           Respond_Byte(PACKAGE_HEAD);   // 0xFD
3282  000a a6fd          	ld	a,#253
3283  000c cd00b6        	call	_Respond_Byte
3285                     ; 52           Respond_Byte(0x01);  // 0x01
3287  000f a601          	ld	a,#1
3288  0011 cd00b6        	call	_Respond_Byte
3290                     ; 53           Respond_Byte(0x00); 
3292  0014 4f            	clr	a
3293  0015 cd00b6        	call	_Respond_Byte
3295                     ; 54           Respond_Byte(0x00);
3297  0018 4f            	clr	a
3298  0019 cd00b6        	call	_Respond_Byte
3300                     ; 55           Respond_Byte(0x00);
3302  001c 4f            	clr	a
3303  001d cd00b6        	call	_Respond_Byte
3305                     ; 56           Respond_Byte(PACKAGE_TAIL);   // 0xFE
3307  0020 a6fe          	ld	a,#254
3308  0022 cd00b6        	call	_Respond_Byte
3311  0025 205f          	jra	L3222
3312  0027               L3122:
3313                     ; 61           RepeatDelayTime++;
3315  0027 3c02          	inc	_RepeatDelayTime
3316                     ; 62           if (RepeatDelayTime > 49) // 50 * 10ms = 500ms
3318  0029 b602          	ld	a,_RepeatDelayTime
3319  002b a132          	cp	a,#50
3320  002d 2557          	jrult	L3222
3321                     ; 64             RepeatDelayTime = 0;
3323  002f 3f02          	clr	_RepeatDelayTime
3324                     ; 65             ReplyRepeatFlag =TRUE;
3326  0031 35010009      	mov	_ReplyRepeatFlag,#1
3327                     ; 67             RepeatCnt++;
3329  0035 3c03          	inc	_RepeatCnt
3330                     ; 68             if (RepeatCnt > 6)  //send 10 times
3332  0037 b603          	ld	a,_RepeatCnt
3333  0039 a107          	cp	a,#7
3334  003b 2549          	jrult	L3222
3335                     ; 70               RepeatCnt = 0;
3337  003d 3f03          	clr	_RepeatCnt
3338                     ; 71               PowerReplyFlag = FALSE;
3340  003f 3f08          	clr	_PowerReplyFlag
3341  0041 2043          	jra	L3222
3342  0043               L1122:
3343                     ; 79     if (StatusReplyFlag) 
3345  0043 3d07          	tnz	_StatusReplyFlag
3346  0045 273b          	jreq	L5222
3347                     ; 81         if (ReplyRepeatFlag)  //send repeat
3349  0047 3d09          	tnz	_ReplyRepeatFlag
3350  0049 271b          	jreq	L7222
3351                     ; 84           ReplyRepeatFlag = FALSE;
3353  004b 3f09          	clr	_ReplyRepeatFlag
3354                     ; 87           Respond_Byte(PACKAGE_HEAD);   // 0xFD
3356  004d a6fd          	ld	a,#253
3357  004f ad65          	call	_Respond_Byte
3359                     ; 88           Respond_Byte(StatusReplyCommand);  // 0x02 | (flag | 0x02)
3361  0051 b605          	ld	a,_StatusReplyCommand
3362  0053 ad61          	call	_Respond_Byte
3364                     ; 89           Respond_Byte(0x00); 
3366  0055 4f            	clr	a
3367  0056 ad5e          	call	_Respond_Byte
3369                     ; 90           Respond_Byte(ReplyStatus);
3371  0058 b601          	ld	a,_ReplyStatus
3372  005a ad5a          	call	_Respond_Byte
3374                     ; 91           Respond_Byte(DimmerDuty);
3376  005c b600          	ld	a,_DimmerDuty
3377  005e ad56          	call	_Respond_Byte
3379                     ; 92           Respond_Byte(PACKAGE_TAIL);   // 0xFE
3381  0060 a6fe          	ld	a,#254
3382  0062 ad52          	call	_Respond_Byte
3385  0064 2020          	jra	L3222
3386  0066               L7222:
3387                     ; 97           RepeatDelayTime++;
3389  0066 3c02          	inc	_RepeatDelayTime
3390                     ; 98           if (RepeatDelayTime > 4) // 80 * 10ms = 800ms
3392  0068 b602          	ld	a,_RepeatDelayTime
3393  006a a105          	cp	a,#5
3394  006c 2518          	jrult	L3222
3395                     ; 100             RepeatDelayTime = 0;
3397  006e 3f02          	clr	_RepeatDelayTime
3398                     ; 101             ReplyRepeatFlag =TRUE;
3400  0070 35010009      	mov	_ReplyRepeatFlag,#1
3401                     ; 103             RepeatCnt++;
3403  0074 3c03          	inc	_RepeatCnt
3404                     ; 104             if (RepeatCnt > 2)  //send 3 times
3406  0076 b603          	ld	a,_RepeatCnt
3407  0078 a103          	cp	a,#3
3408  007a 250a          	jrult	L3222
3409                     ; 106               RepeatCnt = 0;
3411  007c 3f03          	clr	_RepeatCnt
3412                     ; 107               StatusReplyFlag = FALSE;
3414  007e 3f07          	clr	_StatusReplyFlag
3415  0080 2004          	jra	L3222
3416  0082               L5222:
3417                     ; 151       RepeatDelayTime = 0;
3419  0082 3f02          	clr	_RepeatDelayTime
3420                     ; 152       RepeatCnt = 0;
3422  0084 3f03          	clr	_RepeatCnt
3423  0086               L3222:
3424                     ; 154 }
3427  0086 81            	ret
3473                     ; 160 void Respond_Str(_Uchar *RspdStr)
3473                     ; 161 {
3474                     	switch	.text
3475  0087               _Respond_Str:
3477  0087 89            	pushw	x
3478  0088 88            	push	a
3479       00000001      OFST:	set	1
3482                     ; 162     _Uchar  ErrCnt = 0;
3484  0089 0f01          	clr	(OFST+0,sp)
3486  008b 2021          	jra	L7622
3487  008d               L3622:
3488                     ; 166         ErrCnt = 200;
3490  008d a6c8          	ld	a,#200
3491  008f 6b01          	ld	(OFST+0,sp),a
3493  0091 2002          	jra	L7722
3494  0093               L3722:
3495                     ; 169             ErrCnt--;
3497  0093 0a01          	dec	(OFST+0,sp)
3498  0095               L7722:
3499                     ; 167         while (!UART_SEND_FLAG && ErrCnt)		
3501                     	btst	_UART_SEND_FLAG
3502  009a 2504          	jrult	L3032
3504  009c 0d01          	tnz	(OFST+0,sp)
3505  009e 26f3          	jrne	L3722
3506  00a0               L3032:
3507                     ; 171         UART_REGISTER = *RspdStr++;
3509  00a0 1e02          	ldw	x,(OFST+1,sp)
3510  00a2 1c0001        	addw	x,#1
3511  00a5 1f02          	ldw	(OFST+1,sp),x
3512  00a7 1d0001        	subw	x,#1
3513  00aa f6            	ld	a,(x)
3514  00ab c75231        	ld	_UART1_DR,a
3515  00ae               L7622:
3516                     ; 164     while (*RspdStr != '\0')
3518  00ae 1e02          	ldw	x,(OFST+1,sp)
3519  00b0 7d            	tnz	(x)
3520  00b1 26da          	jrne	L3622
3521                     ; 173 }   
3524  00b3 5b03          	addw	sp,#3
3525  00b5 81            	ret
3561                     ; 178 void Respond_Byte(_Uchar RspdByte)
3561                     ; 179 {
3562                     	switch	.text
3563  00b6               _Respond_Byte:
3567                     ; 181     UART_REGISTER = RspdByte;
3569  00b6 c75231        	ld	_UART1_DR,a
3571  00b9               L7232:
3572                     ; 182     while (!UART_SEND_FLAG);
3574                     	btst	_UART_SEND_FLAG
3575  00be 24f9          	jruge	L7232
3576                     ; 183 }
3579  00c0 81            	ret
3718                     	xdef	_Respond_App
3719                     	switch	.ubsct
3720  0000               _ReplyGroup:
3721  0000 00            	ds.b	1
3722                     	xdef	_ReplyGroup
3723  0001               _ReplyStatus:
3724  0001 00            	ds.b	1
3725                     	xdef	_ReplyStatus
3726  0002               _RepeatDelayTime:
3727  0002 00            	ds.b	1
3728                     	xdef	_RepeatDelayTime
3729  0003               _RepeatCnt:
3730  0003 00            	ds.b	1
3731                     	xdef	_RepeatCnt
3732  0004               _NormalReplyCommand:
3733  0004 00            	ds.b	1
3734                     	xdef	_NormalReplyCommand
3735  0005               _StatusReplyCommand:
3736  0005 00            	ds.b	1
3737                     	xdef	_StatusReplyCommand
3738  0006               _NormalReplyFlag:
3739  0006 00            	ds.b	1
3740                     	xdef	_NormalReplyFlag
3741  0007               _StatusReplyFlag:
3742  0007 00            	ds.b	1
3743                     	xdef	_StatusReplyFlag
3744  0008               _PowerReplyFlag:
3745  0008 00            	ds.b	1
3746                     	xdef	_PowerReplyFlag
3747  0009               _ReplyRepeatFlag:
3748  0009 00            	ds.b	1
3749                     	xdef	_ReplyRepeatFlag
3750                     	xref.b	_DimmerDuty
3751                     	xdef	_Respond_Byte
3752                     	xdef	_Respond_Str
3772                     	end
