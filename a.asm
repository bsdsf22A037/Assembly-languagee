.model small
.stack 100h
.data
str1 db  50 dup('$')
str2 db 'the count is:$'

.code
main proc
	mov ax, @data
	mov ds, ax

	mov si, offset str1
	mov cl, 0

aa:	mov ah, 01h
	int 21h
	
	cmp al, 13
	je bb

	mov [si], al
	inc cl
	inc si
	jmp aa
	
bb: dec si
	lea dx , str2
	mov ah , 09h
	int 21h
	add cl ,'0'
	mov dl , cl
	mov ah , 02h
	int 21h
	
	
cc: sub cl , '0'
	mov dl, [si]
	mov ah, 02h
	int 21h

	dec si
	dec cl
	jne cc

mov ah, 4ch
int 21h

main endp
end main

	