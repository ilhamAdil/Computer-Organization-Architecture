global main
extern scanf, printf, fflush
       
section .data
    fmtin db "%f", 0
    fmtin2 db "%d", 0
    fmtout db "%.1f", 10, 0
    tampung dq 0.0       
           
section .bss
	n resd 4
	a resd 4
	result resd 4
      
section .text
           
main
	push n
    push fmtin2
    call scanf
    
    mov edi, [n]
	fld qword[tampung]
	
.loop
	push a
	push fmtin
	call scanf
	add esp, 8
	
	fadd dword[a]
	
	sub edi, 1
	cmp edi, 0
	jne .loop


	fidiv dword[n]
	fst qword[result]
	
	push dword[result+4]
	push dword[result]
	push fmtout
	call printf

exit
    push 0
    call fflush

    mov eax, 1
    mov ebx, 0
    int 0x80