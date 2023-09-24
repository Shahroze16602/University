.model Small
.stack 100h
.data
    Msg db "Give Alphabetic input: $"
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

    cmp AL, 65
    jl Again

    cmp AL, 90
    jg CheckForaToz
ShowInput:
    mov AH, 02h
    mov DL, AL
    int 21h
    jmp Again

CheckForaToz:
    cmp AL, 97
    jl Again

    cmp AL, 122
    jg Again
    
    jmp ShowInput

EndInput:
    mov AH, 04Ch
    int 21h
main endp
end