.model small
.stack 100h
.386

.data
	str1 db 10, 13, "Enter first decimal number: $"
	str2 db 10, 13, "enter second decimal number: $"
	str3 db 10, 13, "answer is: $"
	arr1 dw 0d
	arr2 dw 0d
	arr3 dw 0d
.code
	main proc
		mov ax,@data
		mov ds,ax
		lea dx,str1
		mov ah,09h
		int 21h
		call decimal_input
		mov arr1, bx
		
		
		lea dx, str2
		mov ah, 09h
		int 21h
		call decimal_input
		mov arr2, bx
		
		
;taking operant input	
		lea dx, str3
		mov ah, 09h
		int 21h
		mov ah,01h
		int 21h
		cmp al,'+'
		je addition
		cmp al,'-'
		je subtraction
		cmp al,'*'
		je multip
		cmp al,'%'
		je modi
		
		
addition: mov ax, arr1
			mov bx, arr2
			add ax, bx
			call print_decimal
			jmp exit
		
subtraction:
	mov ax, arr1
			mov bx, arr2
			sub ax, bx
			call print_decimal
			jmp exit
		
multip: mul bl
			mov bx, arr1
			mov ax, arr2
			mul  bx
			call print_decimal
			jmp exit			

modi : mov dx,0h
		mov bx, arr1
		mov ax,arr2
			div  bx
			mov ax,dx
			call print_decimal
			jmp exit



		
		
		
exit:		mov ah, 4ch
		int 21h
main endp

decimal_input proc
		
		mov bx,0
againid: mov ah,01h
		int 21h
		cmp al,13
		je input_takend
		sub al,48
		mov cl,al
		mov ch,0
		mov ax,bx
		mov bx,10
		mul bx
		add ax,cx
		mov bx,ax
		jmp againid
		
input_takend:ret
		decimal_input endp
		
print_decimal proc
	mov bx,10
	
	mov cx,0
againd:	
		mov dx,0
		cmp ax,0
		je printd
		div bx
		push dx
		inc cx
		jmp againd
printd:
		pop dx
		add dl,'0'
		mov ah,02h
		int 21h
		dec cx
		jnz printd
		
exitd:   ret
		print_decimal endp
		
		
end main		
