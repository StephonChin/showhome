   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Generator V4.2.4 - 19 Dec 2007
3302                     ; 16 void main(void)
3302                     ; 17 {
3304                     	switch	.text
3305  0000               _main:
3307  0000 88            	push	a
3308       00000001      OFST:	set	1
3311                     ; 18     _Uchar     MainStep   = 0;
3313  0001 0f01          	clr	(OFST+0,sp)
3314                     ; 20     Mcu_Config();
3316  0003 cd0000        	call	_Mcu_Config
3318                     ; 21     Power_On_Init();
3320  0006 cd0000        	call	_Power_On_Init
3322  0009               L7422:
3323                     ; 25         if (TIM1_UPDATE_FLAG == TRUE)     	//2ms
3325                     	btst	_TIM1_UPDATE_FLAG
3326  000e 24f9          	jruge	L7422
3327                     ; 27             TIM1_UPDATE_FLAG = FALSE;
3329  0010 72115255      	bres	_TIM1_UPDATE_FLAG
3330                     ; 29             Led_Display();						//ledœ‘ æ
3332  0014 cd0000        	call	_Led_Display
3334                     ; 31             switch (MainStep)   				//2 * 5 = 10ms
3336  0017 7b01          	ld	a,(OFST+0,sp)
3338                     ; 61                 break;
3339  0019 4d            	tnz	a
3340  001a 2710          	jreq	L7022
3341  001c 4a            	dec	a
3342  001d 2714          	jreq	L1122
3343  001f 4a            	dec	a
3344  0020 2718          	jreq	L3122
3345  0022 4a            	dec	a
3346  0023 271c          	jreq	L5122
3347  0025 4a            	dec	a
3348  0026 2720          	jreq	L7122
3349  0028               L1222:
3350                     ; 59                 default:
3350                     ; 60                     MainStep = 0;
3352  0028 0f01          	clr	(OFST+0,sp)
3353                     ; 61                 break;
3355  002a 20dd          	jra	L7422
3356  002c               L7022:
3357                     ; 33                 case 0:
3357                     ; 34                     Rcv_Data_From_App();				//appÕ®–≈
3359  002c cd0000        	call	_Rcv_Data_From_App
3361                     ; 35                     MainStep++;
3363  002f 0c01          	inc	(OFST+0,sp)
3364                     ; 36                 break;
3366  0031 20d6          	jra	L7422
3367  0033               L1122:
3368                     ; 38                 case 1:
3368                     ; 39 					Data_Process();
3370  0033 cd0000        	call	_Data_Process
3372                     ; 40                     MainStep++;
3374  0036 0c01          	inc	(OFST+0,sp)
3375                     ; 41                 break;
3377  0038 20cf          	jra	L7422
3378  003a               L3122:
3379                     ; 43                 case 2:
3379                     ; 44                     Key_Scan();
3381  003a cd0000        	call	_Key_Scan
3383                     ; 45                     MainStep++;
3385  003d 0c01          	inc	(OFST+0,sp)
3386                     ; 46                 break;
3388  003f 20c8          	jra	L7422
3389  0041               L5122:
3390                     ; 48                 case 3:
3390                     ; 49 					Switch_On_Off();
3392  0041 cd0000        	call	_Switch_On_Off
3394                     ; 51                     MainStep++;
3396  0044 0c01          	inc	(OFST+0,sp)
3397                     ; 52                 break;
3399  0046 20c1          	jra	L7422
3400  0048               L7122:
3401                     ; 54                 case 4:
3401                     ; 55 					Respond_App();
3403  0048 cd0000        	call	_Respond_App
3405                     ; 56                     MainStep = 0;
3407  004b 0f01          	clr	(OFST+0,sp)
3408                     ; 57                 break;
3410  004d 20ba          	jra	L7422
3411  004f               L7522:
3412  004f 20b8          	jra	L7422
3425                     	xdef	_main
3426                     	xref	_Switch_On_Off
3427                     	xref	_Key_Scan
3428                     	xref	_Power_On_Init
3429                     	xref	_Data_Process
3430                     	xref	_Led_Display
3431                     	xref	_Respond_App
3432                     	xref	_Rcv_Data_From_App
3433                     	xref	_Mcu_Config
3452                     	end
