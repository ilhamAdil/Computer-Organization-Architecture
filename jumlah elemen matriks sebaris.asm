segment .data
	M		dd		7, 11, 10, 6
			dd		5, 8, 9, 2
			dd		1, 3, 12, 4
	ncol	dd		4
	fmt_in	db		"%d", 0
	fmt_out	db		"%d", 10, 0
	
segment .bss
	i		resd	1
	val		resd	1
	
segment .text
	extern scanf, printf, fflush
	global main
	
	main
			; scanf("%d", &i);
	.read	
			push i
			push fmt_in
			call scanf
			add	esp,8
			
			mov ecx,4
			mov eax,[i]
			mov ebx,4
			mul ebx
			mov ebx,0
	
	.sum
			add ebx, [M+4*eax]
			inc eax
			loop main.sum
			
			mov [val],ebx
			
			; printf("%d\n", val);
	.print
			push dword[val]
			push fmt_out
			call printf
			push 0
			call fflush
			add	esp, 12
			
	exit
			mov eax, 0
			ret
			
