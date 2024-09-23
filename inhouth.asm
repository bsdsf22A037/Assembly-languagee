.model small
.stack 100h
.386
.data
	str1 db 'enter your input in hex$'

.code
	main proc
		xor bx,bx
		mov cx,4
again:	mov ah,1
		int 21h
		cmp al,13
		je exit
		cmp al,'9'
		ja letter
		sub al,48
		jmp aa
letter:	sub al,55
		jmp aa
aa:		shl bx,4
		or bl,al
		dec cx
		jnz again
		
		
exit:	mov cx,4
againp:	rol bx,4
		mov dl,bl
		AND dl,0Fh
		cmp dl,09
		ja letters
		add dl,48
		JMP print
letters:add dl,55
print:	mov ah,02h
		int 21h
		dec cx
		jnz againp
		mov ah,4ch
		int 21h
		main endp
		end main