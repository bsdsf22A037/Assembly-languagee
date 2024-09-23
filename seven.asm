.model small
.stack 100
.data
	str1 db "Enter a charecter:&"
	str2 db "you enter:&"
.code 
	Main Proc
		mov ah,01h
		INT 21h
		XOR al,20h
		mov dl,al
		mov ah,02h
		INT 21h
		
		mov ah ,4ch
		INT 21h
	main endp
	end main