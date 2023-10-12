.Model Small
.Stack 100H
.Data
    fnm db "New.txt", 0
    fh dw 0
	Msg db "Bismillah"
.Code 
	main proc
		mov AX, @Data
		mov DS, AX
			mov ah, 03ch
            mov dx, offset fnm
            mov cx, 09H
            int 21H
            mov fh, AX
            
            mov ah, 040h
            mov bx, fh
            mov cx, 9
            mov dx, offset Msg
            int 21H

            mov ah, 03eh
            mov bx, fh
            int 21h
		mov AH, 04CH
		int 21H
	main endp
End