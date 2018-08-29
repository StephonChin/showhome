   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Generator V4.2.4 - 19 Dec 2007
2469                     ; 19 void gpio_config(void)
2469                     ; 20 {
2471                     	switch	.text
2472  0000               _gpio_config:
2476                     ; 21 	PA_DDR=0xf7; //
2478  0000 35f75002      	mov	_PA_DDR,#247
2479                     ; 22 	PA_CR1=0xff; //
2481  0004 35ff5003      	mov	_PA_CR1,#255
2482                     ; 23 	PA_CR2=0x08; //
2484  0008 35085004      	mov	_PA_CR2,#8
2485                     ; 24 	PA_ODR=0x00; //
2487  000c 725f5000      	clr	_PA_ODR
2488                     ; 26 	EXTI_CR1=0x02;
2490  0010 350250a0      	mov	_EXTI_CR1,#2
2491                     ; 27 	enableInterrupts();
2494  0014 9a            rim
2496                     ; 29 	PB_DDR=0xff; //
2499  0015 35ff5007      	mov	_PB_DDR,#255
2500                     ; 30 	PB_CR1=0xcf; //
2502  0019 35cf5008      	mov	_PB_CR1,#207
2503                     ; 31 	PB_CR2=0x00; //
2505  001d 725f5009      	clr	_PB_CR2
2506                     ; 32 	PB_ODR=0x00; //
2508  0021 725f5005      	clr	_PB_ODR
2509                     ; 34 	PC_DDR=0x7f; //
2511  0025 357f500c      	mov	_PC_DDR,#127
2512                     ; 35 	PC_CR1=0x7f; //
2514  0029 357f500d      	mov	_PC_CR1,#127
2515                     ; 36 	PC_CR2=0x00; //
2517  002d 725f500e      	clr	_PC_CR2
2518                     ; 37 	PC_ODR=0x00; //
2520  0031 725f500a      	clr	_PC_ODR
2521                     ; 39 	PD_DDR=0xbf; //
2523  0035 35bf5011      	mov	_PD_DDR,#191
2524                     ; 40 	PD_CR1=0xbf; //
2526  0039 35bf5012      	mov	_PD_CR1,#191
2527                     ; 41 	PD_CR2=0x00; //
2529  003d 725f5013      	clr	_PD_CR2
2530                     ; 42 	PD_ODR=0x00; //
2532  0041 725f500f      	clr	_PD_ODR
2533                     ; 45 }
2536  0045 81            	ret
2549                     	xdef	_gpio_config
2568                     	end
