.model small
.stack 100h
.386

.data

str1 db 10, 13, "enter the algebric expression: $"
str2 db 10, 13, "too many right bracket ,begin again: $"
str4 db 10, 13, "too many left bracket ,begin again: $"
str3 db 10, 13, "correct expression: $"

arr1 db 50 dup("$")

.code
	main proc
	mov ax, @data
	mov ds, ax
	
;printing to take input

	lea dx,arr1
	mov ah,09h
	int 21h
	
;taking input
	mov cx,0
	lea si,arr1
againin:
	mov ah,01h
	int 21h
	cmp al,13
	je input_taken
	mov [si],al
	inc si
	inc cx
	jmp againin
	
	
input_taken:
	mov ax,0
	lea si,arr1
againout:
	mov bl,[si]
	cmp bl,'('
	je left_bracket
	cmp bl,')'
	je right_bracket
	inc si
	dec cx
	jnz againout
	jmp exit

left_bracket:
	push bx
	inc ax
	inc si 
	dec cx
	jnz againout
	jmp exit
	
right_bracket:
	pop bx 
	dec ax
	inc si 
	dec cx
	jnz againout
	jmp exit
exit:
	cmp ax,0
	je perfect
	cmp ax,0
	ja left_more
	cmp ax,0
	jb right_more
perfect:
	lea dx,str3
	mov ah,02h
	int 21h
	jmp endd
right_more:
	lea dx,str2
	mov ah,02h
	int 21h
	jmp endd
left_more:
	lea dx,str4
	mov ah,02h
	int 21h
	jmp endd
	
endd:
		mov ah, 4ch
int 21h
main endp
end main
	
	
		

	