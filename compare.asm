global main
extern scanf,printf,fflush

section .data
	pos		db		"positif",10,0
	nol		db		"nol",10,0
	ngtf	db		"negatif",10,0
	fmtin	db		"%d",0
	
	
section .bss
	x		resd	1

section .text
	main:
			push	x
			push	fmtin
			call	scanf
			add		esp, 8
			
			cmp		dword [x],0
			jg		print_pos
			je		print_nol
			jl		print_ngtf
			
	print_pos:
			push	pos
			jmp		print
	print_nol:
			push	nol
			jmp		print
	print_ngtf:		
			push 	ngtf
						
	print:
			call	printf
			add		esp,4
			
			mov		eax,0
			ret
