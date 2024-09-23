.model small
.stack 100
.data

.code 
	Main Proc
		mov dl,'A'
		mov ah,02h
		INT 21h
		mov ah ,4ch
		INT 21h
	main endp
	end main