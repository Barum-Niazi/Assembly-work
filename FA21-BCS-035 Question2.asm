
org 100h

.data
lowercount db 0
uppercount db 0
specialcount db 0 
msg1 db 'Enter Characters: ' 
msg2 db 'Lowercase:'
msg3 db 'Uppercase:'
msg4 db 'Special:'

.code 
XOR AX, AX
XOR BX, BX 

MOV SI, OFFSET msg1

MOV CX, 18
START:
MOV AH, 2
INT 21h
MOV DL, [SI]
INC SI
LOOP START 

MOV SI, OFFSET msg2

INPUT:     
    
    MOV AH, 1
    INT 21h  
    CMP AL, 13
    JE DISPLAY
    CMP AL, 65
    JGE UPPERCASE
    JMP SPECIAL 


UPPERCASE:
    CMP AL, 90
    JG SPECIAL
    ADD uppercount, 1
    JMP INPUT

SPECIAL:
    CMP AL, 96
    JG LOWERCASE
    ADD specialcount, 1 
    JMP INPUT


LOWERCASE:
    CMP AL, 122
    JG SPECIAL
    ADD lowercount, 1 
    JMP INPUT

DISPLAY: 
    MOV AH, 2   ; this snippet moves to next line
    INT 21h
    MOV DL, 10 
    MOV AH, 2
    INT 21h
    MOV DL, 13
    MOV CX, 10 ;loop counter
    
LOWERMSG:
    MOV AH, 2
    INT 21h
    MOV DL, [SI]
    INC SI
    LOOP LOWERMSG   
         
    MOV AH, 2
    INT 21h
    ADD lowercount, 30h ; first number of lowercase will be printed
    MOV DL, lowercount  
    MOV CX, 10        
    
    MOV AH, 2
    INT 21h
    MOV DL, 10 
    MOV AH, 2
    INT 21h
    MOV DL, 13 
    
UPPERMSG:
    MOV AH, 2
    INT 21h
    MOV DL, [SI]
    INC SI
    LOOP UPPERMSG 
    
    MOV AH, 2
    INT 21h 
    ADD uppercount, 30h ; number of uppercase printed
    MOV DL, uppercount
    MOV CX, 8
    
    MOV AH, 2
    INT 21h
    MOV DL, 10 
    MOV AH, 2
    INT 21h
    MOV DL, 13
 
    SPECIALMSG:
    MOV AH, 2
    INT 21h
    MOV DL, [SI]
    INC SI
    LOOP SPECIALMSG
        
    MOV AH, 2
    INT 21h
    ADD specialcount, 30h ; number of special printed
    MOV DL, specialcount 
    
    MOV AH, 2
    INT 21h
    MOV DL, 10 
    MOV AH, 2
    INT 21h
    MOV DL, 13 
    
    ret
    
                          
                       
    
    
    





