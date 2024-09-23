.model small
.stack 100h
.386

.data
str1 db 10, 13, "Enter a String: $"
str2 db 10, 13, "Sorted string is: $"
str3 db 30 dup('$') ; 
str4 db 30 dup('$')

.code

main proc

  mov ax, @data
  mov ds, ax

  lea dx, str1
  mov ah, 09h
  int 21h

  call input
  mov ch, cl

  mov si, offset str3
  mov di, offset str4
  mov bh, 0 

looop:
  cmp bh,ch 
  je sorted 

  mov bl, [si]
  cmp bl, '$'  
  je next_char 
  call sorting 
  inc si

next_char:
  inc bh
  jmp looop

sorted:
  lea dx, str2
  mov ah, 09h
  int 21h

  lea dx, str4
  mov ah, 09h
  int 21h

  mov ah, 4ch
  int 21h

main endp

input proc
  mov si, offset str3
  xor cl, cl

again:
  mov ah, 01h
  int 21h
  
  cmp al, 13
  je exit  

  cmp al, '$' 
  je exit

  mov [si], al
  inc si
  inc cl
  jmp again

exit:
	mov al,'$'
  mov [si], al
  ret

input endp

sorting proc
  mov al, [si] 

outer_loop:
  inc si
  mov bl, [si] 
  cmp bl, '$'  
  je exit1

  cmp al, bl  
  jae no_swap 

  xchg al, bl  
  mov [si-1], al  
  jmp outer_loop

no_swap:
  dec si  

exit1:
  ret

sorting endp


end main
