global main
extern scanf,printf,fflush

section .data
	fmin	db		"%d",0
	kempes	db		"kempes",10,0
	pas		db		"pas",10,0
	keras	db		"keras",10,0
	
section .bss
	x		resd	1

section .text
	main:
			push	x
			push	fmin
			call	scanf
			add		esp,4*2
			
			mov		eax,[x]
			
			cmp		eax,35
			jg		pkeras
			
			cmp		eax,29
			jge		ppas
			
			cmp		eax,0
			jge		pkempes
	
	pkeras:
			push	keras
			call	printf
			add		esp,4
			jmp		exit
			
	ppas:
			push	pas
			call	printf
			add		esp,4
			jmp		exit
			
	pkempes:
			push	kempes
			call	printf
			add		esp,4
			jmp		exit
			
	exit:
			push	0
			call	fflush
			add		esp,4
			
			mov		eax,0
			ret
			
	
