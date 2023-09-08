
org 100h

.data   
numArray DB 0, 0, 0, 0, 0
sum DB 0

.code
MOV CX, 5
MOV SI, OFFSET numArray


TAKEINPUT:
    MOV AH, 1
    INT 21h
    SUB AL, 30h
    MOV [SI], AL
    INC SI
    LOOP TAKEINPUT

MOV SI, OFFSET numArray
MOV CX, 5

ADDITION:
    MOV AL, [SI]
    ADD sum, AL
    INC SI
    LOOP ADDITION 
    
MOV BL, sum

DISPLAY:
    MOV AH, 2   ; this is to move to next line
    INT 21h
    MOV DL, 10 
    MOV AH, 2
    INT 21h
    MOV DL, 13
    
    MOV AH, 2
    INT 21h
    MOV DL, BL
    
    MOV AH, 2   ; this is done to make sure ret statement isnt directly after the print
    INT 21h
    MOV DL, 10 
    MOV AH, 2
    INT 21h
    MOV DL, 13   
       
    



ret




