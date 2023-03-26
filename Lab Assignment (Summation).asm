
; You may customize this and other start-up templates; 
; The location of this template is c:\emu8086\inc\0_com_template.txt

org 100h

.code

MOV AX, 1

JL LABEL1

LABEL1:
    ADD AX, 3
    CMP AX, 148
    JL LABEL1
    ret




