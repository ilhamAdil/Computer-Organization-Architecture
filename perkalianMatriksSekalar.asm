  
global main
    extern scanf, printf, fflush

section .data
    M       dd  7, 11, 10, 6
            dd  5, 8, 9, 12
            dd  11, 13, 12, 15
    col   dd  4
    fmtin    db  "%d", 0
    fmtout   db  "%d ", 0
    fmtoutln  db  "%d", 10, 0

section .bss
    n       resd    1

section .text
    main
        ; scanf("%d", &n);
    .read
        push    n
        push    fmtin
        call    scanf
        add     esp, 8


        mov     ebx, [n]
        mov     eax, [M]
        mul     ebx
        push    eax
        push    fmtout
        call    printf
        add     esp , 8

        mov     eax, [M+4]
        mul     ebx
        push    eax
        push    fmtout
        call    printf
        add     esp, 8

        mov     eax, [M+8]
        mul     ebx
        push    eax
        push    fmtout
        call    printf
        add     esp, 8

        mov     eax, [M+12]
        mul     ebx
        push    eax
        push    fmtoutln
        call    printf
        add     esp, 8



        mov     eax, [M+16]
        mul     ebx
        push    eax
        push    fmtout
        call    printf
        add     esp, 8
        
        mov     eax, [M+20]
        mul     ebx
        push    eax
        push    fmtout
        call    printf
        add     esp, 8

        mov     eax, [M+24]
        mul     ebx
        push    eax
        push    fmtout
        call    printf
        add     esp, 8

        mov     eax, [M+28]
        mul     ebx
        push    eax
        push    fmtoutln
        call    printf
        add     esp, 8




        
        mov     eax, [M+32]
        mul     ebx
        push    eax
        push    fmtout
        call    printf
        add     esp, 8

        mov     eax, [M+36]
        mul     ebx
        push    eax
        push    fmtout
        call    printf
        add     esp, 8

        mov     eax, [M+40]
        mul     ebx
        push    eax
        push    fmtout
        call    printf
        add     esp, 8


        mov     eax, [M+44]
        mul     ebx
        push    eax
        push    fmtoutln
        call    printf
        add     esp, 8


   
        push    0
        call    fflush
        add     esp, 4

    exit
        mov     ebx, 0
        mov     eax, 0
        ret
