.model small
.stack 100h
.386
.data

str1 db 10, 13, "enter a charecter$"
str2 db 10, 13, "The ASCII code of  $"
str3 db "in binary is $"
str4 db 10, 13, "The number of 1 bit is $"

.code 
	main proc
	
	mov ax, @data
	mov ds, ax
	
	lea dx, str1
	mov ah, 09h
	int 21h
;taking input
	mov ah, 01h
	int 21h
;printing string
	lea dx, str2
	mov ah, 09h
	int 21h
	
	mov dl, al
	mov ah, 02
	
	int 21h

	lea dx, str3
	mov ah, 09h
	int 21h
;printing ended
	mov bl, al

	mov cl, 8
;ch to count the number of ones
	mov ch, 0

again:	shl bl, 1
	jc aa

	mov dl, '0'
	mov ah, 02h
	int 21h
	jmp bb

aa:
	inc ch
	mov dl, '1'
	mov ah, 02h
	int 21h
	jmp bb
	
bb:
	dec cl
	jnz again
	
	lea dx, str4
	mov ah, 09h
	int 21h
	
	add ch, 30h
	mov dl, ch
	mov ah, 02h
	
	int 21h

mov ah, 4ch
int 21h

main endp
end main