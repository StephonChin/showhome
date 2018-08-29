   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Generator V4.2.4 - 19 Dec 2007
3250                     ; 13 static void Clk_Init(void)
3250                     ; 14 {
3252                     	switch	.text
3253  0000               L3712_Clk_Init:
3257                     ; 15     CLK_CKDIVR = 0x00;   //Fcpu = 16/1 = 16M
3259  0000 725f50c6      	clr	_CLK_CKDIVR
3260                     ; 16     CLK_SWR    = 0xE1;   //HSI selected as system clock
3262  0004 35e150c4      	mov	_CLK_SWR,#225
3263                     ; 17 }
3266  0008 81            	ret
3300                     ; 22 static void Gpio_Init(void)
3300                     ; 23 {
3301                     	switch	.text
3302  0009               L3122_Gpio_Init:
3306                     ; 25   PD_DDR |= 0x20;
3308  0009 721a5011      	bset	_PD_DDR,#5
3309                     ; 26   PD_CR1 |= 0x20;
3311  000d 721a5012      	bset	_PD_CR1,#5
3312                     ; 29   PD_DDR &= (~0x40);
3314  0011 721d5011      	bres	_PD_DDR,#6
3315                     ; 30   PD_CR1 |= 0x40;
3317  0015 721c5012      	bset	_PD_CR1,#6
3318                     ; 31   PD_CR2 &= (~0x40);
3320  0019 721d5013      	bres	_PD_CR2,#6
3321                     ; 34   PA_DDR |= 0x08;
3323  001d 72165002      	bset	_PA_DDR,#3
3324                     ; 35   PA_CR1 |= 0x08;
3326  0021 72165003      	bset	_PA_CR1,#3
3327                     ; 36   PA_ODR |= 0x08;
3329  0025 72165000      	bset	_PA_ODR,#3
3330                     ; 39   PD_DDR |= 0x10;
3332  0029 72185011      	bset	_PD_DDR,#4
3333                     ; 40   PD_CR1 |= 0x10;
3335  002d 72185012      	bset	_PD_CR1,#4
3336                     ; 41   PD_ODR &= (~0x10);
3338  0031 7219500f      	bres	_PD_ODR,#4
3339                     ; 44   PD_DDR  &= (~0x08);
3341  0035 72175011      	bres	_PD_DDR,#3
3342                     ; 45   PD_CR1  &= (~0x08);
3344  0039 72175012      	bres	_PD_CR1,#3
3345                     ; 46   PD_CR2 |= 0x08;				//interrupt enable
3347  003d 72165013      	bset	_PD_CR2,#3
3348                     ; 47   EXTI_CR1 |= 0xC0;			//
3350  0041 c650a0        	ld	a,_EXTI_CR1
3351  0044 aac0          	or	a,#192
3352  0046 c750a0        	ld	_EXTI_CR1,a
3353                     ; 50   PC_DDR &= (~0x80);
3355  0049 721f500c      	bres	_PC_DDR,#7
3356                     ; 51   PC_CR1 |= 0x80;
3358  004d 721e500d      	bset	_PC_CR1,#7
3359                     ; 52   PC_CR2 &= (~0x80);
3361  0051 721f500e      	bres	_PC_CR2,#7
3362                     ; 53 }
3365  0055 81            	ret
3397                     ; 60 static void TIM1_Init(void)
3397                     ; 61 {
3398                     	switch	.text
3399  0056               L5222_TIM1_Init:
3403                     ; 62 	TIM1_CR1	  |= 0x80;
3405  0056 721e5250      	bset	_TIM1_CR1,#7
3406                     ; 63 	TIM2_IER		 = 0x00;
3408  005a 725f5303      	clr	_TIM2_IER
3409                     ; 64 	TIM1_SR1	   = 0x00;
3411  005e 725f5255      	clr	_TIM1_SR1
3412                     ; 65 	TIM1_PSCRH	 = 0x00;
3414  0062 725f5260      	clr	_TIM1_PSCRH
3415                     ; 66 	TIM1_PSCRL   = 159;    //16M/160 Hz = 10 us
3417  0066 359f5261      	mov	_TIM1_PSCRL,#159
3418                     ; 67 	TIM1_CNTRH   = 0;
3420  006a 725f525e      	clr	_TIM1_CNTRH
3421                     ; 68 	TIM1_CNTRL	 = 199;		//2ms
3423  006e 35c7525f      	mov	_TIM1_CNTRL,#199
3424                     ; 69 	TIM1_ARRH		 = 0;
3426  0072 725f5262      	clr	_TIM1_ARRH
3427                     ; 70 	TIM1_ARRL    = 199;
3429  0076 35c75263      	mov	_TIM1_ARRL,#199
3430                     ; 71 	TIM1_CR1	  |= 0x01;	//Timer 4 enable
3432  007a 72105250      	bset	_TIM1_CR1,#0
3433                     ; 72 }
3436  007e 81            	ret
3464                     ; 76 static void Uart_Init(void)
3464                     ; 77 { 
3465                     	switch	.text
3466  007f               L7322_Uart_Init:
3470                     ; 78   UART1_SR   = 0x00;
3472  007f 725f5230      	clr	_UART1_SR
3473                     ; 79   UART1_BRR2 = 0x02;
3475  0083 35025233      	mov	_UART1_BRR2,#2
3476                     ; 80   UART1_BRR1 = 0x68;   //115200b/s
3478  0087 35685232      	mov	_UART1_BRR1,#104
3479                     ; 81   UART1_CR1  = 0x00;
3481  008b 725f5234      	clr	_UART1_CR1
3482                     ; 82   UART1_CR2  = 0x2C;   //REN = 1, TEN = 1, RIEN = 1
3484  008f 352c5235      	mov	_UART1_CR2,#44
3485                     ; 83 }
3488  0093 81            	ret
3516                     ; 88 void Tim4_Init(void)
3516                     ; 89 {
3517                     	switch	.text
3518  0094               _Tim4_Init:
3522                     ; 90 	TIM4_PSCR 	= 0x04;  	 //16·ÖÆµ  1us
3524  0094 35045347      	mov	_TIM4_PSCR,#4
3525                     ; 91 	TIM4_ARR  	= 63;     //64us
3527  0098 353f5348      	mov	_TIM4_ARR,#63
3528                     ; 92 	TIM4_CNTR 	= 0;
3530  009c 725f5346      	clr	_TIM4_CNTR
3531                     ; 93 	TIM4_IER 		= 0x01; // interrupt enable
3533  00a0 35015343      	mov	_TIM4_IER,#1
3534                     ; 94 	TIM4_CR1     |= 0x01;
3536  00a4 72105340      	bset	_TIM4_CR1,#0
3537                     ; 95 }
3540  00a8 81            	ret
3567                     ; 100 void AD_Init(void)
3567                     ; 101 {
3568                     	switch	.text
3569  00a9               _AD_Init:
3573                     ; 102 	ADC_CSR = 0x04;
3575  00a9 35045400      	mov	_ADC_CSR,#4
3576                     ; 103 	ADC_CR1 = 0x00;
3578  00ad 725f5401      	clr	_ADC_CR1
3579                     ; 104 	ADC_CR2 = 0x08;
3581  00b1 35085402      	mov	_ADC_CR2,#8
3582                     ; 105 	ADC_CR3 = 0x00;	
3584  00b5 725f5403      	clr	_ADC_CR3
3585                     ; 106 	ADC_CR1 |= 0x01;
3587  00b9 72105401      	bset	_ADC_CR1,#0
3588                     ; 107 }
3591  00bd 81            	ret
3619                     ; 112 void Mcu_Config(void)
3619                     ; 113 {
3620                     	switch	.text
3621  00be               _Mcu_Config:
3625                     ; 114   _asm("sim");         //interrupt disable
3628  00be 9b            sim
3630                     ; 116   Clk_Init();
3632  00bf cd0000        	call	L3712_Clk_Init
3634                     ; 117   Gpio_Init();
3636  00c2 cd0009        	call	L3122_Gpio_Init
3638                     ; 118   TIM1_Init();
3640  00c5 ad8f          	call	L5222_TIM1_Init
3642                     ; 119   Tim4_Init();
3644  00c7 adcb          	call	_Tim4_Init
3646                     ; 120   Uart_Init();
3648  00c9 adb4          	call	L7322_Uart_Init
3650                     ; 123   _asm("rim");         //interrupt enable
3653  00cb 9a            rim
3655                     ; 124 }
3658  00cc 81            	ret
3671                     	xdef	_Mcu_Config
3672                     	xdef	_AD_Init
3673                     	xdef	_Tim4_Init
3692                     	end
