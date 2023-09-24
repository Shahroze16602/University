.Model Small
.Stack 100H
.Data
	Msg db "Bismillah Assembly Language", "$"
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