
org 100h

.data

.code  
MOV BX, 1010101010101010b 
XOR CX, CX 
MOV CX, 16  
MOV AH, 2
INT 21h

OUTPUT:
    DEC CX 
    ROL BX, 1
    JC LABEL 
    MOV AH, 2
    INT 21h
    MOV DL, '0'
    CMP CX, 0
    JG OUTPUT
   
LABEL:   
    MOV AH, 2
    INT 21h
    MOV DL, '1'
    CMP CX, 0 
    JG OUTPUT


ret




