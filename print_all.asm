.model small
.stack 100h
.386

.data

.code 

	main proc
	mov bx,10
	mov ax,251
	call print_output
	
	mov ah, 4ch
	int 21h
	main endp
	
print_output proc
	mov cx,0
again:	cmp ax,0
		je print
		div bx
		push dx
		inc cx
		jmp again
print:
		pop dx
		mov dx,09h
		int 21h
		dec cx
		jnz print
		jmp exit
exit:   ret
		print_output endp
		
		
end main