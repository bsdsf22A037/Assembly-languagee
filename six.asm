.model small
.stack 100h

.data

.code
	main proc
		mov Ch, 10
	bb:	mov Cl, 10

	aa:	mov Dl, "*"
		mov Ah, 02h
		INT 21h

		DEC Cl
		JNZ aa

		mov Dl, 10
		mov Ah, 2
		INT 21h
		mov Dl, 13
		mov Ah, 2
		INT 21h

		DEC Ch
		JNZ bb	

	mov Ah, 4Ch
	INT 21h

main endp
end main