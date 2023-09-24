.Model Small
.Stack 100H
.Data
    msg1 db "Enter First number: ", "$"
    msg2 db "Enter Second number: ", "$"
    msg3 db "Sum: ", "$"
	prevNum dw 0
    currNum dw 1
    ten dw 10
    num1 dw ?
    num2 dw ?
.Code 
	main proc
		mov AX, @Data
		mov DS, AX
			
            mov AH, 09H
            mov DX, offset msg1
            int 21H

            input1:
                mov AH, 01H
                int 21H
                cmp AL, 13
                je EndInput1
                sub AL, 48
                mov AH, 0H
                mov currNum, AX
                mov AX, prevNum
                mul ten
                add AX, currNum
                mov prevNum, AX
                jmp input1

            EndInput1:
                mov AX, prevNum
                mov num1, AX
                mov prevNum, 0
                mov currNum, 1
                mov AH, 09H
                mov DX, offset msg2
                int 21H

            input2:
                mov AH, 01H
                int 21H
                cmp AL, 13
                je EndInput2
                sub AL, 48
                mov AH, 0H
                mov currNum, AX
                mov AX, prevNum
                mul ten
                add AX, currNum
                mov prevNum, AX
                jmp input2

            EndInput2:
                mov AX, prevNum
                mov num2, AX
                mov AH, 09H
                mov DX, offset msg3
                int 21H
            
                mov AX, num1
                add AX, num2
                mov CX, 0H
            
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