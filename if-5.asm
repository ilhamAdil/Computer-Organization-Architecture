global main
extern scanf,printf,fflush

section .data
	fmout	db		"%d",10,0
	fmin	db		"%d %d %d",0

section .bss
	a		resd	1
	b		resd	1
	c		resd	1
	x		resd	1
	
section .text
	main:
			push	a
			push	b
			push	c
			push	fmin
			call	scanf
			add		esp,16
			
			mov		eax,[a]
			mov		ebx,[b]
			mov		ecx,[c]
			cmp		eax,ebx
			jg		tes2
			jl 		masuk1
	
	tes2:
			cmp		eax,ecx
			jg		masuk3
			jl		masuk1
	
	masuk3:
			mov		edx,3
			mov		[x],edx
			jmp		print
	
	masuk1:
			mov		edx,1
			mov		[x],edx
			jmp		print
	
	print:
			push	dword[x]
			push	fmout
			call	printf
			add		esp,8
			
			push	0
			call	fflush
			add		esp,4
			
			mov		eax,0
			ret
			
