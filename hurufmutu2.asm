global main
    extern scanf, printf, fflush

segment .data
    format_in  db   "%d %d %d %d", 0
    mutu_a      db   "A", 10, 0
    mutu_b      db   "B", 10,0
    mutu_c      db   "C", 10,0
    mutu_d      db   "D", 10,0
    mutu_e      db   "E", 10,0

segment .bss
    a       resd    1
    b       resd    1
    c       resd    1
    d       resd    1
    
segment .text
    main:
        push    d
        push    c
        push    b
        push    a
        push    format_in
        call    scanf  
        add     esp, 5*4
        
        mov     eax, [a]
        add     eax, [b]
        add     eax, [c]
        add     eax, [d]
        
        mov     edx, 0
        mov     ecx, 4
        div     ecx
        
        cmp     eax, 80
        jge     print_a
        
        cmp     eax, 60
        jge     print_b
        
        cmp     eax, 50
        jge     print_c
        
        cmp     eax, 40
        jge     print_d
        
        cmp     eax, 0
        jge 	print_e

    print_a:
        push    mutu_a
        call	printf
        add 	esp,4
        jmp     exit
    
    print_b:
        push    mutu_b
        call	printf
        add 	esp,4  
        jmp     exit
    
    print_c:
        push    mutu_c
        call	printf
        add 	esp,4
        jmp     exit
    
    print_d:
        push    mutu_d
        call	printf
        add 	esp,4        
        jmp     exit
    
    print_e:
        push    mutu_e
        call	printf
        add 	esp,4
    
    exit:  
			push 	0
			call	fflush
			add		esp,4
				
			mov		eax,0
			ret
