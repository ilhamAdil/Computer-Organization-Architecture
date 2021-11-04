global main
extern scanf,printf,fflush

section .data
	fmin	db		"%d %d %d",0
	fml		db		"lulus",10,0
	fmtl	db		"tidak",10,0
	
section .bss
	a		resd	1
	b		resd	1
	c		resd	1
	d		resd	1
	av		resd	1

section	.text
	main:
			push	d
			push	c
			push	b
			push	a
			push	fmin
			call	scanf
			add		esp,4*5

			mov		eax,[a]
			add		eax,[b]
			add		eax,[c]
			add		eax,[d]
			
			mov		edx,0
			mov		ebx,4
			div		ebx
			mov		[av],eax
			
			cmp		dword[av],40	
			jge		print_lulus
			jl		print_tidak
	
	print_lulus:
			push	fml
			call	printf
			add		esp,4
			jmp		exit
	
	print_tidak:
			push	fmtl
			call	printf
			add		esp,4
			jmp		exit
	
	exit:
			push 	0
			call	fflush
			add		esp,4
				
			mov		eax,0
			ret
			
