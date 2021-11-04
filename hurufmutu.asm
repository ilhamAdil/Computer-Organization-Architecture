global main
extern scanf,printf,fflush

section .data
	fmin	db		"%d %d %d %d",0
	nila	db		"A",10,0
	nilb	db		"B",10,0
	nilc	db		"C",10,0
	nild	db		"D",10,0
	nile	db		"E",10,0
	
section .bss
	a		resd	1
	b		resd	1
	c		resd	1
	d		resd	1

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
			
			cmp		eax,80
			jge		printa
			
			cmp		eax,60
			jge		printb
			
			cmp		eax,50
			jge		printc
			
			cmp		eax,40
			jge		printd
			
			cmp		eax,0
			jge		printe
	
	printa:
			push	nila
			call	printf
			add		esp,4
			jmp		exit
	
	printb:
			push	nilb
			call	printf
			add		esp,4
			jmp		exit
					
	printc:
			push	nilc
			call	printf	
			add		esp,4
			jmp		exit
			
	printd:
			push	nild
			call	printf
			add		esp,4
			jmp		exit
			
	printe:
			push	nile
			call	printf
			add		esp,4
			jmp		exit
	
	exit:
			push 	0
			call	fflush
			add		esp,4
				
			mov		eax,0
			ret
