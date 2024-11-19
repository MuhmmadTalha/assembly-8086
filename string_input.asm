;: INPUT: Input as string terminated by $ and save it in memory (Use function 1 of INT
;21H, loop to implement the operation, and register indirect addressing mode to address the memory).
.model
.stack 100h
.data
buffer db 50 dup('$')                                        
.code
main proc    
    mov ax,@data
    mov ds,ax      
    
    mov bx,0
      
inp:
    mov ah,01
    int 21h
    
    cmp al, '$'
    je end
    
    mov buffer [bx],al
    inc bx
    jmp inp
             
end: 
mov ah,4ch
int 21h
    
main endp     
end main
    
    
