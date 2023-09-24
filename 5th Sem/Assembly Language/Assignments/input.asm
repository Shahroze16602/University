.model Small
.stack 100h
.data
    Msg db "Enter your name: $"
    Msg2 db "You entered: $"
    userName db 30 DUP ("$")
.code
main proc
    mov AX, @Data
    mov DS, AX

    mov AH, 09h
    mov DX, offset Msg
    int 21h
    mov SI, offset userName

Again:
    mov AH, 01h
    int 21h
    cmp AL, 13
    je EndInput
    mov [SI], AL
    inc SI
    jmp Again

EndInput:
    mov AH, 09h
    mov DX, offset Msg2
    int 21h

    mov AH, 09h
    mov DX, offset userName
    int 21h

    mov AH, 04Ch
    int 21h
main endp
end