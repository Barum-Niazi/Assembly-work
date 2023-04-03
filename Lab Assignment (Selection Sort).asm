
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
    MOV SI, OFFSET DATA ; pointing SI to array
    MOV AL, [SI] ; considering first element as biggest yet 
    MOV BP, SI ; storing address of current biggest element
    SUB CX, DX
    INC DX     ; DX increases by number of passes
    CMP CX, 0 
    JG SORTLOOP
    ret
    
    SORTLOOP:
        CMP AL, [SI + 1] ; comparing biggest to next elements
        JL SWAP ; if biggest is less than the next it changes current biggest
        INC SI  ; incrementing address
        LOOP SORTLOOP
        MOV BL, [SI]  ; moving last element of array to BL
        MOV [BP], BL  ; storing last element at location of biggest
        MOV [SI], AL  ; storing biggest at proper position
        JMP OUTERLOOP
        
     SWAP:
        MOV AL, [SI + 1] ; changing biggest element
        INC SI
        MOV BP, SI       ; storing address of new biggest element
        LOOP SORTLOOP
        MOV BL, [SI]
        MOV [BP], BL
        MOV [SI], AL  
        JMP OUTERLOOP
        
ret




