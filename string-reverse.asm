.model small
.stack 100h
.data
  array db 50 dup('$')
.code
main proc
  mov ax,@data
  mov ds,ax

  mov bl,0             ;as counter loop
  mov si, offset array ;si will act as array

  l1:
  mov ah,01
  int 21h
  cmp al,13 ;ASCII value of Enter Key
  inc si
  inc bl
  jmp l1

  s1:
  mov cl,bl

  p1:
  dec si
  mov dx,[si]
  mov ah,02
  int 21h
  loop p1

  ;Exit DOS
  mov ah,4ch
  int 21h
main endp
end main
