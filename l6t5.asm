.model small
.stack 100h
.386

.data
	str1 db 10, 13, "Enter the numerator of first fraction: $"
	str2 db 10, 13, "enter the denominator of first fraction: $"
	str3 db 10, 13, "enter the denominator of first fraction: $"
	str4 db 10, 13, "enter the denominator of first fraction: $"
	str5 db 10, 13, "the result is : $"
	
	arr1 db 0d
	arr2 db 0d
	arr3 db 0d
.code
	main proc
		mov ax,@data
		mov ds,ax
		lea dx,str1
		mov ah,09h
		int 21h
		mov ah,01h
		int 21h
		sub al,48
		mov dl,al
		
		lea dx,str2
		mov ah,09h
		int 21h
		mov ah,01h
		int 21h
		sub al,48

		mov dh,al
		
		lea dx,str3
		mov ah,09h
		int 21h
		mov ah,01h
		int 21h
		sub al,48

		mov cl,al
		
		lea dx,str4
		mov ah,09h
		int 21h
		mov ah,01h
		int 21h
		
		sub al,48

		mov ch,al
		
		
mov ah,0
mov al,ch
mov bl,dh
mul bl
mov arr1,al

mov ah,0
mov al,dl
mul ch
mov arr2,al

mov ah,0
mov al,dh
mul cl
mov arr3,al

mov al,arr2
mov bl ,arr3
add al,bl
add al,48
mov bl ,arr1
add bl,48

lea dx,str5
	mov ah,09h
	int 21h
mov dl,bl
mov ah,02h
int 21h

mov dl,'/'
mov ah,02h
int 21h

mov dl,al 
mov ah,02h
int 21h

mov ah, 4ch
	int 21h

main endp
end main