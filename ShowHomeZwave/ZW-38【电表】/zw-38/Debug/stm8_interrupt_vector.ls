   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Generator V4.2.4 - 19 Dec 2007
2424                     	bsct
2425  0000               _bstate:
2426  0000 00            	dc.b	0
2427  0001               _report_state:
2428  0001 00            	dc.b	0
2459                     ; 40 @far @interrupt void NonHandledInterrupt (void)
2459                     ; 41 {
2460                     	switch	.text
2461  0000               f_NonHandledInterrupt:
2466                     ; 45 	return;
2469  0000 80            	iret
2471                     .const:	section	.text
2472  0000               __vectab:
2473  0000 82            	dc.b	130
2475  0001 00            	dc.b	page(__stext)
2476  0002 0000          	dc.w	__stext
2477  0004 82            	dc.b	130
2479  0005 00            	dc.b	page(f_NonHandledInterrupt)
2480  0006 0000          	dc.w	f_NonHandledInterrupt
2481  0008 82            	dc.b	130
2483  0009 00            	dc.b	page(f_NonHandledInterrupt)
2484  000a 0000          	dc.w	f_NonHandledInterrupt
2485  000c 82            	dc.b	130
2487  000d 00            	dc.b	page(f_NonHandledInterrupt)
2488  000e 0000          	dc.w	f_NonHandledInterrupt
2489  0010 82            	dc.b	130
2491  0011 00            	dc.b	page(f_NonHandledInterrupt)
2492  0012 0000          	dc.w	f_NonHandledInterrupt
2493  0014 82            	dc.b	130
2495  0015 01            	dc.b	page(_ext10)
2496  0016 0001          	dc.w	_ext10
2497  0018 82            	dc.b	130
2499  0019 00            	dc.b	page(f_NonHandledInterrupt)
2500  001a 0000          	dc.w	f_NonHandledInterrupt
2501  001c 82            	dc.b	130
2503  001d 00            	dc.b	page(f_NonHandledInterrupt)
2504  001e 0000          	dc.w	f_NonHandledInterrupt
2505  0020 82            	dc.b	130
2507  0021 00            	dc.b	page(f_NonHandledInterrupt)
2508  0022 0000          	dc.w	f_NonHandledInterrupt
2509  0024 82            	dc.b	130
2511  0025 00            	dc.b	page(f_NonHandledInterrupt)
2512  0026 0000          	dc.w	f_NonHandledInterrupt
2513  0028 82            	dc.b	130
2515  0029 00            	dc.b	page(f_NonHandledInterrupt)
2516  002a 0000          	dc.w	f_NonHandledInterrupt
2517  002c 82            	dc.b	130
2519  002d 00            	dc.b	page(f_NonHandledInterrupt)
2520  002e 0000          	dc.w	f_NonHandledInterrupt
2521  0030 82            	dc.b	130
2523  0031 00            	dc.b	page(f_NonHandledInterrupt)
2524  0032 0000          	dc.w	f_NonHandledInterrupt
2525  0034 82            	dc.b	130
2527  0035 00            	dc.b	page(f_NonHandledInterrupt)
2528  0036 0000          	dc.w	f_NonHandledInterrupt
2529  0038 82            	dc.b	130
2531  0039 00            	dc.b	page(f_NonHandledInterrupt)
2532  003a 0000          	dc.w	f_NonHandledInterrupt
2533  003c 82            	dc.b	130
2535  003d 00            	dc.b	page(f_NonHandledInterrupt)
2536  003e 0000          	dc.w	f_NonHandledInterrupt
2537  0040 82            	dc.b	130
2539  0041 00            	dc.b	page(f_NonHandledInterrupt)
2540  0042 0000          	dc.w	f_NonHandledInterrupt
2541  0044 82            	dc.b	130
2543  0045 00            	dc.b	page(f_NonHandledInterrupt)
2544  0046 0000          	dc.w	f_NonHandledInterrupt
2545  0048 82            	dc.b	130
2547  0049 00            	dc.b	page(f_NonHandledInterrupt)
2548  004a 0000          	dc.w	f_NonHandledInterrupt
2549  004c 82            	dc.b	130
2551  004d 00            	dc.b	page(f_NonHandledInterrupt)
2552  004e 0000          	dc.w	f_NonHandledInterrupt
2553  0050 82            	dc.b	130
2555  0051 74            	dc.b	page(_uart1_rx)
2556  0052 0074          	dc.w	_uart1_rx
2557  0054 82            	dc.b	130
2559  0055 00            	dc.b	page(f_NonHandledInterrupt)
2560  0056 0000          	dc.w	f_NonHandledInterrupt
2561  0058 82            	dc.b	130
2563  0059 00            	dc.b	page(f_NonHandledInterrupt)
2564  005a 0000          	dc.w	f_NonHandledInterrupt
2565  005c 82            	dc.b	130
2567  005d 00            	dc.b	page(f_NonHandledInterrupt)
2568  005e 0000          	dc.w	f_NonHandledInterrupt
2569  0060 82            	dc.b	130
2571  0061 00            	dc.b	page(f_NonHandledInterrupt)
2572  0062 0000          	dc.w	f_NonHandledInterrupt
2573  0064 82            	dc.b	130
2575  0065 0c            	dc.b	page(_time4)
2576  0066 010c          	dc.w	_time4
2577  0068 82            	dc.b	130
2579  0069 00            	dc.b	page(f_NonHandledInterrupt)
2580  006a 0000          	dc.w	f_NonHandledInterrupt
2581  006c 82            	dc.b	130
2583  006d 00            	dc.b	page(f_NonHandledInterrupt)
2584  006e 0000          	dc.w	f_NonHandledInterrupt
2585  0070 82            	dc.b	130
2587  0071 00            	dc.b	page(f_NonHandledInterrupt)
2588  0072 0000          	dc.w	f_NonHandledInterrupt
2589  0074 82            	dc.b	130
2591  0075 00            	dc.b	page(f_NonHandledInterrupt)
2592  0076 0000          	dc.w	f_NonHandledInterrupt
2593  0078 82            	dc.b	130
2595  0079 00            	dc.b	page(f_NonHandledInterrupt)
2596  007a 0000          	dc.w	f_NonHandledInterrupt
2597  007c 82            	dc.b	130
2599  007d 00            	dc.b	page(f_NonHandledInterrupt)
2600  007e 0000          	dc.w	f_NonHandledInterrupt
2629                     ; 85 @near @interrupt void ext10 (void)
2629                     ; 86 {
2631                     	switch	.text
2632  0001               _ext10:
2635  0001 3b0002        	push	c_x+2
2636  0004 be00          	ldw	x,c_x
2637  0006 89            	pushw	x
2638  0007 3b0002        	push	c_y+2
2639  000a be00          	ldw	x,c_y
2640  000c 89            	pushw	x
2643                     ; 87 	rate_count+=1;
2645  000d 3c00          	inc	_rate_count
2646                     ; 88 	if(rate_count>99)
2648  000f b600          	ld	a,_rate_count
2649  0011 a164          	cp	a,#100
2650  0013 2509          	jrult	L3261
2651                     ; 90 		rate_count=0;
2653  0015 3f00          	clr	_rate_count
2654                     ; 91 		rate=rate_buf;
2656  0017 be03          	ldw	x,_rate_buf
2657  0019 bf01          	ldw	_rate,x
2658                     ; 92 		rate_buf=0;
2660  001b 5f            	clrw	x
2661  001c bf03          	ldw	_rate_buf,x
2662  001e               L3261:
2663                     ; 95 	ade7753_read_bytes(0x0c);
2665  001e a60c          	ld	a,#12
2666  0020 cd0000        	call	_ade7753_read_bytes
2668                     ; 97 	if((buf[0]&0x04)==0x04){
2670  0023 b600          	ld	a,_buf
2671  0025 a404          	and	a,#4
2672  0027 a104          	cp	a,#4
2673  0029 260a          	jrne	L5261
2674                     ; 98 		  meter_watt(LAENERGY);
2676  002b a604          	ld	a,#4
2677  002d cd0000        	call	_meter_watt
2679                     ; 99 			meter_watt(LVAENERGY);
2681  0030 a607          	ld	a,#7
2682  0032 cd0000        	call	_meter_watt
2684  0035               L5261:
2685                     ; 102 	if((buf[0]&0x10)==0x10)
2687  0035 b600          	ld	a,_buf
2688  0037 a410          	and	a,#16
2689  0039 a110          	cp	a,#16
2690  003b 262a          	jrne	L7261
2691                     ; 104     switch(bstate)
2693  003d b600          	ld	a,_bstate
2695                     ; 126 			default:
2695                     ; 127 			break;
2696  003f 4a            	dec	a
2697  0040 270b          	jreq	L1061
2698  0042 4a            	dec	a
2699  0043 270f          	jreq	L3061
2700  0045 4a            	dec	a
2701  0046 2713          	jreq	L5061
2702  0048 4a            	dec	a
2703  0049 2717          	jreq	L7061
2704  004b 201a          	jra	L7261
2705  004d               L1061:
2706                     ; 106 			case get_vrms:
2706                     ; 107 			meter_data_get(VRMS);
2708  004d a617          	ld	a,#23
2709  004f cd0000        	call	_meter_data_get
2711                     ; 108 			break;
2713  0052 2013          	jra	L7261
2714  0054               L3061:
2715                     ; 110 			case get_irms:
2715                     ; 111 			meter_data_get(IRMS);
2717  0054 a616          	ld	a,#22
2718  0056 cd0000        	call	_meter_data_get
2720                     ; 112 			break;
2722  0059 200c          	jra	L7261
2723  005b               L5061:
2724                     ; 114 			case get_chanel1_waveform:
2724                     ; 115 			meter_data_get(WAVEFORM);
2726  005b a601          	ld	a,#1
2727  005d cd0000        	call	_meter_data_get
2729                     ; 116 			break;
2731  0060 2005          	jra	L7261
2732  0062               L7061:
2733                     ; 118 			case get_chanel2_waveform:
2733                     ; 119 			meter_data_get(WAVEFORM);
2735  0062 a601          	ld	a,#1
2736  0064 cd0000        	call	_meter_data_get
2738                     ; 120 			break;
2740  0067               L1161:
2741                     ; 126 			default:
2741                     ; 127 			break;
2743  0067               L3361:
2744  0067               L7261:
2745                     ; 132 }
2748  0067 85            	popw	x
2749  0068 bf00          	ldw	c_y,x
2750  006a 320002        	pop	c_y+2
2751  006d 85            	popw	x
2752  006e bf00          	ldw	c_x,x
2753  0070 320002        	pop	c_x+2
2754  0073 80            	iret
2757                     	bsct
2758  0002               L5361_uart_data:
2759  0002 00            	dc.b	0
2760  0003               L7361_get_enable:
2761  0003 00            	dc.b	0
2762  0004               L1461_get_flag:
2763  0004 00            	dc.b	0
2816                     ; 136 @near @interrupt void uart1_rx (void)
2816                     ; 137 {
2817                     	switch	.text
2818  0074               _uart1_rx:
2823                     ; 142 	if((UART1_SR&0x20)==0x20)
2825  0074 c65230        	ld	a,_UART1_SR
2826  0077 a420          	and	a,#32
2827  0079 a120          	cp	a,#32
2828  007b 2703          	jreq	L21
2829  007d cc010b        	jp	L1761
2830  0080               L21:
2831                     ; 144 		UART1_SR&=0xbf;
2833  0080 721d5230      	bres	_UART1_SR,#6
2834                     ; 145 		uart_data=UART1_DR;
2836  0084 5552310002    	mov	L5361_uart_data,_UART1_DR
2837                     ; 147 		if(uart_data=='$')
2839  0089 b602          	ld	a,L5361_uart_data
2840  008b a124          	cp	a,#36
2841  008d 2606          	jrne	L3761
2842                     ; 149 		  get_enable=1;
2844  008f 35010003      	mov	L7361_get_enable,#1
2845                     ; 150 			get_flag=0;
2847  0093 3f04          	clr	L1461_get_flag
2848  0095               L3761:
2849                     ; 153 		if(get_enable)
2851  0095 3d03          	tnz	L7361_get_enable
2852  0097 2772          	jreq	L1761
2853                     ; 155     	if(uart_data=='W') {if(get_flag==0){report_state=report_w;} else{report_state=report_k;}get_enable=0;}
2855  0099 b602          	ld	a,L5361_uart_data
2856  009b a157          	cp	a,#87
2857  009d 2612          	jrne	L7761
2860  009f 3d04          	tnz	L1461_get_flag
2861  00a1 2606          	jrne	L1071
2864  00a3 35010001      	mov	_report_state,#1
2866  00a7 2004          	jra	L3071
2867  00a9               L1071:
2870  00a9 35040001      	mov	_report_state,#4
2871  00ad               L3071:
2874  00ad 3f03          	clr	L7361_get_enable
2876  00af 205a          	jra	L1761
2877  00b1               L7761:
2878                     ; 156 	    else if(uart_data=='V') {if(get_flag==0){report_state=report_v;}else{report_state=report_va;}get_enable=0;}
2880  00b1 b602          	ld	a,L5361_uart_data
2881  00b3 a156          	cp	a,#86
2882  00b5 2612          	jrne	L7071
2885  00b7 3d04          	tnz	L1461_get_flag
2886  00b9 2606          	jrne	L1171
2889  00bb 35020001      	mov	_report_state,#2
2891  00bf 2004          	jra	L3171
2892  00c1               L1171:
2895  00c1 35070001      	mov	_report_state,#7
2896  00c5               L3171:
2899  00c5 3f03          	clr	L7361_get_enable
2901  00c7 2042          	jra	L1761
2902  00c9               L7071:
2903                     ; 157 		  else if(uart_data=='A') {report_state=report_a;get_enable=0;}
2905  00c9 b602          	ld	a,L5361_uart_data
2906  00cb a141          	cp	a,#65
2907  00cd 2608          	jrne	L7171
2910  00cf 35030001      	mov	_report_state,#3
2913  00d3 3f03          	clr	L7361_get_enable
2915  00d5 2034          	jra	L1761
2916  00d7               L7171:
2917                     ; 158 		  else if(uart_data=='K') {get_flag=1;}
2919  00d7 b602          	ld	a,L5361_uart_data
2920  00d9 a14b          	cp	a,#75
2921  00db 2606          	jrne	L3271
2924  00dd 35010004      	mov	L1461_get_flag,#1
2926  00e1 2028          	jra	L1761
2927  00e3               L3271:
2928                     ; 159 		  else if(uart_data=='D') {report_state=report_d;get_enable=0;}
2930  00e3 b602          	ld	a,L5361_uart_data
2931  00e5 a144          	cp	a,#68
2932  00e7 2608          	jrne	L7271
2935  00e9 35050001      	mov	_report_state,#5
2938  00ed 3f03          	clr	L7361_get_enable
2940  00ef 201a          	jra	L1761
2941  00f1               L7271:
2942                     ; 160 		  else if(uart_data=='R') {report_state=report_r;get_enable=0;}
2944  00f1 b602          	ld	a,L5361_uart_data
2945  00f3 a152          	cp	a,#82
2946  00f5 2608          	jrne	L3371
2949  00f7 35060001      	mov	_report_state,#6
2952  00fb 3f03          	clr	L7361_get_enable
2954  00fd 200c          	jra	L1761
2955  00ff               L3371:
2956                     ; 161 		else if(uart_data=='F') {report_state=report_rate;get_enable=0;}
2958  00ff b602          	ld	a,L5361_uart_data
2959  0101 a146          	cp	a,#70
2960  0103 2606          	jrne	L1761
2963  0105 35080001      	mov	_report_state,#8
2966  0109 3f03          	clr	L7361_get_enable
2967  010b               L1761:
2968                     ; 165 }
2971  010b 80            	iret
2999                     ; 167 @near @interrupt void time4 (void)
2999                     ; 168 {
3000                     	switch	.text
3001  010c               _time4:
3006                     ; 169 	TIM4_SR&=0xfe;
3008  010c 72115344      	bres	_TIM4_SR,#0
3009                     ; 170 	rate_buf+=1;
3011  0110 be03          	ldw	x,_rate_buf
3012  0112 1c0001        	addw	x,#1
3013  0115 bf03          	ldw	_rate_buf,x
3014                     ; 171 	delta_time_count1+=1;
3016  0117 3c06          	inc	_delta_time_count1
3017                     ; 172 	if(delta_time_count1>99)
3019  0119 b606          	ld	a,_delta_time_count1
3020  011b a164          	cp	a,#100
3021  011d 251f          	jrult	L1571
3022                     ; 174 		delta_time_count1=0;
3024  011f 3f06          	clr	_delta_time_count1
3025                     ; 175 		delta_time_count2+=1;
3027  0121 3c05          	inc	_delta_time_count2
3028                     ; 176 		if(delta_time_count2>9)
3030  0123 b605          	ld	a,_delta_time_count2
3031  0125 a10a          	cp	a,#10
3032  0127 2515          	jrult	L1571
3033                     ; 178 			delta_time_count2=0;
3035  0129 3f05          	clr	_delta_time_count2
3036                     ; 179 		  delta_time+=1;
3038  012b be07          	ldw	x,_delta_time
3039  012d 1c0001        	addw	x,#1
3040  0130 bf07          	ldw	_delta_time,x
3041                     ; 180 		  if(delta_time>999)
3043  0132 be07          	ldw	x,_delta_time
3044  0134 a303e8        	cpw	x,#1000
3045  0137 2505          	jrult	L1571
3046                     ; 181 		  delta_time=999;
3048  0139 ae03e7        	ldw	x,#999
3049  013c bf07          	ldw	_delta_time,x
3050  013e               L1571:
3051                     ; 184 }
3054  013e 80            	iret
3179                     	xdef	__vectab
3180                     	xref	__stext
3181                     	xdef	f_NonHandledInterrupt
3182                     	xref	_meter_watt
3183                     	xref	_meter_data_get
3184                     	xref	_ade7753_read_bytes
3185                     	xdef	_time4
3186                     	xdef	_uart1_rx
3187                     	xdef	_ext10
3188                     	xref.b	_buf
3189                     	switch	.ubsct
3190  0000               _rate_count:
3191  0000 00            	ds.b	1
3192                     	xdef	_rate_count
3193  0001               _rate:
3194  0001 0000          	ds.b	2
3195                     	xdef	_rate
3196  0003               _rate_buf:
3197  0003 0000          	ds.b	2
3198                     	xdef	_rate_buf
3199  0005               _delta_time_count2:
3200  0005 00            	ds.b	1
3201                     	xdef	_delta_time_count2
3202  0006               _delta_time_count1:
3203  0006 00            	ds.b	1
3204                     	xdef	_delta_time_count1
3205  0007               _delta_time:
3206  0007 0000          	ds.b	2
3207                     	xdef	_delta_time
3208                     	xdef	_report_state
3209                     	xdef	_bstate
3210                     	xref.b	c_x
3211                     	xref.b	c_y
3231                     	end
