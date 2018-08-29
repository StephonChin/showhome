   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Generator V4.2.4 - 19 Dec 2007
2453                     ; 19 void meter_get(void)
2453                     ; 20 {
2455                     	switch	.text
2456  0000               _meter_get:
2460                     ; 21 	switch(bstate)
2462  0000 b600          	ld	a,_bstate
2464                     ; 40 		break;
2465  0002 4a            	dec	a
2466  0003 2709          	jreq	L3651
2467  0005 4a            	dec	a
2468  0006 2712          	jreq	L5651
2469  0008               L7651:
2470                     ; 38 		default:
2470                     ; 39 		bstate=get_vrms;
2472  0008 35010000      	mov	_bstate,#1
2473                     ; 40 		break;
2475  000c 2016          	jra	L1161
2476  000e               L3651:
2477                     ; 23 		case get_vrms:
2477                     ; 24 		if(meter_updata_type==vrms_updata)
2479  000e b600          	ld	a,_meter_updata_type
2480  0010 a101          	cp	a,#1
2481  0012 2610          	jrne	L1161
2482                     ; 25 		  bstate=get_irms;
2484  0014 35020000      	mov	_bstate,#2
2485  0018 200a          	jra	L1161
2486  001a               L5651:
2487                     ; 28 		case get_irms:
2487                     ; 29 		if(meter_updata_type==irms_updata)
2489  001a b600          	ld	a,_meter_updata_type
2490  001c a102          	cp	a,#2
2491  001e 2604          	jrne	L1161
2492                     ; 30 		  bstate=get_vrms;
2494  0020 35010000      	mov	_bstate,#1
2495  0024               L1161:
2496                     ; 43 }
2499  0024 81            	ret
2512                     	xref.b	_meter_updata_type
2513                     	xref.b	_bstate
2514                     	xdef	_meter_get
2533                     	end
