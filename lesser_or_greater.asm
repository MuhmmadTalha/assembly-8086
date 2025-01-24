.model small
.stack 100h
.data
    msg1 db 'A is greater$', 0
    msg2 db 'B is greater$' , 0
    msg3 db 'Both are Equal$', 0
    newline db 0x0d,0x0a
.code
main proc
    
    mov ax,@data
    mov ds,ax
    
    ;Taking input from user
    mov ah, 01h
    int 21h
    lea dx, newline
    int 21h
    
    ;Assuming bx by ourself
    mov bx, 5fh 
    
    ;comparing
    cmp ax, bx
    jg exe1
    jl exe2
    je exe3
    
exe1:
    mov ah, 09h
    mov dx, offset msg1
    int 21h
    jmp finish

exe2:
    mov ah, 09h
    mov dx, offset msg2
    int 21h
    jmp finish
    
exe3:
    mov ah, 09h
    mov dx, offset msg3
    int 21h
    jmp finish

finish:
    mov ah, 4ch
    int 21h

main endp
