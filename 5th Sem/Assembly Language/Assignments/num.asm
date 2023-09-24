.Model Small
.Stack 100H
.Data
	no dw 65535
    ten dw 10
.Code 
	main proc
		mov AX, @Data
		mov DS, AX
			
            mov CX, 0H
            mov AX, no

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