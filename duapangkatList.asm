global main
    extern scanf, printf, fflush

section .data
    i            dd   0
    fmtin    db  "%d", 0
    fmtout   db  "%d", 10, 0

section .bss
    n       resd    1

section .text
    main
        ; scanf("%d", &n);
        push    n
        push    fmtin
        call    scanf
        add     esp, 8

        mov     ecx, [n]
        mov     ebx, [n]

        cmp     ebx, 0   ; if(n==0) jmp exit
        je      exit

        mov     eax, 1       ;eax = kuadrat(n) 
        call    kuadrat 
 
        ; printf("%d", eax);
        push    eax
        push    fmtout
        call    printf
        add     esp, 8

        cmp     ebx, 0
        jne     main
   
        jmp     exit

    kuadrat   ; eax = kuadrat(eax)
        mov     edx, 2
        imul    edx
        loop    kuadrat

        ret

    exit
        push    0
        call    fflush
        add     esp, 4
        mov     ebx, 0
        
        mov     eax, 0
        ret