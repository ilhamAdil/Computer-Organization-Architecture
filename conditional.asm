global main
extern scanf,printf,fflush

section .data
	fmtin	db		"%d% d% d",0
	fmtout	db		"%d",10,0
	
section .bss
	a		resd	1
	b		resd	1
	c		resd	1
	x		resd	1

section .text
	main:
			push	a
			push	b
			push	c
			push	fmtin
			call	scanf
			add		esp,16
			
			mov		eax,dword[a]
			mov		ebx,dword[b]
			cmp		eax,ebx
			jg		kondisi2
			jmp		masukin1
	
	masukin1:
			mov		eax,1
			mov		dword[x],eax
			jmp		print
	
	kondisi2:
			mov		eax,dword[a]
			mov		ebx,dword[c]
			cmp		eax,ebx
			jg		masukin3
			jmp		masukin1
	
	masukin3:
			mov		eax,3
			mov		dword[x],eax
			jmp 	print
	
	print:
			push	dword[x]
			push	fmtout
			call	print
			add 	esp,8
			
			push 	0
			call	fflush
			add		esp,4
			
			mov		eax,0
			ret
			
			
			
			

