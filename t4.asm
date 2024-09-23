.model small
.stack 100h
.386
.data

str1 db 10, 13, "Enter a binary number up to 16 digits: $"
str2 db 10, 13, "Its HEX is $"
str3 db 10, 13, "Wrong input$"
.code
main proc
mov ax, @data
mov ds, ax

	
	
againinput:
	mov bx, 0
	lea dx, str1
	mov ah, 09h
	int 21h
		
input:	mov ah, 01h
	int 21h
	cmp al, '1'
	ja illegal

	cmp al, 13
	je exit

	sub al, 30h
	shl bx, 1
	or bl, al
	jmp input
	
illegal:
	lea dx, str3
	mov ah, 09h
	int 21h
	jmp againinput
 
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