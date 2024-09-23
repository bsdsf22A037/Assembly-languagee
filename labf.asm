.model small
.stack 100h
.386

.data
		arr1 dw 1.1, 2.5, 3.3
		noOfelements dw 3

		sumv dw 0
		
		
		str1 db 10,13, "Average is :$"
		

.code 
	main proc
	mov ax,@data
	mov ds,ax
	mov es,ax
	mov ax,noOfelements
	mov cx,ax
	lea si,arr1
;taking the sum
again:	lodsw
		add sumv,ax
		loop again
		
;deviding:
		mov ax,sumv
		mov dx,0h
		mov bx,noOfelements
		div bx
		mov bx,ax
		push dx
		call print_decimal
		mov dl,'.'
		mov ah,02h
		int 21h
		pop dx
		mov ax,dx
		
divloop:mov dx,0h
		cmp ax,0
		je exit
		
		mov bx,10
		mul bx
		
		mov bx,noOfelements
		
		div bx
		mov bx,ax
		call print_decimal
		
		
		
		
		
		
		
	
exit:mov ah,4ch
int 21h
main endp


print_decimal proc
		mov ax,bx
		mov cx,0
		
againd: cmp ax,0
	
		je exit
		mov bx,10
		mov dx,0h
		div bx
		push dx
		inc cx
		jmp againd
exit :  pop dx
		add dl,48
		mov ah,02h
		int 21h
		loop exit
ret
print_decimal endp

end main
	
	
	
	