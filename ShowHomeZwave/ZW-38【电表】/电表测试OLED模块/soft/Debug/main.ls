   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Generator V4.2.4 - 19 Dec 2007
3259                     ; 10 void main(void)
3259                     ; 11 {
3261                     	switch	.text
3262  0000               _main:
3266                     ; 12 	ClkConfig();
3268  0000 cd0000        	call	_ClkConfig
3270                     ; 13 	GpioConfig();
3272  0003 cd0000        	call	_GpioConfig
3274                     ; 14 	UartConfig();
3276  0006 cd0000        	call	_UartConfig
3278                     ; 15 	TimerConfig();
3280  0009 cd0000        	call	_TimerConfig
3282                     ; 16 	LedDisplayChs();
3284  000c cd0000        	call	_LedDisplayChs
3286  000f               L1122:
3287                     ; 20 		if (refreshFlag)
3289  000f 3d00          	tnz	_refreshFlag
3290  0011 27fc          	jreq	L1122
3291                     ; 22 			refreshFlag = 0;
3293  0013 3f00          	clr	_refreshFlag
3294                     ; 23 			TIM4_CR1 &= 0xFE;
3296  0015 72115340      	bres	_TIM4_CR1,#0
3297                     ; 24 			RespondStr("$W");
3299  0019 ae0014        	ldw	x,#L7122
3300  001c cd0000        	call	_RespondStr
3303  001f               L3222:
3304                     ; 25 			while(!flagCmdStart);
3306  001f 3d00          	tnz	_flagCmdStart
3307  0021 27fc          	jreq	L3222
3308                     ; 26 			DataGet();
3310  0023 cd0000        	call	_DataGet
3312                     ; 27 			LedDisplay(1);
3314  0026 a601          	ld	a,#1
3315  0028 cd0000        	call	_LedDisplay
3317                     ; 29 			RespondStr((u8t *)"$V");
3319  002b ae0011        	ldw	x,#L7222
3320  002e cd0000        	call	_RespondStr
3323  0031               L3322:
3324                     ; 30 			while(!flagCmdStart);
3326  0031 3d00          	tnz	_flagCmdStart
3327  0033 27fc          	jreq	L3322
3328                     ; 31 			DataGet();
3330  0035 cd0000        	call	_DataGet
3332                     ; 32 			LedDisplay(2);
3334  0038 a602          	ld	a,#2
3335  003a cd0000        	call	_LedDisplay
3337                     ; 34 			RespondStr("$A");
3339  003d ae000e        	ldw	x,#L7322
3340  0040 cd0000        	call	_RespondStr
3343  0043               L3422:
3344                     ; 35 			while(!flagCmdStart);
3346  0043 3d00          	tnz	_flagCmdStart
3347  0045 27fc          	jreq	L3422
3348                     ; 36 			DataGet();
3350  0047 cd0000        	call	_DataGet
3352                     ; 37 			LedDisplay(3);
3354  004a a603          	ld	a,#3
3355  004c cd0000        	call	_LedDisplay
3357                     ; 39 			RespondStr("$KW");
3359  004f ae000a        	ldw	x,#L7422
3360  0052 cd0000        	call	_RespondStr
3363  0055               L3522:
3364                     ; 40 			while(!flagCmdStart);
3366  0055 3d00          	tnz	_flagCmdStart
3367  0057 27fc          	jreq	L3522
3368                     ; 41 			DataGet();
3370  0059 cd0000        	call	_DataGet
3372                     ; 42 			LedDisplay(4);
3374  005c a604          	ld	a,#4
3375  005e cd0000        	call	_LedDisplay
3377                     ; 44 			RespondStr("$KV");
3379  0061 ae0006        	ldw	x,#L7522
3380  0064 cd0000        	call	_RespondStr
3383  0067               L3622:
3384                     ; 45 			while(!flagCmdStart);
3386  0067 3d00          	tnz	_flagCmdStart
3387  0069 27fc          	jreq	L3622
3388                     ; 46 			DataGet();
3390  006b cd0000        	call	_DataGet
3392                     ; 47 			LedDisplay(5);
3394  006e a605          	ld	a,#5
3395  0070 cd0000        	call	_LedDisplay
3397                     ; 49 			RespondStr("$F");
3399  0073 ae0003        	ldw	x,#L7622
3400  0076 cd0000        	call	_RespondStr
3403  0079               L3722:
3404                     ; 50 			while(!flagCmdStart);
3406  0079 3d00          	tnz	_flagCmdStart
3407  007b 27fc          	jreq	L3722
3408                     ; 51 			DataGet();
3410  007d cd0000        	call	_DataGet
3412                     ; 52 			LedDisplay(6);
3414  0080 a606          	ld	a,#6
3415  0082 cd0000        	call	_LedDisplay
3417                     ; 54 			RespondStr("$D");
3419  0085 ae0000        	ldw	x,#L7722
3420  0088 cd0000        	call	_RespondStr
3423  008b               L3032:
3424                     ; 55 			while(!flagCmdStart);
3426  008b 3d00          	tnz	_flagCmdStart
3427  008d 27fc          	jreq	L3032
3428                     ; 56 			DataGet();
3430  008f cd0000        	call	_DataGet
3432                     ; 57 			LedDisplay(7);
3434  0092 a607          	ld	a,#7
3435  0094 cd0000        	call	_LedDisplay
3437                     ; 59 			TIM4_CR1 |= 0x01;
3439  0097 72105340      	bset	_TIM4_CR1,#0
3440  009b ac0f000f      	jpf	L1122
3467                     ; 65 @far @interrupt void Timer4Interrupt(void)
3467                     ; 66 {
3469                     	switch	.text
3470  009f               f_Timer4Interrupt:
3475                     ; 67 	TIM4_SR &= 0xFE;
3477  009f 72115344      	bres	_TIM4_SR,#0
3478                     ; 69 	timeCnt1++;
3480  00a3 3c02          	inc	_timeCnt1
3481                     ; 70 	if (timeCnt1 > 249) //200*250=50ms
3483  00a5 b602          	ld	a,_timeCnt1
3484  00a7 a1fa          	cp	a,#250
3485  00a9 2510          	jrult	L7132
3486                     ; 72 		timeCnt1 = 0;
3488  00ab 3f02          	clr	_timeCnt1
3489                     ; 73 		timeCnt2++;
3491  00ad 3c01          	inc	_timeCnt2
3492                     ; 75 		if (timeCnt2 > 149)
3494  00af b601          	ld	a,_timeCnt2
3495  00b1 a196          	cp	a,#150
3496  00b3 2506          	jrult	L7132
3497                     ; 77 			timeCnt2 = 0;
3499  00b5 3f01          	clr	_timeCnt2
3500                     ; 78 			refreshFlag = 1;
3502  00b7 35010000      	mov	_refreshFlag,#1
3503  00bb               L7132:
3504                     ; 82 }
3507  00bb 80            	iret
3569                     	xdef	f_Timer4Interrupt
3570                     	xdef	_main
3571                     	switch	.ubsct
3572  0000               _refreshFlag:
3573  0000 00            	ds.b	1
3574                     	xdef	_refreshFlag
3575  0001               _timeCnt2:
3576  0001 00            	ds.b	1
3577                     	xdef	_timeCnt2
3578  0002               _timeCnt1:
3579  0002 00            	ds.b	1
3580                     	xdef	_timeCnt1
3581                     	xref	_LedDisplay
3582                     	xref	_LedDisplayChs
3583                     	xref.b	_flagCmdStart
3584                     	xref	_DataGet
3585                     	xref	_RespondStr
3586                     	xref	_TimerConfig
3587                     	xref	_ClkConfig
3588                     	xref	_UartConfig
3589                     	xref	_GpioConfig
3590                     .const:	section	.text
3591  0000               L7722:
3592  0000 244400        	dc.b	"$D",0
3593  0003               L7622:
3594  0003 244600        	dc.b	"$F",0
3595  0006               L7522:
3596  0006 244b5600      	dc.b	"$KV",0
3597  000a               L7422:
3598  000a 244b5700      	dc.b	"$KW",0
3599  000e               L7322:
3600  000e 244100        	dc.b	"$A",0
3601  0011               L7222:
3602  0011 245600        	dc.b	"$V",0
3603  0014               L7122:
3604  0014 245700        	dc.b	"$W",0
3624                     	end
