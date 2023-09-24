.Model Small
.Stack 100H
.Data
    msg1 db "Enter your number: ", "$"
    msg2 db "Given number is prime", "$"
    msg3 db "Given number is not prime", "$"
	prevNum dw 0
    currNum dw 1
    ten dw 10
    two dw 2

.Code 
	main proc
		mov AX, @Data
		mov DS, AX
			
            mov AH, 09H
            mov DX, offset msg1
            int 21H

            inputAgain:
                mov AH, 01H
                int 21H
                cmp AL, 13
                je EndInput
                sub AL, 48
                mov AH, 0H
                mov currNum, AX
                mov AX, prevNum
                mul ten
                add AX, currNum
                mov prevNum, AX
                jmp inputAgain

            EndInput:
                mov AX, prevNum
                sub AX, 1
                mov CX, AX

            CheckPrime:
                cmp prevNum, 2
                jl NotPrimeMsg
            
            CheckLoop:
                cmp CX, 2
                jl PrimeMsg
                mov AX, prevNum
                mov DX, 0H
                div CX
                cmp DX, 0H
                je NotPrimeMsg
                loop CheckLoop

            PrimeMsg:
                mov AH, 09H
                mov DX, offset msg2
                int 21H
                jmp Return

            NotPrimeMsg:
                mov AH, 09H
                mov DX, offset msg3
                int 21H

        Return:
            mov AH, 04CH
            int 21H
	main endp
End