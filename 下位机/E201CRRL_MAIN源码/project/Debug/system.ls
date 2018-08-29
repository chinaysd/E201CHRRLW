   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Generator V4.2.4 - 19 Dec 2007
   4                     	bsct
   5  0000               L3_Key_Msg:
   6  0000 00            	dc.b	0
  43                     ; 33 static void Tim4_Init(void)
  43                     ; 34 {
  45                     	switch	.text
  46  0000               L51_Tim4_Init:
  50                     ; 35 	TIM4_DeInit();
  52  0000 cd0000        	call	_TIM4_DeInit
  54                     ; 36 	TIM4_TimeBaseInit( TIM4_PRESCALER_32,Delay-1);
  56  0003 ae004a        	ldw	x,#74
  57  0006 a605          	ld	a,#5
  58  0008 95            	ld	xh,a
  59  0009 cd0000        	call	_TIM4_TimeBaseInit
  61                     ; 37 	TIM4_PrescalerConfig(TIM4_PRESCALER_32,TIM4_PSCRELOADMODE_IMMEDIATE);
  63  000c ae0001        	ldw	x,#1
  64  000f a605          	ld	a,#5
  65  0011 95            	ld	xh,a
  66  0012 cd0000        	call	_TIM4_PrescalerConfig
  68                     ; 38 	TIM4_ARRPreloadConfig(ENABLE);
  70  0015 a601          	ld	a,#1
  71  0017 cd0000        	call	_TIM4_ARRPreloadConfig
  73                     ; 39 	TIM4_ITConfig( TIM4_IT_UPDATE , ENABLE);
  75  001a ae0001        	ldw	x,#1
  76  001d a601          	ld	a,#1
  77  001f 95            	ld	xh,a
  78  0020 cd0000        	call	_TIM4_ITConfig
  80                     ; 40 	TIM4_UpdateDisableConfig(DISABLE);
  82  0023 4f            	clr	a
  83  0024 cd0000        	call	_TIM4_UpdateDisableConfig
  85                     ; 41 	TIM4_UpdateRequestConfig( TIM4_UPDATESOURCE_GLOBAL);
  87  0027 4f            	clr	a
  88  0028 cd0000        	call	_TIM4_UpdateRequestConfig
  90                     ; 42 	TIM4_Cmd(ENABLE );
  92  002b a601          	ld	a,#1
  93  002d cd0000        	call	_TIM4_Cmd
  95                     ; 43 }
  98  0030 81            	ret
 126                     ; 49 static void Iwdg_Init(void)
 126                     ; 50 {	
 127                     	switch	.text
 128  0031               L53_Iwdg_Init:
 132                     ; 51 	IWDG_Enable();
 134  0031 cd0000        	call	_IWDG_Enable
 136                     ; 52 	IWDG_WriteAccessCmd(IWDG_WriteAccess_Enable);
 138  0034 a655          	ld	a,#85
 139  0036 cd0000        	call	_IWDG_WriteAccessCmd
 141                     ; 53 	IWDG_SetPrescaler(IWDG_Prescaler_256);
 143  0039 a606          	ld	a,#6
 144  003b cd0000        	call	_IWDG_SetPrescaler
 146                     ; 54 	IWDG_SetReload(0XFF);
 148  003e a6ff          	ld	a,#255
 149  0040 cd0000        	call	_IWDG_SetReload
 151                     ; 55 	IWDG_ReloadCounter();
 153  0043 cd0000        	call	_IWDG_ReloadCounter
 155                     ; 56 }
 158  0046 81            	ret
 183                     ; 58 static System_Sundry_Init(void){
 184                     	switch	.text
 185  0047               L74_System_Sundry_Init:
 189                     ; 60 	GPIO_Init(FOOT_LED_PORT, FOOT_LED_PIN, GPIO_MODE_OUT_PP_HIGH_FAST);
 191  0047 4bf0          	push	#240
 192  0049 4b04          	push	#4
 193  004b ae500f        	ldw	x,#20495
 194  004e cd0000        	call	_GPIO_Init
 196  0051 85            	popw	x
 197                     ; 61 	GPIO_WriteLow(FOOT_LED_PORT, FOOT_LED_PIN);
 199  0052 4b04          	push	#4
 200  0054 ae500f        	ldw	x,#20495
 201  0057 cd0000        	call	_GPIO_WriteLow
 203  005a 84            	pop	a
 204                     ; 62 	GPIO_Init(SUB_LED_PORT, SUB_LED_PIN, GPIO_MODE_OUT_PP_HIGH_FAST);
 206  005b 4bf0          	push	#240
 207  005d 4b04          	push	#4
 208  005f ae5000        	ldw	x,#20480
 209  0062 cd0000        	call	_GPIO_Init
 211  0065 85            	popw	x
 212                     ; 63 	GPIO_WriteLow(SUB_LED_PORT, SUB_LED_PIN);
 214  0066 4b04          	push	#4
 215  0068 ae5000        	ldw	x,#20480
 216  006b cd0000        	call	_GPIO_WriteLow
 218  006e 84            	pop	a
 219                     ; 64 	GPIO_Init(sys_FAN_LED_PORT, sys_FAN_LED_PIN, GPIO_MODE_OUT_PP_HIGH_FAST);
 221  006f 4bf0          	push	#240
 222  0071 4b08          	push	#8
 223  0073 ae500f        	ldw	x,#20495
 224  0076 cd0000        	call	_GPIO_Init
 226  0079 85            	popw	x
 227                     ; 65 	GPIO_WriteLow(sys_FAN_LED_PORT, sys_FAN_LED_PIN);
 229  007a 4b08          	push	#8
 230  007c ae500f        	ldw	x,#20495
 231  007f cd0000        	call	_GPIO_WriteLow
 233  0082 84            	pop	a
 234                     ; 66 }
 237  0083 81            	ret
 284                     ; 69 void System_Init(void){
 285                     	switch	.text
 286  0084               _System_Init:
 288  0084 5203          	subw	sp,#3
 289       00000003      OFST:	set	3
 292                     ; 70 	int i = 0;
 294  0086 5f            	clrw	x
 295  0087 1f02          	ldw	(OFST-1,sp),x
 296                     ; 71 	System_Sundry_Init();
 298  0089 adbc          	call	L74_System_Sundry_Init
 300                     ; 72 	KEY_Init();
 302  008b cd0000        	call	_KEY_Init
 304                     ; 74 	for(i = 0; i < PUSHROD_NUM ;i ++){	
 306  008e 5f            	clrw	x
 307  008f 1f02          	ldw	(OFST-1,sp),x
 308  0091               L77:
 309                     ; 75 		Pushrod[i].ID = i;
 311  0091 7b03          	ld	a,(OFST+0,sp)
 312  0093 1e02          	ldw	x,(OFST-1,sp)
 313  0095 58            	sllw	x
 314  0096 58            	sllw	x
 315  0097 e718          	ld	(L5_Pushrod,x),a
 316                     ; 76 		Pushrod_APP_Init(&Pushrod[i]);
 318  0099 a618          	ld	a,#L5_Pushrod
 319  009b 6b01          	ld	(OFST-2,sp),a
 320  009d 1e02          	ldw	x,(OFST-1,sp)
 321  009f 58            	sllw	x
 322  00a0 58            	sllw	x
 323  00a1 01            	rrwa	x,a
 324  00a2 1b01          	add	a,(OFST-2,sp)
 325  00a4 2401          	jrnc	L41
 326  00a6 5c            	incw	x
 327  00a7               L41:
 328  00a7 5f            	clrw	x
 329  00a8 97            	ld	xl,a
 330  00a9 cd0000        	call	_Pushrod_APP_Init
 332                     ; 74 	for(i = 0; i < PUSHROD_NUM ;i ++){	
 334  00ac 1e02          	ldw	x,(OFST-1,sp)
 335  00ae 1c0001        	addw	x,#1
 336  00b1 1f02          	ldw	(OFST-1,sp),x
 339  00b3 9c            	rvf
 340  00b4 1e02          	ldw	x,(OFST-1,sp)
 341  00b6 a30002        	cpw	x,#2
 342  00b9 2fd6          	jrslt	L77
 343                     ; 78 	for(i = 0; i< CH_NUM; i ++){
 345  00bb 5f            	clrw	x
 346  00bc 1f02          	ldw	(OFST-1,sp),x
 347  00be               L501:
 348                     ; 79 		CH_Para[i].ID = i;
 350  00be 7b03          	ld	a,(OFST+0,sp)
 351  00c0 1e02          	ldw	x,(OFST-1,sp)
 352  00c2 90ae0003      	ldw	y,#3
 353  00c6 cd0000        	call	c_imul
 355  00c9 e70f          	ld	(L11_CH_Para,x),a
 356                     ; 80 		CH_App_Init(&CH_Para[i]);
 358  00cb a60f          	ld	a,#L11_CH_Para
 359  00cd 6b01          	ld	(OFST-2,sp),a
 360  00cf 1e02          	ldw	x,(OFST-1,sp)
 361  00d1 90ae0003      	ldw	y,#3
 362  00d5 cd0000        	call	c_imul
 364  00d8 01            	rrwa	x,a
 365  00d9 1b01          	add	a,(OFST-2,sp)
 366  00db 2401          	jrnc	L61
 367  00dd 5c            	incw	x
 368  00de               L61:
 369  00de 5f            	clrw	x
 370  00df 97            	ld	xl,a
 371  00e0 cd0000        	call	_CH_App_Init
 373                     ; 78 	for(i = 0; i< CH_NUM; i ++){
 375  00e3 1e02          	ldw	x,(OFST-1,sp)
 376  00e5 1c0001        	addw	x,#1
 377  00e8 1f02          	ldw	(OFST-1,sp),x
 380  00ea 9c            	rvf
 381  00eb 1e02          	ldw	x,(OFST-1,sp)
 382  00ed a30001        	cpw	x,#1
 383  00f0 2fcc          	jrslt	L501
 384                     ; 82 	Tim4_Init();
 386  00f2 cd0000        	call	L51_Tim4_Init
 388                     ; 83 	Iwdg_Init();
 390  00f5 cd0031        	call	L53_Iwdg_Init
 392                     ; 84 	TimeOutDet_Init();
 394  00f8 cd0000        	call	_TimeOutDet_Init
 396                     ; 86 	Commu_Init();
 398  00fb cd0000        	call	_Commu_Init
 400                     ; 87 	TimeOut_Record(&Timeout, COMMU_TIMEOUT_VALUE);
 402  00fe ae1388        	ldw	x,#5000
 403  0101 89            	pushw	x
 404  0102 ae0000        	ldw	x,#0
 405  0105 89            	pushw	x
 406  0106 ae0007        	ldw	x,#L31_Timeout
 407  0109 cd0000        	call	_TimeOut_Record
 409  010c 5b04          	addw	sp,#4
 410                     ; 88 	enableInterrupts();
 413  010e 9a            rim
 415                     ; 89 }
 419  010f 5b03          	addw	sp,#3
 420  0111 81            	ret
 474                     ; 95 void System_Handle(void){
 475                     	switch	.text
 476  0112               _System_Handle:
 478  0112 89            	pushw	x
 479       00000002      OFST:	set	2
 482                     ; 97 	IWDG_ReloadCounter();
 484  0113 cd0000        	call	_IWDG_ReloadCounter
 486                     ; 102 	Key_Msg = KEY_Scan();
 488  0116 cd0000        	call	_KEY_Scan
 490  0119 b700          	ld	L3_Key_Msg,a
 491                     ; 104 	if(Key_Msg == MSG_KEY2_LONGPRESS || Key_Msg == MSG_KEY3_LONGPRESS){
 493  011b b600          	ld	a,L3_Key_Msg
 494  011d a107          	cp	a,#7
 495  011f 2706          	jreq	L331
 497  0121 b600          	ld	a,L3_Key_Msg
 498  0123 a10b          	cp	a,#11
 499  0125 2604          	jrne	L131
 500  0127               L331:
 501                     ; 105 		Pushrod[PUSHROD_A].ReverseFlag = TRUE;
 503  0127 35010019      	mov	L5_Pushrod+1,#1
 504  012b               L131:
 505                     ; 107 	if(Key_Msg == MSG_KEY2_LONGPRESS_RE || Key_Msg == MSG_KEY3_LONGPRESS_RE){
 507  012b b600          	ld	a,L3_Key_Msg
 508  012d a108          	cp	a,#8
 509  012f 2706          	jreq	L731
 511  0131 b600          	ld	a,L3_Key_Msg
 512  0133 a10c          	cp	a,#12
 513  0135 2602          	jrne	L531
 514  0137               L731:
 515                     ; 108 		Pushrod[PUSHROD_A].ReverseFlag = FALSE;
 517  0137 3f19          	clr	L5_Pushrod+1
 518  0139               L531:
 519                     ; 111 	if(Key_Msg == MSG_KEY1_LONGPRESS || Key_Msg == MSG_KEY3_LONGPRESS){
 521  0139 b600          	ld	a,L3_Key_Msg
 522  013b a103          	cp	a,#3
 523  013d 2706          	jreq	L341
 525  013f b600          	ld	a,L3_Key_Msg
 526  0141 a10b          	cp	a,#11
 527  0143 2604          	jrne	L141
 528  0145               L341:
 529                     ; 112 		Pushrod[PUSHROD_B].ReverseFlag = TRUE;
 531  0145 3501001d      	mov	L5_Pushrod+5,#1
 532  0149               L141:
 533                     ; 114 	if(Key_Msg == MSG_KEY1_LONGPRESS_RE || Key_Msg == MSG_KEY3_LONGPRESS_RE){
 535  0149 b600          	ld	a,L3_Key_Msg
 536  014b a104          	cp	a,#4
 537  014d 2706          	jreq	L741
 539  014f b600          	ld	a,L3_Key_Msg
 540  0151 a10c          	cp	a,#12
 541  0153 2602          	jrne	L541
 542  0155               L741:
 543                     ; 115 		Pushrod[PUSHROD_B].ReverseFlag = FALSE;
 545  0155 3f1d          	clr	L5_Pushrod+5
 546  0157               L541:
 547                     ; 122 	if(Rev_Msg.PushRod_Sta == PUSHROD_STOP || Rev_Msg.PushRod_Sta == PUSHROD_A_STOP ||Rev_Msg.PushRod_Sta == PUSHROD_B_STOP){
 549  0157 3d14          	tnz	L7_Rev_Msg+2
 550  0159 270c          	jreq	L351
 552  015b b614          	ld	a,L7_Rev_Msg+2
 553  015d a103          	cp	a,#3
 554  015f 2706          	jreq	L351
 556  0161 b614          	ld	a,L7_Rev_Msg+2
 557  0163 a106          	cp	a,#6
 558  0165 2623          	jrne	L151
 559  0167               L351:
 560                     ; 123 		Pushrod_APP_Handle(&Pushrod[PUSHROD_A], PUSH_STOP);
 562  0167 4b00          	push	#0
 563  0169 ae0018        	ldw	x,#L5_Pushrod
 564  016c cd0000        	call	_Pushrod_APP_Handle
 566  016f 84            	pop	a
 567                     ; 125 		Pushrod_APP_Handle(&Pushrod[PUSHROD_B], PUSH_STOP);
 569  0170 4b00          	push	#0
 570  0172 ae001c        	ldw	x,#L5_Pushrod+4
 571  0175 cd0000        	call	_Pushrod_APP_Handle
 573  0178 84            	pop	a
 575  0179               L751:
 576                     ; 149 	if(Rev_Msg.Cool_Heat_Sta == CH_A_OFF){
 578  0179 3d13          	tnz	L7_Rev_Msg+1
 579  017b 2665          	jrne	L102
 580                     ; 150 		CH_Handle(&CH_Para[CH_A],CH_STOP_MODE);
 582  017d 4b00          	push	#0
 583  017f ae000f        	ldw	x,#L11_CH_Para
 584  0182 cd0000        	call	_CH_Handle
 586  0185 84            	pop	a
 588  0186 ac350235      	jpf	L302
 589  018a               L151:
 590                     ; 127 	}else if(Rev_Msg.PushRod_Sta == PUSHROD_A_OPEN){
 592  018a b614          	ld	a,L7_Rev_Msg+2
 593  018c a101          	cp	a,#1
 594  018e 260b          	jrne	L161
 595                     ; 128 		Pushrod_APP_Handle(&Pushrod[PUSHROD_A], PUSH_OPEN);
 597  0190 4b01          	push	#1
 598  0192 ae0018        	ldw	x,#L5_Pushrod
 599  0195 cd0000        	call	_Pushrod_APP_Handle
 601  0198 84            	pop	a
 603  0199 20de          	jra	L751
 604  019b               L161:
 605                     ; 129 	}else if(Rev_Msg.PushRod_Sta == PUSHROD_A_CLOSE){
 607  019b b614          	ld	a,L7_Rev_Msg+2
 608  019d a102          	cp	a,#2
 609  019f 260b          	jrne	L561
 610                     ; 130 		Pushrod_APP_Handle(&Pushrod[PUSHROD_A], PUSH_CLOSE);
 612  01a1 4b02          	push	#2
 613  01a3 ae0018        	ldw	x,#L5_Pushrod
 614  01a6 cd0000        	call	_Pushrod_APP_Handle
 616  01a9 84            	pop	a
 618  01aa 20cd          	jra	L751
 619  01ac               L561:
 620                     ; 133 	else if(Rev_Msg.PushRod_Sta == PUSHROD_B_OPEN){
 622  01ac b614          	ld	a,L7_Rev_Msg+2
 623  01ae a104          	cp	a,#4
 624  01b0 260b          	jrne	L171
 625                     ; 134 		Pushrod_APP_Handle(&Pushrod[PUSHROD_B], PUSH_OPEN);
 627  01b2 4b01          	push	#1
 628  01b4 ae001c        	ldw	x,#L5_Pushrod+4
 629  01b7 cd0000        	call	_Pushrod_APP_Handle
 631  01ba 84            	pop	a
 633  01bb 20bc          	jra	L751
 634  01bd               L171:
 635                     ; 135 	}else if(Rev_Msg.PushRod_Sta == PUSHROD_B_CLOSE){
 637  01bd b614          	ld	a,L7_Rev_Msg+2
 638  01bf a105          	cp	a,#5
 639  01c1 260b          	jrne	L571
 640                     ; 136 		Pushrod_APP_Handle(&Pushrod[PUSHROD_B], PUSH_CLOSE);
 642  01c3 4b02          	push	#2
 643  01c5 ae001c        	ldw	x,#L5_Pushrod+4
 644  01c8 cd0000        	call	_Pushrod_APP_Handle
 646  01cb 84            	pop	a
 648  01cc 20ab          	jra	L751
 649  01ce               L571:
 650                     ; 140 		Pushrod_APP_Handle(&Pushrod[PUSHROD_A], PUSH_STOP);
 652  01ce 4b00          	push	#0
 653  01d0 ae0018        	ldw	x,#L5_Pushrod
 654  01d3 cd0000        	call	_Pushrod_APP_Handle
 656  01d6 84            	pop	a
 657                     ; 142 		Pushrod_APP_Handle(&Pushrod[PUSHROD_B], PUSH_STOP);
 659  01d7 4b00          	push	#0
 660  01d9 ae001c        	ldw	x,#L5_Pushrod+4
 661  01dc cd0000        	call	_Pushrod_APP_Handle
 663  01df 84            	pop	a
 664  01e0 2097          	jra	L751
 665  01e2               L102:
 666                     ; 151 	}else if(Rev_Msg.Cool_Heat_Sta == CH_A_COOL){
 668  01e2 b613          	ld	a,L7_Rev_Msg+1
 669  01e4 a101          	cp	a,#1
 670  01e6 261f          	jrne	L502
 671                     ; 152 		if(Pushrod_GetStatus(&Pushrod[PUSHROD_A])){
 673  01e8 ae0018        	ldw	x,#L5_Pushrod
 674  01eb cd0000        	call	_Pushrod_GetStatus
 676  01ee 4d            	tnz	a
 677  01ef 270b          	jreq	L702
 678                     ; 153 			CH_Cool_Heat_Moudle_Set(&CH_Para[CH_A],0);
 680  01f1 4b00          	push	#0
 681  01f3 ae000f        	ldw	x,#L11_CH_Para
 682  01f6 cd0000        	call	_CH_Cool_Heat_Moudle_Set
 684  01f9 84            	pop	a
 686  01fa 2039          	jra	L302
 687  01fc               L702:
 688                     ; 155 			CH_Handle(&CH_Para[CH_A],CH_COOL_MODE);
 690  01fc 4b01          	push	#1
 691  01fe ae000f        	ldw	x,#L11_CH_Para
 692  0201 cd0000        	call	_CH_Handle
 694  0204 84            	pop	a
 695  0205 202e          	jra	L302
 696  0207               L502:
 697                     ; 157 	}else if(Rev_Msg.Cool_Heat_Sta == CH_A_HEAT){
 699  0207 b613          	ld	a,L7_Rev_Msg+1
 700  0209 a102          	cp	a,#2
 701  020b 261f          	jrne	L512
 702                     ; 158 		if(Pushrod_GetStatus(&Pushrod[PUSHROD_A])){
 704  020d ae0018        	ldw	x,#L5_Pushrod
 705  0210 cd0000        	call	_Pushrod_GetStatus
 707  0213 4d            	tnz	a
 708  0214 270b          	jreq	L712
 709                     ; 159 			CH_Cool_Heat_Moudle_Set(&CH_Para[CH_A],0);
 711  0216 4b00          	push	#0
 712  0218 ae000f        	ldw	x,#L11_CH_Para
 713  021b cd0000        	call	_CH_Cool_Heat_Moudle_Set
 715  021e 84            	pop	a
 717  021f 2014          	jra	L302
 718  0221               L712:
 719                     ; 161 			CH_Handle(&CH_Para[CH_A],CH_HEAT_MODE);
 721  0221 4b02          	push	#2
 722  0223 ae000f        	ldw	x,#L11_CH_Para
 723  0226 cd0000        	call	_CH_Handle
 725  0229 84            	pop	a
 726  022a 2009          	jra	L302
 727  022c               L512:
 728                     ; 164 		CH_Handle(&CH_Para[CH_A],CH_STOP_MODE);
 730  022c 4b00          	push	#0
 731  022e ae000f        	ldw	x,#L11_CH_Para
 732  0231 cd0000        	call	_CH_Handle
 734  0234 84            	pop	a
 735  0235               L302:
 736                     ; 169 	if(Rev_Msg.Foot_Led_Sta == FOOT_LED_OFF){
 738  0235 3d12          	tnz	L7_Rev_Msg
 739  0237 2614          	jrne	L522
 740                     ; 170 		Foot_Led_Set(0);
 742  0239 4b04          	push	#4
 743  023b ae500f        	ldw	x,#20495
 744  023e cd0000        	call	_GPIO_WriteLow
 746  0241 84            	pop	a
 747                     ; 171 		Sub_Led_Set(0);
 749  0242 4b04          	push	#4
 750  0244 ae5000        	ldw	x,#20480
 751  0247 cd0000        	call	_GPIO_WriteLow
 753  024a 84            	pop	a
 755  024b 2012          	jra	L722
 756  024d               L522:
 757                     ; 173 		Foot_Led_Set(1);
 759  024d 4b04          	push	#4
 760  024f ae500f        	ldw	x,#20495
 761  0252 cd0000        	call	_GPIO_WriteHigh
 763  0255 84            	pop	a
 764                     ; 174 		Sub_Led_Set(1);
 766  0256 4b04          	push	#4
 767  0258 ae5000        	ldw	x,#20480
 768  025b cd0000        	call	_GPIO_WriteHigh
 770  025e 84            	pop	a
 771  025f               L722:
 772                     ; 179 	if(Rev_Msg.ucWarn_Cloth_Sta == WARM_ON){
 774  025f b616          	ld	a,L7_Rev_Msg+4
 775  0261 a101          	cp	a,#1
 776  0263 260b          	jrne	L132
 777                     ; 180 		sys_FAN_LED_SET(1);
 779  0265 4b08          	push	#8
 780  0267 ae500f        	ldw	x,#20495
 781  026a cd0000        	call	_GPIO_WriteHigh
 783  026d 84            	pop	a
 785  026e 200d          	jra	L332
 786  0270               L132:
 787                     ; 181 	}else if(Rev_Msg.ucWarn_Cloth_Sta == WARM_OFF){
 789  0270 3d16          	tnz	L7_Rev_Msg+4
 790  0272 2609          	jrne	L332
 791                     ; 182 		sys_FAN_LED_SET(0);
 793  0274 4b08          	push	#8
 794  0276 ae500f        	ldw	x,#20495
 795  0279 cd0000        	call	_GPIO_WriteLow
 797  027c 84            	pop	a
 798  027d               L332:
 799                     ; 187 	if(Rev_Msg.ucMass_Sta == MASS_ON){
 801  027d b617          	ld	a,L7_Rev_Msg+5
 802  027f a101          	cp	a,#1
 803  0281 2605          	jrne	L732
 804                     ; 188 		Mass_Handle();
 806  0283 cd0000        	call	_Mass_Handle
 809  0286 2007          	jra	L142
 810  0288               L732:
 811                     ; 189 	}else if(Rev_Msg.ucMass_Sta == MASS_OFF){
 813  0288 3d17          	tnz	L7_Rev_Msg+5
 814  028a 2603          	jrne	L142
 815                     ; 190 		Mass_Deinit();
 817  028c cd0000        	call	_Mass_Deinit
 819  028f               L142:
 820                     ; 196 	if(Serial_Get_Status()){
 822  028f cd0000        	call	_Serial_Get_Status
 824  0292 4d            	tnz	a
 825  0293 2603          	jrne	L42
 826  0295 cc0362        	jp	L542
 827  0298               L42:
 828                     ; 197 		unsigned int Rev_Data = 0;
 830  0298 5f            	clrw	x
 831  0299 1f01          	ldw	(OFST-1,sp),x
 832                     ; 198 		TimeOut_Record(&Timeout, COMMU_TIMEOUT_VALUE);
 834  029b ae1388        	ldw	x,#5000
 835  029e 89            	pushw	x
 836  029f ae0000        	ldw	x,#0
 837  02a2 89            	pushw	x
 838  02a3 ae0007        	ldw	x,#L31_Timeout
 839  02a6 cd0000        	call	_TimeOut_Record
 841  02a9 5b04          	addw	sp,#4
 842                     ; 200 		if(Rev_Para.Data_Format.MessageID != NUM1){
 844  02ab b601          	ld	a,_Rev_Para+1
 845  02ad a101          	cp	a,#1
 846                     ; 206 		if(Rev_Para.Data_Format.Checksum != (unsigned char)(Rev_Para.Data_Format.MessageID + Rev_Para.Data_Format.Cont2+ 
 846                     ; 207 			Rev_Para.Data_Format.Start + Rev_Para.Data_Format.Cont1)){
 848  02af b601          	ld	a,_Rev_Para+1
 849  02b1 bb03          	add	a,_Rev_Para+3
 850  02b3 bb00          	add	a,_Rev_Para
 851  02b5 bb02          	add	a,_Rev_Para+2
 852  02b7 b104          	cp	a,_Rev_Para+4
 853                     ; 214 		Rev_Data = Get_32bit(Rev_Para.Data_Format.Cont1, Rev_Para.Data_Format.Cont2);
 855  02b9 b602          	ld	a,_Rev_Para+2
 856  02bb 5f            	clrw	x
 857  02bc 97            	ld	xl,a
 858  02bd 4f            	clr	a
 859  02be 02            	rlwa	x,a
 860  02bf 01            	rrwa	x,a
 861  02c0 ba03          	or	a,_Rev_Para+3
 862  02c2 02            	rlwa	x,a
 863  02c3 1f01          	ldw	(OFST-1,sp),x
 864  02c5 01            	rrwa	x,a
 865                     ; 215 		if(Rev_Data & CONT_LED_ON){
 867  02c6 7b02          	ld	a,(OFST+0,sp)
 868  02c8 a501          	bcp	a,#1
 869  02ca 2706          	jreq	L352
 870                     ; 216 			Rev_Msg.Foot_Led_Sta = FOOT_LED_ON;
 872  02cc 35010012      	mov	L7_Rev_Msg,#1
 874  02d0 2008          	jra	L552
 875  02d2               L352:
 876                     ; 217 		}else if(Rev_Data & CONT_LED_OFF){
 878  02d2 7b02          	ld	a,(OFST+0,sp)
 879  02d4 a502          	bcp	a,#2
 880  02d6 2702          	jreq	L552
 881                     ; 218 			Rev_Msg.Foot_Led_Sta = FOOT_LED_OFF;
 883  02d8 3f12          	clr	L7_Rev_Msg
 884  02da               L552:
 885                     ; 220 		if(Rev_Data & CONT_CH_A_OFF){
 887  02da 7b02          	ld	a,(OFST+0,sp)
 888  02dc a504          	bcp	a,#4
 889  02de 2704          	jreq	L162
 890                     ; 221 			Rev_Msg.Cool_Heat_Sta = CH_A_OFF;
 892  02e0 3f13          	clr	L7_Rev_Msg+1
 894  02e2 2016          	jra	L362
 895  02e4               L162:
 896                     ; 222 		}else if(Rev_Data & CONT_CH_A_COOL){
 898  02e4 7b02          	ld	a,(OFST+0,sp)
 899  02e6 a508          	bcp	a,#8
 900  02e8 2706          	jreq	L562
 901                     ; 223 			Rev_Msg.Cool_Heat_Sta = CH_A_COOL;
 903  02ea 35010013      	mov	L7_Rev_Msg+1,#1
 905  02ee 200a          	jra	L362
 906  02f0               L562:
 907                     ; 224 		}else if(Rev_Data & CONT_CH_A_HEAT){
 909  02f0 7b02          	ld	a,(OFST+0,sp)
 910  02f2 a510          	bcp	a,#16
 911  02f4 2704          	jreq	L362
 912                     ; 225 			Rev_Msg.Cool_Heat_Sta = CH_A_HEAT;
 914  02f6 35020013      	mov	L7_Rev_Msg+1,#2
 915  02fa               L362:
 916                     ; 227 		if(Rev_Data & CONT_PUSHROD_STOP){
 918  02fa 7b02          	ld	a,(OFST+0,sp)
 919  02fc a520          	bcp	a,#32
 920  02fe 2704          	jreq	L372
 921                     ; 228 			Rev_Msg.PushRod_Sta = PUSHROD_STOP;
 923  0300 3f14          	clr	L7_Rev_Msg+2
 925  0302 202e          	jra	L572
 926  0304               L372:
 927                     ; 229 		}else if(Rev_Data & CONT_PUSHROD_A_OPEN){
 929  0304 7b02          	ld	a,(OFST+0,sp)
 930  0306 a540          	bcp	a,#64
 931  0308 2706          	jreq	L772
 932                     ; 230 			Rev_Msg.PushRod_Sta = PUSHROD_A_OPEN;
 934  030a 35010014      	mov	L7_Rev_Msg+2,#1
 936  030e 2022          	jra	L572
 937  0310               L772:
 938                     ; 231 		}else if(Rev_Data & CONT_PUSHROD_A_CLOSE){
 940  0310 7b02          	ld	a,(OFST+0,sp)
 941  0312 a580          	bcp	a,#128
 942  0314 2706          	jreq	L303
 943                     ; 232 			Rev_Msg.PushRod_Sta = PUSHROD_A_CLOSE;
 945  0316 35020014      	mov	L7_Rev_Msg+2,#2
 947  031a 2016          	jra	L572
 948  031c               L303:
 949                     ; 233 		}else if(Rev_Data & CONT_PUSHROD_B_OPEN){
 951  031c 7b01          	ld	a,(OFST-1,sp)
 952  031e a502          	bcp	a,#2
 953  0320 2706          	jreq	L703
 954                     ; 234 			Rev_Msg.PushRod_Sta = PUSHROD_B_OPEN;
 956  0322 35040014      	mov	L7_Rev_Msg+2,#4
 958  0326 200a          	jra	L572
 959  0328               L703:
 960                     ; 235 		}else if(Rev_Data & CONT_PUSHROD_B_CLOSE){
 962  0328 7b01          	ld	a,(OFST-1,sp)
 963  032a a504          	bcp	a,#4
 964  032c 2704          	jreq	L572
 965                     ; 236 			Rev_Msg.PushRod_Sta = PUSHROD_B_CLOSE;
 967  032e 35050014      	mov	L7_Rev_Msg+2,#5
 968  0332               L572:
 969                     ; 239 		if(Rev_Data & CONT_MASS_ON){
 971  0332 7b01          	ld	a,(OFST-1,sp)
 972  0334 a510          	bcp	a,#16
 973  0336 2706          	jreq	L513
 974                     ; 240 			Rev_Msg.ucMass_Sta = MASS_ON;
 976  0338 35010017      	mov	L7_Rev_Msg+5,#1
 978  033c 2008          	jra	L713
 979  033e               L513:
 980                     ; 241 		}else if(Rev_Data & CONT_MASS_OFF){
 982  033e 7b01          	ld	a,(OFST-1,sp)
 983  0340 a520          	bcp	a,#32
 984  0342 2702          	jreq	L713
 985                     ; 242 			Rev_Msg.ucMass_Sta = MASS_OFF;
 987  0344 3f17          	clr	L7_Rev_Msg+5
 988  0346               L713:
 989                     ; 245 		if(Rev_Data & CONT_WARM_CLOTH_ON){
 991  0346 7b01          	ld	a,(OFST-1,sp)
 992  0348 a540          	bcp	a,#64
 993  034a 2706          	jreq	L323
 994                     ; 246 			Rev_Msg.ucWarn_Cloth_Sta = WARM_ON;
 996  034c 35010016      	mov	L7_Rev_Msg+4,#1
 998  0350 2008          	jra	L523
 999  0352               L323:
1000                     ; 247 		}else if(Rev_Data & CONT_WARM_CLOTH_OFF){
1002  0352 7b01          	ld	a,(OFST-1,sp)
1003  0354 a580          	bcp	a,#128
1004  0356 2702          	jreq	L523
1005                     ; 248 			Rev_Msg.ucWarn_Cloth_Sta = WARM_OFF;
1007  0358 3f16          	clr	L7_Rev_Msg+4
1008  035a               L523:
1009                     ; 251 		memset(Rev_Para.Buf,0,sizeof(Rev_Para.Buf));
1011  035a ae0007        	ldw	x,#7
1012  035d               L22:
1013  035d 6fff          	clr	(_Rev_Para-1,x)
1014  035f 5a            	decw	x
1015  0360 26fb          	jrne	L22
1016  0362               L542:
1017                     ; 257 	if(TimeOutDet_Check(&Timeout) && !Serial_Get_Status()){
1019  0362 ae0007        	ldw	x,#L31_Timeout
1020  0365 cd0000        	call	_TimeOutDet_Check
1022  0368 cd0000        	call	c_lrzmp
1024  036b 2704          	jreq	L133
1026  036d cd0000        	call	_Serial_Get_Status
1028  0370 4d            	tnz	a
1029  0371               L133:
1030                     ; 264 }
1033  0371 85            	popw	x
1034  0372 81            	ret
1672                     	switch	.ubsct
1673  0000               _buf:
1674  0000 000000000000  	ds.b	7
1675                     	xdef	_buf
1676  0007               L31_Timeout:
1677  0007 000000000000  	ds.b	8
1678  000f               L11_CH_Para:
1679  000f 000000        	ds.b	3
1680  0012               L7_Rev_Msg:
1681  0012 000000000000  	ds.b	6
1682  0018               L5_Pushrod:
1683  0018 000000000000  	ds.b	8
1684                     	xref.b	_Rev_Para
1685                     	xref	_Mass_Deinit
1686                     	xref	_Mass_Handle
1687                     	xref	_memset
1688                     	xref	_TimeOutDet_Check
1689                     	xref	_TimeOut_Record
1690                     	xref	_TimeOutDet_Init
1691                     	xref	_CH_Cool_Heat_Moudle_Set
1692                     	xref	_CH_Handle
1693                     	xref	_CH_App_Init
1694                     	xref	_Serial_Get_Status
1695                     	xref	_Commu_Init
1696                     	xref	_Pushrod_GetStatus
1697                     	xref	_Pushrod_APP_Handle
1698                     	xref	_Pushrod_APP_Init
1699                     	xref	_KEY_Scan
1700                     	xref	_KEY_Init
1701                     	xdef	_System_Handle
1702                     	xdef	_System_Init
1703                     	xref	_TIM4_ARRPreloadConfig
1704                     	xref	_TIM4_PrescalerConfig
1705                     	xref	_TIM4_UpdateRequestConfig
1706                     	xref	_TIM4_UpdateDisableConfig
1707                     	xref	_TIM4_ITConfig
1708                     	xref	_TIM4_Cmd
1709                     	xref	_TIM4_TimeBaseInit
1710                     	xref	_TIM4_DeInit
1711                     	xref	_IWDG_Enable
1712                     	xref	_IWDG_ReloadCounter
1713                     	xref	_IWDG_SetReload
1714                     	xref	_IWDG_SetPrescaler
1715                     	xref	_IWDG_WriteAccessCmd
1716                     	xref	_GPIO_WriteLow
1717                     	xref	_GPIO_WriteHigh
1718                     	xref	_GPIO_Init
1738                     	xref	c_lrzmp
1739                     	xref	c_imul
1740                     	end
