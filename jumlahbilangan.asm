global main
extern scanf,printf,fflush

section .data
	fmin	db		"%d",0
	fmout	db		"%d",10,0
	
section .bss
	nilai	resd	1
	
section .text
	main:
			push	nilai
			push	fmin
			call	scanf
			add		esp,4*2
			
			mov		eax,0
			mov		ecx,[nilai]
	
	jumlah:
			add		eax,ecx
			loop	jumlah
			
			push	eax
			push 	fmout
			call	printf
			add		esp,4*2
			
			push 	0
			call 	fflush
			add		esp,4
		
			mov 	eax,0
			ret			
			
			
	
