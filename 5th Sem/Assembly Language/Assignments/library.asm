.Model Small
.Stack 100H
.Data
    msg1 db 10,13,"Enter your numbers","$"
    msg2 db 10,13,"Given numbers: ","$"
	PNO dw 0
    CNO dw 1
    ten dw 10
    intArray dw 5 DUP(0)
.Code 
	main proc
		mov AX, @Data
		mov DS, AX

        mov DX, offset msg1
        call coutString

        mov SI, offset intArray
        mov CX, 5
        inputArray:
            call getNo
            mov AX, PNO
            mov [SI], AX
            add SI, 2
            loop inputArray

        mov DX, offset msg2
        call coutString

        mov SI, offset intArray
        mov CX, 5
        showArray:
            mov AX, [SI]
            mov PNO,ax
            call showNo
            add si,2
            loop showArray
		mov AH, 04CH
		int 21H
	main endp
    include io.lib
End