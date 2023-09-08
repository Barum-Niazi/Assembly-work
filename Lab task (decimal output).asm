
org 100h

.data
d1 dw 655


.code
MOV AX, @data
MOV DS, AX

mov ax, d1

MOV CX, 0
MOV DX, 0

lab1:
    cmp ax, 0
    je print1
    
    mov bx, 10
    
    div bx
    
    push dx
    inc cx
    
    xor dx, dx
    jmp lab1
    
    print1:
        cmp cx, 0
        je exit
        
        pop dx
        add dx, 48
        
        mov ah, 02h
        int 21h
        
        dec cx
        jmp print1;
    
exit:
    ret
        



ret




