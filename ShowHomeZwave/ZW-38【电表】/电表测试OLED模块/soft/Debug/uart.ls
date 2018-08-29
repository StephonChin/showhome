   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Generator V4.2.4 - 19 Dec 2007
3213                     	switch	.ubsct
3214  0000               L3712_characterCnt:
3215  0000 00            	ds.b	1
3275                     ; 22 @far @interrupt void UartInterrupt(void)
3275                     ; 23 {
3276                     	switch	.text
3277  0000               f_UartInterrupt:
3280       00000001      OFST:	set	1
3281  0000 88            	push	a
3284                     ; 24 	u8t catNum = 0;
3286  0001 0f01          	clr	(OFST+0,sp)
3287                     ; 27 	if (!flagCmdStart)
3289  0003 3d0f          	tnz	_flagCmdStart
3290  0005 2619          	jrne	L5222
3291                     ; 29 		dataReceive[characterCnt] = uartDataRegistor;
3293  0007 b600          	ld	a,L3712_characterCnt
3294  0009 5f            	clrw	x
3295  000a 97            	ld	xl,a
3296  000b c65231        	ld	a,_UART1_DR
3297  000e e706          	ld	(_dataReceive,x),a
3298                     ; 31 		characterCnt++;
3300  0010 3c00          	inc	L3712_characterCnt
3301                     ; 32 		if (characterCnt == 3)
3303  0012 b600          	ld	a,L3712_characterCnt
3304  0014 a103          	cp	a,#3
3305  0016 260c          	jrne	L1322
3306                     ; 34 			flagCmdStart = 1;
3308  0018 3501000f      	mov	_flagCmdStart,#1
3309                     ; 35 			characterCnt = 0;
3311  001c 3f00          	clr	L3712_characterCnt
3312  001e 2004          	jra	L1322
3313  0020               L5222:
3314                     ; 40 		uartDataRegistor = 0;
3316  0020 725f5231      	clr	_UART1_DR
3317  0024               L1322:
3318                     ; 65 }
3321  0024 84            	pop	a
3322  0025 80            	iret
3348                     .const:	section	.text
3349  0000               L01:
3350  0000 00002710      	dc.l	10000
3351  0004               L21:
3352  0004 000003e8      	dc.l	1000
3353  0008               L41:
3354  0008 00000064      	dc.l	100
3355  000c               L61:
3356  000c 0000000a      	dc.l	10
3357                     ; 70 void DataGet(void)
3357                     ; 71 {
3358                     	scross	off
3359                     	switch	.text
3360  0026               _DataGet:
3362  0026 5208          	subw	sp,#8
3363       00000008      OFST:	set	8
3366                     ; 72 	if (flagCmdStart)
3368  0028 3d0f          	tnz	_flagCmdStart
3369  002a 2603          	jrne	L02
3370  002c cc00d9        	jp	L3422
3371  002f               L02:
3372                     ; 74 		flagCmdStart = 0;
3374  002f 3f0f          	clr	_flagCmdStart
3375                     ; 75 		dataDisplay = //(u16t)(dataReceive[0] *16*16*16*16*16) +
3375                     ; 76 									(u32t)((u32t)dataReceive[0] *16*16*16*16) +
3375                     ; 77 									//(u16t)(dataReceive[2] *16*16*16) +
3375                     ; 78 									(u32t)((u32t)dataReceive[1] *16*16) +
3375                     ; 79 									//(u16t)(dataReceive[1] *16) +
3375                     ; 80 									(u32t)dataReceive[2];
3377  0031 b608          	ld	a,_dataReceive+2
3378  0033 b703          	ld	c_lreg+3,a
3379  0035 3f02          	clr	c_lreg+2
3380  0037 3f01          	clr	c_lreg+1
3381  0039 3f00          	clr	c_lreg
3382  003b 96            	ldw	x,sp
3383  003c 1c0005        	addw	x,#OFST-3
3384  003f cd0000        	call	c_rtol
3386  0042 b607          	ld	a,_dataReceive+1
3387  0044 5f            	clrw	x
3388  0045 97            	ld	xl,a
3389  0046 90ae0100      	ldw	y,#256
3390  004a cd0000        	call	c_umul
3392  004d 96            	ldw	x,sp
3393  004e 1c0001        	addw	x,#OFST-7
3394  0051 cd0000        	call	c_rtol
3396  0054 b606          	ld	a,_dataReceive
3397  0056 b703          	ld	c_lreg+3,a
3398  0058 3f02          	clr	c_lreg+2
3399  005a 3f01          	clr	c_lreg+1
3400  005c 3f00          	clr	c_lreg
3401  005e a610          	ld	a,#16
3402  0060 cd0000        	call	c_llsh
3404  0063 96            	ldw	x,sp
3405  0064 1c0001        	addw	x,#OFST-7
3406  0067 cd0000        	call	c_ladd
3408  006a 96            	ldw	x,sp
3409  006b 1c0005        	addw	x,#OFST-3
3410  006e cd0000        	call	c_ladd
3412  0071 ae0002        	ldw	x,#_dataDisplay
3413  0074 cd0000        	call	c_rtol
3415                     ; 82 		dataReceive2[0] = (u8t)(dataDisplay / 10000);
3417  0077 ae0002        	ldw	x,#_dataDisplay
3418  007a cd0000        	call	c_ltor
3420  007d ae0000        	ldw	x,#L01
3421  0080 cd0000        	call	c_ludv
3423  0083 b603          	ld	a,c_lreg+3
3424  0085 b709          	ld	_dataReceive2,a
3425                     ; 83 		dataReceive2[1] = (u8t)(dataDisplay % 10000 / 1000);
3427  0087 ae0002        	ldw	x,#_dataDisplay
3428  008a cd0000        	call	c_ltor
3430  008d ae0000        	ldw	x,#L01
3431  0090 cd0000        	call	c_lumd
3433  0093 ae0004        	ldw	x,#L21
3434  0096 cd0000        	call	c_ludv
3436  0099 b603          	ld	a,c_lreg+3
3437  009b b70a          	ld	_dataReceive2+1,a
3438                     ; 84 		dataReceive2[2] = (u8t)(dataDisplay % 1000 / 100);
3440  009d ae0002        	ldw	x,#_dataDisplay
3441  00a0 cd0000        	call	c_ltor
3443  00a3 ae0004        	ldw	x,#L21
3444  00a6 cd0000        	call	c_lumd
3446  00a9 ae0008        	ldw	x,#L41
3447  00ac cd0000        	call	c_ludv
3449  00af b603          	ld	a,c_lreg+3
3450  00b1 b70b          	ld	_dataReceive2+2,a
3451                     ; 85 		dataReceive2[3] = (u8t)(dataDisplay % 100 / 10);
3453  00b3 ae0002        	ldw	x,#_dataDisplay
3454  00b6 cd0000        	call	c_ltor
3456  00b9 ae0008        	ldw	x,#L41
3457  00bc cd0000        	call	c_lumd
3459  00bf ae000c        	ldw	x,#L61
3460  00c2 cd0000        	call	c_ludv
3462  00c5 b603          	ld	a,c_lreg+3
3463  00c7 b70c          	ld	_dataReceive2+3,a
3464                     ; 86 		dataReceive2[4] = (u8t)(dataDisplay % 10);
3466  00c9 ae0002        	ldw	x,#_dataDisplay
3467  00cc cd0000        	call	c_ltor
3469  00cf ae000c        	ldw	x,#L61
3470  00d2 cd0000        	call	c_lumd
3472  00d5 b603          	ld	a,c_lreg+3
3473  00d7 b70d          	ld	_dataReceive2+4,a
3474  00d9               L3422:
3475                     ; 88 }
3478  00d9 5b08          	addw	sp,#8
3479  00db 81            	ret
3482                     	switch	.ubsct
3483  0001               L5422_errCnt:
3484  0001 00            	ds.b	1
3547                     ; 94 void RespondStr(u8t *pStr)
3547                     ; 95 {
3548                     	switch	.text
3549  00dc               _RespondStr:
3551  00dc 89            	pushw	x
3552  00dd 89            	pushw	x
3553       00000002      OFST:	set	2
3556                     ; 96 	u8t strLen = 0;
3558  00de 7b01          	ld	a,(OFST-1,sp)
3559  00e0 97            	ld	xl,a
3560                     ; 97 	u8t catCnt = 0;
3562  00e1 7b02          	ld	a,(OFST+0,sp)
3563  00e3 97            	ld	xl,a
3564                     ; 99 	strLen = (u8t)strlen(pStr);
3566  00e4 1e03          	ldw	x,(OFST+1,sp)
3567  00e6 cd0000        	call	_strlen
3569  00e9 9f            	ld	a,xl
3570  00ea 6b01          	ld	(OFST-1,sp),a
3571                     ; 101 	for (catCnt = 0; catCnt < strLen; catCnt++)
3573  00ec 0f02          	clr	(OFST+0,sp)
3575  00ee 2024          	jra	L5032
3576  00f0               L1032:
3577                     ; 103 		errCnt = 250;
3579  00f0 35fa0001      	mov	L5422_errCnt,#250
3581  00f4 2002          	jra	L5132
3582  00f6               L1132:
3583                     ; 104 		while (!flagUartTransmit && errCnt)		errCnt--;
3585  00f6 3a01          	dec	L5422_errCnt
3586  00f8               L5132:
3589  00f8 c65230        	ld	a,_UART1_SR
3590  00fb a5c0          	bcp	a,#192
3591  00fd 2604          	jrne	L1232
3593  00ff 3d01          	tnz	L5422_errCnt
3594  0101 26f3          	jrne	L1132
3595  0103               L1232:
3596                     ; 105 		uartDataRegistor = *(pStr + catCnt);
3598  0103 7b03          	ld	a,(OFST+1,sp)
3599  0105 97            	ld	xl,a
3600  0106 7b04          	ld	a,(OFST+2,sp)
3601  0108 1b02          	add	a,(OFST+0,sp)
3602  010a 2401          	jrnc	L42
3603  010c 5c            	incw	x
3604  010d               L42:
3605  010d 02            	rlwa	x,a
3606  010e f6            	ld	a,(x)
3607  010f c75231        	ld	_UART1_DR,a
3608                     ; 101 	for (catCnt = 0; catCnt < strLen; catCnt++)
3610  0112 0c02          	inc	(OFST+0,sp)
3611  0114               L5032:
3614  0114 7b02          	ld	a,(OFST+0,sp)
3615  0116 1101          	cp	a,(OFST-1,sp)
3616  0118 25d6          	jrult	L1032
3617                     ; 107 } 
3620  011a 5b04          	addw	sp,#4
3621  011c 81            	ret
3705                     	xdef	f_UartInterrupt
3706                     	switch	.ubsct
3707  0002               _dataDisplay:
3708  0002 00000000      	ds.b	4
3709                     	xdef	_dataDisplay
3710  0006               _dataReceive:
3711  0006 000000        	ds.b	3
3712                     	xdef	_dataReceive
3713  0009               _dataReceive2:
3714  0009 0000000000    	ds.b	5
3715                     	xdef	_dataReceive2
3716  000e               _flagCmdEnd:
3717  000e 00            	ds.b	1
3718                     	xdef	_flagCmdEnd
3719  000f               _flagCmdStart:
3720  000f 00            	ds.b	1
3721                     	xdef	_flagCmdStart
3722                     	xdef	_DataGet
3723                     	xdef	_RespondStr
3724                     	xref	_strlen
3725                     	xref.b	c_lreg
3745                     	xref	c_lumd
3746                     	xref	c_ludv
3747                     	xref	c_ltor
3748                     	xref	c_ladd
3749                     	xref	c_rtol
3750                     	xref	c_umul
3751                     	xref	c_llsh
3752                     	end
