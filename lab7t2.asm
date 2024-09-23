.model small
.stack 100h
.386

.data
	str1 db 10, 13, "my str: $"
	str2 db 10, 13, "ch : $"
	str3 db 10, 13, " modified string: $"
	str4 db 50 dup('$')
	str5 db 10,13, 50 dup('$')
	
	
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
		mov bl,al
		lea si,str4
		lea di,str5
		
		pop cx
		call modify_string
		
		lea dx,str3
		mov ah,09h
		
		int 21h
		
		lea dx,str5
		mov ah,09h
		
		int 21h

		
		
		
mov ah,4ch
int 21h	
main endp		


take_input proc
cld
mov cl,0	
again:	mov ah,01h
		int 21h
		cmp al,13
		je input_taken
		stosb
		inc cl
		
		jmp again
input_taken:
		ret
	take_input endp


modify_string proc
mov ch,0
cld
again: 
		lodsb
		cmp al,bl
		je skip
		inc ch
		stosb
		dec cl
		jnz again
		jmp exit
		
skip:
dec cl
jnz again

exit: ret
	modify_string endp
	
end main
		