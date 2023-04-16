
org 100h

.data

.code   
MOV BX, 0
MOV AH, 1
INT 21h

LOOPBIN:
    CMP AL, 0x0D
    JE ENDLOOP
    AND AL, 00001111b
    SHL BX, 1
    OR BL, AL
    INT 21h
    JMP LOOPBIN



ENDLOOP:
    ret




