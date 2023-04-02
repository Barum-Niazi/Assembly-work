
org 100h

.data
DATA DB 7, 5, 3, 9, 1
N DW 5
    
.code
XOR CX, CX
MOV CX, N - 1 ; initializing loop counter to size of array - 1
MOV SI, OFFSET DATA ; pointing SI to array 
MOV AX, 0
MOV DX, 0
MOV N, 5

OUTERLOOP: 
    MOV CX, 4 
    SUB CX, DX ; subbing loop counter with number of passes
    INC DX
    MOV SI, OFFSET DATA
    CMP CX, 0
    JG BUBBLESORT
    ret
     
        BUBBLESORT:
        MOV AL, [SI] ; storing first element in AL
        MOV BL, [SI + 1] ; storing 2nd element in BL
        CMP AL, BL ; comparing, if 1st element is greater it swaps them
        JG SORTING 
        INC SI     ; incrementing address
        LOOP BUBBLESORT
        ret
        
        SORTING:
        XCHG AL, BL ; exchanging 1st and 2nd element
        MOV [SI], AL ; storing 2nd element in first address
        MOV [SI + 1], BL ; storing 1st element in second address
        INC SI     
        LOOP BUBBLESORT
        JMP OUTERLOOP

ret

       