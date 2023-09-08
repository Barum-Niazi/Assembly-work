
INCLUDE 'EMU8086.INC'
org 100h

.DATA

.CODE
MAIN PROC
    MOV AX, @DATA
    MOV DS, AX
   
   PRINT 'Fibonacci Series:'

    MOV CX, 6       ; COUNTER

    MOV DL, 0  ; INITIALIZING THE FIRST TERM OF THE SERIES
    MOV AH, 02H      
    ADD DL, 30H    
    INT 21H

    MOV DL, 1  ; INITIALIZING THE SECOND TERM
    MOV AH, 02H 
    ADD DL, 30H    
    INT 21H

    DEC CX          

    XOR AX, AX        ; CLEARING THE AX REGISTER
    MOV BX, 1        

    CALL FIB       

    MOV AH, 4CH     
    INT 21H

MAIN ENDP

FIB PROC
    PUSH CX          ; PUSHING AX AND CX INTO STACK TO RESTORE THEM LATER
    PUSH AX         

    CMP CX, 0        
    JE END_FIB       

    ADD AX, BX       ; ADDING AX AND BX WITH EACHOTHER FOR THE NEXT TERM IN THE SERIES
    MOV DL, AL      
    ADD DL, 30H    
    MOV AH, 02H     
    INT 21H

    XCHG AX, BX      ; SWAP AX AND BX FOR NEXT ITERATION
  
  
    SUB BX,30H
    SUB CX, 1       

    CALL FIB         ; RECURSIVE CALL

END_FIB:
    POP AX          
    POP CX           
    RET

FIB ENDP

END MAIN
