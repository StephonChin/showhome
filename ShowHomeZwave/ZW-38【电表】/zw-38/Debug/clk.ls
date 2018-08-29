   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Generator V4.2.4 - 19 Dec 2007
2454                     ; 15 void clk_config(void)
2454                     ; 16 {
2456                     	switch	.text
2457  0000               _clk_config:
2461                     ; 17 	CLK_ICKR=0x01;
2463  0000 350150c0      	mov	_CLK_ICKR,#1
2465  0004               L5061:
2466                     ; 18 	while(!(CLK_ICKR&0x02)==0x02);   //4m
2468  0004 c650c0        	ld	a,_CLK_ICKR
2469  0007 a502          	bcp	a,#2
2470  0009 2605          	jrne	L6
2471  000b ae0001        	ldw	x,#1
2472  000e 2001          	jra	L01
2473  0010               L6:
2474  0010 5f            	clrw	x
2475  0011               L01:
2476  0011 a30002        	cpw	x,#2
2477  0014 27ee          	jreq	L5061
2478                     ; 19 	CLK_CMSR=0xe1;
2480  0016 35e150c3      	mov	_CLK_CMSR,#225
2481                     ; 21 	CLK_CKDIVR=0x10;
2483  001a 351050c6      	mov	_CLK_CKDIVR,#16
2484                     ; 22 }
2487  001e 81            	ret
2515                     ; 30 void timr4_config(void)
2515                     ; 31 {
2516                     	switch	.text
2517  001f               _timr4_config:
2521                     ; 32 	TIM4_PSCR=0x04;   //8·ÖÆµ
2523  001f 35045347      	mov	_TIM4_PSCR,#4
2524                     ; 33 	TIM4_ARR=250;     //100*1us=100us
2526  0023 35fa5348      	mov	_TIM4_ARR,#250
2527                     ; 34 	TIM4_CNTR=0;
2529  0027 725f5346      	clr	_TIM4_CNTR
2530                     ; 35 	TIM4_IER=0x01;
2532  002b 35015343      	mov	_TIM4_IER,#1
2533                     ; 36 	TIM4_CR1|=0X01;
2535  002f 72105340      	bset	_TIM4_CR1,#0
2536                     ; 37 }
2539  0033 81            	ret
2552                     	xdef	_timr4_config
2553                     	xdef	_clk_config
2572                     	end
