section .data
	msg1 db 'Enter the password : '
	len_msg1 equ $-msg1
	msg2 db 'password is correct'
	len_msg2 equ $-msg2
	msg3 db 'password is incorrect'
	len_msg3 equ $-msg3

section .bss
	inp_data resb 0x14

section .text
	global _start

_start:
; Printing the user promt
	mov eax, 0x4
	mov ebx, 0x1
	mov ecx, msg1
	mov edx, len_msg1
	int 0x80

; reading data from user
	mov eax, 0x3
	mov ebx, 0x2
	mov ecx, inp_data
	mov edx, 0x14
	int 0x80

; Printing the user data
	mov eax, 0x4
	mov ebx, 0x1
	mov ecx, inp_data
	mov edx, 0x14
	int 0x80
	
; checking the input
	xor ecx, ecx
	
	xor eax,eax
	mov byte al, [inp_data+ecx]
	inc ecx
	xor eax, 0x14
	shr eax, 0x1
	shr eax, 0x1
	cmp byte al, 0x1f
	jnz l1

	xor eax,eax
	mov byte al, [inp_data+ecx]
	inc ecx
	xor eax, 0x14
	shr eax, 0x1
	shr eax, 0x1
	cmp byte al, 0x1e
	jnz l1

	xor eax,eax
	mov byte al, [inp_data+ecx]
	inc ecx
	xor eax, 0x14
	shr eax, 0x1
	shr eax, 0x1
	cmp byte al, 0x18
	jnz l1

	xor eax,eax
	mov byte al, [inp_data+ecx]
	inc ecx
	xor eax, 0x14
	shr eax, 0x1
	shr eax, 0x1
	cmp byte al, 0x19
	jnz l1

	xor eax,eax
	mov byte al, [inp_data+ecx]
	inc ecx
	xor eax, 0x14
	shr eax, 0x1
	shr eax, 0x1
	cmp byte al, 0x1e
	jnz l1

	xor eax,eax
	mov byte al, [inp_data+ecx]
	inc ecx
	xor eax, 0x14
	shr eax, 0x1
	shr eax, 0x1
	cmp byte al, 0x12
	jnz l1

	xor eax,eax
	mov byte al, [inp_data+ecx]
	inc ecx
	xor eax, 0x14
	shr eax, 0x1
	shr eax, 0x1
	cmp byte al, 0x18
	jnz l1

	xor eax,eax
	mov byte al, [inp_data+ecx]
	inc ecx
	xor eax, 0x14
	shr eax, 0x1
	shr eax, 0x1
	cmp byte al, 0x1e
	jnz l1

	xor eax,eax
	mov byte al, [inp_data+ecx]
	inc ecx
	xor eax, 0x14
	shr eax, 0x1
	shr eax, 0x1
	cmp byte al, 0x12
	jnz l1

	xor eax,eax
	mov byte al, [inp_data+ecx]
	inc ecx
	xor eax, 0x14
	shr eax, 0x1
	shr eax, 0x1
	cmp byte al, 0x1d
	jnz l1

	xor eax,eax
	mov byte al, [inp_data+ecx]
	inc ecx
	xor eax, 0x14
	shr eax, 0x1
	shr eax, 0x1
	cmp byte al, 0x19
	jnz l1

	xor eax,eax
	mov byte al, [inp_data+ecx]
	inc ecx
	xor eax, 0x14
	shr eax, 0x1
	shr eax, 0x1
	cmp byte al, 0x19
	jnz l1

	xor eax,eax
	mov byte al, [inp_data+ecx]
	inc ecx
	xor eax, 0x14
	shr eax, 0x1
	shr eax, 0x1
	cmp byte al, 0x1c
	jnz l1

	xor eax,eax
	mov byte al, [inp_data+ecx]
	inc ecx
	xor eax, 0x14
	shr eax, 0x1
	shr eax, 0x1
	cmp byte al, 0x1e
	jnz l1

	xor eax,eax
	mov byte al, [inp_data+ecx]
	inc ecx
	xor eax, 0x14
	shr eax, 0x1
	shr eax, 0x1
	cmp byte al, 0x1d
	jnz l1

	xor eax,eax
	mov byte al, [inp_data+ecx]
	inc ecx
	xor eax, 0x14
	shr eax, 0x1
	shr eax, 0x1
	cmp byte al, 0x1e
	jnz l1

	xor eax,eax
	mov byte al, [inp_data+ecx]
	inc ecx
	xor eax, 0x14
	shr eax, 0x1
	shr eax, 0x1
	cmp byte al, 0x1b
	jnz l1

; Password is correct prompt
	mov eax, 0x4
	mov ebx, 0x1
	mov ecx, msg2
	mov edx, len_msg2
	int 0x80
	jmp l2

; Password is incorrect prompt
l1:
	mov eax, 0x4
	mov ebx, 0x1
	mov ecx, msg3
	mov edx, len_msg3
	int 0x80
	jmp l2

;	Exit 
l2:
	mov eax, 0x1
	int 0x80
