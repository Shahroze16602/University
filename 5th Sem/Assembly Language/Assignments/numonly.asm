.model Small
.stack 100h
.data
    Msg db "Give Numeric input: $"
.code
main proc
    mov AX, @Data
    mov DS, AX

    mov AH, 09h
    mov DX, offset Msg
    int 21h

Again:
    mov AH, 07h
    int 21h

    cmp AL, 13
    je EndInput

    cmp AL, 48
    jl Again

    cmp AL, 57
    jg Again

    mov AH, 02h
    mov DL, AL
    int 21h
    jmp Again

EndInput:
    mov AH, 04Ch
    int 21h
main endp
end