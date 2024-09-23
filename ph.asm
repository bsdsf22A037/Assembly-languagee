.model small
.stack 100h
.386
.data

.code
	main proc
;		mov bx,43C2h
		XOR bx,bx
		mov ah,1
		int 21h
againg:	cmp al,13
		je exit
		sub al,48
		shl bx,1
		or bl,al
		mov ah,1
		int 21h
		jmp againg
		





exit:	mov cx,4
again:	rol bx,4
		mov dl,bl
		AND dl,0Fh
		cmp dl,09
		ja letter
		add dl,48
		JMP print
letter:	add dl,55
print:	mov ah,02h
		int 21h
		dec cx
		jnz again
		mov ah,4och
		int 21h
		
		main endp
		end main