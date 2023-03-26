
; You may customize this and other start-up templates; 
; The location of this template is c:\emu8086\inc\0_com_template.txt

org 100h

.code
MOV AX, -1
CMP AX, 0

; Checks if signed flag is 1 (if true jumps to LABEL1)
JS LABEL1  

; Checks if zero flag is 1 (if true jumps to LABEL2)
JZ LABEL2

; Checks if AX is greater than 0 (if true jumps to LABEL3)
JG LABEL3

; Moves -1 to BX
LABEL1:
    MOV BX, -1
    ret  

; Moves 0 to BX    
LABEL2:
    MOV BX, 0
    ret

; Moves 1 to BX    
LABEL3:
    MOV BX, 1
    ret




