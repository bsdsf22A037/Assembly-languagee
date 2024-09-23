.model small
.stack 100h
.386
.data
	str1 db 10,13,'Enter a Decimal Digits String: $'
	str2 db 10,13,'The Sum of Digits in HEX is: $'
	
.code
	main proc
	mov ax,@data
	mov ds,ax
	mov bl,0
	mov cx,4
	mov dx,offset str1	
	mov ah,09
	int 21h
	
input:
	mov ah,1
	int 21h
	cmp al,13
	je display
	sub al,48
	add bl,al
	jmp input
	
	

display:
	mov dx,offset str2	
	mov ah,09
	int 21h
again:
	rol bx,4
	mov dl,bl
	and dl,0fh
	add dl,48
	mov ah,2
	int 21h
	dec cx
	jnz again
	
	mov ah,4ch
	int 21h
	main endp
	end main
	
	
	
	
	