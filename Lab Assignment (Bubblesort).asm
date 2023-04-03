
org 100h

.data
data DB 7, 5, 3, 9, 1
length DW 4
    
.code
XOR CX, CX
MOV AX, 0
MOV DX, 0

OUTERLOOP: 
    MOV CX, length
    SUB CX, DX ; subbing loop counter with number of passes
    INC DX
    MOV SI, OFFSET data ; pointing SI to data
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
        JMP OUTERLOOP ; jumps back to outerloop when entire array traversed
        
        SORTING:
        XCHG AL, BL ; exchanging 1st and 2nd element
        MOV [SI], AL ; storing 2nd element in first address
        MOV [SI + 1], BL ; storing 1st element in second address
        INC SI     
        LOOP BUBBLESORT
        JMP OUTERLOOP

ret

       