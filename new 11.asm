.model small
.stack 100h
.386

.data

.code 
main proc
    mov ax,@data
    mov ds,ax
    
    mov ax,1234     ; Load the number you want to reverse
    call reverse_decimal
    mov ax,bx       ; BX now contains the reversed number
    call print_decimal

    mov ah,4Ch      ; Terminate the program
    int 21h

main endp		

reverse_decimal proc
    mov bx,0h       ; Clear BX, will hold the reversed number
    mov dx,0h       ; Clear DX, used to hold the remainder
    
again: 
    cmp ax,0        ; Check if AX is zero
    je exitrd       ; If zero, exit the loop
    mov dx,0        ; Clear DX before division
    mov cx,10       ; Use CX as divisor (instead of BX to avoid conflict)
    div cx          ; Divide AX by 10, quotient in AX, remainder in DX
    add bx,dx       ; Add remainder to BX (reversed number)
    shl bx,4        ; Shift BX left to make space for the next digit
    jmp again       ; Repeat the loop
    
exitrd: 
    shr bx,4        ; Adjust BX (shifting back to remove the last shift)
    ret
reverse_decimal endp
		
print_decimal proc
    mov bx,10       ; BX will be used as divisor for extracting digits
    
    mov cx,0        ; Clear CX, used as a counter
    
againd:	
    mov dx,0        ; Clear DX before division
    cmp ax,0        ; Check if AX is zero
    je printd       ; If zero, go to print the digits
    div bx          ; Divide AX by 10, quotient in AX, remainder in DX
    push dx         ; Push remainder onto stack (as it represents the digit)
    inc cx          ; Increment counter
    jmp againd      ; Repeat the loop
    
printd:
    pop dx          ; Pop the digit from the stack
    add dl,'0'      ; Convert the digit to ASCII
    mov ah,02h      ; Function to print a character
    int 21h         ; Print the digit
    dec cx          ; Decrement counter
    jnz printd      ; If more digits to print, repeat
    
exitd:   
    ret
print_decimal endp
		
end main
