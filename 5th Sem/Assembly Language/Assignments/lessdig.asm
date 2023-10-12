.Model Small
.Stack 100H
.Data
	PNO dw 0
    CNO dw 0
    ten dw 10
    lar dw 9
.Code 
	main proc
		mov AX, @Data
		mov DS, AX
        inpAgain:
            mov AH, 01H
            int 21H
            cmp AL, 13
            je EndInp
            sub AL, 48
            mov AH, 0H
            cmp lar, ax
            jl skip
            mov lar, AX
            skip:
            jmp inpAgain
        EndInp:
        mov AX, lar
        mov PNO,ax
        call showNo  
		mov AH, 04CH
		int 21H
	main endp
    include io.lib
End