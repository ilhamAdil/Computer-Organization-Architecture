section .data
    hello db "Hello ",
    helloLen equ $-hello

section .bss
    baca resb 4

section .text
global main

main:
        ;baca 
        mov eax, 3
        mov ebx, 0 
        mov ecx, baca
        mov edx, 4
        int 0x80
		
		;cetak Hello 
		mov eax, 4
        mov ebx, 1
        mov ecx, hello
        mov edx, helloLen       
        int 0x80
        
        ;lanjutan cetak (dari input)
        mov eax, 4
        mov ebx, 1
        mov ecx, baca
        mov edx, 4 
        int 0x80    
    
        mov eax, 1
        mov ebx, 0
        int 0x80

