global main
    extern scanf, printf, fflush

section .data
    fmt_in		db "%s", 0
    fmt_out		db "%d", 10, 0
    koma         db "."
         
section .bss
    string   resb   40
    a        resb   1
        
section .text     
	main:
		; scanf("%s", &string);
		push    string
		push    fmt_in
		call    scanf
		add     esp, 8

		cld
		mov     al, [koma]
		mov     edi, string
		mov     ecx, 40
		repne   scasb

		sub     edi, string
		mov     dword [a], edi

		cld     
		mov     al, 0
		mov     edi, string
		mov     ecx, 40
		repne   scasb
		
		sub     edi, string
		dec     edi
		sub     edi, [a]

		cmp     edi, 0
		jl      false
		je      true
		jg      true

	true:
		push    edi
		jmp     print

	false: 
		push    dword 0
		jmp     print

	print:  
		push    fmt_out
		call    printf
		add     esp, 8

	exit:
		push    0
		call    fflush
		add     esp, 4
		
		mov     eax, 0
		ret

    
		
