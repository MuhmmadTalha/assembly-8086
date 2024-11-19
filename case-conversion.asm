;: CASE CONVERSION: Convert the saved string’s case (capital ? small) and save the string with case
;conversion. (Use logical operation with loop, use based addressing mode to address the memory
;locations).
.model
.stack 100h
.data
buffer db 50 dup('$') 
result db 50 dup('$')                                        
.code
main proc    
    mov ax,@data
    mov ds,ax      
    
    mov bx,0
      
inp:
    mov ah,01
    int 21h
    
    cmp al, '$'
    je case1
    
    mov buffer [bx],al
    inc bx
    jmp inp  
       
  
    
case1:
    ;Case 1 - lower to upper
    
    cmp al, 'A'
    jmp case2
    
    cmp al,'Z'
    jmp case2    
 
    sub al,20h
    
    
case2:
    cmp al, 'a'
    add al,20h
    cmp al , 'z'
    add al,20h

return:
    mov result[bx],al
    inc bx 
    mov dx,offset result
    mov ah,09h
    int 21h
             
 
mov ah,4ch
int 21h
    
main endp     
end main
    
    
