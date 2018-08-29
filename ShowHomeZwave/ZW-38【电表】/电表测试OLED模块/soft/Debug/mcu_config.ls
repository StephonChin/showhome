   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Generator V4.2.4 - 19 Dec 2007
3256                     ; 6 void GpioConfig(void)
3256                     ; 7 {
3258                     	switch	.text
3259  0000               _GpioConfig:
3263                     ; 8 	PA_DDR = 0xFF;
3265  0000 35ff5002      	mov	_PA_DDR,#255
3266                     ; 9 	PA_CR1 = 0xFF;
3268  0004 35ff5003      	mov	_PA_CR1,#255
3269                     ; 10 	PA_ODR = 0x00;
3271  0008 725f5000      	clr	_PA_ODR
3272                     ; 12 	PB_DDR = 0xFF;
3274  000c 35ff5007      	mov	_PB_DDR,#255
3275                     ; 13 	PB_CR1 = 0xFF;
3277  0010 35ff5008      	mov	_PB_CR1,#255
3278                     ; 14 	PB_ODR = 0x00;
3280  0014 725f5005      	clr	_PB_ODR
3281                     ; 16 	PC_DDR = 0xFF;
3283  0018 35ff500c      	mov	_PC_DDR,#255
3284                     ; 17 	PC_CR1 = 0x3F;
3286  001c 353f500d      	mov	_PC_CR1,#63
3287                     ; 18 	PC_ODR = 0x00;
3289  0020 725f500a      	clr	_PC_ODR
3290                     ; 20 	PD_DDR = 0xBF;
3292  0024 35bf5011      	mov	_PD_DDR,#191
3293                     ; 21 	PD_CR1 = 0xFF;
3295  0028 35ff5012      	mov	_PD_CR1,#255
3296                     ; 22 	PD_ODR = 0x00;
3298  002c 725f500f      	clr	_PD_ODR
3299                     ; 23 }
3302  0030 81            	ret
3327                     ; 28 void ClkConfig(void)
3327                     ; 29 {
3328                     	switch	.text
3329  0031               _ClkConfig:
3333                     ; 30 	CLK_CKDIVR = 0x04;
3335  0031 350450c6      	mov	_CLK_CKDIVR,#4
3336                     ; 31 	CLK_SWR    = 0xE1;
3338  0035 35e150c4      	mov	_CLK_SWR,#225
3339                     ; 32 }
3342  0039 81            	ret
3370                     ; 37 void UartConfig(void)
3370                     ; 38 {
3371                     	switch	.text
3372  003a               _UartConfig:
3376                     ; 39 	_asm("sim");
3379  003a 9b            sim
3381                     ; 40 	UART1_BRR2 = 0;
3383  003b 725f5233      	clr	_UART1_BRR2
3384                     ; 41 	UART1_BRR1 = 0;
3386  003f 725f5232      	clr	_UART1_BRR1
3387                     ; 42 	UART1_CR1 = 0;
3389  0043 725f5234      	clr	_UART1_CR1
3390                     ; 43 	UART1_CR2 = 0;
3392  0047 725f5235      	clr	_UART1_CR2
3393                     ; 44 	UART1_SR  = 0;
3395  004b 725f5230      	clr	_UART1_SR
3396                     ; 46 	UART1_BRR2 = 0x02;
3398  004f 35025233      	mov	_UART1_BRR2,#2
3399                     ; 47 	UART1_BRR1 = 0x68;
3401  0053 35685232      	mov	_UART1_BRR1,#104
3402                     ; 48 	UART1_CR1  = 0x00;
3404  0057 725f5234      	clr	_UART1_CR1
3405                     ; 49 	UART1_CR2  = 0x2C;
3407  005b 352c5235      	mov	_UART1_CR2,#44
3408                     ; 50 	UART1_SR   = 0x00;
3410  005f 725f5230      	clr	_UART1_SR
3411                     ; 51 	_asm("rim");
3414  0063 9a            rim
3416                     ; 52 }
3419  0064 81            	ret
3447                     ; 57 void TimerConfig(void)
3447                     ; 58 {
3448                     	switch	.text
3449  0065               _TimerConfig:
3453                     ; 59 	_asm("sim");
3456  0065 9b            sim
3458                     ; 60 	TIM4_PSCR = 0x04;
3460  0066 35045347      	mov	_TIM4_PSCR,#4
3461                     ; 61 	TIM4_IER  = 0x01;
3463  006a 35015343      	mov	_TIM4_IER,#1
3464                     ; 62 	TIM4_ARR  = 56;
3466  006e 35385348      	mov	_TIM4_ARR,#56
3467                     ; 63 	TIM4_CNTR = 56;
3469  0072 35385346      	mov	_TIM4_CNTR,#56
3470                     ; 64 	TIM4_CR1  = 0x01;
3472  0076 35015340      	mov	_TIM4_CR1,#1
3473                     ; 65 	_asm("rim");
3476  007a 9a            rim
3478                     ; 66 }
3481  007b 81            	ret
3494                     	xdef	_TimerConfig
3495                     	xdef	_ClkConfig
3496                     	xdef	_UartConfig
3497                     	xdef	_GpioConfig
3516                     	end
