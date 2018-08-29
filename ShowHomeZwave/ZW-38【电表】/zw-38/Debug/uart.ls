   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Generator V4.2.4 - 19 Dec 2007
2457                     ; 38 void uart_Config(void)
2457                     ; 39 {
2459                     	switch	.text
2460  0000               _uart_Config:
2464                     ; 40 	UART1_BRR2=0x00;
2466  0000 725f5233      	clr	_UART1_BRR2
2467                     ; 41 	UART1_BRR1=0x1a;    //4mhz 9600
2469  0004 351a5232      	mov	_UART1_BRR1,#26
2470                     ; 43 	UART1_CR2=0x2c;
2472  0008 352c5235      	mov	_UART1_CR2,#44
2473                     ; 44 	UART1_CR3=0x00;
2475  000c 725f5236      	clr	_UART1_CR3
2476                     ; 45 	UART1_CR1=0x00;
2478  0010 725f5234      	clr	_UART1_CR1
2479                     ; 46 	_asm("rim");     //rim是使能中断_asm("sim"); //sim是禁止中断
2482  0014 9a            rim
2484                     ; 53 }
2487  0015 81            	ret
2490                     	bsct
2491  0000               L1061_temp:
2492  0000 00000000      	dc.l	0
2540                     .const:	section	.text
2541  0000               L01:
2542  0000 00000026      	dc.l	38
2543  0004               L21:
2544  0004 0000001f      	dc.l	31
2545  0008               L41:
2546  0008 00000209      	dc.l	521
2547  000c               L61:
2548  000c 000001fe      	dc.l	510
2549  0010               L02:
2550  0010 000003c6      	dc.l	966
2551  0014               L22:
2552  0014 000003c0      	dc.l	960
2553                     ; 61 void uart_tx(void)
2553                     ; 62 {
2554                     	switch	.text
2555  0016               _uart_tx:
2559                     ; 68 	switch (report_state)
2561  0016 b600          	ld	a,_report_state
2563                     ; 201 		default:
2563                     ; 202 		break;
2564  0018 4a            	dec	a
2565  0019 272b          	jreq	L3061
2566  001b 4a            	dec	a
2567  001c 2603          	jrne	L42
2568  001e cc0106        	jp	L7061
2569  0021               L42:
2570  0021 4a            	dec	a
2571  0022 2603          	jrne	L62
2572  0024 cc0162        	jp	L1161
2573  0027               L62:
2574  0027 4a            	dec	a
2575  0028 2603          	jrne	L03
2576  002a cc01be        	jp	L3161
2577  002d               L03:
2578  002d 4a            	dec	a
2579  002e 2603          	jrne	L23
2580  0030 cc023e        	jp	L7161
2581  0033               L23:
2582  0033 4a            	dec	a
2583  0034 2603          	jrne	L43
2584  0036 cc0272        	jp	L1312
2585  0039               L43:
2586  0039 4a            	dec	a
2587  003a 276f          	jreq	L5061
2588  003c 4a            	dec	a
2589  003d 2603          	jrne	L63
2590  003f cc01f0        	jp	L5161
2591  0042               L63:
2592  0042 ac920292      	jpf	L5461
2593  0046               L3061:
2594                     ; 70 		case report_w:
2594                     ; 71 		 temp=(laenergy*100);
2596  0046 ae0000        	ldw	x,#_laenergy
2597  0049 cd0000        	call	c_ltor
2599  004c a664          	ld	a,#100
2600  004e cd0000        	call	c_smul
2602  0051 ae0000        	ldw	x,#L1061_temp
2603  0054 cd0000        	call	c_rtol
2605                     ; 72 		 if(rate_choice)
2607  0057 3d00          	tnz	_rate_choice
2608  0059 2714          	jreq	L7461
2609                     ; 73 		   temp=(temp/38);
2611  005b ae0000        	ldw	x,#L1061_temp
2612  005e cd0000        	call	c_ltor
2614  0061 ae0000        	ldw	x,#L01
2615  0064 cd0000        	call	c_ludv
2617  0067 ae0000        	ldw	x,#L1061_temp
2618  006a cd0000        	call	c_rtol
2621  006d 2012          	jra	L5561
2622  006f               L7461:
2623                     ; 75 		  temp=(temp/38); 
2625  006f ae0000        	ldw	x,#L1061_temp
2626  0072 cd0000        	call	c_ltor
2628  0075 ae0000        	ldw	x,#L01
2629  0078 cd0000        	call	c_ludv
2631  007b ae0000        	ldw	x,#L1061_temp
2632  007e cd0000        	call	c_rtol
2634  0081               L5561:
2635                     ; 78 		  while((UART1_SR&0x80)==0x00);
2637  0081 c65230        	ld	a,_UART1_SR
2638  0084 a580          	bcp	a,#128
2639  0086 27f9          	jreq	L5561
2640                     ; 79 		  UART1_DR=(u8)(temp>>16);
2642  0088 5500015231    	mov	_UART1_DR,L1061_temp+1
2644  008d               L5661:
2645                     ; 80 		  while((UART1_SR&0x80)==0x00);
2647  008d c65230        	ld	a,_UART1_SR
2648  0090 a580          	bcp	a,#128
2649  0092 27f9          	jreq	L5661
2650                     ; 81 		  UART1_DR=(u8)(temp>>8);
2652  0094 5500025231    	mov	_UART1_DR,L1061_temp+2
2654  0099               L5761:
2655                     ; 82 		  while((UART1_SR&0x80)==0x00);
2657  0099 c65230        	ld	a,_UART1_SR
2658  009c a580          	bcp	a,#128
2659  009e 27f9          	jreq	L5761
2660                     ; 83 		  UART1_DR=(u8)temp;
2662  00a0 5500035231    	mov	_UART1_DR,L1061_temp+3
2663                     ; 84 		  report_state=0;
2665  00a5 3f00          	clr	_report_state
2666                     ; 85 		break;
2668  00a7 ac920292      	jpf	L5461
2669  00ab               L5061:
2670                     ; 87 		case report_va:
2670                     ; 88 		  temp=(lvaenergy*100);
2672  00ab ae0000        	ldw	x,#_lvaenergy
2673  00ae cd0000        	call	c_ltor
2675  00b1 a664          	ld	a,#100
2676  00b3 cd0000        	call	c_smul
2678  00b6 ae0000        	ldw	x,#L1061_temp
2679  00b9 cd0000        	call	c_rtol
2681                     ; 89 			if(rate_choice)
2683  00bc 3d00          	tnz	_rate_choice
2684  00be 270a          	jreq	L1071
2685                     ; 90 		    temp=(temp/32);
2687  00c0 ae0000        	ldw	x,#L1061_temp
2688  00c3 a605          	ld	a,#5
2689  00c5 cd0000        	call	c_lgursh
2692  00c8 2012          	jra	L7071
2693  00ca               L1071:
2694                     ; 92 			  temp=(temp/31);
2696  00ca ae0000        	ldw	x,#L1061_temp
2697  00cd cd0000        	call	c_ltor
2699  00d0 ae0004        	ldw	x,#L21
2700  00d3 cd0000        	call	c_ludv
2702  00d6 ae0000        	ldw	x,#L1061_temp
2703  00d9 cd0000        	call	c_rtol
2705  00dc               L7071:
2706                     ; 96 		  while((UART1_SR&0x80)==0x00);
2708  00dc c65230        	ld	a,_UART1_SR
2709  00df a580          	bcp	a,#128
2710  00e1 27f9          	jreq	L7071
2711                     ; 97 		  UART1_DR=(u8)(temp>>16);
2713  00e3 5500015231    	mov	_UART1_DR,L1061_temp+1
2715  00e8               L7171:
2716                     ; 98 		  while((UART1_SR&0x80)==0x00);
2718  00e8 c65230        	ld	a,_UART1_SR
2719  00eb a580          	bcp	a,#128
2720  00ed 27f9          	jreq	L7171
2721                     ; 99 		  UART1_DR=(u8)(temp>>8);
2723  00ef 5500025231    	mov	_UART1_DR,L1061_temp+2
2725  00f4               L7271:
2726                     ; 100 		  while((UART1_SR&0x80)==0x00);
2728  00f4 c65230        	ld	a,_UART1_SR
2729  00f7 a580          	bcp	a,#128
2730  00f9 27f9          	jreq	L7271
2731                     ; 101 		  UART1_DR=(u8)temp;
2733  00fb 5500035231    	mov	_UART1_DR,L1061_temp+3
2734                     ; 102 		  report_state=0;
2736  0100 3f00          	clr	_report_state
2737                     ; 103 		break;
2739  0102 ac920292      	jpf	L5461
2740  0106               L7061:
2741                     ; 105 		case report_v:
2741                     ; 106 		  temp=vrms;
2743  0106 be02          	ldw	x,_vrms+2
2744  0108 bf02          	ldw	L1061_temp+2,x
2745  010a be00          	ldw	x,_vrms
2746  010c bf00          	ldw	L1061_temp,x
2747                     ; 107 			if(rate_choice)
2749  010e 3d00          	tnz	_rate_choice
2750  0110 2714          	jreq	L3371
2751                     ; 108 		    temp=(temp/521);
2753  0112 ae0000        	ldw	x,#L1061_temp
2754  0115 cd0000        	call	c_ltor
2756  0118 ae0008        	ldw	x,#L41
2757  011b cd0000        	call	c_ludv
2759  011e ae0000        	ldw	x,#L1061_temp
2760  0121 cd0000        	call	c_rtol
2763  0124 2012          	jra	L1471
2764  0126               L3371:
2765                     ; 110 			  temp=(temp/510);
2767  0126 ae0000        	ldw	x,#L1061_temp
2768  0129 cd0000        	call	c_ltor
2770  012c ae000c        	ldw	x,#L61
2771  012f cd0000        	call	c_ludv
2773  0132 ae0000        	ldw	x,#L1061_temp
2774  0135 cd0000        	call	c_rtol
2776  0138               L1471:
2777                     ; 115 		  while((UART1_SR&0x80)==0x00);
2779  0138 c65230        	ld	a,_UART1_SR
2780  013b a580          	bcp	a,#128
2781  013d 27f9          	jreq	L1471
2782                     ; 116 		  UART1_DR=(u8)(temp>>16);
2784  013f 5500015231    	mov	_UART1_DR,L1061_temp+1
2786  0144               L1571:
2787                     ; 117 		  while((UART1_SR&0x80)==0x00);
2789  0144 c65230        	ld	a,_UART1_SR
2790  0147 a580          	bcp	a,#128
2791  0149 27f9          	jreq	L1571
2792                     ; 118 		  UART1_DR=(u8)(temp>>8);
2794  014b 5500025231    	mov	_UART1_DR,L1061_temp+2
2796  0150               L1671:
2797                     ; 119 		  while((UART1_SR&0x80)==0x00);
2799  0150 c65230        	ld	a,_UART1_SR
2800  0153 a580          	bcp	a,#128
2801  0155 27f9          	jreq	L1671
2802                     ; 120 		  UART1_DR=(u8)temp;
2804  0157 5500035231    	mov	_UART1_DR,L1061_temp+3
2805                     ; 121 		  report_state=0;
2807  015c 3f00          	clr	_report_state
2808                     ; 122 		break;
2810  015e ac920292      	jpf	L5461
2811  0162               L1161:
2812                     ; 124 		case report_a:
2812                     ; 125 		  temp=irms;
2814  0162 be02          	ldw	x,_irms+2
2815  0164 bf02          	ldw	L1061_temp+2,x
2816  0166 be00          	ldw	x,_irms
2817  0168 bf00          	ldw	L1061_temp,x
2818                     ; 126 			if(rate_choice)
2820  016a 3d00          	tnz	_rate_choice
2821  016c 2714          	jreq	L5671
2822                     ; 127 		    temp=(temp/966);
2824  016e ae0000        	ldw	x,#L1061_temp
2825  0171 cd0000        	call	c_ltor
2827  0174 ae0010        	ldw	x,#L02
2828  0177 cd0000        	call	c_ludv
2830  017a ae0000        	ldw	x,#L1061_temp
2831  017d cd0000        	call	c_rtol
2834  0180 2012          	jra	L3771
2835  0182               L5671:
2836                     ; 129 			  temp=(temp/960);
2838  0182 ae0000        	ldw	x,#L1061_temp
2839  0185 cd0000        	call	c_ltor
2841  0188 ae0014        	ldw	x,#L22
2842  018b cd0000        	call	c_ludv
2844  018e ae0000        	ldw	x,#L1061_temp
2845  0191 cd0000        	call	c_rtol
2847  0194               L3771:
2848                     ; 133 		  while((UART1_SR&0x80)==0x00);
2850  0194 c65230        	ld	a,_UART1_SR
2851  0197 a580          	bcp	a,#128
2852  0199 27f9          	jreq	L3771
2853                     ; 134 			UART1_DR=(u8)(temp>>16);
2855  019b 5500015231    	mov	_UART1_DR,L1061_temp+1
2857  01a0               L3002:
2858                     ; 135 		  while((UART1_SR&0x80)==0x00);
2860  01a0 c65230        	ld	a,_UART1_SR
2861  01a3 a580          	bcp	a,#128
2862  01a5 27f9          	jreq	L3002
2863                     ; 136 		  UART1_DR=(u8)(temp>>8);
2865  01a7 5500025231    	mov	_UART1_DR,L1061_temp+2
2867  01ac               L3102:
2868                     ; 137 		  while((UART1_SR&0x80)==0x00);
2870  01ac c65230        	ld	a,_UART1_SR
2871  01af a580          	bcp	a,#128
2872  01b1 27f9          	jreq	L3102
2873                     ; 138 		  UART1_DR=(u8)temp;
2875  01b3 5500035231    	mov	_UART1_DR,L1061_temp+3
2876                     ; 139 		  report_state=0;
2878  01b8 3f00          	clr	_report_state
2879                     ; 140 		break;
2881  01ba ac920292      	jpf	L5461
2882  01be               L3161:
2883                     ; 142 		case report_k:
2883                     ; 143 		  temp=kwh;
2885  01be be02          	ldw	x,_kwh+2
2886  01c0 bf02          	ldw	L1061_temp+2,x
2887  01c2 be00          	ldw	x,_kwh
2888  01c4 bf00          	ldw	L1061_temp,x
2890  01c6               L3202:
2891                     ; 147 		  while((UART1_SR&0x80)==0x00);
2893  01c6 c65230        	ld	a,_UART1_SR
2894  01c9 a580          	bcp	a,#128
2895  01cb 27f9          	jreq	L3202
2896                     ; 148 		  UART1_DR=(u8)(temp>>16);
2898  01cd 5500015231    	mov	_UART1_DR,L1061_temp+1
2900  01d2               L3302:
2901                     ; 149 		  while((UART1_SR&0x80)==0x00);
2903  01d2 c65230        	ld	a,_UART1_SR
2904  01d5 a580          	bcp	a,#128
2905  01d7 27f9          	jreq	L3302
2906                     ; 150 		  UART1_DR=(u8)(temp>>8);
2908  01d9 5500025231    	mov	_UART1_DR,L1061_temp+2
2910  01de               L3402:
2911                     ; 151 		  while((UART1_SR&0x80)==0x00);
2913  01de c65230        	ld	a,_UART1_SR
2914  01e1 a580          	bcp	a,#128
2915  01e3 27f9          	jreq	L3402
2916                     ; 152 		  UART1_DR=(u8)temp;
2918  01e5 5500035231    	mov	_UART1_DR,L1061_temp+3
2919                     ; 153 		  report_state=0;
2921  01ea 3f00          	clr	_report_state
2922                     ; 155 		break;
2924  01ec ac920292      	jpf	L5461
2925  01f0               L5161:
2926                     ; 158 		case report_rate:
2926                     ; 159 		  //temp=(u32)frequency;
2926                     ; 160 		  temp=(u32)rate;
2928  01f0 be00          	ldw	x,_rate
2929  01f2 cd0000        	call	c_uitolx
2931  01f5 ae0000        	ldw	x,#L1061_temp
2932  01f8 cd0000        	call	c_rtol
2934                     ; 161 			temp=(500000/temp-4);
2936  01fb aea120        	ldw	x,#41248
2937  01fe bf02          	ldw	c_lreg+2,x
2938  0200 ae0007        	ldw	x,#7
2939  0203 bf00          	ldw	c_lreg,x
2940  0205 ae0000        	ldw	x,#L1061_temp
2941  0208 cd0000        	call	c_ludv
2943  020b a604          	ld	a,#4
2944  020d cd0000        	call	c_lsbc
2946  0210 ae0000        	ldw	x,#L1061_temp
2947  0213 cd0000        	call	c_rtol
2950  0216               L3502:
2951                     ; 165 			while((UART1_SR&0x80)==0x00);
2953  0216 c65230        	ld	a,_UART1_SR
2954  0219 a580          	bcp	a,#128
2955  021b 27f9          	jreq	L3502
2956                     ; 166 		  UART1_DR=(u8)(temp>>16);
2958  021d 5500015231    	mov	_UART1_DR,L1061_temp+1
2960  0222               L3602:
2961                     ; 167 		  while((UART1_SR&0x80)==0x00);
2963  0222 c65230        	ld	a,_UART1_SR
2964  0225 a580          	bcp	a,#128
2965  0227 27f9          	jreq	L3602
2966                     ; 168 		  UART1_DR=(u8)(temp>>8);
2968  0229 5500025231    	mov	_UART1_DR,L1061_temp+2
2970  022e               L3702:
2971                     ; 169 		  while((UART1_SR&0x80)==0x00);
2973  022e c65230        	ld	a,_UART1_SR
2974  0231 a580          	bcp	a,#128
2975  0233 27f9          	jreq	L3702
2976                     ; 170 		  UART1_DR=(u8)temp;
2978  0235 5500035231    	mov	_UART1_DR,L1061_temp+3
2979                     ; 171 		  report_state=0;
2981  023a 3f00          	clr	_report_state
2982                     ; 173 		break;
2984  023c 2054          	jra	L5461
2985  023e               L7161:
2986                     ; 175 		case report_d:
2986                     ; 176 		  TIM4_CNTR=0;
2988  023e 725f5346      	clr	_TIM4_CNTR
2989                     ; 177 			delta_time_count1=0;
2991  0242 5f            	clrw	x
2992  0243 bf00          	ldw	_delta_time_count1,x
2993                     ; 178 			delta_time_count2=0;
2995  0245 5f            	clrw	x
2996  0246 bf00          	ldw	_delta_time_count2,x
2998  0248               L3012:
2999                     ; 182 		  while((UART1_SR&0x80)==0x00);
3001  0248 c65230        	ld	a,_UART1_SR
3002  024b a580          	bcp	a,#128
3003  024d 27f9          	jreq	L3012
3004                     ; 183 		  UART1_DR=0x00;
3006  024f 725f5231      	clr	_UART1_DR
3008  0253               L3112:
3009                     ; 184 		  while((UART1_SR&0x80)==0x00);
3011  0253 c65230        	ld	a,_UART1_SR
3012  0256 a580          	bcp	a,#128
3013  0258 27f9          	jreq	L3112
3014                     ; 185 		  UART1_DR=(u8)(delta_time>>8);
3016  025a 5500005231    	mov	_UART1_DR,_delta_time
3018  025f               L3212:
3019                     ; 186 		  while((UART1_SR&0x80)==0x00);
3021  025f c65230        	ld	a,_UART1_SR
3022  0262 a580          	bcp	a,#128
3023  0264 27f9          	jreq	L3212
3024                     ; 187 		  UART1_DR=(u8)delta_time;
3026  0266 5500015231    	mov	_UART1_DR,_delta_time+1
3027                     ; 189 			delta_time=0;
3029  026b 5f            	clrw	x
3030  026c bf00          	ldw	_delta_time,x
3031                     ; 190 		  report_state=0;
3033  026e 3f00          	clr	_report_state
3034                     ; 191 		break;
3036  0270 2020          	jra	L5461
3037  0272               L1312:
3038                     ; 193 		case report_r:
3038                     ; 194 		  while((FLASH_IAPSR&0x04)==0x04);
3040  0272 c6505f        	ld	a,_FLASH_IAPSR
3041  0275 a404          	and	a,#4
3042  0277 a104          	cp	a,#4
3043  0279 27f7          	jreq	L1312
3044                     ; 195 		  eeprom_write(0x01,0x00);
3046  027b 5f            	clrw	x
3047  027c a601          	ld	a,#1
3048  027e 95            	ld	xh,a
3049  027f cd0000        	call	_eeprom_write
3052  0282               L7312:
3053                     ; 197 		  while((FLASH_IAPSR&0x04)==0x04);
3055  0282 c6505f        	ld	a,_FLASH_IAPSR
3056  0285 a404          	and	a,#4
3057  0287 a104          	cp	a,#4
3058  0289 27f7          	jreq	L7312
3059                     ; 198 		  eeprom_write(0x02,0x00);
3061  028b 5f            	clrw	x
3062  028c a602          	ld	a,#2
3063  028e 95            	ld	xh,a
3064  028f cd0000        	call	_eeprom_write
3066                     ; 199 		break;
3068  0292               L3261:
3069                     ; 201 		default:
3069                     ; 202 		break;
3071  0292               L5461:
3072                     ; 204 }
3075  0292 81            	ret
3088                     	xref.b	_rate_choice
3089                     	xref.b	_rate
3090                     	xref.b	_delta_time_count2
3091                     	xref.b	_delta_time_count1
3092                     	xref.b	_delta_time
3093                     	xref.b	_kwh
3094                     	xref.b	_lvaenergy
3095                     	xref.b	_laenergy
3096                     	xref.b	_irms
3097                     	xref.b	_vrms
3098                     	xref.b	_report_state
3099                     	xref	_eeprom_write
3100                     	xdef	_uart_tx
3101                     	xdef	_uart_Config
3102                     	xref.b	c_lreg
3121                     	xref	c_lsbc
3122                     	xref	c_uitolx
3123                     	xref	c_lgursh
3124                     	xref	c_ludv
3125                     	xref	c_rtol
3126                     	xref	c_smul
3127                     	xref	c_ltor
3128                     	end
