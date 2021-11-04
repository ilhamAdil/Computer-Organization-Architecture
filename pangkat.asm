global main
    extern scanf, printf, fflush
     
section .data
    fmtin	db "%d", 0
    fmtout	db "%d", 10, 0
         
section .bss
    a resd 4
    b resd 4
        
section .text             
main
	push a
	push fmtin
	call scanf
	mov ebx, [a]
	
	cmp ebx, 0
	je exit
	
	push b
	push fmtin
	call scanf
	mov ecx, [b]
	
	mov eax, 1
	call pangkat
	
	push eax
	push fmtout
	call printf
	
	jmp main
	
pangkat
	imul ebx
	loop pangkat
	ret

exit 
    push 0
    call fflush
         
    mov eax, 1
    mov ebx, 0
    int 0x80