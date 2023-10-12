.Model Small
.Stack 100H
.Data
    fnm db "New.txt", 0
    fh dw 0
	MsgBuffer db 50 DUP("$")
.Code 
	main proc
		mov AX, @Data
		mov DS, AX
			mov ah, 03dh
            mov dx, offset fnm
            mov al, 0
            int 21H
            mov fh, AX
            
            mov ah, 03fh
            mov bx, fh
            mov cx, 9
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