global main
extern scanf,printf,fflush

section .data
	fmin	db		"%d",0
	fmout	db		"%d",10,0
	data0	db		"0",10,0
	data1	db		"1",10,0
	
section .bss
	n		resd	1
	
section	.text
	main:
			push	n
			push	fmin
			call	scanf
			add		esp,4*2
			
			cmp		dword[n],0
			je		print0
			cmp		dword[n],1
			je		print1
			cmp		dword[n],2
			je		print2
			mov		eax,0
			mov		ebx,1
			mov		ecx,[n]
			sub		ecx,2
			mov		edx,1
			jmp		tes
	
	print0:
			push	data0
			call	printf
			add		esp,4
			jmp		exit
			
	print1:
			push	data1
			call	printf
			add		esp,4
			jmp		exit
			
	print2:
			push	data1
			call	printf
			add		esp,4
			jmp		exit
			
	tes:	
			mov		eax,ebx
			add		eax,edx
			mov		edx,ebx
			mov		ebx,eax
			loop	tes
			
			push	eax
			push	fmout
			call	printf
			add		esp,4*2
			jmp		exit
			
	exit:
			push 	0
			call 	fflush
			add		esp,4
		
			mov 	eax,0
			ret		
