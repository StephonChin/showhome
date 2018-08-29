   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Generator V4.2.4 - 19 Dec 2007
3213                     	switch	.ubsct
3214  0000               L7712_KeyPressLongTime:
3215  0000 00            	ds.b	1
3216  0001               L1022_KeyPressLongFlag:
3217  0001 00            	ds.b	1
3218  0002               L3712_KeyTime:
3219  0002 00            	ds.b	1
3220  0003               L3022_FadeInOrOut:
3221  0003 00            	ds.b	1
3322                     ; 23 void Key_Scan(void)
3322                     ; 24 {
3324                     	switch	.text
3325  0000               _Key_Scan:
3329                     ; 31   if (PORT_KEY == 0)
3331                     	btst	_PC_IDR_7
3332  0005 252e          	jrult	L5522
3333                     ; 33 	  KeyTime++;
3335  0007 3c02          	inc	L3712_KeyTime
3336                     ; 34 	  if (KeyTime > 4) // 50ms
3338  0009 b602          	ld	a,L3712_KeyTime
3339  000b a105          	cp	a,#5
3340  000d 255e          	jrult	L3722
3341                     ; 36 		  KeyTime = 0;
3343  000f 3f02          	clr	L3712_KeyTime
3344                     ; 38 		  KeyPressLongTime++;
3346  0011 3c00          	inc	L7712_KeyPressLongTime
3347                     ; 41 		  if (KeyPressLongTime > 19)
3349  0013 b600          	ld	a,L7712_KeyPressLongTime
3350  0015 a114          	cp	a,#20
3351  0017 2554          	jrult	L3722
3352                     ; 43 			  KeyPressLongFlag = TRUE;
3354  0019 35010001      	mov	L1022_KeyPressLongFlag,#1
3355                     ; 47 			  if (FadeInOrOut == FALSE)
3357  001d 3d03          	tnz	L3022_FadeInOrOut
3358  001f 260a          	jrne	L3622
3359                     ; 49 				  if (DimmerDuty < 100)
3361  0021 b600          	ld	a,_DimmerDuty
3362  0023 a164          	cp	a,#100
3363  0025 2446          	jruge	L3722
3364                     ; 51 					  DimmerDuty++;
3366  0027 3c00          	inc	_DimmerDuty
3367  0029 2042          	jra	L3722
3368  002b               L3622:
3369                     ; 59 				  if (DimmerDuty > 1)
3371  002b b600          	ld	a,_DimmerDuty
3372  002d a102          	cp	a,#2
3373  002f 253c          	jrult	L3722
3374                     ; 61 					  DimmerDuty--;
3376  0031 3a00          	dec	_DimmerDuty
3377  0033 2038          	jra	L3722
3378  0035               L5522:
3379                     ; 72 	  if ( (KeyPressLongFlag == FALSE) && (KeyPressLongTime > 0) && (KeyPressLongTime < 10) )
3381  0035 3d01          	tnz	L1022_KeyPressLongFlag
3382  0037 2622          	jrne	L5722
3384  0039 3d00          	tnz	L7712_KeyPressLongTime
3385  003b 271e          	jreq	L5722
3387  003d b600          	ld	a,L7712_KeyPressLongTime
3388  003f a10a          	cp	a,#10
3389  0041 2418          	jruge	L5722
3390                     ; 74 			SwitchInit = TRUE;
3392  0043 35010000      	mov	_SwitchInit,#1
3393                     ; 75 			DimmerBySwitchFlag = TRUE;
3395  0047 35010000      	mov	_DimmerBySwitchFlag,#1
3396                     ; 77 			if (SwitchStatus == 0x01)
3398  004b b600          	ld	a,_SwitchStatus
3399  004d a101          	cp	a,#1
3400  004f 2604          	jrne	L7722
3401                     ; 79 				SwitchStatus = 0x00;
3403  0051 3f00          	clr	_SwitchStatus
3405  0053 2012          	jra	L3032
3406  0055               L7722:
3407                     ; 83 			SwitchStatus = 0x01;
3409  0055 35010000      	mov	_SwitchStatus,#1
3410  0059 200c          	jra	L3032
3411  005b               L5722:
3412                     ; 88 	  if (KeyPressLongFlag == TRUE)
3414  005b b601          	ld	a,L1022_KeyPressLongFlag
3415  005d a101          	cp	a,#1
3416  005f 2606          	jrne	L3032
3417                     ; 90 		  FadeInOrOut ^= 1;
3419  0061 b603          	ld	a,L3022_FadeInOrOut
3420  0063 a801          	xor	a,	#1
3421  0065 b703          	ld	L3022_FadeInOrOut,a
3422  0067               L3032:
3423                     ; 94 	  KeyTime = 0;
3425  0067 3f02          	clr	L3712_KeyTime
3426                     ; 95 	  KeyPressLongTime = 0;
3428  0069 3f00          	clr	L7712_KeyPressLongTime
3429                     ; 96 	  KeyPressLongFlag= FALSE;
3431  006b 3f01          	clr	L1022_KeyPressLongFlag
3432  006d               L3722:
3433                     ; 131 }
3436  006d 81            	ret
3449                     	xdef	_Key_Scan
3450                     	xref.b	_DimmerBySwitchFlag
3451                     	xref.b	_DimmerDuty
3452                     	xref.b	_SwitchInit
3453                     	xref.b	_SwitchStatus
3472                     	end
