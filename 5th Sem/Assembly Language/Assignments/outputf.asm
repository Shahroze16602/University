.Model Small
.Stack 100H
.Data
    Msg db "Enter your text file name: ", "$"
    fnm db 50 DUP(0)
    fh dw 0
	MsgBuffer db 1000 DUP("$")
.Code 
	main proc
		mov AX, @Data
		mov DS, AX

            mov AH, 09h
            mov DX, offset Msg
            int 21h
            mov SI, offset fnm

            Again:
                mov AH, 01h
                int 21h
                cmp AL, 13
                je EndInput
                mov [SI], AL
                inc SI
                jmp Again

            EndInput:
			mov ah, 03dh
            mov dx, offset fnm
            mov al, 0
            int 21H
            mov fh, AX
            
            mov ah, 03fh
            mov bx, fh
            mov cx, 999 
            mov dx, offset MsgBuffer
            int 21H

            mov ah, 09H
            mov dx, offset MsgBuffer
            int 21H
            
            mov ah, 03eh
            mov bx, fh
            int 21h
		mov AH, 04CH
		int 21H
	main endp
End