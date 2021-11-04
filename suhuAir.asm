global main
extern scanf,printf,fflush

section .data
	fmin	db		"%d %d",0
	dingin	db		"dingin",10,0
	hangat	db		"hangat",10,0
	panas	db		"panas",10,0
	
section .bss
	x		resd	1
	
section .text
	main:
			push	x
			push	fmin
			call	scanf
			add		esp,4*2
			
			mov		eax,[x]
			cmp		eax,61
			jge		print_panas
			
			cmp		eax,36
			jge		print_hangat
			
			cmp		eax,0
			jge		print_dingin
			
	print_panas:
			push	panas
			call	printf
			add		esp,4
			jmp		exit
			
	print_hangat:
			push	hangat
			call	printf
			add		esp,4
			jmp		exit
			
	print_dingin:
			push	dingin
			call	printf
			add		esp,4
			jmp 	exit
			
	exit:
			push	0
			call	fflush
			add		esp,4
			
			mov		eax,0
			ret
