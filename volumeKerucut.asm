global main
extern scanf, printf, fflush

section .data
	fmt_in		db		"%f %f", 0
	fmt_out		db		"%.4f", 10, 0
	tiga		dd		3	
	
section .bss
	r			resd	1
	t			resd	1
	v			resq	1
	
section .text
	main:			
				;scanf("%f %f", &r, &t);
				push 	t
				push	r
				push 	fmt_in
				call	scanf
				add		esp, 12
				
				;v = 1/3*pi*r*r*t
				finit
				fldpi
				fmul	dword [r]
				fmul	dword [r]
				fmul	dword [t]
				fidiv	dword [tiga]
				fst		qword [v]
				
				push	dword [v+4]
				push 	dword [v]
				push	fmt_out
				call	printf
				add		esp, 12
				
	exit:
				push	0
				call	fflush
				add		esp, 4
				
				mov		eax, 0
				ret
				

