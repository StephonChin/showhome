   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Generator V4.2.4 - 19 Dec 2007
3213                     	switch	.ubsct
3214  0000               L3712_KeyTime:
3215  0000 00            	ds.b	1
3216  0001               L5712_KeyPressDone:
3217  0001 00            	ds.b	1
3298                     ; 23 void Key_Scan(void)
3298                     ; 24 {
3300                     	switch	.text
3301  0000               _Key_Scan:
3305                     ; 29   if (PORT_KEY == 0)
3307                     	btst	_PC_IDR_7
3308  0005 254a          	jrult	L7322
3309                     ; 31     if (KeyPressDone == FALSE)
3311  0007 3d01          	tnz	L5712_KeyPressDone
3312  0009 264a          	jrne	L7522
3313                     ; 33       KeyTime++;
3315  000b 3c00          	inc	L3712_KeyTime
3316                     ; 35       if (KeyTime > 5)  // 60ms
3318  000d b600          	ld	a,L3712_KeyTime
3319  000f a106          	cp	a,#6
3320  0011 2542          	jrult	L7522
3321                     ; 37         KeyTime = 0;
3323  0013 3f00          	clr	L3712_KeyTime
3324                     ; 38         KeyPressDone = TRUE;
3326  0015 35010001      	mov	L5712_KeyPressDone,#1
3327                     ; 45         if ( (SwitchStatus[0] == 0x01)  || (SwitchStatus[1] == 0x01))
3329  0019 b600          	ld	a,_SwitchStatus
3330  001b a101          	cp	a,#1
3331  001d 2706          	jreq	L7422
3333  001f b601          	ld	a,_SwitchStatus+1
3334  0021 a101          	cp	a,#1
3335  0023 261a          	jrne	L5422
3336  0025               L7422:
3337                     ; 48 			if (SwitchStatus[0] == 0x01)
3339  0025 b600          	ld	a,_SwitchStatus
3340  0027 a101          	cp	a,#1
3341  0029 2606          	jrne	L1522
3342                     ; 50 				SwitchStatus[0] = 0x00;
3344  002b 3f00          	clr	_SwitchStatus
3345                     ; 51 				SwitchInit[0] = TRUE;
3347  002d 35010000      	mov	_SwitchInit,#1
3348  0031               L1522:
3349                     ; 55 			if (SwitchStatus[1] == 0x01)
3351  0031 b601          	ld	a,_SwitchStatus+1
3352  0033 a101          	cp	a,#1
3353  0035 261e          	jrne	L7522
3354                     ; 57 				SwitchStatus[1] = 0x00;
3356  0037 3f01          	clr	_SwitchStatus+1
3357                     ; 58 				SwitchInit[1] = TRUE;
3359  0039 35010001      	mov	_SwitchInit+1,#1
3360  003d 2016          	jra	L7522
3361  003f               L5422:
3362                     ; 63 			SwitchStatus[0] = 0x01;
3364  003f 35010000      	mov	_SwitchStatus,#1
3365                     ; 64 			SwitchStatus[1] = 0x01;
3367  0043 35010001      	mov	_SwitchStatus+1,#1
3368                     ; 65 			SwitchInit[0] = TRUE;
3370  0047 35010000      	mov	_SwitchInit,#1
3371                     ; 66 			SwitchInit[1] = TRUE;
3373  004b 35010001      	mov	_SwitchInit+1,#1
3374  004f 2004          	jra	L7522
3375  0051               L7322:
3376                     ; 75     KeyTime = 0;
3378  0051 3f00          	clr	L3712_KeyTime
3379                     ; 76     KeyPressDone = FALSE;
3381  0053 3f01          	clr	L5712_KeyPressDone
3382  0055               L7522:
3383                     ; 78 }
3386  0055 81            	ret
3399                     	xdef	_Key_Scan
3400                     	xref.b	_SwitchInit
3401                     	xref.b	_SwitchStatus
3420                     	end
