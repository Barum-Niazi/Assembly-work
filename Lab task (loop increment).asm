
; You may customize this and other start-up templates; 
; The location of this template is c:\emu8086\inc\0_com_template.txt

org 100h

     
.code
MOV AX, 1
MOV BX, 0 ; BX will act as counter

JMP LABEL1

LABEL1:
   INC AX
   INC BX ; incrementing counter 
   CMP BX, 8 ; compares BX to 8
   
   JZ LABEL2 ; checks zero flag, if 1, it ends the loop
   JMP LABEL1 

LABEL2:
    ret




