   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Generator V4.2.4 - 19 Dec 2007
  32                     ; 43 void TIM4_DeInit(void)
  32                     ; 44 {
  34                     	switch	.text
  35  0000               _TIM4_DeInit:
  39                     ; 45     TIM4->CR1 = TIM4_CR1_RESET_VALUE;
  41  0000 725f5340      	clr	21312
  42                     ; 46     TIM4->IER = TIM4_IER_RESET_VALUE;
  44  0004 725f5343      	clr	21315
  45                     ; 47     TIM4->CNTR = TIM4_CNTR_RESET_VALUE;
  47  0008 725f5346      	clr	21318
  48                     ; 48     TIM4->PSCR = TIM4_PSCR_RESET_VALUE;
  50  000c 725f5347      	clr	21319
  51                     ; 49     TIM4->ARR = TIM4_ARR_RESET_VALUE;
  53  0010 35ff5348      	mov	21320,#255
  54                     ; 50     TIM4->SR1 = TIM4_SR1_RESET_VALUE;
  56  0014 725f5344      	clr	21316
  57                     ; 51 }
  60  0018 81            	ret
 166                     ; 59 void TIM4_TimeBaseInit(TIM4_Prescaler_TypeDef TIM4_Prescaler, uint8_t TIM4_Period)
 166                     ; 60 {
 167                     	switch	.text
 168  0019               _TIM4_TimeBaseInit:
 172                     ; 62     assert_param(IS_TIM4_PRESCALER_OK(TIM4_Prescaler));
 174                     ; 64     TIM4->PSCR = (uint8_t)(TIM4_Prescaler);
 176  0019 9e            	ld	a,xh
 177  001a c75347        	ld	21319,a
 178                     ; 66     TIM4->ARR = (uint8_t)(TIM4_Period);
 180  001d 9f            	ld	a,xl
 181  001e c75348        	ld	21320,a
 182                     ; 67 }
 185  0021 81            	ret
 240                     ; 77 void TIM4_Cmd(FunctionalState NewState)
 240                     ; 78 {
 241                     	switch	.text
 242  0022               _TIM4_Cmd:
 246                     ; 80     assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 248                     ; 83     if (NewState != DISABLE)
 250  0022 4d            	tnz	a
 251  0023 2706          	jreq	L511
 252                     ; 85         TIM4->CR1 |= TIM4_CR1_CEN;
 254  0025 72105340      	bset	21312,#0
 256  0029 2004          	jra	L711
 257  002b               L511:
 258                     ; 89         TIM4->CR1 &= (uint8_t)(~TIM4_CR1_CEN);
 260  002b 72115340      	bres	21312,#0
 261  002f               L711:
 262                     ; 91 }
 265  002f 81            	ret
 323                     ; 103 void TIM4_ITConfig(TIM4_IT_TypeDef TIM4_IT, FunctionalState NewState)
 323                     ; 104 {
 324                     	switch	.text
 325  0030               _TIM4_ITConfig:
 327  0030 89            	pushw	x
 328       00000000      OFST:	set	0
 331                     ; 106     assert_param(IS_TIM4_IT_OK(TIM4_IT));
 333                     ; 107     assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 335                     ; 109     if (NewState != DISABLE)
 337  0031 9f            	ld	a,xl
 338  0032 4d            	tnz	a
 339  0033 2709          	jreq	L151
 340                     ; 112         TIM4->IER |= (uint8_t)TIM4_IT;
 342  0035 9e            	ld	a,xh
 343  0036 ca5343        	or	a,21315
 344  0039 c75343        	ld	21315,a
 346  003c 2009          	jra	L351
 347  003e               L151:
 348                     ; 117         TIM4->IER &= (uint8_t)(~TIM4_IT);
 350  003e 7b01          	ld	a,(OFST+1,sp)
 351  0040 43            	cpl	a
 352  0041 c45343        	and	a,21315
 353  0044 c75343        	ld	21315,a
 354  0047               L351:
 355                     ; 119 }
 358  0047 85            	popw	x
 359  0048 81            	ret
 395                     ; 127 void TIM4_UpdateDisableConfig(FunctionalState NewState)
 395                     ; 128 {
 396                     	switch	.text
 397  0049               _TIM4_UpdateDisableConfig:
 401                     ; 130     assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 403                     ; 133     if (NewState != DISABLE)
 405  0049 4d            	tnz	a
 406  004a 2706          	jreq	L371
 407                     ; 135         TIM4->CR1 |= TIM4_CR1_UDIS;
 409  004c 72125340      	bset	21312,#1
 411  0050 2004          	jra	L571
 412  0052               L371:
 413                     ; 139         TIM4->CR1 &= (uint8_t)(~TIM4_CR1_UDIS);
 415  0052 72135340      	bres	21312,#1
 416  0056               L571:
 417                     ; 141 }
 420  0056 81            	ret
 478                     ; 151 void TIM4_UpdateRequestConfig(TIM4_UpdateSource_TypeDef TIM4_UpdateSource)
 478                     ; 152 {
 479                     	switch	.text
 480  0057               _TIM4_UpdateRequestConfig:
 484                     ; 154     assert_param(IS_TIM4_UPDATE_SOURCE_OK(TIM4_UpdateSource));
 486                     ; 157     if (TIM4_UpdateSource != TIM4_UPDATESOURCE_GLOBAL)
 488  0057 4d            	tnz	a
 489  0058 2706          	jreq	L522
 490                     ; 159         TIM4->CR1 |= TIM4_CR1_URS;
 492  005a 72145340      	bset	21312,#2
 494  005e 2004          	jra	L722
 495  0060               L522:
 496                     ; 163         TIM4->CR1 &= (uint8_t)(~TIM4_CR1_URS);
 498  0060 72155340      	bres	21312,#2
 499  0064               L722:
 500                     ; 165 }
 503  0064 81            	ret
 560                     ; 175 void TIM4_SelectOnePulseMode(TIM4_OPMode_TypeDef TIM4_OPMode)
 560                     ; 176 {
 561                     	switch	.text
 562  0065               _TIM4_SelectOnePulseMode:
 566                     ; 178     assert_param(IS_TIM4_OPM_MODE_OK(TIM4_OPMode));
 568                     ; 181     if (TIM4_OPMode != TIM4_OPMODE_REPETITIVE)
 570  0065 4d            	tnz	a
 571  0066 2706          	jreq	L752
 572                     ; 183         TIM4->CR1 |= TIM4_CR1_OPM;
 574  0068 72165340      	bset	21312,#3
 576  006c 2004          	jra	L162
 577  006e               L752:
 578                     ; 187         TIM4->CR1 &= (uint8_t)(~TIM4_CR1_OPM);
 580  006e 72175340      	bres	21312,#3
 581  0072               L162:
 582                     ; 190 }
 585  0072 81            	ret
 653                     ; 212 void TIM4_PrescalerConfig(TIM4_Prescaler_TypeDef Prescaler, TIM4_PSCReloadMode_TypeDef TIM4_PSCReloadMode)
 653                     ; 213 {
 654                     	switch	.text
 655  0073               _TIM4_PrescalerConfig:
 659                     ; 215     assert_param(IS_TIM4_PRESCALER_RELOAD_OK(TIM4_PSCReloadMode));
 661                     ; 216     assert_param(IS_TIM4_PRESCALER_OK(Prescaler));
 663                     ; 219     TIM4->PSCR = (uint8_t)Prescaler;
 665  0073 9e            	ld	a,xh
 666  0074 c75347        	ld	21319,a
 667                     ; 222     TIM4->EGR = (uint8_t)TIM4_PSCReloadMode;
 669  0077 9f            	ld	a,xl
 670  0078 c75345        	ld	21317,a
 671                     ; 223 }
 674  007b 81            	ret
 710                     ; 231 void TIM4_ARRPreloadConfig(FunctionalState NewState)
 710                     ; 232 {
 711                     	switch	.text
 712  007c               _TIM4_ARRPreloadConfig:
 716                     ; 234     assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 718                     ; 237     if (NewState != DISABLE)
 720  007c 4d            	tnz	a
 721  007d 2706          	jreq	L333
 722                     ; 239         TIM4->CR1 |= TIM4_CR1_ARPE;
 724  007f 721e5340      	bset	21312,#7
 726  0083 2004          	jra	L533
 727  0085               L333:
 728                     ; 243         TIM4->CR1 &= (uint8_t)(~TIM4_CR1_ARPE);
 730  0085 721f5340      	bres	21312,#7
 731  0089               L533:
 732                     ; 245 }
 735  0089 81            	ret
 784                     ; 254 void TIM4_GenerateEvent(TIM4_EventSource_TypeDef TIM4_EventSource)
 784                     ; 255 {
 785                     	switch	.text
 786  008a               _TIM4_GenerateEvent:
 790                     ; 257     assert_param(IS_TIM4_EVENT_SOURCE_OK(TIM4_EventSource));
 792                     ; 260     TIM4->EGR = (uint8_t)(TIM4_EventSource);
 794  008a c75345        	ld	21317,a
 795                     ; 261 }
 798  008d 81            	ret
 832                     ; 270 void TIM4_SetCounter(uint8_t Counter)
 832                     ; 271 {
 833                     	switch	.text
 834  008e               _TIM4_SetCounter:
 838                     ; 273     TIM4->CNTR = (uint8_t)(Counter);
 840  008e c75346        	ld	21318,a
 841                     ; 274 }
 844  0091 81            	ret
 878                     ; 283 void TIM4_SetAutoreload(uint8_t Autoreload)
 878                     ; 284 {
 879                     	switch	.text
 880  0092               _TIM4_SetAutoreload:
 884                     ; 286     TIM4->ARR = (uint8_t)(Autoreload);
 886  0092 c75348        	ld	21320,a
 887                     ; 287 }
 890  0095 81            	ret
 913                     ; 294 uint8_t TIM4_GetCounter(void)
 913                     ; 295 {
 914                     	switch	.text
 915  0096               _TIM4_GetCounter:
 919                     ; 297     return (uint8_t)(TIM4->CNTR);
 921  0096 c65346        	ld	a,21318
 924  0099 81            	ret
 948                     ; 305 TIM4_Prescaler_TypeDef TIM4_GetPrescaler(void)
 948                     ; 306 {
 949                     	switch	.text
 950  009a               _TIM4_GetPrescaler:
 954                     ; 308     return (TIM4_Prescaler_TypeDef)(TIM4->PSCR);
 956  009a c65347        	ld	a,21319
 959  009d 81            	ret
1038                     ; 318 FlagStatus TIM4_GetFlagStatus(TIM4_FLAG_TypeDef TIM4_FLAG)
1038                     ; 319 {
1039                     	switch	.text
1040  009e               _TIM4_GetFlagStatus:
1042  009e 88            	push	a
1043       00000001      OFST:	set	1
1046                     ; 320     FlagStatus bitstatus = RESET;
1048  009f 0f01          	clr	(OFST+0,sp)
1049                     ; 323     assert_param(IS_TIM4_GET_FLAG_OK(TIM4_FLAG));
1051                     ; 325   if ((TIM4->SR1 & (uint8_t)TIM4_FLAG)  != 0)
1053  00a1 c45344        	and	a,21316
1054  00a4 2706          	jreq	L774
1055                     ; 327     bitstatus = SET;
1057  00a6 a601          	ld	a,#1
1058  00a8 6b01          	ld	(OFST+0,sp),a
1060  00aa 2002          	jra	L105
1061  00ac               L774:
1062                     ; 331     bitstatus = RESET;
1064  00ac 0f01          	clr	(OFST+0,sp)
1065  00ae               L105:
1066                     ; 333   return ((FlagStatus)bitstatus);
1068  00ae 7b01          	ld	a,(OFST+0,sp)
1071  00b0 5b01          	addw	sp,#1
1072  00b2 81            	ret
1107                     ; 343 void TIM4_ClearFlag(TIM4_FLAG_TypeDef TIM4_FLAG)
1107                     ; 344 {
1108                     	switch	.text
1109  00b3               _TIM4_ClearFlag:
1113                     ; 346     assert_param(IS_TIM4_GET_FLAG_OK(TIM4_FLAG));
1115                     ; 349     TIM4->SR1 = (uint8_t)(~TIM4_FLAG);
1117  00b3 43            	cpl	a
1118  00b4 c75344        	ld	21316,a
1119                     ; 351 }
1122  00b7 81            	ret
1186                     ; 360 ITStatus TIM4_GetITStatus(TIM4_IT_TypeDef TIM4_IT)
1186                     ; 361 {
1187                     	switch	.text
1188  00b8               _TIM4_GetITStatus:
1190  00b8 88            	push	a
1191  00b9 89            	pushw	x
1192       00000002      OFST:	set	2
1195                     ; 362     ITStatus bitstatus = RESET;
1197  00ba 7b02          	ld	a,(OFST+0,sp)
1198  00bc 97            	ld	xl,a
1199                     ; 364   uint8_t itstatus = 0x0, itenable = 0x0;
1201  00bd 7b01          	ld	a,(OFST-1,sp)
1202  00bf 97            	ld	xl,a
1205  00c0 7b02          	ld	a,(OFST+0,sp)
1206  00c2 97            	ld	xl,a
1207                     ; 367   assert_param(IS_TIM4_IT_OK(TIM4_IT));
1209                     ; 369   itstatus = (uint8_t)(TIM4->SR1 & (uint8_t)TIM4_IT);
1211  00c3 c65344        	ld	a,21316
1212  00c6 1403          	and	a,(OFST+1,sp)
1213  00c8 6b01          	ld	(OFST-1,sp),a
1214                     ; 371   itenable = (uint8_t)(TIM4->IER & (uint8_t)TIM4_IT);
1216  00ca c65343        	ld	a,21315
1217  00cd 1403          	and	a,(OFST+1,sp)
1218  00cf 6b02          	ld	(OFST+0,sp),a
1219                     ; 373   if ((itstatus != (uint8_t)RESET ) && (itenable != (uint8_t)RESET ))
1221  00d1 0d01          	tnz	(OFST-1,sp)
1222  00d3 270a          	jreq	L355
1224  00d5 0d02          	tnz	(OFST+0,sp)
1225  00d7 2706          	jreq	L355
1226                     ; 375     bitstatus = (ITStatus)SET;
1228  00d9 a601          	ld	a,#1
1229  00db 6b02          	ld	(OFST+0,sp),a
1231  00dd 2002          	jra	L555
1232  00df               L355:
1233                     ; 379     bitstatus = (ITStatus)RESET;
1235  00df 0f02          	clr	(OFST+0,sp)
1236  00e1               L555:
1237                     ; 381   return ((ITStatus)bitstatus);
1239  00e1 7b02          	ld	a,(OFST+0,sp)
1242  00e3 5b03          	addw	sp,#3
1243  00e5 81            	ret
1279                     ; 391 void TIM4_ClearITPendingBit(TIM4_IT_TypeDef TIM4_IT)
1279                     ; 392 {
1280                     	switch	.text
1281  00e6               _TIM4_ClearITPendingBit:
1285                     ; 394     assert_param(IS_TIM4_IT_OK(TIM4_IT));
1287                     ; 397     TIM4->SR1 = (uint8_t)(~TIM4_IT);
1289  00e6 43            	cpl	a
1290  00e7 c75344        	ld	21316,a
1291                     ; 398 }
1294  00ea 81            	ret
1307                     	xdef	_TIM4_ClearITPendingBit
1308                     	xdef	_TIM4_GetITStatus
1309                     	xdef	_TIM4_ClearFlag
1310                     	xdef	_TIM4_GetFlagStatus
1311                     	xdef	_TIM4_GetPrescaler
1312                     	xdef	_TIM4_GetCounter
1313                     	xdef	_TIM4_SetAutoreload
1314                     	xdef	_TIM4_SetCounter
1315                     	xdef	_TIM4_GenerateEvent
1316                     	xdef	_TIM4_ARRPreloadConfig
1317                     	xdef	_TIM4_PrescalerConfig
1318                     	xdef	_TIM4_SelectOnePulseMode
1319                     	xdef	_TIM4_UpdateRequestConfig
1320                     	xdef	_TIM4_UpdateDisableConfig
1321                     	xdef	_TIM4_ITConfig
1322                     	xdef	_TIM4_Cmd
1323                     	xdef	_TIM4_TimeBaseInit
1324                     	xdef	_TIM4_DeInit
1343                     	end
