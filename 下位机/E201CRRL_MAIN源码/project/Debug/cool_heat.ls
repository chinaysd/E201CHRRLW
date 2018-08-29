   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Generator V4.2.4 - 19 Dec 2007
   4                     	xref	_CH_Port_Adc_Init
   5                     	xref	_CH_Port_Init
 108                     ; 21 unsigned char CH_App_Init(CH_PARA_t *p){
 110                     	switch	.text
 111  0000               _CH_App_Init:
 113  0000 89            	pushw	x
 114       00000000      OFST:	set	0
 117                     ; 24 	CH_Port_Init(p->ID);
 119  0001 f6            	ld	a,(x)
 120  0002 cd0000        	call	_CH_Port_Init
 122                     ; 25 	CH_Port_Adc_Init(p->ID);
 124  0005 1e01          	ldw	x,(OFST+1,sp)
 125  0007 f6            	ld	a,(x)
 126  0008 cd0000        	call	_CH_Port_Adc_Init
 128                     ; 26 }
 131  000b 85            	popw	x
 132  000c 81            	ret
 135                     	xref	_Get_Temp
 171                     ; 29 static unsigned int CH_Get_Temp(CH_PARA_t *p){
 172                     	switch	.text
 173  000d               L17_CH_Get_Temp:
 177                     ; 32 	return Get_Temp(p->ID);
 179  000d f6            	ld	a,(x)
 180  000e cd0000        	call	_Get_Temp
 184  0011 81            	ret
 187                     	switch	.ubsct
 188  0000               L511_Flag:
 189  0000 00            	ds.b	1
 248                     ; 36 static unsigned char CH_Stop_Handle(CH_PARA_t *p){
 249                     	switch	.text
 250  0012               L311_CH_Stop_Handle:
 252  0012 89            	pushw	x
 253  0013 89            	pushw	x
 254       00000002      OFST:	set	2
 257                     ; 40 		p->Abnormal_DetFlag = FALSE;
 259  0014 6f02          	clr	(2,x)
 260                     ; 42 	ret = CH_Port_Cool_Set(p->ID, CH_CLOSE) && CH_Port_Heat_Set(p->ID, CH_CLOSE);
 262  0016 5f            	clrw	x
 263  0017 1603          	ldw	y,(OFST+1,sp)
 264  0019 90f6          	ld	a,(y)
 265  001b 95            	ld	xh,a
 266  001c cd0000        	call	_CH_Port_Cool_Set
 268  001f 4d            	tnz	a
 269  0020 2710          	jreq	L21
 270  0022 5f            	clrw	x
 271  0023 1603          	ldw	y,(OFST+1,sp)
 272  0025 90f6          	ld	a,(y)
 273  0027 95            	ld	xh,a
 274  0028 cd0000        	call	_CH_Port_Heat_Set
 276  002b 4d            	tnz	a
 277  002c 2704          	jreq	L21
 278  002e a601          	ld	a,#1
 279  0030 2001          	jra	L41
 280  0032               L21:
 281  0032 4f            	clr	a
 282  0033               L41:
 283  0033 6b02          	ld	(OFST+0,sp),a
 284                     ; 44 	if(p->Status != CH_STOP_MODE){
 286  0035 1e03          	ldw	x,(OFST+1,sp)
 287  0037 6d01          	tnz	(1,x)
 288  0039 2706          	jreq	L741
 289                     ; 45 		p->Status = CH_STOP_MODE;
 291  003b 1e03          	ldw	x,(OFST+1,sp)
 292  003d 6f01          	clr	(1,x)
 293                     ; 46 		Flag = 0;
 295  003f 3f00          	clr	L511_Flag
 296  0041               L741:
 297                     ; 49 	if(Flag == 0){
 299  0041 3d00          	tnz	L511_Flag
 300  0043 2627          	jrne	L151
 301                     ; 50 		Flag = 1;
 303  0045 35010000      	mov	L511_Flag,#1
 304                     ; 51 		TimeOut_Record(&CH_Stop_Timer[p->ID -1], CH_STOP_TIME);
 306  0049 ae3a98        	ldw	x,#15000
 307  004c 89            	pushw	x
 308  004d ae0000        	ldw	x,#0
 309  0050 89            	pushw	x
 310  0051 a637          	ld	a,#L3_CH_Stop_Timer
 311  0053 6b05          	ld	(OFST+3,sp),a
 312  0055 1e07          	ldw	x,(OFST+5,sp)
 313  0057 f6            	ld	a,(x)
 314  0058 97            	ld	xl,a
 315  0059 a608          	ld	a,#8
 316  005b 42            	mul	x,a
 317  005c 1d0008        	subw	x,#8
 318  005f 01            	rrwa	x,a
 319  0060 1b05          	add	a,(OFST+3,sp)
 320  0062 2401          	jrnc	L61
 321  0064 5c            	incw	x
 322  0065               L61:
 323  0065 5f            	clrw	x
 324  0066 97            	ld	xl,a
 325  0067 cd0000        	call	_TimeOut_Record
 327  006a 5b04          	addw	sp,#4
 328  006c               L151:
 329                     ; 54 	if(TimeOutDet_Check(&CH_Stop_Timer[p->ID -1])){
 331  006c a637          	ld	a,#L3_CH_Stop_Timer
 332  006e 6b01          	ld	(OFST-1,sp),a
 333  0070 1e03          	ldw	x,(OFST+1,sp)
 334  0072 f6            	ld	a,(x)
 335  0073 97            	ld	xl,a
 336  0074 a608          	ld	a,#8
 337  0076 42            	mul	x,a
 338  0077 1d0008        	subw	x,#8
 339  007a 01            	rrwa	x,a
 340  007b 1b01          	add	a,(OFST-1,sp)
 341  007d 2401          	jrnc	L02
 342  007f 5c            	incw	x
 343  0080               L02:
 344  0080 5f            	clrw	x
 345  0081 97            	ld	xl,a
 346  0082 cd0000        	call	_TimeOutDet_Check
 348  0085 cd0000        	call	c_lrzmp
 350  0088 270d          	jreq	L351
 351                     ; 55 		ret &= CH_Port_Fan_Set(p->ID, CH_CLOSE);
 353  008a 5f            	clrw	x
 354  008b 1603          	ldw	y,(OFST+1,sp)
 355  008d 90f6          	ld	a,(y)
 356  008f 95            	ld	xh,a
 357  0090 cd0000        	call	_CH_Port_Fan_Set
 359  0093 1402          	and	a,(OFST+0,sp)
 360  0095 6b02          	ld	(OFST+0,sp),a
 361  0097               L351:
 362                     ; 58 	return ret;
 364  0097 7b02          	ld	a,(OFST+0,sp)
 367  0099 5b04          	addw	sp,#4
 368  009b 81            	ret
 371                     	switch	.ubsct
 372  0001               L751_Flag:
 373  0001 00            	ds.b	1
 432                     ; 65 static unsigned char CH_Cool_Handle(CH_PARA_t *p){
 433                     	switch	.text
 434  009c               L551_CH_Cool_Handle:
 436  009c 89            	pushw	x
 437  009d 89            	pushw	x
 438       00000002      OFST:	set	2
 441                     ; 69 		p->Abnormal_DetFlag = FALSE;
 443  009e 6f02          	clr	(2,x)
 444                     ; 71 	ret = CH_Port_Fan_Set(p->ID, CH_OPEN);
 446  00a0 ae0001        	ldw	x,#1
 447  00a3 1603          	ldw	y,(OFST+1,sp)
 448  00a5 90f6          	ld	a,(y)
 449  00a7 95            	ld	xh,a
 450  00a8 cd0000        	call	_CH_Port_Fan_Set
 452  00ab 6b02          	ld	(OFST+0,sp),a
 453                     ; 73 	if(p->Status != CH_COOL_MODE){
 455  00ad 1e03          	ldw	x,(OFST+1,sp)
 456  00af e601          	ld	a,(1,x)
 457  00b1 a101          	cp	a,#1
 458  00b3 2708          	jreq	L112
 459                     ; 74 		p->Status = CH_COOL_MODE;
 461  00b5 1e03          	ldw	x,(OFST+1,sp)
 462  00b7 a601          	ld	a,#1
 463  00b9 e701          	ld	(1,x),a
 464                     ; 75 		Flag = 0;
 466  00bb 3f01          	clr	L751_Flag
 467  00bd               L112:
 468                     ; 78 	if(Flag == 0){
 470  00bd 3d01          	tnz	L751_Flag
 471  00bf 2639          	jrne	L312
 472                     ; 79 		Flag = 1;
 474  00c1 35010001      	mov	L751_Flag,#1
 475                     ; 80 		TimeOut_Record(&CH_Cool_Timer[p->ID -1], CH_START_TIME);
 477  00c5 ae2710        	ldw	x,#10000
 478  00c8 89            	pushw	x
 479  00c9 ae0000        	ldw	x,#0
 480  00cc 89            	pushw	x
 481  00cd a62f          	ld	a,#L5_CH_Cool_Timer
 482  00cf 6b05          	ld	(OFST+3,sp),a
 483  00d1 1e07          	ldw	x,(OFST+5,sp)
 484  00d3 f6            	ld	a,(x)
 485  00d4 97            	ld	xl,a
 486  00d5 a608          	ld	a,#8
 487  00d7 42            	mul	x,a
 488  00d8 1d0008        	subw	x,#8
 489  00db 01            	rrwa	x,a
 490  00dc 1b05          	add	a,(OFST+3,sp)
 491  00de 2401          	jrnc	L42
 492  00e0 5c            	incw	x
 493  00e1               L42:
 494  00e1 5f            	clrw	x
 495  00e2 97            	ld	xl,a
 496  00e3 cd0000        	call	_TimeOut_Record
 498  00e6 5b04          	addw	sp,#4
 499                     ; 81 		CH_Port_Cool_Set(p->ID, CH_CLOSE);		// first close module
 501  00e8 5f            	clrw	x
 502  00e9 1603          	ldw	y,(OFST+1,sp)
 503  00eb 90f6          	ld	a,(y)
 504  00ed 95            	ld	xh,a
 505  00ee cd0000        	call	_CH_Port_Cool_Set
 507                     ; 82 		CH_Port_Heat_Set(p->ID, CH_CLOSE);
 509  00f1 5f            	clrw	x
 510  00f2 1603          	ldw	y,(OFST+1,sp)
 511  00f4 90f6          	ld	a,(y)
 512  00f6 95            	ld	xh,a
 513  00f7 cd0000        	call	_CH_Port_Heat_Set
 515  00fa               L312:
 516                     ; 85 	if(TimeOutDet_Check(&CH_Cool_Timer[p->ID -1])){
 518  00fa a62f          	ld	a,#L5_CH_Cool_Timer
 519  00fc 6b01          	ld	(OFST-1,sp),a
 520  00fe 1e03          	ldw	x,(OFST+1,sp)
 521  0100 f6            	ld	a,(x)
 522  0101 97            	ld	xl,a
 523  0102 a608          	ld	a,#8
 524  0104 42            	mul	x,a
 525  0105 1d0008        	subw	x,#8
 526  0108 01            	rrwa	x,a
 527  0109 1b01          	add	a,(OFST-1,sp)
 528  010b 2401          	jrnc	L62
 529  010d 5c            	incw	x
 530  010e               L62:
 531  010e 5f            	clrw	x
 532  010f 97            	ld	xl,a
 533  0110 cd0000        	call	_TimeOutDet_Check
 535  0113 cd0000        	call	c_lrzmp
 537  0116 271e          	jreq	L512
 538                     ; 86 		ret &= CH_Port_Cool_Set(p->ID, CH_OPEN);	// delay to complete
 540  0118 ae0001        	ldw	x,#1
 541  011b 1603          	ldw	y,(OFST+1,sp)
 542  011d 90f6          	ld	a,(y)
 543  011f 95            	ld	xh,a
 544  0120 cd0000        	call	_CH_Port_Cool_Set
 546  0123 1402          	and	a,(OFST+0,sp)
 547  0125 6b02          	ld	(OFST+0,sp),a
 548                     ; 87 		ret &= CH_Port_Heat_Set(p->ID, CH_OPEN);
 550  0127 ae0001        	ldw	x,#1
 551  012a 1603          	ldw	y,(OFST+1,sp)
 552  012c 90f6          	ld	a,(y)
 553  012e 95            	ld	xh,a
 554  012f cd0000        	call	_CH_Port_Heat_Set
 556  0132 1402          	and	a,(OFST+0,sp)
 557  0134 6b02          	ld	(OFST+0,sp),a
 558  0136               L512:
 559                     ; 90 	return ret;
 561  0136 7b02          	ld	a,(OFST+0,sp)
 564  0138 5b04          	addw	sp,#4
 565  013a 81            	ret
 568                     	bsct
 569  0000               L522_num:
 570  0000 0000          	dc.w	0
 571                     	switch	.ubsct
 572  0002               L122_Flag:
 573  0002 00            	ds.b	1
 574  0003               L332_SoftwareDelay:
 575  0003 000000000000  	ds.b	16
 576  0013               L132_Flag2:
 577  0013 0000          	ds.b	2
 578  0015               L722_Flag1:
 579  0015 0000          	ds.b	2
 710                     ; 95 static unsigned char CH_Heat_Handle(CH_PARA_t *p){
 711                     	switch	.text
 712  013b               L712_CH_Heat_Handle:
 714  013b 89            	pushw	x
 715  013c 5205          	subw	sp,#5
 716       00000005      OFST:	set	5
 719                     ; 97 	unsigned int ret = 0,temp = 0;
 721  013e 1e02          	ldw	x,(OFST-3,sp)
 724  0140 1e04          	ldw	x,(OFST-1,sp)
 725                     ; 98 	ret = CH_Port_Fan_Set(p->ID, CH_OPEN);
 727  0142 ae0001        	ldw	x,#1
 728  0145 1606          	ldw	y,(OFST+1,sp)
 729  0147 90f6          	ld	a,(y)
 730  0149 95            	ld	xh,a
 731  014a cd0000        	call	_CH_Port_Fan_Set
 733  014d 5f            	clrw	x
 734  014e 97            	ld	xl,a
 735  014f 1f02          	ldw	(OFST-3,sp),x
 736                     ; 100 	if(p->Status != CH_HEAT_MODE){
 738  0151 1e06          	ldw	x,(OFST+1,sp)
 739  0153 e601          	ld	a,(1,x)
 740  0155 a102          	cp	a,#2
 741  0157 2708          	jreq	L133
 742                     ; 101 		p->Status = CH_HEAT_MODE;
 744  0159 1e06          	ldw	x,(OFST+1,sp)
 745  015b a602          	ld	a,#2
 746  015d e701          	ld	(1,x),a
 747                     ; 102 		Flag = 0;
 749  015f 3f02          	clr	L122_Flag
 750  0161               L133:
 751                     ; 105 	if(Flag == 0){
 753  0161 3d02          	tnz	L122_Flag
 754  0163 2639          	jrne	L333
 755                     ; 106 		Flag = 1;
 757  0165 35010002      	mov	L122_Flag,#1
 758                     ; 107 		TimeOut_Record(&CH_Heat_Timer[p->ID -1], CH_START_TIME);
 760  0169 ae2710        	ldw	x,#10000
 761  016c 89            	pushw	x
 762  016d ae0000        	ldw	x,#0
 763  0170 89            	pushw	x
 764  0171 a627          	ld	a,#L7_CH_Heat_Timer
 765  0173 6b05          	ld	(OFST+0,sp),a
 766  0175 1e0a          	ldw	x,(OFST+5,sp)
 767  0177 f6            	ld	a,(x)
 768  0178 97            	ld	xl,a
 769  0179 a608          	ld	a,#8
 770  017b 42            	mul	x,a
 771  017c 1d0008        	subw	x,#8
 772  017f 01            	rrwa	x,a
 773  0180 1b05          	add	a,(OFST+0,sp)
 774  0182 2401          	jrnc	L23
 775  0184 5c            	incw	x
 776  0185               L23:
 777  0185 5f            	clrw	x
 778  0186 97            	ld	xl,a
 779  0187 cd0000        	call	_TimeOut_Record
 781  018a 5b04          	addw	sp,#4
 782                     ; 108 		CH_Port_Cool_Set(p->ID, CH_CLOSE);		// first close module
 784  018c 5f            	clrw	x
 785  018d 1606          	ldw	y,(OFST+1,sp)
 786  018f 90f6          	ld	a,(y)
 787  0191 95            	ld	xh,a
 788  0192 cd0000        	call	_CH_Port_Cool_Set
 790                     ; 109 		CH_Port_Heat_Set(p->ID, CH_CLOSE);
 792  0195 5f            	clrw	x
 793  0196 1606          	ldw	y,(OFST+1,sp)
 794  0198 90f6          	ld	a,(y)
 795  019a 95            	ld	xh,a
 796  019b cd0000        	call	_CH_Port_Heat_Set
 798  019e               L333:
 799                     ; 112 	if(TimeOutDet_Check(&CH_Heat_Timer[p->ID -1])){
 801  019e a627          	ld	a,#L7_CH_Heat_Timer
 802  01a0 6b01          	ld	(OFST-4,sp),a
 803  01a2 1e06          	ldw	x,(OFST+1,sp)
 804  01a4 f6            	ld	a,(x)
 805  01a5 97            	ld	xl,a
 806  01a6 a608          	ld	a,#8
 807  01a8 42            	mul	x,a
 808  01a9 1d0008        	subw	x,#8
 809  01ac 01            	rrwa	x,a
 810  01ad 1b01          	add	a,(OFST-4,sp)
 811  01af 2401          	jrnc	L43
 812  01b1 5c            	incw	x
 813  01b2               L43:
 814  01b2 5f            	clrw	x
 815  01b3 97            	ld	xl,a
 816  01b4 cd0000        	call	_TimeOutDet_Check
 818  01b7 cd0000        	call	c_lrzmp
 820  01ba 2603          	jrne	L64
 821  01bc cc02f7        	jp	L533
 822  01bf               L64:
 823                     ; 113 		temp = CH_Get_Temp(p);		// cyclic heat
 825  01bf 1e06          	ldw	x,(OFST+1,sp)
 826  01c1 cd000d        	call	L17_CH_Get_Temp
 828  01c4 1f04          	ldw	(OFST-1,sp),x
 829                     ; 115 		if(temp == 0 || temp == 1023){
 831  01c6 1e04          	ldw	x,(OFST-1,sp)
 832  01c8 2707          	jreq	L143
 834  01ca 1e04          	ldw	x,(OFST-1,sp)
 835  01cc a303ff        	cpw	x,#1023
 836  01cf 2648          	jrne	L733
 837  01d1               L143:
 838                     ; 116 			if(p->Abnormal_DetFlag == FALSE){
 840  01d1 1e06          	ldw	x,(OFST+1,sp)
 841  01d3 6d02          	tnz	(2,x)
 842  01d5 2642          	jrne	L733
 843                     ; 117 				p->Abnormal_DetFlag = TRUE;
 845  01d7 1e06          	ldw	x,(OFST+1,sp)
 846  01d9 a601          	ld	a,#1
 847  01db e702          	ld	(2,x),a
 848                     ; 118 				TimeOut_restart(&CH_Heat_Abnormal_Timer[p->ID -1]);
 850  01dd a61f          	ld	a,#L11_CH_Heat_Abnormal_Timer
 851  01df 6b01          	ld	(OFST-4,sp),a
 852  01e1 1e06          	ldw	x,(OFST+1,sp)
 853  01e3 f6            	ld	a,(x)
 854  01e4 97            	ld	xl,a
 855  01e5 a608          	ld	a,#8
 856  01e7 42            	mul	x,a
 857  01e8 1d0008        	subw	x,#8
 858  01eb 01            	rrwa	x,a
 859  01ec 1b01          	add	a,(OFST-4,sp)
 860  01ee 2401          	jrnc	L63
 861  01f0 5c            	incw	x
 862  01f1               L63:
 863  01f1 5f            	clrw	x
 864  01f2 97            	ld	xl,a
 865  01f3 cd0000        	call	_TimeOut_restart
 867                     ; 119 				TimeOut_Record(&CH_Heat_Abnormal_Timer[p->ID -1], CH_ABNORMAL_TIME);
 869  01f6 ae0bb8        	ldw	x,#3000
 870  01f9 89            	pushw	x
 871  01fa ae0000        	ldw	x,#0
 872  01fd 89            	pushw	x
 873  01fe a61f          	ld	a,#L11_CH_Heat_Abnormal_Timer
 874  0200 6b05          	ld	(OFST+0,sp),a
 875  0202 1e0a          	ldw	x,(OFST+5,sp)
 876  0204 f6            	ld	a,(x)
 877  0205 97            	ld	xl,a
 878  0206 a608          	ld	a,#8
 879  0208 42            	mul	x,a
 880  0209 1d0008        	subw	x,#8
 881  020c 01            	rrwa	x,a
 882  020d 1b05          	add	a,(OFST+0,sp)
 883  020f 2401          	jrnc	L04
 884  0211 5c            	incw	x
 885  0212               L04:
 886  0212 5f            	clrw	x
 887  0213 97            	ld	xl,a
 888  0214 cd0000        	call	_TimeOut_Record
 890  0217 5b04          	addw	sp,#4
 891  0219               L733:
 892                     ; 123 		if(TimeOutDet_Check(&CH_Heat_Abnormal_Timer[p->ID -1]) && p->Abnormal_DetFlag){
 894  0219 a61f          	ld	a,#L11_CH_Heat_Abnormal_Timer
 895  021b 6b01          	ld	(OFST-4,sp),a
 896  021d 1e06          	ldw	x,(OFST+1,sp)
 897  021f f6            	ld	a,(x)
 898  0220 97            	ld	xl,a
 899  0221 a608          	ld	a,#8
 900  0223 42            	mul	x,a
 901  0224 1d0008        	subw	x,#8
 902  0227 01            	rrwa	x,a
 903  0228 1b01          	add	a,(OFST-4,sp)
 904  022a 2401          	jrnc	L24
 905  022c 5c            	incw	x
 906  022d               L24:
 907  022d 5f            	clrw	x
 908  022e 97            	ld	xl,a
 909  022f cd0000        	call	_TimeOutDet_Check
 911  0232 cd0000        	call	c_lrzmp
 913  0235 2603cc02bd    	jreq	L543
 915  023a 1e06          	ldw	x,(OFST+1,sp)
 916  023c 6d02          	tnz	(2,x)
 917  023e 277d          	jreq	L543
 918                     ; 126 			switch(num){		// loop heat 
 920  0240 be00          	ldw	x,L522_num
 922                     ; 155 					break;
 923  0242 5d            	tnzw	x
 924  0243 2708          	jreq	L532
 925  0245 5a            	decw	x
 926  0246 273c          	jreq	L732
 927  0248               L142:
 928                     ; 154 					num = 0;
 930  0248 5f            	clrw	x
 931  0249 bf00          	ldw	L522_num,x
 932                     ; 155 					break;
 934  024b 206c          	jra	L153
 935  024d               L532:
 936                     ; 128 					Flag2 = 0;
 938  024d 5f            	clrw	x
 939  024e bf13          	ldw	L132_Flag2,x
 940                     ; 129 					if(!Flag1){
 942  0250 be15          	ldw	x,L722_Flag1
 943  0252 2615          	jrne	L353
 944                     ; 130 						Flag1 = 1;
 946  0254 ae0001        	ldw	x,#1
 947  0257 bf15          	ldw	L722_Flag1,x
 948                     ; 131 						TimeOut_Record(&SoftwareDelay[0], 4000);
 950  0259 ae0fa0        	ldw	x,#4000
 951  025c 89            	pushw	x
 952  025d ae0000        	ldw	x,#0
 953  0260 89            	pushw	x
 954  0261 ae0003        	ldw	x,#L332_SoftwareDelay
 955  0264 cd0000        	call	_TimeOut_Record
 957  0267 5b04          	addw	sp,#4
 958  0269               L353:
 959                     ; 133 					if(TimeOutDet_Check(&SoftwareDelay[0])){
 961  0269 ae0003        	ldw	x,#L332_SoftwareDelay
 962  026c cd0000        	call	_TimeOutDet_Check
 964  026f cd0000        	call	c_lrzmp
 966  0272 2745          	jreq	L153
 967                     ; 134 						CH_Port_Cool_Set(p->ID, CH_CLOSE);
 969  0274 5f            	clrw	x
 970  0275 1606          	ldw	y,(OFST+1,sp)
 971  0277 90f6          	ld	a,(y)
 972  0279 95            	ld	xh,a
 973  027a cd0000        	call	_CH_Port_Cool_Set
 975                     ; 135 						num = 1;
 977  027d ae0001        	ldw	x,#1
 978  0280 bf00          	ldw	L522_num,x
 979  0282 2035          	jra	L153
 980  0284               L732:
 981                     ; 141 					Flag1 = 0;
 983  0284 5f            	clrw	x
 984  0285 bf15          	ldw	L722_Flag1,x
 985                     ; 142 					if(!Flag2){
 987  0287 be13          	ldw	x,L132_Flag2
 988  0289 2615          	jrne	L753
 989                     ; 143 						Flag2 = 1;
 991  028b ae0001        	ldw	x,#1
 992  028e bf13          	ldw	L132_Flag2,x
 993                     ; 144 						TimeOut_Record(&SoftwareDelay[1], 10000);
 995  0290 ae2710        	ldw	x,#10000
 996  0293 89            	pushw	x
 997  0294 ae0000        	ldw	x,#0
 998  0297 89            	pushw	x
 999  0298 ae000b        	ldw	x,#L332_SoftwareDelay+8
1000  029b cd0000        	call	_TimeOut_Record
1002  029e 5b04          	addw	sp,#4
1003  02a0               L753:
1004                     ; 146 					if(TimeOutDet_Check(&SoftwareDelay[1])){
1006  02a0 ae000b        	ldw	x,#L332_SoftwareDelay+8
1007  02a3 cd0000        	call	_TimeOutDet_Check
1009  02a6 cd0000        	call	c_lrzmp
1011  02a9 270e          	jreq	L153
1012                     ; 147 						CH_Port_Cool_Set(p->ID, CH_OPEN);
1014  02ab ae0001        	ldw	x,#1
1015  02ae 1606          	ldw	y,(OFST+1,sp)
1016  02b0 90f6          	ld	a,(y)
1017  02b2 95            	ld	xh,a
1018  02b3 cd0000        	call	_CH_Port_Cool_Set
1020                     ; 148 						num = 0;
1022  02b6 5f            	clrw	x
1023  02b7 bf00          	ldw	L522_num,x
1024  02b9               L153:
1025                     ; 158 			return 0XFF;
1027  02b9 a6ff          	ld	a,#255
1029  02bb 203c          	jra	L44
1030  02bd               L543:
1031                     ; 161 		if(temp < CH_HEAT_STOP_VALUE){
1033  02bd 1e04          	ldw	x,(OFST-1,sp)
1034  02bf a30154        	cpw	x,#340
1035  02c2 2416          	jruge	L363
1036                     ; 162 			ret &= CH_Port_Cool_Set(p->ID, CH_CLOSE);
1038  02c4 5f            	clrw	x
1039  02c5 1606          	ldw	y,(OFST+1,sp)
1040  02c7 90f6          	ld	a,(y)
1041  02c9 95            	ld	xh,a
1042  02ca cd0000        	call	_CH_Port_Cool_Set
1044  02cd 5f            	clrw	x
1045  02ce 97            	ld	xl,a
1046  02cf 01            	rrwa	x,a
1047  02d0 1403          	and	a,(OFST-2,sp)
1048  02d2 01            	rrwa	x,a
1049  02d3 1402          	and	a,(OFST-3,sp)
1050  02d5 01            	rrwa	x,a
1051  02d6 1f02          	ldw	(OFST-3,sp),x
1053  02d8 201d          	jra	L533
1054  02da               L363:
1055                     ; 163 		}else if(temp > CH_HEAT_START_VALUE){
1057  02da 1e04          	ldw	x,(OFST-1,sp)
1058  02dc a30164        	cpw	x,#356
1059  02df 2516          	jrult	L533
1060                     ; 164 			ret &= CH_Port_Cool_Set(p->ID, CH_OPEN);
1062  02e1 ae0001        	ldw	x,#1
1063  02e4 1606          	ldw	y,(OFST+1,sp)
1064  02e6 90f6          	ld	a,(y)
1065  02e8 95            	ld	xh,a
1066  02e9 cd0000        	call	_CH_Port_Cool_Set
1068  02ec 5f            	clrw	x
1069  02ed 97            	ld	xl,a
1070  02ee 01            	rrwa	x,a
1071  02ef 1403          	and	a,(OFST-2,sp)
1072  02f1 01            	rrwa	x,a
1073  02f2 1402          	and	a,(OFST-3,sp)
1074  02f4 01            	rrwa	x,a
1075  02f5 1f02          	ldw	(OFST-3,sp),x
1076  02f7               L533:
1077                     ; 168 	return ret;
1079  02f7 7b03          	ld	a,(OFST-2,sp)
1081  02f9               L44:
1083  02f9 5b07          	addw	sp,#7
1084  02fb 81            	ret
1134                     ; 172 unsigned char CH_Handle(CH_PARA_t *p,CH_STATUS_t Status){
1135                     	switch	.text
1136  02fc               _CH_Handle:
1138  02fc 89            	pushw	x
1139       00000000      OFST:	set	0
1142                     ; 173 	if(Status == CH_STOP_MODE){
1144  02fd 0d05          	tnz	(OFST+5,sp)
1145  02ff 2605          	jrne	L514
1146                     ; 174 		return CH_Stop_Handle(p);
1148  0301 cd0012        	call	L311_CH_Stop_Handle
1151  0304 200b          	jra	L25
1152  0306               L514:
1153                     ; 177 	else if(Status == CH_COOL_MODE){
1155  0306 7b05          	ld	a,(OFST+5,sp)
1156  0308 a101          	cp	a,#1
1157  030a 2607          	jrne	L124
1158                     ; 178 		return CH_Cool_Handle(p);
1160  030c 1e01          	ldw	x,(OFST+1,sp)
1161  030e cd009c        	call	L551_CH_Cool_Handle
1164  0311               L25:
1166  0311 85            	popw	x
1167  0312 81            	ret
1168  0313               L124:
1169                     ; 182 	else if(Status == CH_HEAT_MODE){
1171  0313 7b05          	ld	a,(OFST+5,sp)
1172  0315 a102          	cp	a,#2
1173  0317 2607          	jrne	L524
1174                     ; 183 		return CH_Heat_Handle(p);
1176  0319 1e01          	ldw	x,(OFST+1,sp)
1177  031b cd013b        	call	L712_CH_Heat_Handle
1180  031e 20f1          	jra	L25
1181  0320               L524:
1182                     ; 187 		return 0;
1184  0320 4f            	clr	a
1186  0321 20ee          	jra	L25
1235                     ; 196 int CH_Cool_Heat_Moudle_Set(CH_PARA_t *p,unsigned char Status){
1236                     	switch	.text
1237  0323               _CH_Cool_Heat_Moudle_Set:
1239  0323 89            	pushw	x
1240       00000000      OFST:	set	0
1243                     ; 197 	if(p->ID == 0){
1245  0324 7d            	tnz	(x)
1246  0325 2636          	jrne	L554
1247                     ; 198 		if(Status == 0){
1249  0327 0d05          	tnz	(OFST+5,sp)
1250  0329 2614          	jrne	L754
1251                     ; 199 			CH_Port_Cool_Set(p->ID, 0);
1253  032b 5f            	clrw	x
1254  032c 1601          	ldw	y,(OFST+1,sp)
1255  032e 90f6          	ld	a,(y)
1256  0330 95            	ld	xh,a
1257  0331 cd0000        	call	_CH_Port_Cool_Set
1259                     ; 200 			CH_Port_Heat_Set(p->ID, 0);
1261  0334 5f            	clrw	x
1262  0335 1601          	ldw	y,(OFST+1,sp)
1263  0337 90f6          	ld	a,(y)
1264  0339 95            	ld	xh,a
1265  033a cd0000        	call	_CH_Port_Heat_Set
1268  033d 201f          	jra	L564
1269  033f               L754:
1270                     ; 201 		}else if(Status == 1){
1272  033f 7b05          	ld	a,(OFST+5,sp)
1273  0341 a101          	cp	a,#1
1274  0343 2619          	jrne	L564
1275                     ; 202 			CH_Port_Cool_Set(p->ID, 1);
1277  0345 ae0001        	ldw	x,#1
1278  0348 1601          	ldw	y,(OFST+1,sp)
1279  034a 90f6          	ld	a,(y)
1280  034c 95            	ld	xh,a
1281  034d cd0000        	call	_CH_Port_Cool_Set
1283                     ; 203 			CH_Port_Heat_Set(p->ID, 1);
1285  0350 ae0001        	ldw	x,#1
1286  0353 1601          	ldw	y,(OFST+1,sp)
1287  0355 90f6          	ld	a,(y)
1288  0357 95            	ld	xh,a
1289  0358 cd0000        	call	_CH_Port_Heat_Set
1291  035b 2001          	jra	L564
1292  035d               L554:
1293                     ; 206 		return 0;
1295  035d 5f            	clrw	x
1297  035e               L564:
1298                     ; 208 }
1299  035e               L65:
1302  035e 5b02          	addw	sp,#2
1303  0360 81            	ret
1379                     	xref	_CH_Port_Fan_Set
1380                     	xref	_CH_Port_Heat_Set
1381                     	xref	_CH_Port_Cool_Set
1382                     	switch	.ubsct
1383  0017               L31_CH_Heat_Software:
1384  0017 000000000000  	ds.b	8
1385  001f               L11_CH_Heat_Abnormal_Timer:
1386  001f 000000000000  	ds.b	8
1387  0027               L7_CH_Heat_Timer:
1388  0027 000000000000  	ds.b	8
1389  002f               L5_CH_Cool_Timer:
1390  002f 000000000000  	ds.b	8
1391  0037               L3_CH_Stop_Timer:
1392  0037 000000000000  	ds.b	8
1393                     	xref	_TimeOutDet_Check
1394                     	xref	_TimeOut_restart
1395                     	xref	_TimeOut_Record
1396                     	xdef	_CH_Cool_Heat_Moudle_Set
1397                     	xdef	_CH_Handle
1398                     	xdef	_CH_App_Init
1418                     	xref	c_lrzmp
1419                     	end
