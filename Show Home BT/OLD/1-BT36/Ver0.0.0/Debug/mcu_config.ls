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
3338                     ; 44   PC_DDR &= (~0x80);
3340  0035 721f500c      	bres	_PC_DDR,#7
3341                     ; 45   PC_CR1 |= 0x80;
3343  0039 721e500d      	bset	_PC_CR1,#7
3344                     ; 46   PC_CR2 &= (~0x80);
3346  003d 721f500e      	bres	_PC_CR2,#7
3347                     ; 60 }
3350  0041 81            	ret
3382                     ; 67 static void TIM1_Init(void)
3382                     ; 68 {
3383                     	switch	.text
3384  0042               L5222_TIM1_Init:
3388                     ; 69 	TIM1_CR1	  |= 0x80;
3390  0042 721e5250      	bset	_TIM1_CR1,#7
3391                     ; 70 	TIM2_IER		 = 0x00;
3393  0046 725f5303      	clr	_TIM2_IER
3394                     ; 71 	TIM1_SR1	   = 0x00;
3396  004a 725f5255      	clr	_TIM1_SR1
3397                     ; 72 	TIM1_PSCRH	 = 0x00;
3399  004e 725f5260      	clr	_TIM1_PSCRH
3400                     ; 73 	TIM1_PSCRL   = 159;    //16M/160 Hz = 10 us
3402  0052 359f5261      	mov	_TIM1_PSCRL,#159
3403                     ; 74 	TIM1_CNTRH   = 0;
3405  0056 725f525e      	clr	_TIM1_CNTRH
3406                     ; 75 	TIM1_CNTRL	 = 199;		//2ms
3408  005a 35c7525f      	mov	_TIM1_CNTRL,#199
3409                     ; 76 	TIM1_ARRH		 = 0;
3411  005e 725f5262      	clr	_TIM1_ARRH
3412                     ; 77 	TIM1_ARRL    = 199;
3414  0062 35c75263      	mov	_TIM1_ARRL,#199
3415                     ; 78 	TIM1_CR1	  |= 0x01;	//Timer 4 enable
3417  0066 72105250      	bset	_TIM1_CR1,#0
3418                     ; 79 }
3421  006a 81            	ret
3449                     ; 83 static void Uart_Init(void)
3449                     ; 84 { 
3450                     	switch	.text
3451  006b               L7322_Uart_Init:
3455                     ; 85   UART1_SR   = 0x00;
3457  006b 725f5230      	clr	_UART1_SR
3458                     ; 86   UART1_BRR2 = 0x02;
3460  006f 35025233      	mov	_UART1_BRR2,#2
3461                     ; 87   UART1_BRR1 = 0x68;   //115200b/s
3463  0073 35685232      	mov	_UART1_BRR1,#104
3464                     ; 88   UART1_CR1  = 0x00;
3466  0077 725f5234      	clr	_UART1_CR1
3467                     ; 89   UART1_CR2  = 0x2C;   //REN = 1, TEN = 1, RIEN = 1
3469  007b 352c5235      	mov	_UART1_CR2,#44
3470                     ; 90 }
3473  007f 81            	ret
3501                     ; 95 void Tim4_Init(void)
3501                     ; 96 {
3502                     	switch	.text
3503  0080               _Tim4_Init:
3507                     ; 97 	TIM4_PSCR = 0x06;  	 //64·ÖÆµ  4us
3509  0080 35065347      	mov	_TIM4_PSCR,#6
3510                     ; 98 	TIM4_ARR  = 249;     //1ms
3512  0084 35f95348      	mov	_TIM4_ARR,#249
3513                     ; 99 	TIM4_CNTR = 0;
3515  0088 725f5346      	clr	_TIM4_CNTR
3516                     ; 100   TIM4_IER = 0x01; // interrupt enable
3518  008c 35015343      	mov	_TIM4_IER,#1
3519                     ; 101 	TIM4_CR1 |= 0x01;
3521  0090 72105340      	bset	_TIM4_CR1,#0
3522                     ; 102 }
3525  0094 81            	ret
3552                     ; 107 void AD_Init(void)
3552                     ; 108 {
3553                     	switch	.text
3554  0095               _AD_Init:
3558                     ; 109 	ADC_CSR = 0x04;
3560  0095 35045400      	mov	_ADC_CSR,#4
3561                     ; 110 	ADC_CR1 = 0x00;
3563  0099 725f5401      	clr	_ADC_CR1
3564                     ; 111 	ADC_CR2 = 0x08;
3566  009d 35085402      	mov	_ADC_CR2,#8
3567                     ; 112 	ADC_CR3 = 0x00;	
3569  00a1 725f5403      	clr	_ADC_CR3
3570                     ; 113 	ADC_CR1 |= 0x01;
3572  00a5 72105401      	bset	_ADC_CR1,#0
3573                     ; 114 }
3576  00a9 81            	ret
3604                     ; 119 void Mcu_Config(void)
3604                     ; 120 {
3605                     	switch	.text
3606  00aa               _Mcu_Config:
3610                     ; 121   _asm("sim");         //interrupt disable
3613  00aa 9b            sim
3615                     ; 123   Clk_Init();
3617  00ab cd0000        	call	L3712_Clk_Init
3619                     ; 124   Gpio_Init();
3621  00ae cd0009        	call	L3122_Gpio_Init
3623                     ; 125   TIM1_Init();
3625  00b1 ad8f          	call	L5222_TIM1_Init
3627                     ; 126   Tim4_Init();
3629  00b3 adcb          	call	_Tim4_Init
3631                     ; 127   Uart_Init();
3633  00b5 adb4          	call	L7322_Uart_Init
3635                     ; 130   _asm("rim");         //interrupt enable
3638  00b7 9a            rim
3640                     ; 131 }
3643  00b8 81            	ret
3656                     	xdef	_Mcu_Config
3657                     	xdef	_AD_Init
3658                     	xdef	_Tim4_Init
3677                     	end
