
org 100h

.data
array DB 12 DUP(0) ; reserving 12 bytes for the array

.code
MOV CX, 12  ; CX is loop counter
XOR AL, AL  ; AL will act as first number of fibonacci
MOV BL, 1   ; BL will act as second number of fibonacci
MOV SI, OFFSET array 
    
FIBONACCI:     
     MOV [SI] , AL ; moving value stored in AL to array
     ADD AL, BL  ; adding the two terms
     MOV BL, [SI] ; storing previous value of AL into BL 
     INC SI       ; incrementing index
     LOOP FIBONACCI  
     
ret




