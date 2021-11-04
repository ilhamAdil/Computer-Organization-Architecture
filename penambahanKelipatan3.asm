global main
extern scanf,printf,fflush

section .data
	fmin	db		"%d",0
	fmout	db		"%d",10,0
	i		dd		0

section .bss
	x		resd	1
	
section .text
	main:
			push	x
			push	fmin
			call	scanf
			add		esp,4*2
			
			mov		eax,0
			mov		ebx,[x]
			mov		dword[i],0
			
	kelipatan:
			add		eax,[i]
			inc		dword[i]
			inc		dword[i]
			inc		dword[i]
			cmp		dword[i],ebx
			jle		kelipatan
			
	print:
			push	eax
			push	fmout
			call	printf
			add		esp,4*2
			
			push	0
			call	fflush
			add		esp,4
			
			mov		eax,0
			ret
			
			
