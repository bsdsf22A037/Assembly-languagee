.model small
.stack 100h
.386

.data


.code 
	main proc
		mov ax,@data
		mov ds,ax
		
		mov ax,6789
		call reverse_decimal
		mov ax,bx
		call print_decimal
	
		
	
mov dl,10
		mov ah,4ch
		int 21h		
		
		main endp
reverse_decimal proc
		
		mov dx,0
		mov cx,0
		
again:	cmp ax,0
		je exitrd
		push ax
		mov ax,10
		
		mul cx
		mov cx,ax
		pop ax
		mov bx,10
		div bx
		add cx,dx
		
		
		
		jmp again
exitrd: mov bx,cx
		
		ret
		reverse_decimal endp
		
		
print_decimal proc
	mov bx,10
	
	mov cx,0
againd:	
		mov dx,0
		cmp ax,0
		je printd
		div bx
		push dx
		inc cx
		jmp againd
printd:
		pop dx
		add dl,'0'
		mov ah,02h
		int 21h
		dec cx
		jnz printd
		
exitd:   ret
		print_decimal endp
		
end main
		
