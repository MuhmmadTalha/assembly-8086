.model small
.stack 100h
.data 
    var1 db "Enter a Decimal Number:","$"
    var2 db 0dh,0ah,"In Binary ","$"
.code

main proc
    
    mov ax,@data
    mov ds,ax 
    
    lea dx,var1
    mov ah,09
    int 21h
    
    mov ah,01
    int 21h
    
    sub al,48
    mov ah,0
    mov cx,0
    
divide:  
    mov dx,0
    mov bx,2
    div bx  
    inc cx
    push dx
    cmp ax,0
    jne divide
    
    lea dx,var2
    mov ah,09
    int 21h
    
disp:         
    pop dx
    add dx,48
    mov ah,02
    int 21h
    loop disp     
    
    mov ah,4ch
    int 21h   

    mov ah,4ch
    int 21h
main endp
end main
