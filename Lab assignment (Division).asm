
org 100h

.code 

MOV AX, 9 ; AX is dividend
MOV BX, 3  ; BX is divisor
MOV CX, 0  ; CX is quotient

CMP AX, BX 
JG LABEL1  ; if AX greater than BX jump to label1

LABEL1:
    SUB AX, BX ; repeated subtraction for division
    INC CX
    CMP AX, BX
    JGE LABEL1
    jmp label2
        
    
LABEL2:
    ret