.model small
.stack 100h
.386

.data
	str1 db 10, 13, "enter a string: $"
	str2 db 10, 13, " after trim start: $"
	str3 db 10, 13, " string: $"
	str4 db 50 dup('$')
	str5 db 50 dup('$')
	
	
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
		
		lea dx,str3
		mov ah,09h
		int 21h
		
		pop cx
		lea si,str4
		lea di,str5
		call modify_string
		
		lea dx,str5
		mov ah,09h
		
		int 21h

		
		
		
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
input_taken:
		ret
	take_input endp
	
	
	
modify_string proc
againg:		lodsb
		cmp al,' '
		
		jne exit
		loop againg
		
exit: dec cx
		dec si
		
exitt:
	lodsb
	stosb
	loop exitt
ret
modify_string endp
	
	
end main

	