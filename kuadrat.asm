global main
    extern scanf, printf, fflush

section .data
    fmtin        db  "%d", 0
    fmtout   db  "%d", 10, 0

section .bss
    n       resd    1

section .text
    kali:   
        mov     ebx, eax
        mul     ebx

        ret

    main:
        ; scanf("%d", &n);
        push    n
        push    fmtin
        call    scanf
        add     esp, 8

        cmp     dword [n], 0   
        je      exit

        mov     eax, [n]     
        call    kali 
 

        push    eax
        push    fmtout
        call    printf
        add     esp, 8
   
        jmp     main

    exit:
        push    0
        call    fflush
        add     esp, 4
        mov     ebx, 0

        mov     eax, 0
        ret