;VOWELS: Calculate the number of vowels in the user string. 
;(Use conditional jumps)

.model 
.stack 100h
.data
   starting db "Enter a String and when done use dollar sign", "$"
   buffer db 50 dup('$')  
   newline db 0ah, 0dh, '$' 
   disp db "The total number of vowels in this string are: ", "$"
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
    
    ;Vowels loop
    
    vowel_count:
    mov al, buffer[si]
    cmp al, '$'
    je display
    
    
    ;Conditions
    
    cmp al, 'a'
    je store
    
    cmp al, 'A'
    je store
    
    cmp al, 'e'
    je store
    
    cmp al, 'E'
    je store
    
    cmp al, 'i'
    je store
    
    cmp al, 'I'
    je store
    
    cmp al, 'o'
    je store
    
    cmp al, 'O'
    je store
    
    cmp al, 'u'
    je store
    
    cmp al, 'U'
    je store 
    
    jmp not_a_vowel
    
    
    store:
    inc bx
    
    not_a_vowel:
    inc si
    jmp vowel_count
     
     
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
    
    mov dl,al   ;displays vowels not more than 9
    mov ah,02h  
    int 21h
                          
    end:       
    mov ah,4ch
    int 21h
main endp
end main
    