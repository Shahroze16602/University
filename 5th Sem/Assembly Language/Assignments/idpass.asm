.model Small
.stack 100h
.data
    Msg db "Enter User ID: $"
    Msg2 db "Enter Password: $"
    Msg3 db 10,13,"Dear $"
    Msg4 db " your given password is $"
    userID db 30 DUP ("$")
    password db 30 DUP ("$")
.code
main proc
    mov AX, @Data
    mov DS, AX

    mov AH, 09h
    mov DX, offset Msg
    int 21h

    mov SI, offset userID

    Again:
        mov AH, 01h
        int 21h

        cmp AL, 13
        je PrintMsg

        mov [SI], AL
        inc SI

        jmp Again

    PrintMsg:
        mov AH, 09h
        mov DX, offset Msg2
        int 21h

        mov SI, offset password

    InputPassword:
        mov AH, 07h
        int 21h

        cmp AL, 13
        je EndInput

        mov [SI], AL
        inc SI

        mov AH, 02h
        mov DL, '*'
        int 21h

        jmp InputPassword

    EndInput:
        mov AH, 09h
        mov DX, offset Msg3
        int 21h

        mov AH, 09h
        mov DX, offset userID
        int 21h

        mov AH, 09h
        mov DX, offset Msg4
        int 21h

        mov AH, 09h
        mov DX, offset password
        int 21h

        mov AH, 04Ch
        int 21h

main endp
end