.Model Small
.Stack 100H
.Data
    msg1 db "Enter your number: ", "$"
    msg2 db "Given number: ", "$"
	prevNum dw 0
    currNum dw 1
    ten dw 10
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
                mov AH, 09H
                mov DX, offset msg2
                int 21H

                mov CX, 0H
                mov AX, prevNum
            
            DivAgain:
                mov DX, 0H
                div ten
                push DX
                inc CX
                cmp AX, 0H
                jne DivAgain
            
            ShowNum:
                mov AH, 02H
                pop DX
                add DX, 48
                int 21H
                Loop ShowNum

		mov AH, 04CH
		int 21H
	main endp
End