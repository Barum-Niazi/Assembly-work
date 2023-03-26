
; You may customize this and other start-up templates; 
; The location of this template is c:\emu8086\inc\0_com_template.txt

org 100h

.code
MOV AX, 4
MOV BX, 5
          
; Compares both AX and Bx
CMP AX, BX
; Checks if AX greater than BX (if true jumps to LABEL1)
JG LABEL1
; Checks if AX less than BX (if true jumps to LABEL2)
JL LABEL2

LABEL1:
    MOV CX, AX 
    ret     
LABEL2:
    MOV CX, BX
    ret



