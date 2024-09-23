.model small
.stack 100h
.386

.data

		st1 db 10, 13, "Enter a Hex number(0to ffff) $"
		st2 db 10, 13, "illegeal hex digit,try again $"
		st3 db "in binary it is  is $"
		
.code
	main proc
	mov ax,@data
	mov ds,ax
;printing the first string
lea dx,st1
mov ah,09h
int 21h
		
wholeagain:	xor bx,bx
		mov cx,4
againin:mov ah,1
		int 21h
		cmp al,13
		je exit
		cmp al,96
		ja illegal
		cmp al,'9'
		ja letter
		sub al,48
		jmp aa
letter:	sub al,55
		jmp aa
aa:		shl bx,4
		or bl,al
		dec cx
		jnz againin
		jmp exit
		
illegal:
		
		jmp wholeagain
		
exit:	mov cx,16
;printing binary
	
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
		
		
mov ah, 4ch
int 21h

main endp
end main