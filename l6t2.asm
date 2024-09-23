.model small
.stack 100h
.386

.data
	str1 db 10, 13, "Enter An Odd number: $"
	str2 db 10, 13, "enter the three charecter string: $"
	
.code 
		main proc
		
		mov ax,@data
		mov ds,ax
		
		lea dx,str1
		mov ah,09h
		int 21h
		
		mov ah,01h
		int 21h
		sub al,48
		push ax
		mov ah,0
		mov cl,2
		div cl
		mov cl,al
		pop ax
		push ax
		call p_star
		

		mov ah,02h
		int 21h	
main endp		
		
p_star  proc
agains:	mov ch,cl
again:	mov dl,'*'
		mov ah,02h
		int 21h
		dec ch
		jnz again
		mov dl,10
		mov ah,02h
		int 21h
		mov dl,13
		mov ah,02h
		int 21h
		dec ax 
		jnz agains
		
		ret
		p_star endp
		
end main
		
		
		