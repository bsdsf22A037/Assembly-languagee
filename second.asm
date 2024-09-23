.model small
.stack 100
.data

.code 
	Main Proc
		mov ah,01h
		INT 21h
		mov dl,al
		mov ah,02h
		INT 21h
		mov ah ,4ch
		INT 21h
	main endp
	end main