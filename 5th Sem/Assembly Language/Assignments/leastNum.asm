.Model Small
.Stack 100H
.Data
	PNO dw 0
    CNO dw 0
    ten dw 10
    intArray dw 5 DUP(0)
    small dw 0
.Code 
	main proc
		mov AX, @Data
		mov DS, AX

        mov SI, offset intArray
        call getNo
        mov AX, PNO
        mov [SI], AX
        add SI, 2
        mov small, AX

        mov CX, 4
        inputArray:
            call getNo
            mov AX, PNO
            mov [SI], AX
            add SI, 2
            cmp small, ax
            jl skip
            mov small, AX
            skip:
            loop inputArray

            mov AX, small
            mov PNO,ax
            call showNo
            
		mov AH, 04CH
		int 21H
	main endp
    include io.lib
End