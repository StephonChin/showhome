   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Generator V4.2.4 - 19 Dec 2007
3268                     ; 24 void AD_Scan(void)
3268                     ; 25 {
3270                     	switch	.text
3271  0000               _AD_Scan:
3273  0000 89            	pushw	x
3274       00000002      OFST:	set	2
3277                     ; 26   _Uint         ADData = 0;
3279  0001 5f            	clrw	x
3280  0002 1f01          	ldw	(OFST-1,sp),x
3281                     ; 29   if (ADActivedFlag == TRUE)
3283  0004 b602          	ld	a,_ADActivedFlag
3284  0006 a101          	cp	a,#1
3285  0008 266e          	jrne	L7122
3286                     ; 32     ADC_CR1 |= 0x01;
3288  000a 72105401      	bset	_ADC_CR1,#0
3290  000e               L3222:
3291                     ; 35     while(!EOC);
3293  000e c65400        	ld	a,_ADC_CSR
3294  0011 a580          	bcp	a,#128
3295  0013 27f9          	jreq	L3222
3296                     ; 38     ADData += (_Uint)ADC_DRL;
3298  0015 c65405        	ld	a,_ADC_DRL
3299  0018 5f            	clrw	x
3300  0019 97            	ld	xl,a
3301  001a 72fb01        	addw	x,(OFST-1,sp)
3302  001d 1f01          	ldw	(OFST-1,sp),x
3303                     ; 39     ADData += ((_Uint)ADC_DRH) * 256;
3305  001f c65404        	ld	a,_ADC_DRH
3306  0022 5f            	clrw	x
3307  0023 97            	ld	xl,a
3308  0024 4f            	clr	a
3309  0025 02            	rlwa	x,a
3310  0026 72fb01        	addw	x,(OFST-1,sp)
3311  0029 1f01          	ldw	(OFST-1,sp),x
3312                     ; 44     if (StatusChgFlag == TRUE) //shake enable
3314  002b b600          	ld	a,_StatusChgFlag
3315  002d a101          	cp	a,#1
3316  002f 260e          	jrne	L7222
3317                     ; 46       ShakeTime++;
3319  0031 3c01          	inc	_ShakeTime
3320                     ; 47       if (ShakeTime > 199) //200 * 10ms = 2s
3322  0033 b601          	ld	a,_ShakeTime
3323  0035 a1c8          	cp	a,#200
3324  0037 2543          	jrult	L7422
3325                     ; 49         ShakeTime = 0;
3327  0039 3f01          	clr	_ShakeTime
3328                     ; 50         StatusChgFlag = FALSE;
3330  003b 3f00          	clr	_StatusChgFlag
3331  003d 203d          	jra	L7422
3332  003f               L7222:
3333                     ; 59       if (ADData > (_Uint)600)  //night
3335  003f 1e01          	ldw	x,(OFST-1,sp)
3336  0041 a30259        	cpw	x,#601
3337  0044 2514          	jrult	L5322
3338                     ; 62         if (SwitchStatus != 0x01)
3340  0046 b600          	ld	a,_SwitchStatus
3341  0048 a101          	cp	a,#1
3342  004a 2730          	jreq	L7422
3343                     ; 64           SwitchStatus = 0x01;
3345  004c 35010000      	mov	_SwitchStatus,#1
3346                     ; 65           SwitchInit   = TRUE;
3348  0050 35010000      	mov	_SwitchInit,#1
3349                     ; 68           StatusChgFlag = TRUE;
3351  0054 35010000      	mov	_StatusChgFlag,#1
3352  0058 2022          	jra	L7422
3353  005a               L5322:
3354                     ; 74       if ( (ADData < (_Uint)200) && (ADData > (_Uint)10) ) //daytime
3356  005a 1e01          	ldw	x,(OFST-1,sp)
3357  005c a300c8        	cpw	x,#200
3358  005f 241b          	jruge	L7422
3360  0061 1e01          	ldw	x,(OFST-1,sp)
3361  0063 a3000b        	cpw	x,#11
3362  0066 2514          	jrult	L7422
3363                     ; 77         if (SwitchStatus != 0x00)
3365  0068 3d00          	tnz	_SwitchStatus
3366  006a 2706          	jreq	L5422
3367                     ; 79           SwitchStatus = 0x00;
3369  006c 3f00          	clr	_SwitchStatus
3370                     ; 80           SwitchInit = TRUE;
3372  006e 35010000      	mov	_SwitchInit,#1
3373  0072               L5422:
3374                     ; 84         StatusChgFlag = TRUE;
3376  0072 35010000      	mov	_StatusChgFlag,#1
3377  0076 2004          	jra	L7422
3378  0078               L7122:
3379                     ; 93     StatusChgFlag = FALSE;
3381  0078 3f00          	clr	_StatusChgFlag
3382                     ; 94     ShakeTime = 0;
3384  007a 3f01          	clr	_ShakeTime
3385  007c               L7422:
3386                     ; 96 }
3389  007c 85            	popw	x
3390  007d 81            	ret
3454                     	xdef	_AD_Scan
3455                     	switch	.ubsct
3456  0000               _StatusChgFlag:
3457  0000 00            	ds.b	1
3458                     	xdef	_StatusChgFlag
3459  0001               _ShakeTime:
3460  0001 00            	ds.b	1
3461                     	xdef	_ShakeTime
3462  0002               _ADActivedFlag:
3463  0002 00            	ds.b	1
3464                     	xdef	_ADActivedFlag
3465                     	xref.b	_SwitchInit
3466                     	xref.b	_SwitchStatus
3486                     	end
