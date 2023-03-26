
; You may customize this and other start-up templates; 
; The location of this template is c:\emu8086\inc\0_com_template.txt

org 100h

.code  
MOV AX, 5
MOV BX, 0 ; acts as counter variable

LABEL1:
    DEC AX
    INC BX
    CMP AX, 0 ; compares AX to 0 as loop condition
    
    JZ LABEL2 ; if zero flag is 1, then loop ends
    
    JNZ LABEL1 ; if zero flag is 0 then loop continues

LABEL2:
    ret




