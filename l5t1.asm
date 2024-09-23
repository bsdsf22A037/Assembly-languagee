.model small
.stack 100h
.386

.data
	str1 db 10, 13, "Binart input : $"
	
	str2 db 10, 13, "hexa decimal output: $"
	str3 db 10, 13, "wrong input: $"

	arr1 db 10 dup('$')
	
.code 
		main proc
		mov ax,@data 
		mov ds,ax
;printing to take input
start:
		lea dx,str1
		mov ah,09h
		int 21h
		mov ch ,5
		lea si,arr1
callingin:	call binary_input
		mov [si],bl
		inc si
		dec ch
		jnz callingin
#output
		
		mov ah, 4ch
	int 21h

	main endp
	
		
		
binary_input	proc

	xor bl, bl
	mov cl,8

aa:	mov ah, 01
	int 21h
	cmp al, 13
	je exit
	cmp al,'1'
	ja wrong input
	
	sub al, 30h
	shl bl, 1
	or bl, al
	dec cl
	jnz aa
	

exit:
	ret
	binary_input endp
wrong input:
	lea bx,str3
	mov dx,bx
	mov ah,09h
	int 21h
	jmp start


	
end main
	