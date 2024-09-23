.model small
.stack 100
.data
	str1 db "hello world$"
	
	
.code 
	Main Proc
		mov ax ,@data
		mov ds,ax
		mov dx,offset str1
		mov ah,09h
		INT 21h
		mov ah ,4ch
		INT 21h
	main endp
	end main