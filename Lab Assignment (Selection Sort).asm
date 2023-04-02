
org 100h

.data 
DATA DB 7, 5, 3, 9, 1
COUNT DB 1
.code
XOR AX, AX
XOR CX, CX
XOR BX, BX
MOV DX, 0  

OUTERLOOP:
    MOV CX, 4
    MOV SI, OFFSET DATA
    MOV AL, [SI]
    SUB CX, DX
    INC DX
    CMP CX, 0 
    JG SORTLOOP
    ret
    
    SORTLOOP:
        CMP AL, [SI]
        JL SWAP
        INC SI 
        DEC CX
        CMP CX, 0
        JG SORTLOOP
        MOV BL, [SI]
        MOV [SI], AL
        MOV [SI - 1], BL
        JMP OUTERLOOP
        
     SWAP:
        MOV AL, [SI]
        MOV BL, [SI + 1]
        MOV 
        INC SI
        DEC CX
        CMP CX, 0
        JG SORTLOOP
        MOV [SI], AL  
        MOV [SI - COUNT], BL
        JMP OUTERLOOP
        
ret




