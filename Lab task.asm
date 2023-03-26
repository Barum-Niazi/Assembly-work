org 100h

.data

var1 DW 0
var2 DW 0
var3 DW 0
var4 DW 0
var5 DB 2

    
.code
; assigning values to variables
MOV var1, 0x4AC8
MOV var2, 478
MOV var3, 0110101000101101b
MOV var4, 'BD'

; storing variables in registers
MOV AX, var2
MOV BX, var1

; adding var2(AX) to var1 
ADD var1, AX
MOV BX, var1

; subtracting var1(BX) from var3
SUB var3, BX

; incrementing var3 and decrementing var1  
INC var3 
DEC var1

; exchanging var1 and var4
MOV BX, var1
XCHG BX, var4
XCHG BX, var1

; negative of var3
NEG var3     


     

ret