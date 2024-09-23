.model small
.stack 100h
.386

.data
	str1 db 10, 13, "input string string: $"
	str2 db 10, 13, "char to find : $"
	str3 db 10, 13, " char to replace: $"
	str5 db 10, 13, " modify string is: $"

	str4 db 50 dup('$')
	
.code
	main proc
		mov ax,@data
		mov ds,ax
		mov es,ax
		
		lea dx,str1
		mov ah,09h
		int 21h
		lea di,str4
		
		call take_input
		push cx
	
		
		lea dx,str2
		mov ah,09h
		int 21h
		mov ah,01h
		int 21h
		mov dl ,al
		push dx
		
		lea dx,str3
		mov ah,09h
		int 21h
		mov ah,01h
		int 21h
		mov bl,al
		lea si,str4
		pop dx

		call modify_input
		
		lea dx,str1
		mov ah,09h
		int 21h
		pop cx
		lea si,str4
again:
		mov dl,[si]
		mov ah,02h 
		int 21h
		inc si 
		loop again
		
		
		
mov ah,4ch
int 21h	
main endp		
		
		
		
		
take_input proc
cld
		mov cx,0
again:	mov ah,01h
		int 21h
		cmp al,13
		je input_taken
		stosb
		inc cx
		jmp again
input_taken:ret
	take_input endp
		
		
modify_input proc
cld
againm:
		mov ah,[si]
		cmp ah,dl
		je replacem
		inc si
		loop againm
		jmp exit
		
replacem:
		mov al,bl
		mov [si],al
		inc si
		loop againm
exit:  ret
	modify_input endp
	
	
	
	
end main
	
		
		
	
			
		
		
		