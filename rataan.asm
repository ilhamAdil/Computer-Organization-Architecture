global main
extern	scanf,printf,fflush

section .data
	fmout	db		"%d",10,0
	fmin	db		"%d %d %d %d",0
	
section .bss
	a		resd	1
	b		resd	1
	c		resd	1
	d		resd	1
	x		resd	1
	
section .text
	main:
			push	a
			push	b
			push	c
			push	d
			push	fmin
			call	scanf
			add		esp,20
			
			mov		eax,[a]
			add		eax,[b]
			add		eax,[c]
			add		eax,[d]
			
			mov		edx,0
			mov		ebx,4
			div		ebx
			mov		[x],eax
			
			push	dword[x]
			push	fmout
			call	printf
			add		esp,8
			
			push 	0
			call	fflush
			add		esp,4
			
			mov		eax,0
			ret
			
			
