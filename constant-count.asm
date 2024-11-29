;Constants: Calculate the number of constants in the user string. 
;(Use conditional jumps)

.model 
.stack 100h
.data
   starting db "Enter a String and when done use dollar sign", "$"
   buffer db 50 dup('$')  
   newline db 0ah, 0dh, '$' 
   disp db "The total number of constants in this string are: ", "$"
   count db 0
.code
main proc
    
    mov ax,@data
    mov ds, ax
    
    ;Initialization 
    mov si,0
    mov ah,01
    
    lea dx,starting
    mov ah,09h
    int 21h
    
    lea dx,newline
    mov ah,09h
    int 21h
    
    input:
    mov ah,01h
    int 21h   
    
    cmp al, '$'
    je reset
    
    mov buffer[si],al   
    inc si
    jmp input
   
    
    reset:
    mov si,0
    mov bx,0
    
    ;Constants loop
    
    constants_count:
    mov al, buffer[si]
    cmp al, '$'
    je display
    
    
    ;Conditions
    
    cmp al, 'a'
    je not_a_constant
    
    cmp al, 'A'
    je not_a_constant
    
    cmp al, 'e'
    je not_a_constant
    
    cmp al, 'E'
    je not_a_constant
    
    cmp al, 'i'
    je not_a_constant
    
    cmp al, 'I'
    je not_a_constant
    
    cmp al, 'o'
    je not_a_constant
    
    cmp al, 'O'
    je not_a_constant
    
    cmp al, 'u'
    je not_a_constant
    
    cmp al, 'U'
    je not_a_constant 
    
    jmp store
    
    
    store:
    inc bx
    
    not_a_constant:
    inc si
    jmp constants_count
     
     
    display:
    ;Display Message
    lea dx, newline 
    mov ah,09h
    int 21h 
    
    lea dx, disp
    mov ah,09h
    int 21h
    
    ;Convert bx to ASCII code
    
    mov ax,bx
    add al,'0' ;Converts to ASCII
    
    mov dl,al   ;displays constants not more than 9
    mov ah,02h  
    int 21h
                          
    end:       
    mov ah,4ch
    int 21h
main endp
end main
    