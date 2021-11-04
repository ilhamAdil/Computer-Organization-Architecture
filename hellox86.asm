        global main
        extern printf,fflush
 
        section .data
msg     db      "Hello x86",10,0
 
        section .text
main:
        push    msg
        call    printf
        add     esp,4
         
        push    0
        call    fflush
        add     esp,4
         
        mov     eax,0
        ret
