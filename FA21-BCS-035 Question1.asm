
org 100h

.data

.code 
XOR AX, AX
XOR CX, CX
XOR BX, BX

MOV AH, 1
INT 21h

MOV BL, 1
SUB AL, 30h
MOV BH, AL

MOV AH, 2
INT 21h
MOV DL, 10 
MOV AH, 2
INT 21h
MOV DL, 13 
JMP START
         
         
ROWIN:
SUB AL, 1
MOV BH, AL
INC BL


START:
    MOV AH, 2
    INT 21h
    MOV DL, 0
    DEC BH
    CMP BH, 1
    JNE START
 
STARS:   
    MOV AH, 2
    INT 21h
    MOV DL, '*'
    MOV AH, 2 
    DEC BL
    CMP BL, 0
    JNE STARS
    
    INT 21h
    MOV DL, 10 
    MOV AH, 2
    INT 21h
    MOV DL, 13
    DEC BH
    CMP BH, 0
    JE ROWIN  
    
    
ret

    

    

                 
              
    




