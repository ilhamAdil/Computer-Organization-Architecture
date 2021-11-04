global main
    extern scanf, printf, fflush

section .data
    fmtin  db  "%s", 0
    weekd      db  "weekday", 10, 0
    weeke      db  "weekend", 10, 0
    sun     db  "Sun", 0
    sat     db  "Sat", 0

section .bss
    string   resb    10

section .text
main
    push    string
    push    fmtin
    call    scanf

    mov     esi, string
    mov     edi, sun

    cmpsb
    je      .baru

    mov     edi, sat

    cmpsb
    je      .baru

    push    weekd
    call    printf
    jmp     exit

.baru
    push    weeke
    call    printf
    jmp     exit

exit
    push    0
    call    fflush
    mov     eax, 1
    mov     ebx, 0
    int 0x80