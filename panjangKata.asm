global main
extern scanf, printf, fflush

section .data
    fmtin       db      "%s", 0
    fmtout      db      "%d", 10, 0

section .bss
    string      resb    21

section .text
    main:
                push    string  
                push    fmtin
                call    scanf
                add     esp, 8

                cld
                mov     al, 0
                mov     edi, string
                mov     ecx, 21 
                repne   scasb

                sub     edi, string
                dec     edi

                push    edi
                push    fmtout
                call    printf
                add     esp, 8
                jmp     exit     

    exit:
                push    0
                call    fflush
                add     esp, 4

                mov     eax, 0
                ret

                