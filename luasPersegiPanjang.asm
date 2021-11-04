global main
extern scanf,printf,fflush

section .data
	fmin	db		"%d %d",0
	fmout	db		"%d",10,0
	
section .bss
	p		resd	1
	l		resd	1
	
section .data
	main:
			push	p
			push	l
			push	fmin
			call	scanf
			add		esp,4*3
			
			mov		eax,[p]
			mov		ebx,[l]
			mul		ebx
			
			push	eax
			push	fmout
			call	printf
			add		esp,4*2
			
			push	0
			call	fflush
			add		esp,4
			
			mov		eax,0
			ret
