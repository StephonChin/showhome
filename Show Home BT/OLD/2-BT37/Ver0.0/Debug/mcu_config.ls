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
3299                     ; 22 static void Gpio_Init(void)
3299                     ; 23 {
3300                     	switch	.text
3301  0009               L3122_Gpio_Init:
3305                     ; 25   PD_DDR |= 0x20;
3307  0009 721a5011      	bset	_PD_DDR,#5
3308                     ; 26   PD_CR1 |= 0x20;
3310  000d 721a5012      	bset	_PD_CR1,#5
3311                     ; 29   PD_DDR &= (~0x40);
3313  0011 721d5011      	bres	_PD_DDR,#6
3314                     ; 30   PD_CR1 |= 0x40;
3316  0015 721c5012      	bset	_PD_CR1,#6
3317                     ; 31   PD_CR2 &= (~0x40);
3319  0019 721d5013      	bres	_PD_CR2,#6
3320                     ; 34   PA_DDR |= 0x08;
3322  001d 72165002      	bset	_PA_DDR,#3
3323                     ; 35   PA_CR1 |= 0x08;
3325  0021 72165003      	bset	_PA_CR1,#3
3326                     ; 36   PA_ODR |= 0x08;
3328  0025 72165000      	bset	_PA_ODR,#3
3329                     ; 39   PD_DDR |= 0x10;
3331  0029 72185011      	bset	_PD_DDR,#4
3332                     ; 40   PD_CR1 |= 0x10;
3334  002d 72185012      	bset	_PD_CR1,#4
3335                     ; 41   PD_ODR &= (~0x10);
3337  0031 7219500f      	bres	_PD_ODR,#4
3338                     ; 44   PD_DDR |= 0x08;
3340  0035 72165011      	bset	_PD_DDR,#3
3341                     ; 45   PD_CR1 |= 0x08;
3343  0039 72165012      	bset	_PD_CR1,#3
3344                     ; 46   PD_ODR &= (~0x08);
3346  003d 7217500f      	bres	_PD_ODR,#3
3347                     ; 49   PC_DDR &= (~0x80);
3349  0041 721f500c      	bres	_PC_DDR,#7
3350                     ; 50   PC_CR1 |= 0x80;
3352  0045 721e500d      	bset	_PC_CR1,#7
3353                     ; 51   PC_CR2 &= (~0x80);
3355  0049 721f500e      	bres	_PC_CR2,#7
3356                     ; 65 }
3359  004d 81            	ret
3391                     ; 72 static void TIM1_Init(void)
3391                     ; 73 {
3392                     	switch	.text
3393  004e               L5222_TIM1_Init:
3397                     ; 74 	TIM1_CR1	  |= 0x80;
3399  004e 721e5250      	bset	_TIM1_CR1,#7
3400                     ; 75 	TIM2_IER		 = 0x00;
3402  0052 725f5303      	clr	_TIM2_IER
3403                     ; 76 	TIM1_SR1	   = 0x00;
3405  0056 725f5255      	clr	_TIM1_SR1
3406                     ; 77 	TIM1_PSCRH	 = 0x00;
3408  005a 725f5260      	clr	_TIM1_PSCRH
3409                     ; 78 	TIM1_PSCRL   = 159;    //16M/160 Hz = 10 us
3411  005e 359f5261      	mov	_TIM1_PSCRL,#159
3412                     ; 79 	TIM1_CNTRH   = 0;
3414  0062 725f525e      	clr	_TIM1_CNTRH
3415                     ; 80 	TIM1_CNTRL	 = 199;		//2ms
3417  0066 35c7525f      	mov	_TIM1_CNTRL,#199
3418                     ; 81 	TIM1_ARRH		 = 0;
3420  006a 725f5262      	clr	_TIM1_ARRH
3421                     ; 82 	TIM1_ARRL    = 199;
3423  006e 35c75263      	mov	_TIM1_ARRL,#199
3424                     ; 83 	TIM1_CR1	  |= 0x01;	//Timer 4 enable
3426  0072 72105250      	bset	_TIM1_CR1,#0
3427                     ; 84 }
3430  0076 81            	ret
3458                     ; 88 static void Uart_Init(void)
3458                     ; 89 { 
3459                     	switch	.text
3460  0077               L7322_Uart_Init:
3464                     ; 90   UART1_SR   = 0x00;
3466  0077 725f5230      	clr	_UART1_SR
3467                     ; 91   UART1_BRR2 = 0x02;
3469  007b 35025233      	mov	_UART1_BRR2,#2
3470                     ; 92   UART1_BRR1 = 0x68;   //115200b/s
3472  007f 35685232      	mov	_UART1_BRR1,#104
3473                     ; 93   UART1_CR1  = 0x00;
3475  0083 725f5234      	clr	_UART1_CR1
3476                     ; 94   UART1_CR2  = 0x2C;   //REN = 1, TEN = 1, RIEN = 1
3478  0087 352c5235      	mov	_UART1_CR2,#44
3479                     ; 95 }
3482  008b 81            	ret
3510                     ; 100 void Tim4_Init(void)
3510                     ; 101 {
3511                     	switch	.text
3512  008c               _Tim4_Init:
3516                     ; 102 	TIM4_PSCR = 0x06;  	 //64·ÖÆµ  4us
3518  008c 35065347      	mov	_TIM4_PSCR,#6
3519                     ; 103 	TIM4_ARR  = 249;     //1ms
3521  0090 35f95348      	mov	_TIM4_ARR,#249
3522                     ; 104 	TIM4_CNTR = 0;
3524  0094 725f5346      	clr	_TIM4_CNTR
3525                     ; 105   TIM4_IER = 0x01; // interrupt enable
3527  0098 35015343      	mov	_TIM4_IER,#1
3528                     ; 106 	TIM4_CR1 |= 0x01;
3530  009c 72105340      	bset	_TIM4_CR1,#0
3531                     ; 107 }
3534  00a0 81            	ret
3561                     ; 112 void AD_Init(void)
3561                     ; 113 {
3562                     	switch	.text
3563  00a1               _AD_Init:
3567                     ; 114 	ADC_CSR = 0x04;
3569  00a1 35045400      	mov	_ADC_CSR,#4
3570                     ; 115 	ADC_CR1 = 0x00;
3572  00a5 725f5401      	clr	_ADC_CR1
3573                     ; 116 	ADC_CR2 = 0x08;
3575  00a9 35085402      	mov	_ADC_CR2,#8
3576                     ; 117 	ADC_CR3 = 0x00;	
3578  00ad 725f5403      	clr	_ADC_CR3
3579                     ; 118 	ADC_CR1 |= 0x01;
3581  00b1 72105401      	bset	_ADC_CR1,#0
3582                     ; 119 }
3585  00b5 81            	ret
3613                     ; 124 void Mcu_Config(void)
3613                     ; 125 {
3614                     	switch	.text
3615  00b6               _Mcu_Config:
3619                     ; 126   _asm("sim");         //interrupt disable
3622  00b6 9b            sim
3624                     ; 128   Clk_Init();
3626  00b7 cd0000        	call	L3712_Clk_Init
3628                     ; 129   Gpio_Init();
3630  00ba cd0009        	call	L3122_Gpio_Init
3632                     ; 130   TIM1_Init();
3634  00bd ad8f          	call	L5222_TIM1_Init
3636                     ; 131   Tim4_Init();
3638  00bf adcb          	call	_Tim4_Init
3640                     ; 132   Uart_Init();
3642  00c1 adb4          	call	L7322_Uart_Init
3644                     ; 135   _asm("rim");         //interrupt enable
3647  00c3 9a            rim
3649                     ; 136 }
3652  00c4 81            	ret
3665                     	xdef	_Mcu_Config
3666                     	xdef	_AD_Init
3667                     	xdef	_Tim4_Init
3686                     	end
