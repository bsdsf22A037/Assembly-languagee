.model small 
.stack 100h
.386

.data 

		str1 db 10,13, "Enter string 1: $"
		str2 db 10,13, "Enter string2:$"
		str3 db 10,13, "enter integer$"
		str4 db 10,13, "new string is :$"
		
		
		s1 db 50 dup('$')
		s2 db 50 dup('$')
		s3 db 50 dup('$')
		
		sz1 dw 0
		sz2 dw 0
		intval dw 0
		
		
		
.code  
	main proc
	
		mov ax,@data
		mov ds,ax
		mov es,ax
		
		lea dx,str1
		mov ah,09h
		int 21h
		lea di,s1
		call take_input
		mov sz1,cx
		
		
		lea dx,str2
		mov ah,09h
		int 21h
		lea di,s2
		call take_input
		mov sz2,cx
		
		lea dx,str3
		mov ah,09h
		int 21h
		call take_decimal
		mov intval,bx
		
		lea si,s2
		lea di,s3
		mov cx,intval
	againg:	movsb
		loop againg
		lea si,s1
		lea di,s3
		add di,intval
		mov cx,sz2
	againcc:	movsb
		loop againcc
		
		
		
		lea si ,s2
		add si,intval
		lea di,s3
		add di,intval
		add di,sz2
		mov cx,sz1
		sub cx,intval
	againggg: movsb
			loop againggg
			
		lea dx, s3
		mov ah,09h
		int 21h
			
		
		
		
		
		
mov ah,4ch
int 21h
main endp
	
		
		
take_input proc
	mov cx ,0
	
again: mov ah,01h
		int 21h
		cmp al,13
		je input_taken
		stosb
		inc cx
		jmp again
		
input_taken:
		ret
		take_input endp

		
		
take_decimal proc
	mov bx,0
againd: mov ah,01h
		int 21h
		cmp al,13
		je ipuutd_taken
		sub al,48
		mov ch,0
		mov cl,al
		mov ax,10
		mul bx
		mov bx,ax
		add bx,cx
		jmp againd
		
ipuutd_taken: ret 
		take_decimal endp
		
		
		
		
end main