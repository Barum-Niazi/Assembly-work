
org 100h

.data
start DB 'Enter a string:'
array DB ?
ascendArr DB 0

.code

XOR AX, AX
XOR CX, CX 
MOV SI, OFFSET ascendArr
MOV DI, OFFSET array  

INPUT:  
    MOV AH, 1
    INT 21h
    MOV array, AL ; moving all the elements input into an array
    CMP AL, 13
    JE COMPARE ; when input has been finished jumping to compare
    JMP INPUT 

COMPARE:
    MOV AL, [DI] 
    CMP AL, [DI + 1]
    INC DI 
    JLE ASCENDING ; if current less than next jump to ascending
    CMP AL, 13
    JE END
    JMP COMPARE  
    
ASCENDING:
    MOV [SI], AL ; moving it into the ascending array
    INC SI
    JMP COMPARE 
    
    
END:
    ret




