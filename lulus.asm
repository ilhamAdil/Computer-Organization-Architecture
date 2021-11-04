global main
extern scanf,printf,fflush

section .data
	fmtin	db		"%d% d% d %d",0
	fmout1	db		"lulus",10,0
	fmout2	db		"tidak",10,0

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
			push	fmtin
			call	scanf
			add		esp,20
			
			mov		eax,dword[a]
			add		eax,dword[b]
			add		eax,dword[c]
			add		eax,dword[d]
			mov		ebx,4
			idiv	ebx
			
			cmp		eax,40
			jge		print_lulus
			jl		print_tidak
	
	print_tidak:
			push	fmout2
			call	printf
			add		esp,4
			jmp		keluar
	
	print_lulus:
			push	fmout1
			call	printf
			add		esp,4
			jmp 	keluar
	
	keluar:
			push	0
			call	fflush
			add		esp,4
			
			mov		eax,0
			ret
			
			
			
	
