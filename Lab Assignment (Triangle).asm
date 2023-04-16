org 100h


.data 

.code

MOV AH, 1
INT 21h
MOV AH, 0    

SUB AL,30h

MOV CX,AX    ; intializing CX for loop

MOV BH, 1    ; variable for rows
MOV BL, 1    ; variable for columns

MOV DL, 0Ah   ; printing newline
MOV AH, 2    ; displaying output
INT 21h
MOV DL, 0Dh 
MOV AH, 2
INT 21h


JMP INNER2 ; jumpnig to inner2 to print * at the start

OUTERLOOP:
        MOV AH, 2
        MOV DL, 0Ah
        INT 21h  
        MOV AH,2
        MOV DL, 0Dh
        INT 21h    
        MOV AH, 2
        MOV DL,'*' ; printing *
        INT 21h
        INC BL
    
    INNERLOOP:
        cmp BL, BH
        JE INNER2
        JMP PRINTDASHES ; if rows not equal to column print dashes
    
    INNER2:
        MOV AH, 2
        MOV DL, '*'
        INT 21h
        MOV BL, 1
        INC BH        
        LOOP OUTERLOOP      
        JMP END ; jump to exit when counter has ended
    
    PRINTDASHES:
        MOV AH, 2
        MOV DL, '_' ; printing dashes
        INT 21h
        INC BL   ; incrementing column num
        JMP INNERLOOP          
        
END:        
    ret