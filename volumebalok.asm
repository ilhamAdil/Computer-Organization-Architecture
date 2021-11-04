global main
extern scanf,printf,fflush

section .data
	fmin 	db		"%d %d %d",0
	fmout	db		"%d",10,0
	
section .bss
	p		resd	1
	l		resd	1
	t		resd	1
	
section .data
	main:
			;scanf("%d %d %d",&p,&q,&l);
			push	t
			push	l
			push	p
			push	fmin
			call	scanf
			add		esp,4*4
			
			mov		eax,[p]
			mov		ebx,[l]
			mov		ecx,[t]
			mul		ebx
			mul		ecx
			
			push	eax
			push	fmout
			call	printf
			add		esp,4*2
			
			push	0
			call	fflush
			add		esp,4
			
			mov		eax,0
			ret
			
			
