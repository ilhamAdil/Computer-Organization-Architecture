global main
extern scanf,printf,fflush

section .data
	fmin	db		"%d",0
	fmout	db		"%d",10,0
	
section .bss
	n 		db		1
	
section .text
	main:
			push	n
			push	fmin
			call	scanf
			add		esp,4*2
			
			mov		eax,1
			mov		ecx,[n]
			
	faktorial:
			mul		ecx
			loop	faktorial
			
			push	eax
			push	fmout
			call	printf
			add		esp,4*2
			
			push 	0
			call	fflush
			add		esp,4
			
			mov		eax,0
			ret
