global main
extern scanf, printf, fflush

segment .data
	fmt_in	db	"%d %d",0
	fmt_out	db	"%d",0xa

segment .bss
	a	resd	1
	b	resd	1
	c	resd	1

segment .text
	main:
	push	b
	push	a
	push 	fmt_in
	call	scanf
	add		esp, 3*4
	
	mov 	eax, [a]
	add		eax, [b]
	mov		[c], eax
	
	push	dword [c]
	push	fmt_out
	call	printf
	add		esp, 8
	
	push 	0
	call	fflush
	add		esp, 4
	
	
