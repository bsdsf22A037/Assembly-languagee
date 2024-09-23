.model small
.stack 100h
.386

.data

str1 db 10, 13, "Enter a string: $"
str2 db 10, 13, "You Enter: $"
arr1 db 50 dup("$")

.code
	main proc
	mov ax, @data
	mov ds, ax
;print to enter string
	lea dx, str1
	mov ah, 09h
	int 21h

	lea si,arr1
;taking input	
input:	
	mov ah, 01h
	int 21h

	cmp al, 13
	je inputdone

	mov  [si], al
	inc si
	jmp input


inputdone:
	mov si, offset arr1
	mov cl, 0
	
	lea dx, str2
	mov ah, 09h
	int 21h
	
again:	
	mov bl, [si]
	
		
	
	push bx
	inc cl
	inc si
	cmp bl, '$'
	je last	
	cmp bl, 20h
	je poping

	jmp again
	
poping:
	pop bx
	mov dl, bl

	mov ah, 02h
	int 21h
	
	dec cl
	jnz poping
	
	jmp again
last:	
	pop bx
	mov dl,' '
	mov ah,02h
	int 21h
	dec cl
laast:
	
	pop bx
	mov dl, bl

	mov ah, 02h
	int 21h
	dec cl
	jnz laast
	
exit:
	mov al, 02h
mov ah, 4ch
int 21h
main endp
end main