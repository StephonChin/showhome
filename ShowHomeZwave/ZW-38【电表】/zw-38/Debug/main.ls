   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Generator V4.2.4 - 19 Dec 2007
2480                     ; 10 main()
2480                     ; 11 {
2482                     	switch	.text
2483  0000               _main:
2485  0000 89            	pushw	x
2486       00000002      OFST:	set	2
2489                     ; 14 	clk_config();
2491  0001 cd0000        	call	_clk_config
2493                     ; 15 	gpio_config();
2495  0004 cd0000        	call	_gpio_config
2497                     ; 16 	eeprom_init();
2499  0007 cd0000        	call	_eeprom_init
2501                     ; 17 	uart_Config();
2503  000a cd0000        	call	_uart_Config
2505                     ; 18 	timr4_config();
2507  000d cd0000        	call	_timr4_config
2509                     ; 19 	rate_choice=1;
2511  0010 35010000      	mov	_rate_choice,#1
2512                     ; 23 	ade7753_config();
2514  0014 cd0000        	call	_ade7753_config
2516                     ; 25 	for(s=0;s<250;s++)
2518  0017 0f01          	clr	(OFST-1,sp)
2519  0019               L3161:
2520                     ; 26 	 for(j=0;j<250;j++);
2522  0019 0f02          	clr	(OFST+0,sp)
2523  001b               L1261:
2527  001b 0c02          	inc	(OFST+0,sp)
2530  001d 7b02          	ld	a,(OFST+0,sp)
2531  001f a1fa          	cp	a,#250
2532  0021 25f8          	jrult	L1261
2533                     ; 25 	for(s=0;s<250;s++)
2535  0023 0c01          	inc	(OFST-1,sp)
2538  0025 7b01          	ld	a,(OFST-1,sp)
2539  0027 a1fa          	cp	a,#250
2540  0029 25ee          	jrult	L3161
2541  002b               L7261:
2542                     ; 30 		 meter_get();
2544  002b cd0000        	call	_meter_get
2546                     ; 33 		uart_tx();
2548  002e cd0000        	call	_uart_tx
2551  0031 20f8          	jra	L7261
2564                     	xdef	_main
2565                     	xref.b	_rate_choice
2566                     	xref	_timr4_config
2567                     	xref	_meter_get
2568                     	xref	_uart_tx
2569                     	xref	_ade7753_config
2570                     	xref	_gpio_config
2571                     	xref	_uart_Config
2572                     	xref	_eeprom_init
2573                     	xref	_clk_config
2592                     	end
