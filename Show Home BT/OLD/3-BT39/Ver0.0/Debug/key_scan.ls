   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Generator V4.2.4 - 19 Dec 2007
3213                     	switch	.ubsct
3214  0000               L3712_KeyTime:
3215  0000 00            	ds.b	1
3216  0001               L5712_KeyPressDone:
3217  0001 00            	ds.b	1
3299                     ; 23 void Key_Scan(void)
3299                     ; 24 {
3301                     	switch	.text
3302  0000               _Key_Scan:
3306                     ; 29   if (PORT_KEY == 0)
3308                     	btst	_PC_IDR_7
3309  0005 252a          	jrult	L7322
3310                     ; 31     if (KeyPressDone == FALSE)
3312  0007 3d01          	tnz	L5712_KeyPressDone
3313  0009 262a          	jrne	L1522
3314                     ; 33       KeyTime++;
3316  000b 3c00          	inc	L3712_KeyTime
3317                     ; 35       if (KeyTime > 5)  // 60ms
3319  000d b600          	ld	a,L3712_KeyTime
3320  000f a106          	cp	a,#6
3321  0011 2522          	jrult	L1522
3322                     ; 37         KeyTime = 0;
3324  0013 3f00          	clr	L3712_KeyTime
3325                     ; 38         KeyPressDone = TRUE;
3327  0015 35010001      	mov	L5712_KeyPressDone,#1
3328                     ; 40         SwitchInit = TRUE;
3330  0019 35010000      	mov	_SwitchInit,#1
3331                     ; 41 		DimmerBySwitchFlag = TRUE;
3333  001d 35010000      	mov	_DimmerBySwitchFlag,#1
3334                     ; 48         if (SwitchStatus == 0x01)
3336  0021 b600          	ld	a,_SwitchStatus
3337  0023 a101          	cp	a,#1
3338  0025 2604          	jrne	L5422
3339                     ; 50 			SwitchStatus = 0x00;
3341  0027 3f00          	clr	_SwitchStatus
3343  0029 200a          	jra	L1522
3344  002b               L5422:
3345                     ; 54           SwitchStatus = 0x01;
3347  002b 35010000      	mov	_SwitchStatus,#1
3348  002f 2004          	jra	L1522
3349  0031               L7322:
3350                     ; 63     KeyTime = 0;
3352  0031 3f00          	clr	L3712_KeyTime
3353                     ; 64     KeyPressDone = FALSE;
3355  0033 3f01          	clr	L5712_KeyPressDone
3356  0035               L1522:
3357                     ; 66 }
3360  0035 81            	ret
3373                     	xdef	_Key_Scan
3374                     	xref.b	_DimmerBySwitchFlag
3375                     	xref.b	_SwitchInit
3376                     	xref.b	_SwitchStatus
3395                     	end
