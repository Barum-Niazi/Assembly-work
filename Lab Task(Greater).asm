
org 100h

.data

.code


MOV AH, 1
INT 21h
MOV BL, AL 
SUB BL, 30h 

MOV AH, 1
INT 21h
MOV CL, AL   

MOV AH, 2   ; this snippet moves to next line
INT 21h
MOV DL, 10 
MOV AH, 2
INT 21h
MOV DL, 13      

CMP BL, CL
JG PRINTFIRST  ; if first is greater


MOV AH, 2  ; if second is greater
INT 21h
MOV DL, CL


PRINTFIRST:
    MOV AH, 2
    INT 21h
    MOV DL, BL
     

       
         
ret




