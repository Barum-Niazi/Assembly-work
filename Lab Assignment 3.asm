
org 100h

.data
msg1 DB 'Enter a line of text with spaces (100 characters max): $'
inputText DB 100 dup ('$')
reversedInput DB ?
arrSize DW 0
reverseMsg DB 'Reverse: $'
noCapitalMsg DB 'Your text has no capitals $'
firstCapitalMsg DB 'First Capital: $'
lastCapitalMsg DB 'Last Capital: $'

NEWLINE MACRO: ; this macro prints a newline
    MOV AH, 2
    MOV DL, 10
    INT 21H
    MOV AH, 2
    MOV DL, 13
    INT 21H 
    
ENDM

.code


MAIN PROC 
    MOV AX, @data
    MOV DS, AX
    MOV CX, 0
    
    MOV AH, 9
    MOV DX, OFFSET msg1
    INT 21h
    
    MOV SI, OFFSET inputText  
    
    INPUT:
        MOV AH, 1
        INT 21H
        CMP AL, 13
        JE ENDINPUT
        MOV [SI], AL
        INC SI
        INC arrSize
        JMP INPUT
        
    ENDINPUT:
        XOR SI, SI ; clearing SI 
        NEWLINE        
        MOV AH, 9
        MOV DX, offset inputText
        INT 21h
     
    CALL DETECTCAPITAL
    CALL REVERSE    
     
    ret   
MAIN ENDP

DETECTCAPITAL PROC ; this procedure checks the capitals
    MOV SI, OFFSET inputText
    MOV CX, arrSize
    
    
    LOOPLB: ; this loop will check against lower bound    
        CMP [SI], 41h
        JGE LOOPUB
        INC SI
        LOOP LOOPLB
    
    JMP NOCAPITAL    
    
    LOOPUB: ; this loop will check against upper bound
        CMP [SI], 5Ah
        JLE CAPITALS
        INC SI
        LOOP LOOPUB
        
    JMP NOCAPITAL

        
                         
    CAPITALS:
        CALL BUBBLESORTING
        MOV SI, OFFSET inputText
        MOV AL, [SI] ; the first element will alphabetically be first capital because array is sorted
        
    FIRSTCAPITAL:
        NEWLINE
        MOV AH, 9
        MOV DX, OFFSET firstCapitalMsg
        INT 21h
        
        MOV AH, 2
        MOV DL, [SI]
        INT 21h  
        
        MOV CX, arrSize
        
        TRAVERSE: ; traversing to the end of the input to go to last element
            INC SI
            LOOP TRAVERSE
            
    LASTCAPITAL:
        NEWLINE
        MOV AH, 9
        MOV DX, OFFSET lastCapitalMsg
        INT 21h
        
        MOV AH, 2
        MOV DL, [SI] ; SI is at last element which should be the last capital   
        INT 21h
        
        ret         
           
         
    NOCAPITAL:
        NEWLINE
        MOV AH, 9
        MOV DX, OFFSET noCapitalMsg
        INT 21h
    
    ret  
    
    
DETECTCAPITAL ENDP


REVERSE PROC ; this procedure reverses the input string
   
    NEWLINE
    MOV AH, 9
    MOV DX, OFFSET reverseMsg  
    INT 21H 
   
    MOV SI, OFFSET inputText
    MOV DI, OFFSET reversedInput
    MOV CX, arrSize
    
    LOOP1: ; this loop will push contents of input array to stack
        PUSH [SI]
        INC SI
        LOOP LOOP1
        
    MOV CX, arrSize
    
    LOOP2: ; this loop will pop contents of array to reverse it
        POP [DI]
        INC DI
        LOOP LOOP2
        
        MOV [DI], '$' 
    
    DISPLAY:
        MOV AH, 9
        MOV DX, OFFSET reversedInput
        INT 21H    

    ret        
REVERSE ENDP          


BUBBLESORTING PROC ; bubblesorting the input array to easily find last and first capital
    
    OUTERLOOP: 
    MOV CX, arrSize
    SUB CX, DX ; subbing loop counter with number of passes
    INC DX
    MOV SI, OFFSET inputText ; pointing SI to data
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


