global main
extern printf, scanf, fflush
%define arg(n)      ebp + (n+1)*4


section .data
    fmtin   db      "%d %d", 0
    fmtout  db      "%d", 10, 0

section .bss
    a       resd    1
    b       resd    1

section .text
    ;int tambah(int a, int b){
    ;    return a + b;    
    ;}

    tambah:
            ;push    ebp
            ;mov     ebp, esp
            enter   0, 0
            
            ;mov     eax, [ebp + 8]          ; eax = a
            ;add     eax, [ebp + 12]         ; eax += b

            mov     eax, [arg(1)]           ; eax = a
            add     eax, [arg(2)]           ; eax += b
            
            ;mov     esp, ebp
            ;pop     ebp
            leave
            ret
    
    main:   
            ;scanf("%d %d", &a, &b);
            push    b
            push    a 
            push    fmtin
            call    scanf
            add     esp, 12

            push    dword [a]
            push    dword [b]
            call    tambah  
            add     esp, 8

            push    eax
            push    fmtout
            call    printf
            add     esp, 8

    exit:
            push    0
            call    fflush
            add     esp, 4
            
            mov     eax, 0
            ret

            
