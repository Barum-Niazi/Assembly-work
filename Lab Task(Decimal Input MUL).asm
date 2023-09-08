.data 
Total db 0
Result dw 0
.code
loop1:
mov ah,1
int 21h 
sub al,30h
 mov bl,al
 
 mov al,10h
 mul Total
 mov Total,al
add Total,bl

 
 mov Result,ax
  
  cmp bl,0dh
  jne loop1

ret