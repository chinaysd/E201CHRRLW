   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Generator V4.2.4 - 19 Dec 2007
  33                     ; 49 INTERRUPT_HANDLER(NonHandledInterrupt, 25)
  33                     ; 50 {
  34                     	switch	.text
  35  0000               f_NonHandledInterrupt:
  40                     ; 54 }
  43  0000 80            	iret
  65                     ; 62 INTERRUPT_HANDLER_TRAP(TRAP_IRQHandler)
  65                     ; 63 {
  66                     	switch	.text
  67  0001               f_TRAP_IRQHandler:
  72                     ; 67 }
  75  0001 80            	iret
  97                     ; 73 INTERRUPT_HANDLER(TLI_IRQHandler, 0)
  97                     ; 74 
  97                     ; 75 {
  98                     	switch	.text
  99  0002               f_TLI_IRQHandler:
 104                     ; 79 }
 107  0002 80            	iret
 129                     ; 86 INTERRUPT_HANDLER(AWU_IRQHandler, 1)
 129                     ; 87 {
 130                     	switch	.text
 131  0003               f_AWU_IRQHandler:
 136                     ; 91 }
 139  0003 80            	iret
 161                     ; 98 INTERRUPT_HANDLER(CLK_IRQHandler, 2)
 161                     ; 99 {
 162                     	switch	.text
 163  0004               f_CLK_IRQHandler:
 168                     ; 103 }
 171  0004 80            	iret
 194                     ; 110 INTERRUPT_HANDLER(EXTI_PORTA_IRQHandler, 3)
 194                     ; 111 {
 195                     	switch	.text
 196  0005               f_EXTI_PORTA_IRQHandler:
 201                     ; 115 }
 204  0005 80            	iret
 227                     ; 122 INTERRUPT_HANDLER(EXTI_PORTB_IRQHandler, 4)
 227                     ; 123 {
 228                     	switch	.text
 229  0006               f_EXTI_PORTB_IRQHandler:
 234                     ; 128 }
 237  0006 80            	iret
 260                     ; 135 INTERRUPT_HANDLER(EXTI_PORTC_IRQHandler, 5)
 260                     ; 136 {
 261                     	switch	.text
 262  0007               f_EXTI_PORTC_IRQHandler:
 267                     ; 141 }
 270  0007 80            	iret
 293                     ; 148 INTERRUPT_HANDLER(EXTI_PORTD_IRQHandler, 6)
 293                     ; 149 {
 294                     	switch	.text
 295  0008               f_EXTI_PORTD_IRQHandler:
 300                     ; 154 }
 303  0008 80            	iret
 326                     ; 161 INTERRUPT_HANDLER(EXTI_PORTE_IRQHandler, 7)
 326                     ; 162 {
 327                     	switch	.text
 328  0009               f_EXTI_PORTE_IRQHandler:
 333                     ; 174 }
 336  0009 80            	iret
 358                     ; 221 INTERRUPT_HANDLER(SPI_IRQHandler, 10)
 358                     ; 222 {
 359                     	switch	.text
 360  000a               f_SPI_IRQHandler:
 365                     ; 226 }
 368  000a 80            	iret
 391                     ; 233 INTERRUPT_HANDLER(TIM1_UPD_OVF_TRG_BRK_IRQHandler, 11)
 391                     ; 234 {
 392                     	switch	.text
 393  000b               f_TIM1_UPD_OVF_TRG_BRK_IRQHandler:
 398                     ; 241 }
 401  000b 80            	iret
 424                     ; 248 INTERRUPT_HANDLER(TIM1_CAP_COM_IRQHandler, 12)
 424                     ; 249 {
 425                     	switch	.text
 426  000c               f_TIM1_CAP_COM_IRQHandler:
 431                     ; 253 }
 434  000c 80            	iret
 457                     ; 287  INTERRUPT_HANDLER(TIM2_UPD_OVF_BRK_IRQHandler, 13)
 457                     ; 288 {
 458                     	switch	.text
 459  000d               f_TIM2_UPD_OVF_BRK_IRQHandler:
 464                     ; 290 }
 467  000d 80            	iret
 490                     ; 297  INTERRUPT_HANDLER(TIM2_CAP_COM_IRQHandler, 14)
 490                     ; 298 {
 491                     	switch	.text
 492  000e               f_TIM2_CAP_COM_IRQHandler:
 497                     ; 302 }
 500  000e 80            	iret
 523                     ; 312  INTERRUPT_HANDLER(TIM3_UPD_OVF_BRK_IRQHandler, 15)
 523                     ; 313  {
 524                     	switch	.text
 525  000f               f_TIM3_UPD_OVF_BRK_IRQHandler:
 530                     ; 317  }
 533  000f 80            	iret
 556                     ; 324  INTERRUPT_HANDLER(TIM3_CAP_COM_IRQHandler, 16)
 556                     ; 325  {
 557                     	switch	.text
 558  0010               f_TIM3_CAP_COM_IRQHandler:
 563                     ; 329  }
 566  0010 80            	iret
 588                     ; 364 INTERRUPT_HANDLER(I2C_IRQHandler, 19)
 588                     ; 365 {
 589                     	switch	.text
 590  0011               f_I2C_IRQHandler:
 595                     ; 369 }
 598  0011 80            	iret
 621                     ; 377  INTERRUPT_HANDLER(UART2_TX_IRQHandler, 20)
 621                     ; 378  {
 622                     	switch	.text
 623  0012               f_UART2_TX_IRQHandler:
 628                     ; 382  }
 631  0012 80            	iret
 655                     ; 389  INTERRUPT_HANDLER(UART2_RX_IRQHandler, 21)
 655                     ; 390  {
 656                     	switch	.text
 657  0013               f_UART2_RX_IRQHandler:
 660  0013 3b0002        	push	c_x+2
 661  0016 be00          	ldw	x,c_x
 662  0018 89            	pushw	x
 663  0019 3b0002        	push	c_y+2
 664  001c be00          	ldw	x,c_y
 665  001e 89            	pushw	x
 668                     ; 394     	Serial_Rev_IQH();
 670  001f cd0000        	call	_Serial_Rev_IQH
 672                     ; 395  }
 675  0022 85            	popw	x
 676  0023 bf00          	ldw	c_y,x
 677  0025 320002        	pop	c_y+2
 678  0028 85            	popw	x
 679  0029 bf00          	ldw	c_x,x
 680  002b 320002        	pop	c_x+2
 681  002e 80            	iret
 703                     ; 444  INTERRUPT_HANDLER(ADC1_IRQHandler, 22)
 703                     ; 445  {
 704                     	switch	.text
 705  002f               f_ADC1_IRQHandler:
 710                     ; 449  }
 713  002f 80            	iret
 739                     ; 470  INTERRUPT_HANDLER(TIM4_UPD_OVF_IRQHandler, 23)
 739                     ; 471  {
 740                     	switch	.text
 741  0030               f_TIM4_UPD_OVF_IRQHandler:
 744  0030 3b0002        	push	c_x+2
 745  0033 be00          	ldw	x,c_x
 746  0035 89            	pushw	x
 747  0036 3b0002        	push	c_y+2
 748  0039 be00          	ldw	x,c_y
 749  003b 89            	pushw	x
 752                     ; 475 	TIM4_ClearFlag(TIM4_FLAG_UPDATE); 
 754  003c a601          	ld	a,#1
 755  003e cd0000        	call	_TIM4_ClearFlag
 757                     ; 476   	TimeOutDet_DecHandle();
 759  0041 cd0000        	call	_TimeOutDet_DecHandle
 761                     ; 477 	MassTimeHandle();
 763  0044 cd0000        	call	_MassTimeHandle
 765                     ; 478  }
 768  0047 85            	popw	x
 769  0048 bf00          	ldw	c_y,x
 770  004a 320002        	pop	c_y+2
 771  004d 85            	popw	x
 772  004e bf00          	ldw	c_x,x
 773  0050 320002        	pop	c_x+2
 774  0053 80            	iret
 797                     ; 486 INTERRUPT_HANDLER(EEPROM_EEC_IRQHandler, 24)
 797                     ; 487 {
 798                     	switch	.text
 799  0054               f_EEPROM_EEC_IRQHandler:
 804                     ; 492 }
 807  0054 80            	iret
 819                     	xref	_MassTimeHandle
 820                     	xref	_Serial_Rev_IQH
 821                     	xref	_TimeOutDet_DecHandle
 822                     	xdef	f_EEPROM_EEC_IRQHandler
 823                     	xdef	f_TIM4_UPD_OVF_IRQHandler
 824                     	xdef	f_ADC1_IRQHandler
 825                     	xdef	f_UART2_TX_IRQHandler
 826                     	xdef	f_UART2_RX_IRQHandler
 827                     	xdef	f_I2C_IRQHandler
 828                     	xdef	f_TIM3_CAP_COM_IRQHandler
 829                     	xdef	f_TIM3_UPD_OVF_BRK_IRQHandler
 830                     	xdef	f_TIM2_CAP_COM_IRQHandler
 831                     	xdef	f_TIM2_UPD_OVF_BRK_IRQHandler
 832                     	xdef	f_TIM1_UPD_OVF_TRG_BRK_IRQHandler
 833                     	xdef	f_TIM1_CAP_COM_IRQHandler
 834                     	xdef	f_SPI_IRQHandler
 835                     	xdef	f_EXTI_PORTE_IRQHandler
 836                     	xdef	f_EXTI_PORTD_IRQHandler
 837                     	xdef	f_EXTI_PORTC_IRQHandler
 838                     	xdef	f_EXTI_PORTB_IRQHandler
 839                     	xdef	f_EXTI_PORTA_IRQHandler
 840                     	xdef	f_CLK_IRQHandler
 841                     	xdef	f_AWU_IRQHandler
 842                     	xdef	f_TLI_IRQHandler
 843                     	xdef	f_TRAP_IRQHandler
 844                     	xdef	f_NonHandledInterrupt
 845                     	xref	_TIM4_ClearFlag
 846                     	xref.b	c_x
 847                     	xref.b	c_y
 866                     	end
