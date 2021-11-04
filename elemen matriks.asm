global main
	extern scanf, printf, fflush

section .data
	M		dd		7, 11, 10, 6
			dd		5, 8, 9, 2
			dd		1, 3, 12, 4
	ncol	dd		4
	fmtin	db		"%d %d", 0
	fmtout	db		"%d", 10, 0
	
section .bss
	i		resd	1
	j		resd	1
	val		resd	1
	
section .text
	main:
			
	.read
			; scanf("%d %d",&i,&j)
			push	j
			push	i
			push	fmtin
			call	scanf
			add		esp, 4*3
			
			; karena array 2d itu adalah 1d yang diextend, maka aksesnya dengan cara akses 1D
			; val = M[i][j] --> M[i*ncol + j]			ex M[1][1] = M[5]
			mov		eax,[i]
			mul		dword [ncol]
			add		eax,[j]
			
			; ebx = M[eax]
			;konsepnya sama seperti pointer pada c, jadi M adalah pointer elemen pertama, *4 karna kapasitas byte dword
			mov		ebx,[M + eax*4]	
			mov		[val],ebx
			
			
	.print	
			; printf("%d\n",val);
			push	dword [val]
			push	fmtout
			call	printf			
			push	0
			call	fflush
			add		esp, 4*3
			
	exit:
			mov		eax,0
			ret
