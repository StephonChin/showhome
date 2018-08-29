   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Generator V4.2.4 - 19 Dec 2007
2424                     	bsct
2425  0000               _p:
2426  0000 4000          	dc.w	16384
2457                     ; 17 void eeprom_config(void)
2457                     ; 18 {
2459                     	switch	.text
2460  0000               _eeprom_config:
2464                     ; 19 	FLASH_CR1|=0x01; //标准编程时间
2466  0000 7210505a      	bset	_FLASH_CR1,#0
2467                     ; 20 	FLASH_DUKR = 0xae; //解锁data memory
2469  0004 35ae5064      	mov	_FLASH_DUKR,#174
2470                     ; 21 	FLASH_DUKR = 0x56; 
2472  0008 35565064      	mov	_FLASH_DUKR,#86
2473                     ; 22 }
2476  000c 81            	ret
2511                     ; 29 u8 eeprom_read(u8 addr)
2511                     ; 30 {
2512                     	switch	.text
2513  000d               _eeprom_read:
2517                     ; 31   return *(p+(u16)addr);
2519  000d 5f            	clrw	x
2520  000e 97            	ld	xl,a
2521  000f 92d600        	ld	a,([_p.w],x)
2524  0012 81            	ret
2568                     ; 39 void eeprom_write(u8 addr,u8 data)
2568                     ; 40 {
2569                     	switch	.text
2570  0013               _eeprom_write:
2572  0013 89            	pushw	x
2573       00000000      OFST:	set	0
2576                     ; 41 	*(p+(u16)addr)=data;
2578  0014 9e            	ld	a,xh
2579  0015 5f            	clrw	x
2580  0016 97            	ld	xl,a
2581  0017 7b02          	ld	a,(OFST+2,sp)
2582  0019 92d700        	ld	([_p.w],x),a
2583                     ; 42 }
2586  001c 85            	popw	x
2587  001d 81            	ret
2615                     ; 50 void eeprom_init(void)
2615                     ; 51 {
2616                     	switch	.text
2617  001e               _eeprom_init:
2621                     ; 52 	eeprom_config();
2623  001e ade0          	call	_eeprom_config
2625                     ; 54   if(eeprom_read(0x00)==0xaa)
2627  0020 4f            	clr	a
2628  0021 adea          	call	_eeprom_read
2630  0023 a1aa          	cp	a,#170
2631  0025 262a          	jrne	L7561
2632                     ; 56 	  kwh=(u32)eeprom_read(0x01);
2634  0027 a601          	ld	a,#1
2635  0029 ade2          	call	_eeprom_read
2637  002b b703          	ld	c_lreg+3,a
2638  002d 3f02          	clr	c_lreg+2
2639  002f 3f01          	clr	c_lreg+1
2640  0031 3f00          	clr	c_lreg
2641  0033 ae0000        	ldw	x,#_kwh
2642  0036 cd0000        	call	c_rtol
2644                     ; 57 		kwh+=(u32)(eeprom_read(0x02)<<8);
2646  0039 a602          	ld	a,#2
2647  003b add0          	call	_eeprom_read
2649  003d 5f            	clrw	x
2650  003e 97            	ld	xl,a
2651  003f 4f            	clr	a
2652  0040 02            	rlwa	x,a
2653  0041 cd0000        	call	c_itolx
2655  0044 ae0000        	ldw	x,#_kwh
2656  0047 cd0000        	call	c_lgadd
2658                     ; 58 		kwh+=(u32)(eeprom_read(0x02)<<16);
2660  004a ae0000        	ldw	x,#_kwh
2661  004d cd0000        	call	c_ltor
2664  0050               L3561:
2665                     ; 73 }
2668  0050 81            	ret
2669  0051               L7561:
2670                     ; 62 		while((FLASH_IAPSR&0x04)==0x04);
2672  0051 c6505f        	ld	a,_FLASH_IAPSR
2673  0054 a404          	and	a,#4
2674  0056 a104          	cp	a,#4
2675  0058 27f7          	jreq	L7561
2676                     ; 63 		eeprom_write(0x00,0xaa);
2678  005a ae00aa        	ldw	x,#170
2679  005d 4f            	clr	a
2680  005e 95            	ld	xh,a
2681  005f adb2          	call	_eeprom_write
2684  0061               L5661:
2685                     ; 64 		while((FLASH_IAPSR&0x04)==0x04);
2687  0061 c6505f        	ld	a,_FLASH_IAPSR
2688  0064 a404          	and	a,#4
2689  0066 a104          	cp	a,#4
2690  0068 27f7          	jreq	L5661
2691                     ; 65 		eeprom_write(0x01,0x00);
2693  006a 5f            	clrw	x
2694  006b a601          	ld	a,#1
2695  006d 95            	ld	xh,a
2696  006e ada3          	call	_eeprom_write
2699  0070               L3761:
2700                     ; 66 		while((FLASH_IAPSR&0x04)==0x04);
2702  0070 c6505f        	ld	a,_FLASH_IAPSR
2703  0073 a404          	and	a,#4
2704  0075 a104          	cp	a,#4
2705  0077 27f7          	jreq	L3761
2706                     ; 67 		eeprom_write(0x02,0x00);
2708  0079 5f            	clrw	x
2709  007a a602          	ld	a,#2
2710  007c 95            	ld	xh,a
2711  007d ad94          	call	_eeprom_write
2714  007f               L1071:
2715                     ; 68 		while((FLASH_IAPSR&0x04)==0x04);
2717  007f c6505f        	ld	a,_FLASH_IAPSR
2718  0082 a404          	and	a,#4
2719  0084 a104          	cp	a,#4
2720  0086 27f7          	jreq	L1071
2721                     ; 69 		eeprom_write(0x03,0x00);
2723  0088 5f            	clrw	x
2724  0089 a603          	ld	a,#3
2725  008b 95            	ld	xh,a
2726  008c ad85          	call	_eeprom_write
2728  008e 20c0          	jra	L3561
2753                     	xdef	_eeprom_write
2754                     	xdef	_eeprom_read
2755                     	xdef	_eeprom_config
2756                     	xdef	_p
2757                     	xref.b	_kwh
2758                     	xdef	_eeprom_init
2759                     	xref.b	c_lreg
2778                     	xref	c_ltor
2779                     	xref	c_lgadd
2780                     	xref	c_itolx
2781                     	xref	c_rtol
2782                     	end
