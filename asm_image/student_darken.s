#Write your image darkening code here in assembly
.global sdarken
sdarken:
	LDR R9,=0x7F7F7F7F
	ADD R5,R2,R2,LSL#1
	MUL R6,R5,R3
loop:
	SUBS R6,R6,#4
	LDR R8,[R0,R6]
	LSR R8,#1
	AND R8,R8,R9
	STR R8,[R1,R6]
	BGT loop
	MOV PC,LR 
