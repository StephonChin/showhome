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
3308  0005 2526          	jrult	L7322
3309                     ; 31     if (KeyPressDone == FALSE)
3311  0007 3d01          	tnz	L5712_KeyPressDone
3312  0009 2626          	jrne	L1522
3313                     ; 33       KeyTime++;
3315  000b 3c00          	inc	L3712_KeyTime
3316                     ; 35       if (KeyTime > 5)  // 60ms
3318  000d b600          	ld	a,L3712_KeyTime
3319  000f a106          	cp	a,#6
3320  0011 251e          	jrult	L1522
3321                     ; 37         KeyTime = 0;
3323  0013 3f00          	clr	L3712_KeyTime
3324                     ; 38         KeyPressDone = TRUE;
3326  0015 35010001      	mov	L5712_KeyPressDone,#1
3327                     ; 40         SwitchInit = TRUE;
3329  0019 35010000      	mov	_SwitchInit,#1
3330                     ; 47         if (SwitchStatus == 0x01)
3332  001d b600          	ld	a,_SwitchStatus
3333  001f a101          	cp	a,#1
3334  0021 2604          	jrne	L5422
3335                     ; 49           SwitchStatus = 0x00;
3337  0023 3f00          	clr	_SwitchStatus
3339  0025 200a          	jra	L1522
3340  0027               L5422:
3341                     ; 53           SwitchStatus = 0x01;
3343  0027 35010000      	mov	_SwitchStatus,#1
3344  002b 2004          	jra	L1522
3345  002d               L7322:
3346                     ; 62     KeyTime = 0;
3348  002d 3f00          	clr	L3712_KeyTime
3349                     ; 63     KeyPressDone = FALSE;
3351  002f 3f01          	clr	L5712_KeyPressDone
3352  0031               L1522:
3353                     ; 65 }
3356  0031 81            	ret
3369                     	xdef	_Key_Scan
3370                     	xref.b	_SwitchInit
3371                     	xref.b	_SwitchStatus
3390                     	end
