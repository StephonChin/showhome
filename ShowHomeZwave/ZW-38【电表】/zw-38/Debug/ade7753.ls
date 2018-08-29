   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Generator V4.2.4 - 19 Dec 2007
3213                     .const:	section	.text
3214  0000               _reg_len:
3215  0000 00            	dc.b	0
3216  0001 03            	dc.b	3
3217  0002 03            	dc.b	3
3218  0003 03            	dc.b	3
3219  0004 03            	dc.b	3
3220  0005 03            	dc.b	3
3221  0006 03            	dc.b	3
3222  0007 03            	dc.b	3
3223  0008 03            	dc.b	3
3224  0009 02            	dc.b	2
3225  000a 02            	dc.b	2
3226  000b 02            	dc.b	2
3227  000c 02            	dc.b	2
3228  000d 01            	dc.b	1
3229  000e 01            	dc.b	1
3230  000f 01            	dc.b	1
3231  0010 01            	dc.b	1
3232  0011 02            	dc.b	2
3233  0012 02            	dc.b	2
3234  0013 01            	dc.b	1
3235  0014 02            	dc.b	2
3236  0015 02            	dc.b	2
3237  0016 03            	dc.b	3
3238  0017 03            	dc.b	3
3239  0018 02            	dc.b	2
3240  0019 02            	dc.b	2
3241  001a 02            	dc.b	2
3242  001b 01            	dc.b	1
3243  001c 02            	dc.b	2
3244  001d 02            	dc.b	2
3245  001e 01            	dc.b	1
3246  001f 01            	dc.b	1
3247  0020 01            	dc.b	1
3248  0021 01            	dc.b	1
3249  0022 03            	dc.b	3
3250  0023 03            	dc.b	3
3251  0024 03            	dc.b	3
3252  0025 03            	dc.b	3
3253  0026 01            	dc.b	1
3254  0027 02            	dc.b	2
3255  0028 00            	dc.b	0
3256  0029 00            	dc.b	0
3257  002a 00            	dc.b	0
3258  002b 00            	dc.b	0
3259  002c 00            	dc.b	0
3260  002d 00            	dc.b	0
3261  002e 00            	dc.b	0
3262  002f 00            	dc.b	0
3263  0030 00            	dc.b	0
3264  0031 00            	dc.b	0
3265  0032 00            	dc.b	0
3266  0033 00            	dc.b	0
3267  0034 00            	dc.b	0
3268  0035 00            	dc.b	0
3269  0036 00            	dc.b	0
3270  0037 00            	dc.b	0
3271  0038 00            	dc.b	0
3272  0039 00            	dc.b	0
3273  003a 00            	dc.b	0
3274  003b 00            	dc.b	0
3275  003c 00            	dc.b	0
3276  003d 01            	dc.b	1
3277  003e 01            	dc.b	1
3278  003f 01            	dc.b	1
3279  0040               _wr_rd_reg:
3280  0040 09            	dc.b	9
3281  0041 0a            	dc.b	10
3282  0042 0d            	dc.b	13
3283  0043 0e            	dc.b	14
3284  0044 0f            	dc.b	15
3285  0045 10            	dc.b	16
3286  0046 11            	dc.b	17
3287  0047 12            	dc.b	18
3288  0048 13            	dc.b	19
3289  0049 14            	dc.b	20
3290  004a 15            	dc.b	21
3291  004b 18            	dc.b	24
3292  004c 19            	dc.b	25
3293  004d 1a            	dc.b	26
3294  004e 1b            	dc.b	27
3295  004f 1c            	dc.b	28
3296  0050 1d            	dc.b	29
3297  0051 1e            	dc.b	30
3298  0052 1f            	dc.b	31
3299  0053 20            	dc.b	32
3300  0054 21            	dc.b	33
3301  0055 3d            	dc.b	61
3302  0056               _rd_reg:
3303  0056 01            	dc.b	1
3304  0057 02            	dc.b	2
3305  0058 03            	dc.b	3
3306  0059 04            	dc.b	4
3307  005a 05            	dc.b	5
3308  005b 06            	dc.b	6
3309  005c 07            	dc.b	7
3310  005d 08            	dc.b	8
3311  005e 09            	dc.b	9
3312  005f 0a            	dc.b	10
3313  0060 0b            	dc.b	11
3314  0061 0c            	dc.b	12
3315  0062 0d            	dc.b	13
3316  0063 0e            	dc.b	14
3317  0064 0f            	dc.b	15
3318  0065 10            	dc.b	16
3319  0066 11            	dc.b	17
3320  0067 12            	dc.b	18
3321  0068 13            	dc.b	19
3322  0069 14            	dc.b	20
3323  006a 15            	dc.b	21
3324  006b 16            	dc.b	22
3325  006c 17            	dc.b	23
3326  006d 18            	dc.b	24
3327  006e 19            	dc.b	25
3328  006f 1a            	dc.b	26
3329  0070 1b            	dc.b	27
3330  0071 1c            	dc.b	28
3331  0072 1d            	dc.b	29
3332  0073 1e            	dc.b	30
3333  0074 1f            	dc.b	31
3334  0075 20            	dc.b	32
3335  0076 21            	dc.b	33
3336  0077 22            	dc.b	34
3337  0078 23            	dc.b	35
3338  0079 24            	dc.b	36
3339  007a 25            	dc.b	37
3340  007b 26            	dc.b	38
3341  007c 27            	dc.b	39
3342  007d 3d            	dc.b	61
3343  007e 3e            	dc.b	62
3344  007f 3f            	dc.b	63
3395                     	bsct
3396  0000               _data_buf:
3397  0000 00            	dc.b	0
3398  0001 00            	dc.b	0
3399  0002 00            	dc.b	0
3400  0003               _buf:
3401  0003 00            	dc.b	0
3402  0004 00            	dc.b	0
3403  0005 00            	dc.b	0
3404  0006               _irms:
3405  0006 00000000      	dc.l	0
3406  000a               _vrms:
3407  000a 00000000      	dc.l	0
3408  000e               _waveform:
3409  000e 00000000      	dc.l	0
3410  0012               _lvaenergy:
3411  0012 00000000      	dc.l	0
3412  0016               _laenergy:
3413  0016 00000000      	dc.l	0
3414  001a               _laenergy_add_up:
3415  001a 00000000      	dc.l	0
3416  001e               _kwh:
3417  001e 00000000      	dc.l	0
3418  0022               _meter_updata_type:
3419  0022 00            	dc.b	0
3467                     ; 44 void delay_us(uchar ts)
3467                     ; 45 {
3469                     	switch	.text
3470  0000               _delay_us:
3472  0000 88            	push	a
3473       00000000      OFST:	set	0
3476  0001 2002          	jra	L5422
3477  0003               L3422:
3478                     ; 46 	while(ts)ts--;
3480  0003 0a01          	dec	(OFST+1,sp)
3481  0005               L5422:
3484  0005 0d01          	tnz	(OFST+1,sp)
3485  0007 26fa          	jrne	L3422
3486                     ; 47 }
3489  0009 84            	pop	a
3490  000a 81            	ret
3520                     ; 54 void ade7753_config(void)
3520                     ; 55 {
3521                     	switch	.text
3522  000b               _ade7753_config:
3526                     ; 60 	data_buf[0]=0x4d;
3528  000b 354d0000      	mov	_data_buf,#77
3529                     ; 61 	data_buf[1]=0xd8;
3531  000f 35d80001      	mov	_data_buf+1,#216
3532                     ; 62 	ade7753_write_bytes(MODE);
3534  0013 a609          	ld	a,#9
3535  0015 cd029e        	call	_ade7753_write_bytes
3537                     ; 64 	delay_us(40);
3539  0018 a628          	ld	a,#40
3540  001a ade4          	call	_delay_us
3542                     ; 66 	data_buf[0]=0x0d;
3544  001c 350d0000      	mov	_data_buf,#13
3545                     ; 67 	data_buf[1]=0xd8;
3547  0020 35d80001      	mov	_data_buf+1,#216
3548                     ; 68 	ade7753_write_bytes(MODE);
3550  0024 a609          	ld	a,#9
3551  0026 cd029e        	call	_ade7753_write_bytes
3553                     ; 70 	delay_us(10);
3555  0029 a60a          	ld	a,#10
3556  002b add3          	call	_delay_us
3558                     ; 72 	if(rate_choice==1)
3560  002d b600          	ld	a,_rate_choice
3561  002f a101          	cp	a,#1
3562  0031 260d          	jrne	L1622
3563                     ; 74 	  data_buf[0]=0x64;
3565  0033 35640000      	mov	_data_buf,#100
3566                     ; 75 	  data_buf[1]=0x00;
3568  0037 3f01          	clr	_data_buf+1
3569                     ; 76 	  ade7753_write_bytes(LINECYC);
3571  0039 a61c          	ld	a,#28
3572  003b cd029e        	call	_ade7753_write_bytes
3575  003e 200b          	jra	L3622
3576  0040               L1622:
3577                     ; 80 		data_buf[0]=0x78;
3579  0040 35780000      	mov	_data_buf,#120
3580                     ; 81 	  data_buf[1]=0x00;
3582  0044 3f01          	clr	_data_buf+1
3583                     ; 82 	  ade7753_write_bytes(LINECYC);
3585  0046 a61c          	ld	a,#28
3586  0048 cd029e        	call	_ade7753_write_bytes
3588  004b               L3622:
3589                     ; 85 	delay_us(10);
3591  004b a60a          	ld	a,#10
3592  004d adb1          	call	_delay_us
3594                     ; 87 	data_buf[0]=0x02;
3596  004f 35020000      	mov	_data_buf,#2
3597                     ; 88 	ade7753_write_bytes(GAIN);
3599  0053 a60f          	ld	a,#15
3600  0055 cd029e        	call	_ade7753_write_bytes
3602                     ; 90 	delay_us(10);
3604  0058 a60a          	ld	a,#10
3605  005a ada4          	call	_delay_us
3607                     ; 92 	bstate=get_chanel1_waveform;
3609  005c 35030000      	mov	_bstate,#3
3611  0060               L1722:
3612                     ; 93 	while(offset_chanel1());
3614  0060 ad41          	call	_offset_chanel1
3616  0062 4d            	tnz	a
3617  0063 26fb          	jrne	L1722
3618                     ; 95 	data_buf[0]=0x0c;
3620  0065 350c0000      	mov	_data_buf,#12
3621                     ; 96 	data_buf[1]=0xf8;
3623  0069 35f80001      	mov	_data_buf+1,#248
3624                     ; 97 	ade7753_write_bytes(MODE);
3626  006d a609          	ld	a,#9
3627  006f cd029e        	call	_ade7753_write_bytes
3629                     ; 99 	bstate=get_chanel2_waveform;
3631  0072 35040000      	mov	_bstate,#4
3633  0076               L1032:
3634                     ; 100 	while(offset_chanel2());
3636  0076 cd017c        	call	_offset_chanel2
3638  0079 4d            	tnz	a
3639  007a 26fa          	jrne	L1032
3640                     ; 102 	delay_us(10);
3642  007c a60a          	ld	a,#10
3643  007e ad80          	call	_delay_us
3645                     ; 103 	data_buf[0]=0x8c;
3647  0080 358c0000      	mov	_data_buf,#140
3648                     ; 104 	data_buf[1]=0x18;
3650  0084 35180001      	mov	_data_buf+1,#24
3651                     ; 105 	ade7753_write_bytes(MODE);
3653  0088 a609          	ld	a,#9
3654  008a cd029e        	call	_ade7753_write_bytes
3656                     ; 130 	delay_us(10);
3658  008d a60a          	ld	a,#10
3659  008f cd0000        	call	_delay_us
3661                     ; 132 	data_buf[0]=0x14;
3663  0092 35140000      	mov	_data_buf,#20
3664                     ; 133 	data_buf[1]=0x00;
3666  0096 3f01          	clr	_data_buf+1
3667                     ; 134 	ade7753_write_bytes(IRQEN);
3669  0098 a60a          	ld	a,#10
3670  009a cd029e        	call	_ade7753_write_bytes
3672                     ; 149   delay_us(10);
3674  009d a60a          	ld	a,#10
3675  009f cd0000        	call	_delay_us
3677                     ; 156 }
3680  00a2 81            	ret
3718                     	switch	.const
3719  0080               L21:
3720  0080 00800000      	dc.l	8388608
3721  0084               L41:
3722  0084 0000060f      	dc.l	1551
3723  0088               L61:
3724  0088 0000060e      	dc.l	1550
3725                     ; 164 u8 offset_chanel1(void)
3725                     ; 165 {	
3726                     	switch	.text
3727  00a3               _offset_chanel1:
3729  00a3 88            	push	a
3730       00000001      OFST:	set	1
3733                     ; 168 	if(meter_updata_type==waveform_updata)
3735  00a4 b622          	ld	a,_meter_updata_type
3736  00a6 a103          	cp	a,#3
3737  00a8 2703          	jreq	L02
3738  00aa cc0179        	jp	L3232
3739  00ad               L02:
3740                     ; 170 		meter_updata_type=0;
3742  00ad 3f22          	clr	_meter_updata_type
3743                     ; 171 		if((waveform&0x800000)==0x800000)
3745  00af ae000e        	ldw	x,#_waveform
3746  00b2 cd0000        	call	c_ltor
3748  00b5 3f03          	clr	c_lreg+3
3749  00b7 3f02          	clr	c_lreg+2
3750  00b9 b601          	ld	a,c_lreg+1
3751  00bb a480          	and	a,#128
3752  00bd b701          	ld	c_lreg+1,a
3753  00bf 3f00          	clr	c_lreg
3754  00c1 ae0080        	ldw	x,#L21
3755  00c4 cd0000        	call	c_lcmp
3757  00c7 2662          	jrne	L5232
3758                     ; 173 			waveform=(waveform&0x7fffff);
3760  00c9 721f000f      	bres	_waveform+1,#7
3761  00cd 3f0e          	clr	_waveform
3762                     ; 174 			waveform=~waveform;
3764  00cf 3311          	cpl	_waveform+3
3765  00d1 3310          	cpl	_waveform+2
3766  00d3 330f          	cpl	_waveform+1
3767  00d5 330e          	cpl	_waveform
3768                     ; 175 			waveform=(waveform+1);
3770  00d7 ae000e        	ldw	x,#_waveform
3771  00da a601          	ld	a,#1
3772  00dc cd0000        	call	c_lgadc
3774                     ; 176 			if(waveform<=1550)
3776  00df ae000e        	ldw	x,#_waveform
3777  00e2 cd0000        	call	c_ltor
3779  00e5 ae0084        	ldw	x,#L41
3780  00e8 cd0000        	call	c_lcmp
3782  00eb 2404          	jruge	L7232
3783                     ; 177 			 return ok;
3785  00ed 4f            	clr	a
3788  00ee 5b01          	addw	sp,#1
3789  00f0 81            	ret
3790  00f1               L7232:
3791                     ; 179 			 for(i=0;i<30;)
3793  00f1 0f01          	clr	(OFST+0,sp)
3794  00f3               L1332:
3795                     ; 181 				 if(waveform>=1550)
3797  00f3 ae000e        	ldw	x,#_waveform
3798  00f6 cd0000        	call	c_ltor
3800  00f9 ae0088        	ldw	x,#L61
3801  00fc cd0000        	call	c_lcmp
3803  00ff 2518          	jrult	L5332
3804                     ; 183 					 waveform=(waveform-1550);
3806  0101 ae060e        	ldw	x,#1550
3807  0104 bf02          	ldw	c_lreg+2,x
3808  0106 ae0000        	ldw	x,#0
3809  0109 bf00          	ldw	c_lreg,x
3810  010b ae000e        	ldw	x,#_waveform
3811  010e cd0000        	call	c_lgsub
3813                     ; 184 					 i++;
3815  0111 0c01          	inc	(OFST+0,sp)
3817                     ; 179 			 for(i=0;i<30;)
3819  0113 7b01          	ld	a,(OFST+0,sp)
3820  0115 a11e          	cp	a,#30
3821  0117 25da          	jrult	L1332
3822  0119               L5332:
3823                     ; 190 			 data_buf[0]=i;
3825  0119 7b01          	ld	a,(OFST+0,sp)
3826  011b b700          	ld	_data_buf,a
3827                     ; 191 			 data_buf[0]|=0x80;
3829  011d 721e0000      	bset	_data_buf,#7
3830                     ; 192 	     ade7753_write_bytes(CH1OS);
3832  0121 a60d          	ld	a,#13
3833  0123 cd029e        	call	_ade7753_write_bytes
3835                     ; 193 			 return no_ok;
3837  0126 a601          	ld	a,#1
3840  0128 5b01          	addw	sp,#1
3841  012a 81            	ret
3842  012b               L5232:
3843                     ; 197 			if(waveform<=1550)
3845  012b ae000e        	ldw	x,#_waveform
3846  012e cd0000        	call	c_ltor
3848  0131 ae0084        	ldw	x,#L41
3849  0134 cd0000        	call	c_lcmp
3851  0137 2404          	jruge	L5432
3852                     ; 198 			 return ok;
3854  0139 4f            	clr	a
3857  013a 5b01          	addw	sp,#1
3858  013c 81            	ret
3859  013d               L5432:
3860                     ; 200 			 for(i=0;i<30;)
3862  013d 0f01          	clr	(OFST+0,sp)
3863  013f               L7432:
3864                     ; 202 				 if(waveform>=1550)
3866  013f ae000e        	ldw	x,#_waveform
3867  0142 cd0000        	call	c_ltor
3869  0145 ae0088        	ldw	x,#L61
3870  0148 cd0000        	call	c_lcmp
3872  014b 2518          	jrult	L3532
3873                     ; 204 					 waveform=(waveform-1550);
3875  014d ae060e        	ldw	x,#1550
3876  0150 bf02          	ldw	c_lreg+2,x
3877  0152 ae0000        	ldw	x,#0
3878  0155 bf00          	ldw	c_lreg,x
3879  0157 ae000e        	ldw	x,#_waveform
3880  015a cd0000        	call	c_lgsub
3882                     ; 205 					 i++;
3884  015d 0c01          	inc	(OFST+0,sp)
3886                     ; 200 			 for(i=0;i<30;)
3888  015f 7b01          	ld	a,(OFST+0,sp)
3889  0161 a11e          	cp	a,#30
3890  0163 25da          	jrult	L7432
3891  0165               L3532:
3892                     ; 211 			 data_buf[0]=i;
3894  0165 7b01          	ld	a,(OFST+0,sp)
3895  0167 b700          	ld	_data_buf,a
3896                     ; 212 			 data_buf[0]|=0xa0;
3898  0169 b600          	ld	a,_data_buf
3899  016b aaa0          	or	a,#160
3900  016d b700          	ld	_data_buf,a
3901                     ; 213 	     ade7753_write_bytes(CH1OS);
3903  016f a60d          	ld	a,#13
3904  0171 cd029e        	call	_ade7753_write_bytes
3906                     ; 214 			 return no_ok;
3908  0174 a601          	ld	a,#1
3911  0176 5b01          	addw	sp,#1
3912  0178 81            	ret
3913  0179               L3232:
3914                     ; 217 }
3917  0179 5b01          	addw	sp,#1
3918  017b 81            	ret
3956                     	switch	.const
3957  008c               L42:
3958  008c 00000028      	dc.l	40
3959  0090               L62:
3960  0090 00000027      	dc.l	39
3961                     ; 225 u8 offset_chanel2(void)
3961                     ; 226 {	
3962                     	switch	.text
3963  017c               _offset_chanel2:
3965  017c 88            	push	a
3966       00000001      OFST:	set	1
3969                     ; 229 	if(meter_updata_type==waveform_updata)
3971  017d b622          	ld	a,_meter_updata_type
3972  017f a103          	cp	a,#3
3973  0181 2703          	jreq	L03
3974  0183 cc023f        	jp	L7732
3975  0186               L03:
3976                     ; 231 		meter_updata_type=0;
3978  0186 3f22          	clr	_meter_updata_type
3979                     ; 232 		if((waveform&0x800000)==0x800000)
3981  0188 ae000e        	ldw	x,#_waveform
3982  018b cd0000        	call	c_ltor
3984  018e 3f03          	clr	c_lreg+3
3985  0190 3f02          	clr	c_lreg+2
3986  0192 b601          	ld	a,c_lreg+1
3987  0194 a480          	and	a,#128
3988  0196 b701          	ld	c_lreg+1,a
3989  0198 3f00          	clr	c_lreg
3990  019a ae0080        	ldw	x,#L21
3991  019d cd0000        	call	c_lcmp
3993  01a0 265a          	jrne	L1042
3994                     ; 234 			waveform=(waveform&0x7fffff);
3996  01a2 721f000f      	bres	_waveform+1,#7
3997  01a6 3f0e          	clr	_waveform
3998                     ; 235 			waveform=~waveform;
4000  01a8 3311          	cpl	_waveform+3
4001  01aa 3310          	cpl	_waveform+2
4002  01ac 330f          	cpl	_waveform+1
4003  01ae 330e          	cpl	_waveform
4004                     ; 236 			waveform=(waveform+1);
4006  01b0 ae000e        	ldw	x,#_waveform
4007  01b3 a601          	ld	a,#1
4008  01b5 cd0000        	call	c_lgadc
4010                     ; 237 			if(waveform<=39)//392
4012  01b8 ae000e        	ldw	x,#_waveform
4013  01bb cd0000        	call	c_ltor
4015  01be ae008c        	ldw	x,#L42
4016  01c1 cd0000        	call	c_lcmp
4018  01c4 2404          	jruge	L3042
4019                     ; 238 			 return ok;
4021  01c6 4f            	clr	a
4024  01c7 5b01          	addw	sp,#1
4025  01c9 81            	ret
4026  01ca               L3042:
4027                     ; 240 			 for(i=0;i<30;)
4029  01ca 0f01          	clr	(OFST+0,sp)
4030  01cc               L5042:
4031                     ; 242 				 if(waveform>=39)//392
4033  01cc ae000e        	ldw	x,#_waveform
4034  01cf cd0000        	call	c_ltor
4036  01d2 ae0090        	ldw	x,#L62
4037  01d5 cd0000        	call	c_lcmp
4039  01d8 2510          	jrult	L1142
4040                     ; 244 					 waveform=(waveform-39);//392
4042  01da ae000e        	ldw	x,#_waveform
4043  01dd a627          	ld	a,#39
4044  01df cd0000        	call	c_lgsbc
4046                     ; 245 					 i++;
4048  01e2 0c01          	inc	(OFST+0,sp)
4050                     ; 240 			 for(i=0;i<30;)
4052  01e4 7b01          	ld	a,(OFST+0,sp)
4053  01e6 a11e          	cp	a,#30
4054  01e8 25e2          	jrult	L5042
4055  01ea               L1142:
4056                     ; 251 			 data_buf[0]=i;
4058  01ea 7b01          	ld	a,(OFST+0,sp)
4059  01ec b700          	ld	_data_buf,a
4060                     ; 252 			 data_buf[0]|=0x20;
4062  01ee 721a0000      	bset	_data_buf,#5
4063                     ; 253 	     ade7753_write_bytes(CH1OS);
4065  01f2 a60d          	ld	a,#13
4066  01f4 cd029e        	call	_ade7753_write_bytes
4068                     ; 254 			 return no_ok;
4070  01f7 a601          	ld	a,#1
4073  01f9 5b01          	addw	sp,#1
4074  01fb 81            	ret
4075  01fc               L1042:
4076                     ; 258 			if(waveform<=39)//392
4078  01fc ae000e        	ldw	x,#_waveform
4079  01ff cd0000        	call	c_ltor
4081  0202 ae008c        	ldw	x,#L42
4082  0205 cd0000        	call	c_lcmp
4084  0208 2404          	jruge	L1242
4085                     ; 259 			 return ok;
4087  020a 4f            	clr	a
4090  020b 5b01          	addw	sp,#1
4091  020d 81            	ret
4092  020e               L1242:
4093                     ; 261 			 for(i=0;i<30;)
4095  020e 0f01          	clr	(OFST+0,sp)
4096  0210               L3242:
4097                     ; 263 				 if(waveform>=39)//392
4099  0210 ae000e        	ldw	x,#_waveform
4100  0213 cd0000        	call	c_ltor
4102  0216 ae0090        	ldw	x,#L62
4103  0219 cd0000        	call	c_lcmp
4105  021c 2510          	jrult	L7242
4106                     ; 265 					 waveform=(waveform-39);//392
4108  021e ae000e        	ldw	x,#_waveform
4109  0221 a627          	ld	a,#39
4110  0223 cd0000        	call	c_lgsbc
4112                     ; 266 					 i++;
4114  0226 0c01          	inc	(OFST+0,sp)
4116                     ; 261 			 for(i=0;i<30;)
4118  0228 7b01          	ld	a,(OFST+0,sp)
4119  022a a11e          	cp	a,#30
4120  022c 25e2          	jrult	L3242
4121  022e               L7242:
4122                     ; 272 			 data_buf[0]=i;
4124  022e 7b01          	ld	a,(OFST+0,sp)
4125  0230 b700          	ld	_data_buf,a
4126                     ; 273 			 data_buf[0]|=0x20;
4128  0232 721a0000      	bset	_data_buf,#5
4129                     ; 274 	     ade7753_write_bytes(CH1OS);
4131  0236 a60d          	ld	a,#13
4132  0238 ad64          	call	_ade7753_write_bytes
4134                     ; 275 			 return no_ok;
4136  023a a601          	ld	a,#1
4139  023c 5b01          	addw	sp,#1
4140  023e 81            	ret
4141  023f               L7732:
4142                     ; 278 }
4145  023f 5b01          	addw	sp,#1
4146  0241 81            	ret
4191                     ; 286 void ade7753_write_byte(uchar val)
4191                     ; 287 {	
4192                     	switch	.text
4193  0242               _ade7753_write_byte:
4195  0242 88            	push	a
4196  0243 88            	push	a
4197       00000001      OFST:	set	1
4200                     ; 289 	for(i=0;i<8;i++)
4202  0244 0f01          	clr	(OFST+0,sp)
4203  0246               L7542:
4204                     ; 291 		sck=1;
4206  0246 721a500a      	bset	_PC_ODR_5
4207                     ; 292 		if((val&0x80)==0x80) mosi=1;
4209  024a 7b02          	ld	a,(OFST+1,sp)
4210  024c a480          	and	a,#128
4211  024e a180          	cp	a,#128
4212  0250 2606          	jrne	L5642
4215  0252 721c500a      	bset	_PC_ODR_6
4217  0256 2004          	jra	L7642
4218  0258               L5642:
4219                     ; 293 		else mosi=0;
4221  0258 721d500a      	bres	_PC_ODR_6
4222  025c               L7642:
4223                     ; 294 		sck=0;
4225  025c 721b500a      	bres	_PC_ODR_5
4226                     ; 295 		val=val<<1;
4228  0260 0802          	sll	(OFST+1,sp)
4229                     ; 289 	for(i=0;i<8;i++)
4231  0262 0c01          	inc	(OFST+0,sp)
4234  0264 7b01          	ld	a,(OFST+0,sp)
4235  0266 a108          	cp	a,#8
4236  0268 25dc          	jrult	L7542
4237                     ; 297 }
4240  026a 85            	popw	x
4241  026b 81            	ret
4295                     ; 304 uchar ade7753_read_byte(void)
4295                     ; 305 {
4296                     	switch	.text
4297  026c               _ade7753_read_byte:
4299  026c 5203          	subw	sp,#3
4300       00000003      OFST:	set	3
4303                     ; 306 	uchar i,j,val=0;
4305  026e 0f03          	clr	(OFST+0,sp)
4306                     ; 307 	for(i=0;i<8;i++)
4308  0270 0f01          	clr	(OFST-2,sp)
4309  0272               L7152:
4310                     ; 309 		val=val<<1;
4312  0272 0803          	sll	(OFST+0,sp)
4313                     ; 310 		sck=1;
4315  0274 721a500a      	bset	_PC_ODR_5
4316                     ; 311 		if(miso) j=0x01;
4318                     	btst	_PC_IDR_7
4319  027d 2406          	jruge	L5252
4322  027f a601          	ld	a,#1
4323  0281 6b02          	ld	(OFST-1,sp),a
4325  0283 2002          	jra	L7252
4326  0285               L5252:
4327                     ; 312 		else j=0x00;
4329  0285 0f02          	clr	(OFST-1,sp)
4330  0287               L7252:
4331                     ; 313 		sck=0;
4333  0287 721b500a      	bres	_PC_ODR_5
4334                     ; 314 		val=val|j;
4336  028b 7b03          	ld	a,(OFST+0,sp)
4337  028d 1a02          	or	a,(OFST-1,sp)
4338  028f 6b03          	ld	(OFST+0,sp),a
4339                     ; 307 	for(i=0;i<8;i++)
4341  0291 0c01          	inc	(OFST-2,sp)
4344  0293 7b01          	ld	a,(OFST-2,sp)
4345  0295 a108          	cp	a,#8
4346  0297 25d9          	jrult	L7152
4347                     ; 316 	return val;
4349  0299 7b03          	ld	a,(OFST+0,sp)
4352  029b 5b03          	addw	sp,#3
4353  029d 81            	ret
4402                     ; 328 void	ade7753_write_bytes(uchar reg_name)		//
4402                     ; 329 {
4403                     	switch	.text
4404  029e               _ade7753_write_bytes:
4406  029e 88            	push	a
4407  029f 88            	push	a
4408       00000001      OFST:	set	1
4411                     ; 331 	ade7753_cs=0;
4413  02a0 7219500a      	bres	_PC_ODR_4
4414                     ; 332  	i=reg_len[reg_name];	//取得需要写字节数
4416  02a4 5f            	clrw	x
4417  02a5 97            	ld	xl,a
4418  02a6 d60000        	ld	a,(_reg_len,x)
4419  02a9 6b01          	ld	(OFST+0,sp),a
4420                     ; 333 	ade7753_write_byte(0x80|reg_name);	//将地址写入通讯寄存器
4422  02ab 7b02          	ld	a,(OFST+1,sp)
4423  02ad aa80          	or	a,#128
4424  02af ad91          	call	_ade7753_write_byte
4426                     ; 334 	delay_us(30);
4428  02b1 a61e          	ld	a,#30
4429  02b3 cd0000        	call	_delay_us
4431                     ; 335 	switch(i)
4433  02b6 7b01          	ld	a,(OFST+0,sp)
4435                     ; 344 			break;
4436  02b8 4a            	dec	a
4437  02b9 2713          	jreq	L3352
4438  02bb 4a            	dec	a
4439  02bc 2615          	jrne	L1652
4440                     ; 337 		case 2:
4440                     ; 338 			ade7753_write_byte(data_buf[1]);
4442  02be b601          	ld	a,_data_buf+1
4443  02c0 ad80          	call	_ade7753_write_byte
4445                     ; 339 			delay_us(30);
4447  02c2 a61e          	ld	a,#30
4448  02c4 cd0000        	call	_delay_us
4450                     ; 340 		  ade7753_write_byte(data_buf[0]);
4452  02c7 b600          	ld	a,_data_buf
4453  02c9 cd0242        	call	_ade7753_write_byte
4455                     ; 341 			break;
4457  02cc 2005          	jra	L1652
4458  02ce               L3352:
4459                     ; 342 		case 1:
4459                     ; 343 			ade7753_write_byte(data_buf[0]);
4461  02ce b600          	ld	a,_data_buf
4462  02d0 cd0242        	call	_ade7753_write_byte
4464                     ; 344 			break;
4466  02d3               L1652:
4467                     ; 346 	ade7753_cs=1;
4469  02d3 7218500a      	bset	_PC_ODR_4
4470                     ; 347 }
4473  02d7 85            	popw	x
4474  02d8 81            	ret
4523                     ; 355 void	ade7753_read_bytes(uchar reg_name)		
4523                     ; 356 {
4524                     	switch	.text
4525  02d9               _ade7753_read_bytes:
4527  02d9 88            	push	a
4528  02da 88            	push	a
4529       00000001      OFST:	set	1
4532                     ; 359 	buf[0]=0;
4534  02db 3f03          	clr	_buf
4535                     ; 360 	buf[1]=0;
4537  02dd 3f04          	clr	_buf+1
4538                     ; 361 	buf[2]=0;
4540  02df 3f05          	clr	_buf+2
4541                     ; 363 	ade7753_cs=0;
4543  02e1 7219500a      	bres	_PC_ODR_4
4544                     ; 364  	i=reg_len[reg_name];	//取得需要读取的字节数
4546  02e5 5f            	clrw	x
4547  02e6 97            	ld	xl,a
4548  02e7 d60000        	ld	a,(_reg_len,x)
4549  02ea 6b01          	ld	(OFST+0,sp),a
4550                     ; 365 	ade7753_write_byte(reg_name);	//将地址写入通讯寄存器
4552  02ec 7b02          	ld	a,(OFST+1,sp)
4553  02ee cd0242        	call	_ade7753_write_byte
4555                     ; 366 	delay_us(30);
4557  02f1 a61e          	ld	a,#30
4558  02f3 cd0000        	call	_delay_us
4560                     ; 367 	switch(i)
4562  02f6 7b01          	ld	a,(OFST+0,sp)
4564                     ; 383 			break;
4565  02f8 4a            	dec	a
4566  02f9 2732          	jreq	L7652
4567  02fb 4a            	dec	a
4568  02fc 271e          	jreq	L5652
4569  02fe 4a            	dec	a
4570  02ff 2631          	jrne	L5162
4571                     ; 369 		case 3:
4571                     ; 370 			buf[2]=ade7753_read_byte();		//最高字节
4573  0301 cd026c        	call	_ade7753_read_byte
4575  0304 b705          	ld	_buf+2,a
4576                     ; 371 			delay_us(30);
4578  0306 a61e          	ld	a,#30
4579  0308 cd0000        	call	_delay_us
4581                     ; 372 			buf[1]=ade7753_read_byte();
4583  030b cd026c        	call	_ade7753_read_byte
4585  030e b704          	ld	_buf+1,a
4586                     ; 373 			delay_us(30);
4588  0310 a61e          	ld	a,#30
4589  0312 cd0000        	call	_delay_us
4591                     ; 374 			buf[0]=ade7753_read_byte();         //低字节
4593  0315 cd026c        	call	_ade7753_read_byte
4595  0318 b703          	ld	_buf,a
4596                     ; 375 			break;
4598  031a 2016          	jra	L5162
4599  031c               L5652:
4600                     ; 376 		case 2:							          	
4600                     ; 377 			buf[1]=ade7753_read_byte();
4602  031c cd026c        	call	_ade7753_read_byte
4604  031f b704          	ld	_buf+1,a
4605                     ; 378 			delay_us(30);
4607  0321 a61e          	ld	a,#30
4608  0323 cd0000        	call	_delay_us
4610                     ; 379 			buf[0]=ade7753_read_byte();
4612  0326 cd026c        	call	_ade7753_read_byte
4614  0329 b703          	ld	_buf,a
4615                     ; 380 			break;
4617  032b 2005          	jra	L5162
4618  032d               L7652:
4619                     ; 381 		case 1:
4619                     ; 382 			buf[0]=ade7753_read_byte();
4621  032d cd026c        	call	_ade7753_read_byte
4623  0330 b703          	ld	_buf,a
4624                     ; 383 			break;
4626  0332               L5162:
4627                     ; 385   ade7753_cs=1;
4629  0332 7218500a      	bset	_PC_ODR_4
4630                     ; 386 }
4633  0336 85            	popw	x
4634  0337 81            	ret
4637                     	bsct
4638  0023               L7162_add_up_number:
4639  0023 00            	dc.b	0
4640  0024               L1262_meter_data_buf:
4641  0024 00000000      	dc.l	0
4642  0028               L3262_reg_name_buf:
4643  0028 00            	dc.b	0
4708                     ; 395 void meter_data_get (u8 reg_name)
4708                     ; 396 {
4709                     	switch	.text
4710  0338               _meter_data_get:
4712  0338 88            	push	a
4713       00000000      OFST:	set	0
4716                     ; 401 	if(reg_name!=reg_name_buf)
4718  0339 b128          	cp	a,L3262_reg_name_buf
4719  033b 270e          	jreq	L7662
4720                     ; 403 		reg_name_buf=reg_name;
4722  033d b728          	ld	L3262_reg_name_buf,a
4723                     ; 404 		meter_data_buf=0;
4725  033f ae0000        	ldw	x,#0
4726  0342 bf26          	ldw	L1262_meter_data_buf+2,x
4727  0344 ae0000        	ldw	x,#0
4728  0347 bf24          	ldw	L1262_meter_data_buf,x
4729                     ; 405 		add_up_number=0;
4731  0349 3f23          	clr	L7162_add_up_number
4732  034b               L7662:
4733                     ; 408 	ade7753_read_bytes(reg_name);
4735  034b 7b01          	ld	a,(OFST+1,sp)
4736  034d ad8a          	call	_ade7753_read_bytes
4738                     ; 410 	meter_data_buf=(meter_data_buf+(u32)buf[0]);
4740  034f b603          	ld	a,_buf
4741  0351 b703          	ld	c_lreg+3,a
4742  0353 3f02          	clr	c_lreg+2
4743  0355 3f01          	clr	c_lreg+1
4744  0357 3f00          	clr	c_lreg
4745  0359 ae0024        	ldw	x,#L1262_meter_data_buf
4746  035c cd0000        	call	c_lgadd
4748                     ; 411 	meter_data_buf=(meter_data_buf+((u32)buf[1]<<8));
4750  035f b604          	ld	a,_buf+1
4751  0361 5f            	clrw	x
4752  0362 97            	ld	xl,a
4753  0363 90ae0100      	ldw	y,#256
4754  0367 cd0000        	call	c_umul
4756  036a ae0024        	ldw	x,#L1262_meter_data_buf
4757  036d cd0000        	call	c_lgadd
4759                     ; 412 	meter_data_buf=(meter_data_buf+((u32)buf[2]<<16));
4761  0370 b605          	ld	a,_buf+2
4762  0372 b703          	ld	c_lreg+3,a
4763  0374 3f02          	clr	c_lreg+2
4764  0376 3f01          	clr	c_lreg+1
4765  0378 3f00          	clr	c_lreg
4766  037a a610          	ld	a,#16
4767  037c cd0000        	call	c_llsh
4769  037f ae0024        	ldw	x,#L1262_meter_data_buf
4770  0382 cd0000        	call	c_lgadd
4772                     ; 414 	add_up_number+=1;
4774  0385 3c23          	inc	L7162_add_up_number
4775                     ; 415 	if(add_up_number>63)
4777  0387 b623          	ld	a,L7162_add_up_number
4778  0389 a140          	cp	a,#64
4779  038b 2548          	jrult	L1762
4780                     ; 417 		add_up_number=0;
4782  038d 3f23          	clr	L7162_add_up_number
4783                     ; 418 		meter_data_buf=meter_data_buf/64;
4785  038f ae0024        	ldw	x,#L1262_meter_data_buf
4786  0392 a606          	ld	a,#6
4787  0394 cd0000        	call	c_lgursh
4789                     ; 419 		switch(reg_name)
4791  0397 7b01          	ld	a,(OFST+1,sp)
4793                     ; 442 			default:
4793                     ; 443 			  break;
4794  0399 4a            	dec	a
4795  039a 2723          	jreq	L1362
4796  039c a015          	sub	a,#21
4797  039e 2711          	jreq	L7262
4798  03a0 4a            	dec	a
4799  03a1 2628          	jrne	L5762
4800                     ; 421 			case VRMS:
4800                     ; 422 			  vrms=meter_data_buf;
4802  03a3 be26          	ldw	x,L1262_meter_data_buf+2
4803  03a5 bf0c          	ldw	_vrms+2,x
4804  03a7 be24          	ldw	x,L1262_meter_data_buf
4805  03a9 bf0a          	ldw	_vrms,x
4806                     ; 423 				meter_updata_type=vrms_updata;
4808  03ab 35010022      	mov	_meter_updata_type,#1
4809                     ; 424 				break;
4811  03af 201a          	jra	L5762
4812  03b1               L7262:
4813                     ; 426 			case IRMS:
4813                     ; 427 			  irms=meter_data_buf;
4815  03b1 be26          	ldw	x,L1262_meter_data_buf+2
4816  03b3 bf08          	ldw	_irms+2,x
4817  03b5 be24          	ldw	x,L1262_meter_data_buf
4818  03b7 bf06          	ldw	_irms,x
4819                     ; 428 				meter_updata_type=irms_updata;
4821  03b9 35020022      	mov	_meter_updata_type,#2
4822                     ; 429 				break;
4824  03bd 200c          	jra	L5762
4825  03bf               L1362:
4826                     ; 431 			case WAVEFORM:
4826                     ; 432 			  waveform=meter_data_buf;
4828  03bf be26          	ldw	x,L1262_meter_data_buf+2
4829  03c1 bf10          	ldw	_waveform+2,x
4830  03c3 be24          	ldw	x,L1262_meter_data_buf
4831  03c5 bf0e          	ldw	_waveform,x
4832                     ; 433 				meter_updata_type=waveform_updata;
4834  03c7 35030022      	mov	_meter_updata_type,#3
4835                     ; 434 				break;
4837  03cb               L3362:
4838                     ; 442 			default:
4838                     ; 443 			  break;
4840  03cb               L5762:
4841                     ; 446 		meter_data_buf=0;
4843  03cb ae0000        	ldw	x,#0
4844  03ce bf26          	ldw	L1262_meter_data_buf+2,x
4845  03d0 ae0000        	ldw	x,#0
4846  03d3 bf24          	ldw	L1262_meter_data_buf,x
4847  03d5               L1762:
4848                     ; 449 }
4851  03d5 84            	pop	a
4852  03d6 81            	ret
4855                     	bsct
4856  0029               L7762_laenergy_buf:
4857  0029 00000000      	dc.l	0
4906                     	switch	.const
4907  0094               L64:
4908  0094 00000025      	dc.l	37
4909  0098               L05:
4910  0098 00008ca0      	dc.l	36000
4911                     ; 458 void meter_watt(u8 val)
4911                     ; 459 {
4912                     	switch	.text
4913  03d7               _meter_watt:
4915  03d7 88            	push	a
4916       00000000      OFST:	set	0
4919                     ; 461 	ade7753_read_bytes(val);
4921  03d8 cd02d9        	call	_ade7753_read_bytes
4923                     ; 463 	laenergy_buf=0;
4925  03db ae0000        	ldw	x,#0
4926  03de bf2b          	ldw	L7762_laenergy_buf+2,x
4927  03e0 ae0000        	ldw	x,#0
4928  03e3 bf29          	ldw	L7762_laenergy_buf,x
4929                     ; 464 	laenergy_buf=(u32)buf[0];
4931  03e5 b603          	ld	a,_buf
4932  03e7 b703          	ld	c_lreg+3,a
4933  03e9 3f02          	clr	c_lreg+2
4934  03eb 3f01          	clr	c_lreg+1
4935  03ed 3f00          	clr	c_lreg
4936  03ef ae0029        	ldw	x,#L7762_laenergy_buf
4937  03f2 cd0000        	call	c_rtol
4939                     ; 465 	laenergy_buf=(laenergy_buf+((u32)buf[1]<<8));
4941  03f5 b604          	ld	a,_buf+1
4942  03f7 5f            	clrw	x
4943  03f8 97            	ld	xl,a
4944  03f9 90ae0100      	ldw	y,#256
4945  03fd cd0000        	call	c_umul
4947  0400 ae0029        	ldw	x,#L7762_laenergy_buf
4948  0403 cd0000        	call	c_lgadd
4950                     ; 466 	laenergy_buf=(laenergy_buf+((u32)buf[2]<<16));
4952  0406 b605          	ld	a,_buf+2
4953  0408 b703          	ld	c_lreg+3,a
4954  040a 3f02          	clr	c_lreg+2
4955  040c 3f01          	clr	c_lreg+1
4956  040e 3f00          	clr	c_lreg
4957  0410 a610          	ld	a,#16
4958  0412 cd0000        	call	c_llsh
4960  0415 ae0029        	ldw	x,#L7762_laenergy_buf
4961  0418 cd0000        	call	c_lgadd
4963                     ; 469 	if((laenergy_buf&0x00800000)==0x00800000)
4965  041b ae0029        	ldw	x,#L7762_laenergy_buf
4966  041e cd0000        	call	c_ltor
4968  0421 3f03          	clr	c_lreg+3
4969  0423 3f02          	clr	c_lreg+2
4970  0425 b601          	ld	a,c_lreg+1
4971  0427 a480          	and	a,#128
4972  0429 b701          	ld	c_lreg+1,a
4973  042b 3f00          	clr	c_lreg
4974  042d ae0080        	ldw	x,#L21
4975  0430 cd0000        	call	c_lcmp
4977  0433 2616          	jrne	L3272
4978                     ; 471 		laenergy_buf=~laenergy_buf;
4980  0435 332c          	cpl	L7762_laenergy_buf+3
4981  0437 332b          	cpl	L7762_laenergy_buf+2
4982  0439 332a          	cpl	L7762_laenergy_buf+1
4983  043b 3329          	cpl	L7762_laenergy_buf
4984                     ; 472 		laenergy_buf&=0x007fffff;
4986  043d 721f002a      	bres	L7762_laenergy_buf+1,#7
4987  0441 3f29          	clr	L7762_laenergy_buf
4988                     ; 473 		laenergy_buf+=1;
4990  0443 ae0029        	ldw	x,#L7762_laenergy_buf
4991  0446 a601          	ld	a,#1
4992  0448 cd0000        	call	c_lgadc
4994  044b               L3272:
4995                     ; 476 	if(val==LVAENERGY) 
4997  044b 7b01          	ld	a,(OFST+1,sp)
4998  044d a107          	cp	a,#7
4999  044f 260a          	jrne	L5272
5000                     ; 478 		lvaenergy=laenergy_buf;
5002  0451 be2b          	ldw	x,L7762_laenergy_buf+2
5003  0453 bf14          	ldw	_lvaenergy+2,x
5004  0455 be29          	ldw	x,L7762_laenergy_buf
5005  0457 bf12          	ldw	_lvaenergy,x
5007  0459 207b          	jra	L7272
5008  045b               L5272:
5009                     ; 482 	  laenergy=laenergy_buf;
5011  045b be2b          	ldw	x,L7762_laenergy_buf+2
5012  045d bf18          	ldw	_laenergy+2,x
5013  045f be29          	ldw	x,L7762_laenergy_buf
5014  0461 bf16          	ldw	_laenergy,x
5015                     ; 483 	  laenergy_add_up+=(laenergy*10/37);
5017  0463 ae0016        	ldw	x,#_laenergy
5018  0466 cd0000        	call	c_ltor
5020  0469 a60a          	ld	a,#10
5021  046b cd0000        	call	c_smul
5023  046e ae0094        	ldw	x,#L64
5024  0471 cd0000        	call	c_ludv
5026  0474 ae001a        	ldw	x,#_laenergy_add_up
5027  0477 cd0000        	call	c_lgadd
5029                     ; 484 	  if(laenergy_add_up>35999)
5031  047a ae001a        	ldw	x,#_laenergy_add_up
5032  047d cd0000        	call	c_ltor
5034  0480 ae0098        	ldw	x,#L05
5035  0483 cd0000        	call	c_lcmp
5037  0486 254e          	jrult	L7272
5038                     ; 486 		  kwh+=1;
5040  0488 ae001e        	ldw	x,#_kwh
5041  048b a601          	ld	a,#1
5042  048d cd0000        	call	c_lgadc
5044                     ; 487 		  laenergy_add_up-=36000;
5046  0490 ae8ca0        	ldw	x,#36000
5047  0493 bf02          	ldw	c_lreg+2,x
5048  0495 ae0000        	ldw	x,#0
5049  0498 bf00          	ldw	c_lreg,x
5050  049a ae001a        	ldw	x,#_laenergy_add_up
5051  049d cd0000        	call	c_lgsub
5054  04a0               L5372:
5055                     ; 488 		  while((FLASH_IAPSR&0x04)==0x04);
5057  04a0 c6505f        	ld	a,_FLASH_IAPSR
5058  04a3 a404          	and	a,#4
5059  04a5 a104          	cp	a,#4
5060  04a7 27f7          	jreq	L5372
5061                     ; 489 		  eeprom_write(0x01,(u8)kwh);
5063  04a9 b621          	ld	a,_kwh+3
5064  04ab 97            	ld	xl,a
5065  04ac a601          	ld	a,#1
5066  04ae 95            	ld	xh,a
5067  04af cd0000        	call	_eeprom_write
5070  04b2               L3472:
5071                     ; 491 		  while((FLASH_IAPSR&0x04)==0x04);
5073  04b2 c6505f        	ld	a,_FLASH_IAPSR
5074  04b5 a404          	and	a,#4
5075  04b7 a104          	cp	a,#4
5076  04b9 27f7          	jreq	L3472
5077                     ; 492 		  eeprom_write(0x02,(u8)(kwh>>8));
5079  04bb b620          	ld	a,_kwh+2
5080  04bd 97            	ld	xl,a
5081  04be a602          	ld	a,#2
5082  04c0 95            	ld	xh,a
5083  04c1 cd0000        	call	_eeprom_write
5086  04c4               L1572:
5087                     ; 494 		  while((FLASH_IAPSR&0x04)==0x04);
5089  04c4 c6505f        	ld	a,_FLASH_IAPSR
5090  04c7 a404          	and	a,#4
5091  04c9 a104          	cp	a,#4
5092  04cb 27f7          	jreq	L1572
5093                     ; 495 		  eeprom_write(0x03,(u8)(kwh>>16));
5095  04cd b61f          	ld	a,_kwh+1
5096  04cf 97            	ld	xl,a
5097  04d0 a603          	ld	a,#3
5098  04d2 95            	ld	xh,a
5099  04d3 cd0000        	call	_eeprom_write
5101  04d6               L7272:
5102                     ; 498 }
5105  04d6 84            	pop	a
5106  04d7 81            	ret
5146                     ; 506 void meter_rate_get(void)
5146                     ; 507 {
5147                     	switch	.text
5148  04d8               _meter_rate_get:
5150  04d8 5204          	subw	sp,#4
5151       00000004      OFST:	set	4
5154                     ; 511 	temp=(u32)rate;
5156  04da be00          	ldw	x,_rate
5157  04dc cd0000        	call	c_uitolx
5159  04df 96            	ldw	x,sp
5160  04e0 1c0001        	addw	x,#OFST-3
5161  04e3 cd0000        	call	c_rtol
5163                     ; 512 	temp=(500000/temp-4);
5165  04e6 aea120        	ldw	x,#41248
5166  04e9 bf02          	ldw	c_lreg+2,x
5167  04eb ae0007        	ldw	x,#7
5168  04ee bf00          	ldw	c_lreg,x
5169  04f0 96            	ldw	x,sp
5170  04f1 1c0001        	addw	x,#OFST-3
5171  04f4 cd0000        	call	c_ludv
5173  04f7 a604          	ld	a,#4
5174  04f9 cd0000        	call	c_lsbc
5176  04fc 96            	ldw	x,sp
5177  04fd 1c0001        	addw	x,#OFST-3
5178  0500 cd0000        	call	c_rtol
5180                     ; 513 	frequency=(u16)temp;
5182  0503 1e03          	ldw	x,(OFST-1,sp)
5183  0505 bf01          	ldw	_frequency,x
5184                     ; 535 	if(frequency>550)
5186  0507 be01          	ldw	x,_frequency
5187  0509 a30227        	cpw	x,#551
5188  050c 2576          	jrult	L3772
5189                     ; 537 	 if(rate_choice==1)
5191  050e b600          	ld	a,_rate_choice
5192  0510 a101          	cp	a,#1
5193  0512 266c          	jrne	L5772
5194                     ; 543 		ade7753_cs=0;
5196  0514 7219500a      	bres	_PC_ODR_4
5197                     ; 544 		ade7753_write_byte(0x80|MODE);
5199  0518 a689          	ld	a,#137
5200  051a cd0242        	call	_ade7753_write_byte
5202                     ; 545 		delay_us(10);
5204  051d a60a          	ld	a,#10
5205  051f cd0000        	call	_delay_us
5207                     ; 546 		ade7753_write_byte(0x0d);
5209  0522 a60d          	ld	a,#13
5210  0524 cd0242        	call	_ade7753_write_byte
5212                     ; 547 		delay_us(10);
5214  0527 a60a          	ld	a,#10
5215  0529 cd0000        	call	_delay_us
5217                     ; 548 		ade7753_write_byte(0xd8);
5219  052c a6d8          	ld	a,#216
5220  052e cd0242        	call	_ade7753_write_byte
5222                     ; 549 		delay_us(10);
5224  0531 a60a          	ld	a,#10
5225  0533 cd0000        	call	_delay_us
5227                     ; 550 		ade7753_cs=1;
5229  0536 7218500a      	bset	_PC_ODR_4
5230                     ; 552 		 ade7753_cs=0;
5232  053a 7219500a      	bres	_PC_ODR_4
5233                     ; 553 		 ade7753_write_byte(0x80|LINECYC);	//将地址写入通讯寄存器
5235  053e a69c          	ld	a,#156
5236  0540 cd0242        	call	_ade7753_write_byte
5238                     ; 554 	   delay_us(10);
5240  0543 a60a          	ld	a,#10
5241  0545 cd0000        	call	_delay_us
5243                     ; 555 		 ade7753_write_byte(0x00);
5245  0548 4f            	clr	a
5246  0549 cd0242        	call	_ade7753_write_byte
5248                     ; 556 		 delay_us(10);
5250  054c a60a          	ld	a,#10
5251  054e cd0000        	call	_delay_us
5253                     ; 557 		 ade7753_write_byte(0x78);
5255  0551 a678          	ld	a,#120
5256  0553 cd0242        	call	_ade7753_write_byte
5258                     ; 558 		 ade7753_cs=1;
5260  0556 7218500a      	bset	_PC_ODR_4
5261                     ; 560 		 ade7753_cs=0;
5263  055a 7219500a      	bres	_PC_ODR_4
5264                     ; 561 		 ade7753_write_byte(0x80|MODE);
5266  055e a689          	ld	a,#137
5267  0560 cd0242        	call	_ade7753_write_byte
5269                     ; 562 		 delay_us(10);
5271  0563 a60a          	ld	a,#10
5272  0565 cd0000        	call	_delay_us
5274                     ; 563 		 ade7753_write_byte(0x8c);
5276  0568 a68c          	ld	a,#140
5277  056a cd0242        	call	_ade7753_write_byte
5279                     ; 564 		 delay_us(10);
5281  056d a60a          	ld	a,#10
5282  056f cd0000        	call	_delay_us
5284                     ; 565 		 ade7753_write_byte(0x18);
5286  0572 a618          	ld	a,#24
5287  0574 cd0242        	call	_ade7753_write_byte
5289                     ; 566 		 delay_us(10);
5291  0577 a60a          	ld	a,#10
5292  0579 cd0000        	call	_delay_us
5294                     ; 567 		 ade7753_cs=1;
5296  057c 7218500a      	bset	_PC_ODR_4
5297  0580               L5772:
5298                     ; 570 	 rate_choice=0;
5300  0580 3f00          	clr	_rate_choice
5302  0582 2074          	jra	L7772
5303  0584               L3772:
5304                     ; 574 	  if(rate_choice==0)
5306  0584 3d00          	tnz	_rate_choice
5307  0586 266c          	jrne	L1003
5308                     ; 580 			ade7753_cs=0;
5310  0588 7219500a      	bres	_PC_ODR_4
5311                     ; 581 		  ade7753_write_byte(0x80|MODE);
5313  058c a689          	ld	a,#137
5314  058e cd0242        	call	_ade7753_write_byte
5316                     ; 582 		  delay_us(10);
5318  0591 a60a          	ld	a,#10
5319  0593 cd0000        	call	_delay_us
5321                     ; 583 		  ade7753_write_byte(0x0d);
5323  0596 a60d          	ld	a,#13
5324  0598 cd0242        	call	_ade7753_write_byte
5326                     ; 584 		  delay_us(10);
5328  059b a60a          	ld	a,#10
5329  059d cd0000        	call	_delay_us
5331                     ; 585 		  ade7753_write_byte(0xd8);
5333  05a0 a6d8          	ld	a,#216
5334  05a2 cd0242        	call	_ade7753_write_byte
5336                     ; 586 		  delay_us(10);
5338  05a5 a60a          	ld	a,#10
5339  05a7 cd0000        	call	_delay_us
5341                     ; 587 		  ade7753_cs=1;
5343  05aa 7218500a      	bset	_PC_ODR_4
5344                     ; 589 			ade7753_cs=0;
5346  05ae 7219500a      	bres	_PC_ODR_4
5347                     ; 590 		  ade7753_write_byte(0x80|LINECYC);	//将地址写入通讯寄存器
5349  05b2 a69c          	ld	a,#156
5350  05b4 cd0242        	call	_ade7753_write_byte
5352                     ; 591 	    delay_us(30);
5354  05b7 a61e          	ld	a,#30
5355  05b9 cd0000        	call	_delay_us
5357                     ; 592 		  ade7753_write_byte(0x00);
5359  05bc 4f            	clr	a
5360  05bd cd0242        	call	_ade7753_write_byte
5362                     ; 593 		  delay_us(30);
5364  05c0 a61e          	ld	a,#30
5365  05c2 cd0000        	call	_delay_us
5367                     ; 594 		  ade7753_write_byte(0x64);
5369  05c5 a664          	ld	a,#100
5370  05c7 cd0242        	call	_ade7753_write_byte
5372                     ; 595 		  ade7753_cs=1;
5374  05ca 7218500a      	bset	_PC_ODR_4
5375                     ; 597 			ade7753_cs=0;
5377  05ce 7219500a      	bres	_PC_ODR_4
5378                     ; 598 		  ade7753_write_byte(0x80|MODE);
5380  05d2 a689          	ld	a,#137
5381  05d4 cd0242        	call	_ade7753_write_byte
5383                     ; 599 		  delay_us(10);
5385  05d7 a60a          	ld	a,#10
5386  05d9 cd0000        	call	_delay_us
5388                     ; 600 		  ade7753_write_byte(0x8c);
5390  05dc a68c          	ld	a,#140
5391  05de cd0242        	call	_ade7753_write_byte
5393                     ; 601 		  delay_us(10);
5395  05e1 a60a          	ld	a,#10
5396  05e3 cd0000        	call	_delay_us
5398                     ; 602 		  ade7753_write_byte(0x18);
5400  05e6 a618          	ld	a,#24
5401  05e8 cd0242        	call	_ade7753_write_byte
5403                     ; 603 		  delay_us(10);
5405  05eb a60a          	ld	a,#10
5406  05ed cd0000        	call	_delay_us
5408                     ; 604 		  ade7753_cs=1;
5410  05f0 7218500a      	bset	_PC_ODR_4
5411  05f4               L1003:
5412                     ; 607 	  rate_choice=1;
5414  05f4 35010000      	mov	_rate_choice,#1
5415  05f8               L7772:
5416                     ; 609 }
5419  05f8 5b04          	addw	sp,#4
5420  05fa 81            	ret
5545                     	xdef	_delay_us
5546                     	xdef	_offset_chanel2
5547                     	xdef	_offset_chanel1
5548                     	xdef	_ade7753_read_byte
5549                     	xdef	_ade7753_write_byte
5550                     	xref.b	_rate
5551                     	switch	.ubsct
5552  0000               _rate_choice:
5553  0000 00            	ds.b	1
5554                     	xdef	_rate_choice
5555  0001               _frequency:
5556  0001 0000          	ds.b	2
5557                     	xdef	_frequency
5558                     	xdef	_meter_updata_type
5559                     	xdef	_kwh
5560                     	xdef	_laenergy_add_up
5561                     	xdef	_laenergy
5562                     	xdef	_lvaenergy
5563                     	xdef	_waveform
5564                     	xdef	_vrms
5565                     	xdef	_irms
5566                     	xdef	_buf
5567                     	xdef	_data_buf
5568                     	xref.b	_bstate
5569                     	xref	_eeprom_write
5570                     	xdef	_meter_rate_get
5571                     	xdef	_meter_watt
5572                     	xdef	_meter_data_get
5573                     	xdef	_ade7753_read_bytes
5574                     	xdef	_ade7753_write_bytes
5575                     	xdef	_ade7753_config
5576                     	xdef	_rd_reg
5577                     	xdef	_wr_rd_reg
5578                     	xdef	_reg_len
5579                     	xref.b	c_lreg
5599                     	xref	c_lsbc
5600                     	xref	c_uitolx
5601                     	xref	c_ludv
5602                     	xref	c_smul
5603                     	xref	c_rtol
5604                     	xref	c_lgursh
5605                     	xref	c_llsh
5606                     	xref	c_umul
5607                     	xref	c_lgadd
5608                     	xref	c_lgsbc
5609                     	xref	c_lgsub
5610                     	xref	c_lgadc
5611                     	xref	c_lcmp
5612                     	xref	c_ltor
5613                     	end
