
org 100h

.data

.code  
MOV AL, 11110001b
MOV CX, 8

REVERSELOOP:
    SHL AL, 1
    RCR AH, 1
    LOOP REVERSELOOP
MOV AL, AH

ret




