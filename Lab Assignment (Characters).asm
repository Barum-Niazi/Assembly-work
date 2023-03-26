org 100h

.code
MOV CX, 'U'

CMP CX, 0x41  ; compares CX to starting range of capital characters (if greater or equal jumps to label 1)
JGE LABEL1   
MOV AX, 3     ; moves 3 to AX if it is special character
ret

LABEL1:
    CMP CX, 0x5A ; compares CX to ending range of capital characters (if greater than this jumps to label 2)
    JG LABEL2
    MOV AX, 1 ; moves 1 to AX if uppercase
    ret

LABEL2:
    CMP CX, 0x60 ;compares to range of upper bound of special characters between upper and lowercase(if less or equal jumps to label3)
    JLE LABEL3
    CMP CX, 0x7A ; compares to range of upper bound of lowercase characters (if greater moves to label3) 
    JG LABEL3:
    MOV AX, 2    ; moves 2 to AX if it is lowercase
    ret

LABEL3:
    MOV AX, 3 
    ret