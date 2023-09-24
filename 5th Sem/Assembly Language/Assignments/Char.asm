.model Small
.stack 100h
.data
    Msg db "Enter a character: ", "$"
    char db 10,13
.code
main proc
    mov AX, @Data
    mov DS, AX

    mov AH, 09h
    mov DX, offset Msg
    int 21h

    mov AH, 01h
    int 21h

    mov AH, 09h
    mov DX, offset char
    int 21h

    mov AH, 02h
    mov DL, AL
    int 21h

    mov AH, 4Ch
    int 21h
main endp
end
