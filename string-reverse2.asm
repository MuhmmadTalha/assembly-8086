.model
.stack 100h
.data
    str db 0dh,0ah, "Enter Characters (Enter Null to Exit) : ", "$"
    str1 db 0dh,0ah,"In Reverse: ","$"
    newline db 0dh,0ah
.code
main proc
    mov ax,@data
    mov ds,ax
    
    lea dx,str
    mov ah,09h
    int 21h
    
    mov cx,0
    
    ;Read Loop
    ReadLoop:
    mov ah,01h
    int 21h
    cmp al,0dh
    je PrintReverse
    
    push ax
    inc cx
    jmp ReadLoop
    
    ;Print Loop
    PrintReverse:
    lea dx,str1
    mov ah,09h
    int 21h
    
    ;Reverse Loop
    ReverseLoop:
    cmp cx,0
    je Exit
    pop dx
    mov ah,02h
    int 21h
    loop ReverseLoop
    
    Exit:
    mov ah,4ch
    int 21h
    
main endp
end main
