.Model Small
.Stack 100H
.Data
	Msg db "Shahroze (BSCS-21-26)", "$"
.Code 
	main proc
		mov AX, @Data
		mov DS, AX
			mov AH, 09H
			mov DX, offset Msg
			int 21H
		mov AH, 04CH
		int 21H
	main endp
End