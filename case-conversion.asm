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
    mov si,0
      
inp:
    mov ah,01
    int 21h
    
    cmp al, '$'
    je reset
    
    mov buffer [bx],al
    inc bx
    jmp inp  
       
    
reset:
    mov bx,0  
    mov si,0
    
case1:  
    
    mov al, buffer[bx]
    cmp al, '$'
    je display
    ;Case 1 - lower to upper
    
    cmp al, 'a'
    jl case2
    
    cmp al,'z'
    jg case2   
 
    sub al,20h
     
    jmp store
    
    
case2:  ; upper to lower 
    cmp al, 'A'
    jl store
   
    cmp al , 'Z'  
    jg store
    
    add al,20h 
     
    jmp store

store:   
    ;Stores in Result Variable
    mov result[si],al
    inc si
    inc bx
    jmp case1                    
    
display:    
    ;Displays on screen
    mov dx,offset result
    mov ah,09h
    int 21h
             
 
mov ah,4ch
int 21h
    
main endp     
end main
    
    
