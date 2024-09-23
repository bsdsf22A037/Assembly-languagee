.model small
.stack 100h
.386

.data

.code 
main proc
    mov ax, @data
    mov ds, ax
    mov ax, 1234         ; Load the number to be reversed into AX
    call reverse_decimal ; Call the procedure to reverse the number
    mov ax, bx           ; Move the reversed number to AX for printing
    call print_decimal   ; Call the procedure to print the reversed number
    
    mov ah, 4ch          ; Exit the program
    int 21h

main endp		

reverse_decimal proc
    mov bx, 0            ; BX will store the reversed number
    mov cx, 10           ; CX is used for multiplication by 10

reverse_loop:
    cmp ax, 0            ; Check if AX is zero
    je reverse_done      ; If AX is zero, we are done
    xor dx, dx           ; Clear DX before division
    div cx               ; Divide AX by 10; quotient in AX, remainder in DX
    add bx, dx           ; Add the remainder to BX
    mov dx, 0            ; Clear DX
    cmp ax, 0            ; Check if there are more digits to process
    je reverse_done      ; If not, we're done
    mul cx               ; Multiply BX by 10 to shift left for next digit
    jmp reverse_loop     ; Repeat the loop

reverse_done:
    ret

reverse_decimal endp

print_decimal proc
    mov cx, 0            ; CX will count the number of digits
    
print_loop:
    cmp ax, 0            ; Check if AX is zero
    je print_digits      ; If AX is zero, start printing
    xor dx, dx           ; Clear DX before division
    div bx               ; Divide AX by 10; quotient in AX, remainder in DX
    push dx              ; Push remainder (digit) onto the stack
    inc cx               ; Increment digit counter
    jmp print_loop       ; Repeat loop until all digits are pushed

print_digits:
    pop dx               ; Pop the digits from the stack
    add dl, '0'          ; Convert the digit to ASCII
    mov ah, 02h          ; Prepare to print the character
    int 21h              ; Print the digit
    loop print_digits    ; Loop until all digits are printed

    ret

print_decimal endp

end main
