
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
        CMP AL, [SI + 1]
        JL SWAP
        INC SI 
        LOOP SORTLOOP 
        JMP OUTERLOOP
        
     SWAP:
        MOV AL, [SI + 1] 
        INC SI
        
        LOOP SORTLOOP
        MOV BL, [SI + 1]
        MOV [SI + 1], AL
        MOV [SI], BL 
        JMP OUTERLOOP
        
ret




