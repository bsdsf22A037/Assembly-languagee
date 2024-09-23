.model small
.stack 100h
.data

.code 
	main proc
		xor bx,bx
		mov cx,4
againh:	mov ah,1
		int 21h
		cmp al,13
		je exit
		cmp al,9
		ja letter
		sub al,48
		jmp aa
letter:	sub al,55
		jmp aa
aa:		shl bl,4
		or bl,al
		dec cx
		jnz againh
		
		
;		mov bx,43C2h
exit:		mov cx,16
again:	shl bx,01
		jc one
		mov dl,'0'
		mov ah,02h
		int 21h
		jmp last
one:	mov dl,'1'
		mov ah,02h
		int 21h
		
last:	dec cx
		jnz again
		mov ah,4ch
		int 21h
		main endp
		end main
