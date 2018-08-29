   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Generator V4.2.4 - 19 Dec 2007
  60                     ; 60 INTERRUPT_HANDLER_TRAP(TRAP_IRQHandler)
  60                     ; 61 {
  61                     	switch	.text
  62  0000               f_TRAP_IRQHandler:
  67                     ; 65 }
  70  0000 80            	iret
  92                     ; 72 INTERRUPT_HANDLER(TLI_IRQHandler, 0)
  92                     ; 73 
  92                     ; 74 {
  93                     	switch	.text
  94  0001               f_TLI_IRQHandler:
  99                     ; 78 }
 102  0001 80            	iret
 124                     ; 85 INTERRUPT_HANDLER(AWU_IRQHandler, 1)
 124                     ; 86 {
 125                     	switch	.text
 126  0002               f_AWU_IRQHandler:
 131                     ; 90 }
 134  0002 80            	iret
 156                     ; 97 INTERRUPT_HANDLER(CLK_IRQHandler, 2)
 156                     ; 98 {
 157                     	switch	.text
 158  0003               f_CLK_IRQHandler:
 163                     ; 102 }
 166  0003 80            	iret
 190                     ; 109 INTERRUPT_HANDLER(EXTI_PORTA_IRQHandler, 3)
 190                     ; 110 {
 191                     	switch	.text
 192  0004               f_EXTI_PORTA_IRQHandler:
 195  0004 3b0002        	push	c_x+2
 196  0007 be00          	ldw	x,c_x
 197  0009 89            	pushw	x
 198  000a 3b0002        	push	c_y+2
 199  000d be00          	ldw	x,c_y
 200  000f 89            	pushw	x
 203                     ; 114 	if(!GPIO_ReadInputPin(GPIOA, GPIO_PIN_3))
 205  0010 4b08          	push	#8
 206  0012 ae5000        	ldw	x,#20480
 207  0015 cd0000        	call	_GPIO_ReadInputPin
 209  0018 5b01          	addw	sp,#1
 210  001a 4d            	tnz	a
 211                     ; 134 }
 214  001b 85            	popw	x
 215  001c bf00          	ldw	c_y,x
 216  001e 320002        	pop	c_y+2
 217  0021 85            	popw	x
 218  0022 bf00          	ldw	c_x,x
 219  0024 320002        	pop	c_x+2
 220  0027 80            	iret
 243                     ; 141 INTERRUPT_HANDLER(EXTI_PORTB_IRQHandler, 4)
 243                     ; 142 {
 244                     	switch	.text
 245  0028               f_EXTI_PORTB_IRQHandler:
 250                     ; 146 }
 253  0028 80            	iret
 276                     ; 153 INTERRUPT_HANDLER(EXTI_PORTC_IRQHandler, 5)
 276                     ; 154 {
 277                     	switch	.text
 278  0029               f_EXTI_PORTC_IRQHandler:
 283                     ; 158 }
 286  0029 80            	iret
 309                     ; 165 INTERRUPT_HANDLER(EXTI_PORTD_IRQHandler, 6)
 309                     ; 166 {
 310                     	switch	.text
 311  002a               f_EXTI_PORTD_IRQHandler:
 316                     ; 170 }
 319  002a 80            	iret
 342                     ; 177 INTERRUPT_HANDLER(EXTI_PORTE_IRQHandler, 7)
 342                     ; 178 {
 343                     	switch	.text
 344  002b               f_EXTI_PORTE_IRQHandler:
 349                     ; 182 }
 352  002b 80            	iret
 374                     ; 229 INTERRUPT_HANDLER(SPI_IRQHandler, 10)
 374                     ; 230 {
 375                     	switch	.text
 376  002c               f_SPI_IRQHandler:
 381                     ; 234 }
 384  002c 80            	iret
 407                     ; 241 INTERRUPT_HANDLER(TIM1_UPD_OVF_TRG_BRK_IRQHandler, 11)
 407                     ; 242 {
 408                     	switch	.text
 409  002d               f_TIM1_UPD_OVF_TRG_BRK_IRQHandler:
 414                     ; 246 }
 417  002d 80            	iret
 440                     ; 253 INTERRUPT_HANDLER(TIM1_CAP_COM_IRQHandler, 12)
 440                     ; 254 {
 441                     	switch	.text
 442  002e               f_TIM1_CAP_COM_IRQHandler:
 447                     ; 258 }
 450  002e 80            	iret
 473                     ; 291  INTERRUPT_HANDLER(TIM2_UPD_OVF_BRK_IRQHandler, 13)
 473                     ; 292  {
 474                     	switch	.text
 475  002f               f_TIM2_UPD_OVF_BRK_IRQHandler:
 480                     ; 296  }
 483  002f 80            	iret
 506                     ; 303  INTERRUPT_HANDLER(TIM2_CAP_COM_IRQHandler, 14)
 506                     ; 304  {
 507                     	switch	.text
 508  0030               f_TIM2_CAP_COM_IRQHandler:
 513                     ; 308  }
 516  0030 80            	iret
 539                     ; 345  INTERRUPT_HANDLER(UART1_TX_IRQHandler, 17)
 539                     ; 346  {
 540                     	switch	.text
 541  0031               f_UART1_TX_IRQHandler:
 546                     ; 350  }
 549  0031 80            	iret
 572                     ; 357  INTERRUPT_HANDLER(UART1_RX_IRQHandler, 18)
 572                     ; 358  {
 573                     	switch	.text
 574  0032               f_UART1_RX_IRQHandler:
 579                     ; 362  }
 582  0032 80            	iret
 604                     ; 370 INTERRUPT_HANDLER(I2C_IRQHandler, 19)
 604                     ; 371 {
 605                     	switch	.text
 606  0033               f_I2C_IRQHandler:
 611                     ; 375 }
 614  0033 80            	iret
 636                     ; 449  INTERRUPT_HANDLER(ADC1_IRQHandler, 22)
 636                     ; 450  {
 637                     	switch	.text
 638  0034               f_ADC1_IRQHandler:
 643                     ; 454  }
 646  0034 80            	iret
 669                     ; 475  INTERRUPT_HANDLER(TIM4_UPD_OVF_IRQHandler, 23)
 669                     ; 476  {
 670                     	switch	.text
 671  0035               f_TIM4_UPD_OVF_IRQHandler:
 676                     ; 480  }
 679  0035 80            	iret
 702                     ; 488 INTERRUPT_HANDLER(EEPROM_EEC_IRQHandler, 24)
 702                     ; 489 {
 703                     	switch	.text
 704  0036               f_EEPROM_EEC_IRQHandler:
 709                     ; 493 }
 712  0036 80            	iret
 724                     	xdef	f_EEPROM_EEC_IRQHandler
 725                     	xdef	f_TIM4_UPD_OVF_IRQHandler
 726                     	xdef	f_ADC1_IRQHandler
 727                     	xdef	f_I2C_IRQHandler
 728                     	xdef	f_UART1_RX_IRQHandler
 729                     	xdef	f_UART1_TX_IRQHandler
 730                     	xdef	f_TIM2_CAP_COM_IRQHandler
 731                     	xdef	f_TIM2_UPD_OVF_BRK_IRQHandler
 732                     	xdef	f_TIM1_UPD_OVF_TRG_BRK_IRQHandler
 733                     	xdef	f_TIM1_CAP_COM_IRQHandler
 734                     	xdef	f_SPI_IRQHandler
 735                     	xdef	f_EXTI_PORTE_IRQHandler
 736                     	xdef	f_EXTI_PORTD_IRQHandler
 737                     	xdef	f_EXTI_PORTC_IRQHandler
 738                     	xdef	f_EXTI_PORTB_IRQHandler
 739                     	xdef	f_EXTI_PORTA_IRQHandler
 740                     	xdef	f_CLK_IRQHandler
 741                     	xdef	f_AWU_IRQHandler
 742                     	xdef	f_TLI_IRQHandler
 743                     	xdef	f_TRAP_IRQHandler
 744                     	switch	.ubsct
 745  0000               _bintstate:
 746  0000 00            	ds.b	1
 747                     	xdef	_bintstate
 748                     	xref	_GPIO_ReadInputPin
 749                     	xref.b	c_x
 750                     	xref.b	c_y
 770                     	end
