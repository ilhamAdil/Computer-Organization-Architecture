global main
extern scanf,printf,fflush

section .data
	fmin	db		"%d",0
	fmout	db		"%d",10,0
	
section .bss
	n		resd	1
	
section .text
	main:
			push	n
			push	fmin
			call	scanf
			add		esp,4*2
			
			mov		eax,1
			mov		ebx,2
			mov		ecx,[n]
			
	pangkat:			
			mul		ebx
			loop	pangkat
	
			push	eax
			push 	fmout	
			call	printf
			add		esp,4*2
			
			push 	0
			call 	fflush
			add		esp,4
		
			mov 	eax,0
			ret			
