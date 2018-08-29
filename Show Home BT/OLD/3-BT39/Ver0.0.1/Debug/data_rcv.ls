   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Generator V4.2.4 - 19 Dec 2007
3219                     	bsct
3220  0000               _RcvErr:
3221  0000 00            	dc.b	0
3265                     ; 42 @far @interrupt void Uart_Rcv_Interrupt(void)
3265                     ; 43 {  
3266                     	switch	.text
3267  0000               f_Uart_Rcv_Interrupt:
3272                     ; 45     UART_RCV_FLAG = FALSE;    
3274  0000 721b5230      	bres	_UART_RCV_FLAG
3275                     ; 48 	if (FALSE == RcvSttFlag)
3277  0004 3d01          	tnz	_RcvSttFlag
3278  0006 261b          	jrne	L1122
3279                     ; 50 		RcvDataBuf[0] = UART_REGISTER;
3281  0008 5552310009    	mov	_RcvDataBuf,_UART1_DR
3282                     ; 52 		if (RcvDataBuf[0] == CHARACTER_START)   //start character
3284  000d b609          	ld	a,_RcvDataBuf
3285  000f a1fd          	cp	a,#253
3286  0011 2608          	jrne	L3122
3287                     ; 54 			RcvSttFlag = TRUE;
3289  0013 35010001      	mov	_RcvSttFlag,#1
3290                     ; 55       RcvByteCnt = 0;
3292  0017 3f00          	clr	_RcvByteCnt
3294  0019 2045          	jra	L7122
3295  001b               L3122:
3296                     ; 59 			RcvDataBuf[0] = 0;
3298  001b 3f09          	clr	_RcvDataBuf
3299                     ; 60       RcvErr        = ERR_COMMAND;
3301  001d 35010000      	mov	_RcvErr,#1
3302  0021 203d          	jra	L7122
3303  0023               L1122:
3304                     ; 65 		RcvByteCnt++;
3306  0023 3c00          	inc	_RcvByteCnt
3307                     ; 67 		RcvDataBuf[RcvByteCnt] = UART_REGISTER;
3309  0025 b600          	ld	a,_RcvByteCnt
3310  0027 5f            	clrw	x
3311  0028 97            	ld	xl,a
3312  0029 c65231        	ld	a,_UART1_DR
3313  002c e709          	ld	(_RcvDataBuf,x),a
3314                     ; 68 		if(RcvDataBuf[RcvByteCnt] == CHARACTER_START)
3316  002e b600          	ld	a,_RcvByteCnt
3317  0030 5f            	clrw	x
3318  0031 97            	ld	xl,a
3319  0032 e609          	ld	a,(_RcvDataBuf,x)
3320  0034 a1fd          	cp	a,#253
3321  0036 2608          	jrne	L1222
3322                     ; 70 		  RcvDataBuf[0] = CHARACTER_START;
3324  0038 35fd0009      	mov	_RcvDataBuf,#253
3325                     ; 71 		  RcvByteCnt = 0;
3327  003c 3f00          	clr	_RcvByteCnt
3329  003e 2020          	jra	L7122
3330  0040               L1222:
3331                     ; 76       if (RcvDataBuf[RcvByteCnt] == CHARACTER_END)  // end character
3333  0040 b600          	ld	a,_RcvByteCnt
3334  0042 5f            	clrw	x
3335  0043 97            	ld	xl,a
3336  0044 e609          	ld	a,(_RcvDataBuf,x)
3337  0046 a1fe          	cp	a,#254
3338  0048 2608          	jrne	L5222
3339                     ; 78         RcvSttFlag  = FALSE;
3341  004a 3f01          	clr	_RcvSttFlag
3342                     ; 79         RcvErr      = ERR_SUCCESS;
3344  004c 35020000      	mov	_RcvErr,#2
3346  0050 200e          	jra	L7122
3347  0052               L5222:
3348                     ; 82       else if (RcvByteCnt > (RCV_DATA_MAX -1))
3350  0052 b600          	ld	a,_RcvByteCnt
3351  0054 a10a          	cp	a,#10
3352  0056 2508          	jrult	L7122
3353                     ; 84         RcvSttFlag    = FALSE;
3355  0058 3f01          	clr	_RcvSttFlag
3356                     ; 85         RcvDataBuf[0] = 0;
3358  005a 3f09          	clr	_RcvDataBuf
3359                     ; 86         RcvErr        = ERR_COMMAND;
3361  005c 35010000      	mov	_RcvErr,#1
3362  0060               L7122:
3363                     ; 90 }
3366  0060 80            	iret
3403                     ; 95 void Rcv_Data_From_App(void)
3403                     ; 96 {
3405                     	switch	.text
3406  0061               _Rcv_Data_From_App:
3408  0061 88            	push	a
3409       00000001      OFST:	set	1
3412                     ; 97     _Uchar          TempCnt = 0;
3414  0062 0f01          	clr	(OFST+0,sp)
3415                     ; 99      switch (RcvErr)
3417  0064 b600          	ld	a,_RcvErr
3419                     ; 135          break;
3420  0066 4d            	tnz	a
3421  0067 270a          	jreq	L3322
3422  0069 4a            	dec	a
3423  006a 270b          	jreq	L5322
3424  006c 4a            	dec	a
3425  006d 270c          	jreq	L7322
3426  006f               L1422:
3427                     ; 133          default:
3427                     ; 134                     RcvStatus = FALSE;
3429  006f 3f02          	clr	_RcvStatus
3430                     ; 135          break;
3432  0071 202e          	jra	L3622
3433  0073               L3322:
3434                     ; 102          case ERR_DEFAULT:
3434                     ; 103                     RcvStatus = FALSE;
3436  0073 3f02          	clr	_RcvStatus
3437                     ; 105          break;
3439  0075 202a          	jra	L3622
3440  0077               L5322:
3441                     ; 108          case ERR_COMMAND:
3441                     ; 109                     RcvStatus = FALSE;
3443  0077 3f02          	clr	_RcvStatus
3444                     ; 111          break;
3446  0079 2026          	jra	L3622
3447  007b               L7322:
3448                     ; 114          case ERR_SUCCESS:
3448                     ; 115                     /* Save the data */
3448                     ; 116                     RcvData.Header 		= RcvDataBuf[1];
3450  007b 450a03        	mov	_RcvData,_RcvDataBuf+1
3451                     ; 117 					RcvData.TypeH			= RcvDataBuf[2];
3453  007e 450b04        	mov	_RcvData+1,_RcvDataBuf+2
3454                     ; 118 					RcvData.TypeL			= RcvDataBuf[3];
3456  0081 450c05        	mov	_RcvData+2,_RcvDataBuf+3
3457                     ; 119 					RcvData.GroupClass  = RcvDataBuf[4];
3459  0084 450d06        	mov	_RcvData+3,_RcvDataBuf+4
3460                     ; 120 					RcvData.FirstCmd		= RcvDataBuf[5];
3462  0087 450e07        	mov	_RcvData+4,_RcvDataBuf+5
3463                     ; 121 					RcvData.SecondCmd  = RcvDataBuf[6];
3465  008a 450f08        	mov	_RcvData+5,_RcvDataBuf+6
3466                     ; 124                     for (TempCnt = 0; TempCnt < RCV_DATA_MAX; TempCnt++)
3468  008d 0f01          	clr	(OFST+0,sp)
3469  008f               L5622:
3470                     ; 126                         RcvDataBuf[TempCnt] = 0;
3472  008f 7b01          	ld	a,(OFST+0,sp)
3473  0091 5f            	clrw	x
3474  0092 97            	ld	xl,a
3475  0093 6f09          	clr	(_RcvDataBuf,x)
3476                     ; 124                     for (TempCnt = 0; TempCnt < RCV_DATA_MAX; TempCnt++)
3478  0095 0c01          	inc	(OFST+0,sp)
3481  0097 7b01          	ld	a,(OFST+0,sp)
3482  0099 a10a          	cp	a,#10
3483  009b 25f2          	jrult	L5622
3484                     ; 129                     RcvStatus = TRUE;
3486  009d 35010002      	mov	_RcvStatus,#1
3487                     ; 130          break;
3489  00a1               L3622:
3490                     ; 139      RcvErr = ERR_DEFAULT;
3492  00a1 3f00          	clr	_RcvErr
3493                     ; 140 }
3496  00a3 84            	pop	a
3497  00a4 81            	ret
3687                     	xdef	_Rcv_Data_From_App
3688                     	xdef	f_Uart_Rcv_Interrupt
3689                     	xdef	_RcvErr
3690                     	switch	.ubsct
3691  0000               _RcvByteCnt:
3692  0000 00            	ds.b	1
3693                     	xdef	_RcvByteCnt
3694  0001               _RcvSttFlag:
3695  0001 00            	ds.b	1
3696                     	xdef	_RcvSttFlag
3697  0002               _RcvStatus:
3698  0002 00            	ds.b	1
3699                     	xdef	_RcvStatus
3700  0003               _RcvData:
3701  0003 000000000000  	ds.b	6
3702                     	xdef	_RcvData
3703  0009               _RcvDataBuf:
3704  0009 000000000000  	ds.b	10
3705                     	xdef	_RcvDataBuf
3725                     	end
