global main
extern scanf,printf,fflush

section .data
	fmin	db		"%d %d %d",0
	fmout1	db		"1",10,0
	fmout3	db		"3",10,0
	
section .bss
	a		resd	1
	b		resd	1
	c		resd	1

section .data
	main:
			push	c
			push	b
			push	a
			push	fmin
			call	scanf
			add		esp,4*4
			
			mov		eax,[a]
			mov		ebx,[b]
			mov		ecx,[c]
			cmp		eax,ebx
			jg		cek2
			jle		print1
			
	cek2:
			cmp		eax,ecx
			jg		print3
			jle		print1
			
	print1:
			push	fmout1
			call	printf
			add		esp,4
			jmp		exit
			
	print3:
			push	fmout3
			call	printf
			add		esp,4
			jmp		exit
			
	exit:
			push 	0
			call 	fflush
			add		esp,4
		
			mov 	eax,0
			ret		
			
			
			
