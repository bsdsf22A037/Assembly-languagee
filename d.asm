.model small
.stack 100h
.386

.data

str1 db 10, 13, "Enter a string: $"
str2 db 100 dup('$')
.code	
	main proc
	
	lea si , str2
	mov cx , 0
again:
	mov ah , 01h
	int 21h
	cmp al , 13
	je printchar
	mov [si], al
	inc cx
	inc si
	jmp again
	
printchar:
	lea si , str2
aa:	mov dl , [si]
	mov ah , 02h
	int 21h
	
	mov dl , 10
	mov ah , 02h
	int 21h	

	mov dl , 13
	mov ah , 02h
	int 21h
	
	inc si
	dec cl
	jnz aa
	

mov ah, 4ch
int 21h

main endp
end main