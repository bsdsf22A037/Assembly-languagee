.model small
.stack 100h
.386

.data

.code 

	main proc
	mov ax,@data
	mov ds,ax
	
	
	call decimal_input
	mov ax,bx
	call print_decimal
	call print_hexa
	call print_binary
	
	mov ah, 4ch
	int 21h
main endp
decimal_input proc
		mov bx,0
againid: mov ah,01h
		int 21h
		cmp al,13
		je input_takend
		sub al,48
		mov cl,al
		mov ch,0
		mov ax,bx
		mov bx,10
		mul bx
		add ax,cx
		mov bx,ax
		jmp againid
input_takend:ret
			decimal_input endp
		
		
print_decimal proc
	mov bx,10
	push ax
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
		pop ax
exitd:   ret
		print_decimal endp
		
print_hexa proc
	mov bx,16
	push ax
	mov cx,0
againh:	
		mov dx,0
		cmp ax,0
		je printh
		div bx
		push dx
		inc cx
		jmp againh
printh:
		pop dx
		cmp dl,9
		ja letter
		add dl,'0'
		jmp printhh
letter:add dl,55		
printhh:		mov ah,02h
		int 21h
		dec cx
		jnz printh
		pop ax
exith:   ret
		print_hexa endp
		
print_binary proc
	mov bx,2
	push ax
	mov cx,0
againb:	
		mov dx,0
		cmp ax,0
		je printb
		div bx
		push dx
		inc cx
		jmp againb
printb:
		pop dx
		add dl,'0'
		mov ah,02h
		int 21h
		dec cx
		jnz printb
		pop ax
exitb:   ret
		print_binary endp
		
end main